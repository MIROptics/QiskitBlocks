-- TUTORIAL MAP GENERATION

-- == DEBUG SETTINGS ==
-- If true, the generated tutorial map is in "map editing" mode, only generating
-- the raw castle, no grass layer or other random decorations will be generated
local map_editing = minetest.settings:get_bool("tutorial_debug_map_editing")

-- == END OF DEBUG SETTINGS ==

-- Directory where the map data will be stored
tutorial.map_directory = minetest.get_modpath("tutorial").."/mapdata/"

local insecure_environment = minetest.request_insecure_environment()

-- entity management functions

local function init_item_spawners(spawners)
	local count = 0
	for n=1, #spawners do
		local timer = minetest.get_node_timer(spawners[n])
		timer:start(3)
		count = count + 1
	end
	minetest.log("action", "[tutorial] " .. count .. " item spawners initialized")
end

---

-- Sectors of the map to save/load
-- Each element of the array will contain the coordinate where the sector starts
-- along with a "l" property indicating its length in each direction.
tutorial.map_sector = {}

-- Array with the minimum and the maximum positions of the cube that contains the
-- entire Tutorial World, it's best if the start matches the start of a mapchunk
tutorial.limits = {
	{ x = -32, y = -32, z = -32 },
	{ x = 224, y = 48, z = 144 },
}

-- size of the sectors to form divisions of the map.
-- This needs to be a multiple of 16, since it will also determine the
-- chunksize
tutorial.sector_size = 80

-- perform the divisions using the given sector size within the limits provided
for x = tutorial.limits[1].x, tutorial.limits[2].x, tutorial.sector_size do
	for y = tutorial.limits[1].y, tutorial.limits[2].y, tutorial.sector_size do
		for z = tutorial.limits[1].z, tutorial.limits[2].z, tutorial.sector_size do
			table.insert(tutorial.map_sector, {x=x,y=y,z=z,l=(tutorial.sector_size - 1)})
		end
	end
end
--]]

-- Load the sector schematics from disc
tutorial.sector_data = {}
for k,sector in pairs(tutorial.map_sector) do
	local filename = tutorial.map_directory .. "sector_"..k
	local f, err = io.open(filename..".meta", "rb")
	if f then
		local data = minetest.deserialize(minetest.decompress(f:read("*a")))
		tutorial.sector_data[filename] = data
		f:close()
	end
end

-- Saves schematic in the Minetest Schematic (and metadata) to disk.
-- Takes the same arguments as minetest.create_schematic
-- @param minp Lowest position (in all 3 coordinates) of the area to save
-- @param maxp Highest position (in all 3 coordinates) of the area to save
-- @param probability_list = {{pos={x=,y=,z=},prob=}, ...} list of probabilities for the nodes to be loaded (if nil, always load)
-- @param filename (without externsion) with the path to save the shcematic and metadata to
-- @param slice_prob_list = {{ypos=,prob=}, ...} list of probabilities for the slices to be loaded (if nil, always load)
-- @return The number of nodes with metadata.
local function save_region(minp, maxp, probability_list, filename, slice_prob_list)

	local success = minetest.create_schematic(minp, maxp, probability_list, filename .. ".mts", slice_prob_list)
	if not success then
		minetest.log("error", "[tutorial] problem creating schematic on ".. minetest.pos_to_string(minp) .. ": " .. filename)
		return false
	end

	local manip = minetest.get_voxel_manip()
	manip:read_from_map(minp, maxp)
	local pos = {x=minp.x, y=0, z=0}
	local count = 0
	local nodes = {}
	local get_node, get_meta = minetest.get_node, minetest.get_meta
	while pos.x <= maxp.x do
		pos.y = minp.y
		while pos.y <= maxp.y do
			pos.z = minp.z
			while pos.z <= maxp.z do
				local node = get_node(pos)
				if node.name ~= "air" and node.name ~= "ignore" then
					local meta = get_meta(pos):to_table()

					local meta_empty = true
					-- Convert metadata item stacks to item strings
					for name, inventory in pairs(meta.inventory) do
						for index, stack in ipairs(inventory) do
							meta_empty = false
							inventory[index] = stack.to_string and stack:to_string() or stack
						end
					end
					if meta.fields and next(meta.fields) ~= nil then
						meta_empty = false
					end

					if not meta_empty then
						count = count + 1
						nodes[count] = {
							x = pos.x - minp.x,
							y = pos.y - minp.y,
							z = pos.z - minp.z,
							meta = meta,
						}
					end
				end
				pos.z = pos.z + 1
			end
			pos.y = pos.y + 1
		end
		pos.x = pos.x + 1
	end
	if count > 0 then

		local result = {
			size = {
				x = maxp.x - minp.x,
				y = maxp.y - minp.y,
				z = maxp.z - minp.z,
			},
			nodes = nodes,
		}

		-- Serialize entries
		result = minetest.serialize(result)

		local file, err = insecure_environment.io.open(filename..".meta", "wb")
		if err ~= nil then
			error("Couldn't write to \"" .. filename .. "\"")
		end
		file:write(minetest.compress(result))
		file:flush()
		file:close()
		minetest.log("action", "[tutorial] schematic + metadata saved: " .. filename)
	else
	   minetest.log("action", "[tutorial] schematic (no metadata) saved: " .. filename)
	end
	return success, count
end



-- Places the schematic specified in the given position.
-- @param minp Lowest position (in all 3 coordinates) of the area to load
-- @param filename without extension, but with path of the file to load
-- @param vmanip voxelmanip object to use to place the schematic in
-- @param rotation can be 0, 90, 180, 270, or "random".
-- @param replacements = {["old_name"] = "convert_to", ...}
-- @param force_placement is a boolean indicating whether nodes other than air and ignore are replaced by the schematic
-- @return boolean indicating success or failure
local function load_region(minp, filename, vmanip, rotation, replacements, force_placement)

	if rotation == "random" then
		rotation = {nil, 90, 180, 270}
		rotation = rotation[math.random(1,4)]
	end

	local success
	if vmanip and minetest.place_schematic_on_vmanip then
		success = minetest.place_schematic_on_vmanip(vmanip, minp, filename .. ".mts", tostring(rotation), replacements, force_placement)
	else
		success = minetest.place_schematic(minp, filename .. ".mts", tostring(rotation), replacements, force_placement)
	end

	if success == false then
		minetest.log("action", "[tutorial] schematic partionally loaded on ".. minetest.pos_to_string(minp))
	elseif not success then
		minetest.log("error", "[tutorial] problem placing schematic on ".. minetest.pos_to_string(minp) .. ": " .. filename)
		return nil
	end

	local data = tutorial.sector_data[filename]
	if not data then return true, {} end

	local get_meta = minetest.get_meta

	local spawners = {}
	if not rotation or rotation == 0 then
		for i, entry in ipairs(data.nodes) do
			entry.x, entry.y, entry.z = minp.x + entry.x, minp.y + entry.y, minp.z + entry.z
			if entry.meta then
				get_meta(entry):from_table(entry.meta)
				if entry.meta.fields.spawned then
					table.insert(spawners, {x=entry.x, y=entry.y, z=entry.z})
				end
			end
		end
	else
		local maxp_x, maxp_z = minp.x + data.size.x, minp.z + data.size.z
		if rotation == 90 then
		for i, entry in ipairs(data.nodes) do
			entry.x, entry.y, entry.z = minp.x + entry.z, minp.y + entry.y, maxp_z - entry.x
			if entry.meta then get_meta(entry):from_table(entry.meta) end
		end
		elseif rotation == 180 then
			for i, entry in ipairs(data.nodes) do
				entry.x, entry.y, entry.z = maxp_x - entry.x, minp.y + entry.y, maxp_z - entry.z
				if entry.meta then get_meta(entry):from_table(entry.meta) end
			end
		elseif rotation == 270 then
			for i, entry in ipairs(data.nodes) do
				entry.x, entry.y, entry.z = maxp_x - entry.z, minp.y + entry.y, minp.z + entry.x
				if entry.meta then get_meta(entry):from_table(entry.meta) end
			end
		else
			minetest.log("error", "[tutorial] unsupported rotation angle: " ..  (rotation or "nil"))
			return false
		end
	end
	minetest.log("action", "[tutorial] schematic + metadata loaded on ".. minetest.pos_to_string(minp))
	return true, spawners
end

local function save_schematic()
	local success = true
	for k,sector in pairs(tutorial.map_sector) do
		local filename = tutorial.map_directory .. "sector_"..k
		local minp = sector
		local maxp = {
			x = sector.x + sector.l,
			y = sector.y + sector.l,
			z = sector.z + sector.l
		}
		if not save_region(minp, maxp, nil, filename) then
			minetest.log("error", "[tutorial] error loading Tutorial World sector " .. minetest.pos_to_string(sector))
			success = false
		end
	end
	return success
end

local function load_schematic()
	local success = true
	for k,sector in pairs(tutorial.map_sector) do
		local filename = tutorial.map_directory .. "sector_"..k
		minetest.log("action", "loading sector " .. minetest.pos_to_string(sector))
		sector.maxp = vector.add(sector, {x=sector.l, y=sector.l, z=sector.l})

		-- Load the area above the schematic to guarantee we have blue sky above
		-- and prevent lighting glitches
		--minetest.emerge_area(vector.add(sector, {x=0, y=sector.l, z=0}), vector.add(sector.maxp, {x=0,y=32,z=0}))

		local vmanip = VoxelManip(sector, sector.maxp)
		if not load_region(sector, filename, vmanip, nil, nil, true) then
			minetest.log("error", "[tutorial] error loading Tutorial World sector " .. minetest.pos_to_string(sector))
			success = false
		end
		vmanip:calc_lighting()
		vmanip:write_to_map()
		vmanip:update_map()
	end
	return success
end


------ Commands

minetest.register_privilege("tutorialmap", "Can use commands to manage the tutorial map")
minetest.register_chatcommand("treset", {
	params = "",
	description = "Resets the tutorial map",
	privs = {tutorialmap=true},
	func = function(name, param)
		if load_schematic() then
			minetest.chat_send_player(name, "Tutorial World schematic loaded")
		else
			minetest.chat_send_player(name, "An error occurred while loading Tutorial World schematic")
		end

		-- TODO: re-load entities?
	end,
})

-- Add commands for saving map and entities, but only if tutorial mod is trusted
if insecure_environment then
	minetest.register_chatcommand("tsave", {
		params = "",
		description = "Saves the tutorial map",
		privs = {tutorialmap=true},
		func = function(name, param)
			if save_schematic() then
				minetest.chat_send_player(name, "Tutorial World schematic saved")
			else
				minetest.chat_send_player(name, "An error occurred while saving Tutorial World schematic")
			end
		end,
	})
end

------ Map Generation

local vbuffer = nil

tutorial.state = tutorial.state or {}
tutorial.state.loaded = tutorial.state.loaded or {}
minetest.register_on_generated(function(minp, maxp, seed)
	local state_changed = false
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")

	for k,sector in pairs(tutorial.map_sector) do
		if not tutorial.state.loaded[k] then

			if sector.maxp == nil then
				sector.maxp = {
					x = sector.x + sector.l,
					y = sector.y + sector.l,
					z = sector.z + sector.l,
				}
			end

			-- Only load it if not out of the generating range
			if not ((maxp.x < sector.x) or (minp.x > sector.maxp.x)
				or (maxp.y < sector.y) or (minp.y > sector.maxp.y)
				or (maxp.z < sector.z) or (minp.z > sector.maxp.z))
			then

				local filename = tutorial.map_directory .. "sector_" .. k
				local loaded, spawners = load_region(sector, filename, vm)
				if loaded then
					-- Initialize item spawners in the area as well, and mark it as loaded
					init_item_spawners(spawners)
					tutorial.state.loaded[k] = true
				end
				state_changed = true
			end
		end
	end

	-- Generate a layer of grass for the outside area
	if map_editing ~= true then
		local grasslev = 0
		if minp.y <= grasslev and maxp.y >= grasslev then
			local vdata = vm:get_data(vbuffer)
			local area = VoxelArea:new({MinEdge=emin, MaxEdge=emax})
			local c_dirt_with_grass = minetest.get_content_id("default:dirt_with_grass")
			local c_grass = minetest.get_content_id("default:grass_5")
			for x = minp.x, maxp.x do
				for z = minp.z, maxp.z do
					local p_pos = area:index(x, grasslev, z)
					local p_pos_above
					if minp.y <= grasslev+1 and maxp.y >= maxp.y then
						p_pos_above = area:index(x, grasslev + 1, z)
					end
					local _, areas_count = areas:getAreasAtPos({x=x,y=grasslev,z=z})
					if areas_count == 0 then
						if vdata[p_pos] == minetest.CONTENT_AIR then
							vdata[p_pos] = c_dirt_with_grass
							if p_pos_above and vdata[p_pos_above] == minetest.CONTENT_AIR then
								if math.random(0,50) == 0 then
									vdata[p_pos_above] = c_grass
								end
							end
						end
					end
				end
			end
			vm:set_data(vdata)
			state_changed = true
		end
	end

	if(state_changed) then
		vm:calc_lighting(nil, nil, false)
		vm:write_to_map()
		tutorial.save_state()
	end
end)

minetest.set_mapgen_setting("mg_name", "singlenode")
minetest.set_mapgen_setting("water_level", "-31000")
minetest.set_mapgen_setting("chunksize", tostring(tutorial.sector_size/16))

-- coordinates for the first time the player spawns
tutorial.first_spawn = { pos={x=42,y=0.5,z=28}, yaw=(math.pi * 0.5) }

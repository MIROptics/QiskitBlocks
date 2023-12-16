xschem =  {}

dofile(minetest.get_modpath("xschem") .. "/api.lua")

local function begins(str, start)
	return str:sub(1, #start) == start
end

local function file_exists(path)
	local file = io.open(path, "r")
	if file then
		file:close()
		return true
	end
	return false
end

-----------------------------------------------
-- Add all nodes which begin with one of the --
-- following names to the meta whitelist     --
-----------------------------------------------
local prefixes = {
	"q_command:",
	"default:chest",
	"default:sign",
	"circuit_blocks:",
	"mobs:",
	"mobs_npc:"
}

for name, _ in pairs(minetest.registered_nodes) do
	for i=1, #prefixes do
		if begins(name, prefixes[i]) then
			xschem.whitelist(name)
		end
	end
end


----------------------
-- CHANGE AREA HERE --
----------------------
local FROM = vector.new(-50,-5,-192)
local TO = vector.new(600,30,370)

minetest.register_chatcommand("xschemsave", {
	privs = { server = true },
	func = function(name, param)
		local wp = minetest.get_worldpath() .. "/"
		local filename = "save"

		if param:trim() ~= "" and #param > 5 then
			filename = param
			if filename:sub(#filename - 3) == ".mts" then
				filename = filename:sub(1, #filename - 4)
			end
		end

		xschem.save(name, wp .. filename, FROM, TO)
	end,
})




local savepath = minetest.get_modpath("xschem") .. "/schematics/save"

if not file_exists(savepath .. ".mts") or not file_exists(savepath .. ".meta") then
	minetest.log("error", "Unable to find the saved map")
	return
end

if file_exists(minetest.get_worldpath() .. "/xschem_placed.txt") then
	return
end

local metalist
do
	local meta_file = io.open(savepath .. ".meta", "r")
	local json = meta_file:read("*all")
	meta_file:close()

	metalist = minetest.parse_json(json)
end

minetest.register_on_generated(function(minp, maxp, blockseed)
	if metalist then
		local vm = minetest.get_mapgen_object("voxelmanip")
		minetest.place_schematic_on_vmanip(vm, FROM, savepath .. ".mts")
		vm:write_to_map()

		xschem.place_metadata(metalist, minp, maxp)
	end
end)

xschem.load_area(FROM, TO, function(duration_gen, duration_lighting)
	metalist = nil

	local str = "Map generation took %.02fs, and then light calculations took %.02fs"
	minetest.chat_send_all(str:format(duration_gen, duration_lighting))

	local file = io.open(minetest.get_worldpath() .. "/xschem_placed.txt", "w")
	file:write("yes")
	file:close()
end)

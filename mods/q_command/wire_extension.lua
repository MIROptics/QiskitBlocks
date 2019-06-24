-- Block that manages a wire extension, which is a the continuation of a circuit wire

-- our API object
wire_extension = {}

wire_extension.block_pos = {}
wire_extension.wire_specs = {} -- pos, num_columns, is_on_wire
wire_extension.wire_specs.pos = {} -- x, y, z

-- returns wire_extension object or nil
function wire_extension:get_wire_extension_block(pos)
	local node_name = minetest.get_node(pos).name
	if minetest.registered_nodes[node_name] then

        -- Retrieve metadata
        local meta = minetest.get_meta(pos)
        -- local node_type = meta:get_int("node_type")
        local wire_pos_x = meta:get_int("wire_specs_pos_x")
        local wire_pos_y = meta:get_int("wire_specs_pos_y")
        local wire_pos_z = meta:get_int("wire_specs_pos_z")

        local circuit_extension_pos_x = meta:get_int("circuit_extension_pos_x")
        local circuit_extension_pos_y = meta:get_int("circuit_extension_pos_y")
        local circuit_extension_pos_z = meta:get_int("circuit_extension_pos_z")

		return {
			pos = pos,

            -- Node position, table
            get_node_pos = function()
				return pos
			end,

            -- Node name, string
            get_node_name = function()
				return node_name
			end,

            -- Position of left node of the wire extension
            get_wire_pos = function()
                local ret_pos = {}
                ret_pos.x = wire_pos_x
                ret_pos.y = wire_pos_y
                ret_pos.z = wire_pos_z
				return ret_pos
			end,

            -- Determine if wire extension exists
            wire_extension_exists = function()
                local ret_exists = false
                if wire_pos_x > 0 and wire_pos_z > 0 then
                    ret_exists = true
                end
				return ret_exists
			end,

            -- Position of extension point in circuit
            get_circuit_extension_pos = function()
                local ret_pos = {}
                ret_pos.x = circuit_extension_pos_x
                ret_pos.y = circuit_extension_pos_y
                ret_pos.z = circuit_extension_pos_z
				return ret_pos
			end,

            -- Create string representation
            -- TODO: What is Lua way to implement a "to string" function?
            to_string = function()
                local ret_str = "pos: " .. dump(pos) .. "\n" ..
                        "node_name: " .. node_name .. "\n" ..
                        "wire_pos_x: " .. tostring(wire_pos_x) .. "\n" ..
                        "wire_pos_y: " .. tostring(wire_pos_y) .. "\n" ..
                        "wire_pos_z: " .. tostring(wire_pos_z) .. "\n"
                return ret_str
            end
		}
	else
		return nil
	end
end


function wire_extension:debug_node_info(pos, message)
    local block = wire_extension:get_wire_extension_block(pos)
    minetest.debug("to_string:\n" .. dump(block.to_string()))
    minetest.debug((message or "") .. "\ncircuit_block:\n" ..
        "get_node_pos() " .. dump(block.get_node_pos()) .. "\n" ..
        "get_node_name() " .. dump(block.get_node_name()) .. "\n" ..
        "wire_extension_exists() " .. dump(block.wire_extension_exists()) .. "\n" ..
        "get_wire_pos() " .. dump(block.get_wire_pos()) .. "\n" ..
        "get_circuit_extension_pos() " .. dump(block.get_circuit_extension_pos()) .. "\n")

end


function wire_extension:create_blank_wire_extension()
    -- local wire_num_wires = wire_extension.wire_specs.num_wires -- s/b 1
    local wire_num_columns = wire_extension.wire_specs.num_columns

    -- TODO: [x] Eliminate outer loop, as there is just one wire
    -- for wire = 1, 1 do
    for column = 1, wire_num_columns do
        local node_pos = {}
        node_pos.x = wire_extension.wire_specs.pos.x + column - 1
        -- node_pos.y = wire_extension.wire_specs.pos.y + circuit_num_wires - wire
        node_pos.y = wire_extension.wire_specs.pos.y
        node_pos.z = wire_extension.wire_specs.pos.z
        -- TODO: Change to add_node() for clarity?
        minetest.set_node(node_pos,
                {name="circuit_blocks:circuit_blocks_empty_wire"})

        -- Update the metadata in these newly created nodes
        local meta = minetest.get_meta(node_pos)
        meta:set_int("wire_specs_num_wires", 1) -- TODO: Remove, as s/b 1 ?
        meta:set_int("wire_specs_num_columns", wire_num_columns)
        meta:set_int("wire_specs_is_on_grid", 1)
        meta:set_int("wire_specs_pos_x", wire_extension.wire_specs.pos.x)
        meta:set_int("wire_specs_pos_y", wire_extension.wire_specs.pos.y)
        meta:set_int("wire_specs_pos_z", wire_extension.wire_specs.pos.z)
        meta:set_int("wire_extension_block_pos_x", wire_extension.block_pos.x)
        meta:set_int("wire_extension_block_pos_y", wire_extension.block_pos.y)
        meta:set_int("wire_extension_block_pos_z", wire_extension.block_pos.z)
    end
end


minetest.register_on_player_receive_fields(function(player, formname, fields)
    if(formname == "create_wire_extension") then
        if fields.num_columns_str then
            local num_wires = 1
            local num_columns = tonumber(fields.num_columns_str)
            local start_z_offset = 0
            local start_x_offset = 1

            if num_columns and num_columns > 0 then
                -- Store position of left-most, bottom-most block, and dimensions of circuit
                wire_extension.wire_specs.pos.x = wire_extension.block_pos.x + start_x_offset
                wire_extension.wire_specs.pos.y = wire_extension.block_pos.y
                wire_extension.wire_specs.pos.z = wire_extension.block_pos.z + start_z_offset
                wire_extension.wire_specs.num_wires = num_wires
                wire_extension.wire_specs.num_columns = num_columns
                minetest.debug("wire_extension.wire_specs: " .. dump(wire_extension.wire_specs))

                -- Create circuit grid with empty blocks
                wire_extension:create_blank_wire_extension()

                -- Put location of circuit into the wire_extension block metadata
                local meta = minetest.get_meta(wire_extension.block_pos)
                meta:set_int("wire_specs_pos_x", wire_extension.wire_specs.pos.x)
                meta:set_int("wire_specs_pos_y", wire_extension.wire_specs.pos.y)
                meta:set_int("wire_specs_pos_z", wire_extension.wire_specs.pos.z)

                --wire_extension:debug_node_info(pos, "After setting metadata")

                -- TODO: Find a better way (that works)
                -- Punch the wire_extension block (ourself) to run simulator and update resultant displays
                --minetest.punch_node(wire_extension.block_pos)

            else
                -- TODO: Show error message dialog?
                minetest.chat_send_player(player:get_player_name(),
                    "Wire extension not created! ")
            end
            return
        end
    end
end)

minetest.register_node("q_command:wire_extension_block", {
    description = "Wire extension block",
    tiles = {"circuit_blocks_wire_connector_f.png"},
    groups = {oddly_breakable_by_hand=2},
    on_construct = function(pos)
        local meta = minetest.get_meta(pos)
        meta:set_string("infotext", "Wire extension block")
        wire_extension.block_pos = pos
    end,
    on_rightclick = function(pos, node, clicker, itemstack)
        local player_name = clicker:get_player_name()
        local meta = minetest.get_meta(pos)
        local formspec = "size[5.0, 4.6]"..
                -- "field[1.0,0.5;1.5,1.5;num_wires_str;Wires:;3]" ..
                "field[3.0,0.5;1.5,1.5;num_columns_str;Columns:;4]" ..
				"button_exit[1.8,3.5;1.5,1.0;create;Create]"
        minetest.show_formspec(player_name, "create_wire_extension", formspec)
    end,
    on_punch = function(pos, node, player)
        local extension_block = wire_extension:get_wire_extension_block(pos)
        wire_extension:debug_node_info(pos, "In on_punch, wire_extension_block")
        if extension_block:wire_extension_exists() then
            -- TODO: find out why this is being punched when not expected
            --local wire_extension_pos = wire_extension.get_wire_pos()
            --local wire_extension_block = wire_extension:get_wire_extension_block(wire_extension_pos)

        else
            minetest.chat_send_player(player:get_player_name(),
                    "Must create a wire extension first")
        end
    end,
    can_dig = function(pos, player)
        return false
    end
})


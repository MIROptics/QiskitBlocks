-- TODO:
--  Define Quantum control block that creates circuit, etc.

-- our API object
q_command = {}

q_command.block_pos = {}
q_command.circuit_specs = {} -- pos, num_wires, num_columns, is_on_grid
q_command.circuit_specs.pos = {} -- x, y, z

-- returns circuit_blocks object or nil
-- TODO: Use : instead of . for consistency?
--[[
function q_command:get_circuit_block(pos)
	local node_name = minetest.get_node(pos).name
	if minetest.registered_nodes[node_name] then
		return {
			pos = pos,
		}
	else
		return nil
	end
end
--]]

function q_command:create_blank_circuit_grid()
    local circuit_num_wires = q_command.circuit_specs.num_wires
    local circuit_num_columns = q_command.circuit_specs.num_columns
    for wire = 1, circuit_num_wires do
        for column = 1, circuit_num_columns do
            local node_pos = {}
            node_pos.x = q_command.circuit_specs.pos.x + column - 1
            node_pos.y = circuit_num_wires - (q_command.circuit_specs.pos.y + wire - 2)
            node_pos.z = q_command.circuit_specs.pos.z
            -- TODO: Change to add_node() for clarity?
            minetest.set_node(node_pos,
                    {name="circuit_blocks:circuit_blocks_empty_wire"})

            -- Update the metadata in these newly created nodes
            local meta = minetest.get_meta(node_pos)
            meta:set_int("circuit_specs_num_wires", circuit_num_wires)
            meta:set_int("circuit_specs_num_columns", circuit_num_columns)
            meta:set_int("circuit_specs_is_on_grid", 1)
            meta:set_int("circuit_specs_pos_x", node_pos.x)
            meta:set_int("circuit_specs_pos_y", node_pos.y)
            meta:set_int("circuit_specs_pos_z", node_pos.z)
            -- minetest.debug("meta:to_table():\n" .. dump(meta:to_table()))
        end
    end
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
    if(formname == "create_circuit_grid") then
        if fields.num_wires_str and fields.num_columns_str and
                fields.start_z_offset_str and fields.start_x_offset_str then
            local num_wires = tonumber(fields.num_wires_str)
            local num_columns = tonumber(fields.num_columns_str)
            local start_z_offset = tonumber(fields.start_z_offset_str)
            local start_x_offset = tonumber(fields.start_x_offset_str)

            if num_wires and num_wires > 0 and
                    num_columns and num_columns > 0 and
                    start_z_offset and start_z_offset > 0 and
                    start_x_offset then
                -- Store position of left-most, bottom-most block, and dimensions of circuit
                q_command.circuit_specs.pos.x = q_command.block_pos.x - start_x_offset
                q_command.circuit_specs.pos.y = q_command.block_pos.y
                q_command.circuit_specs.pos.z = q_command.block_pos.z + start_z_offset
                q_command.circuit_specs.num_wires = num_wires
                q_command.circuit_specs.num_columns = num_columns
                minetest.debug("q_command.circuit_specs: " .. dump(q_command.circuit_specs))

                -- Create circuit grid with empty blocks
                q_command:create_blank_circuit_grid()
            else
                -- TODO: Show error message dialog?
                minetest.chat_send_player(player:get_player_name(),
                    "Circuit not created! ")
            end
            return
        end
    end
end)

minetest.register_node("q_command:q_block", {
    description = "Q command block",
    tiles = {"q_command_block.png"},
    groups = {oddly_breakable_by_hand=2},
    on_construct = function(pos)
        local meta = minetest.get_meta(pos)
        meta:set_string("infotext", "Quantum circuit command block")
        q_command.block_pos = pos
    end,
    on_rightclick = function(pos, node, clicker, itemstack)
        local player_name = clicker:get_player_name()
        local meta = minetest.get_meta(pos)
        local formspec = "size[5.0, 4.6]"..
                "field[1.0,0.5;1.5,1.5;num_wires_str;Wires:;3]" ..
                "field[3.0,0.5;1.5,1.5;num_columns_str;Columns:;5]" ..
                "field[1.0,2.0;1.5,1.5;start_z_offset_str;Forward offset:;4]" ..
                "field[3.0,2.0;1.5,1.5;start_x_offset_str;Left offset:;2]" ..
				"button_exit[1.8,3.5;1.5,1.0;create;Create]"
        minetest.show_formspec(player_name, "create_circuit_grid", formspec)
    end
})




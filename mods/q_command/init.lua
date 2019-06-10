-- TODO:
--  Define Quantum control block that creates circuit, etc.

-- our API object
q_command = {}

q_command.block_pos = {}
q_command.circuit_specs = {}
q_command.circuit_specs.pos = {}

minetest.register_on_player_receive_fields(function(player, formname, fields)
    if(formname == "create_circuit_grid") then
        if fields.num_wires and tonumber(fields.num_wires) > 0 and
                fields.num_columns and tonumber(fields.num_columns) > 0 and
                fields.start_z_offset and tonumber(fields.start_z_offset) > 0 and
                fields.start_x_offset and tonumber(fields.start_x_offset) > 0 then
            minetest.chat_send_player(player:get_player_name(),
                    "Creating circuit grid with " ..
                            fields["num_wires"] .. " wires, " ..
                            fields["num_columns"] .. " columns, " ..
                            fields["start_z_offset"] .. " start_z_offset, " ..
                            fields["start_x_offset"] .. " start_x_offset"
            )

            -- Store position of left-most, bottom-most block, and dimensions of circuit
            q_command.circuit_specs.pos.x = q_command.block_pos.x -
                    tonumber(fields.start_x_offset)
            q_command.circuit_specs.pos.y = q_command.block_pos.y
            q_command.circuit_specs.pos.z = q_command.block_pos.z +
                    tonumber(fields.start_z_offset)

            q_command.circuit_specs.num_wires = tonumber(fields.num_wires)
            q_command.circuit_specs.num_columns = tonumber(fields.num_columns)
            minetest.debug("q_command.circuit_specs: " .. dump(q_command.circuit_specs))

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
                "field[1.0,0.5;1.5,1.5;num_wires;Wires:;3]" ..
                "field[3.0,0.5;1.5,1.5;num_columns;Columns:;8]" ..
                "field[1.0,2.0;1.5,1.5;start_z_offset;Forward offset:;3]" ..
                "field[3.0,2.0;1.5,1.5;start_x_offset;Left offset:;4]" ..
				"button_exit[1.8,3.5;1.5,1.0;create;Create]"
        minetest.show_formspec(player_name, "create_circuit_grid", formspec)
    end
})




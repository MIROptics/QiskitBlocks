-- TODO:
--  Define Quantum control block that creates circuit, etc.

-- our API object
q_command = {}

q_command.block_pos = {}
q_command.circuit_specs = {}
q_command.circuit_specs.pos = {}

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
                "field[3.0,0.5;1.5,1.5;num_columns_str;Columns:;8]" ..
                "field[1.0,2.0;1.5,1.5;start_z_offset_str;Forward offset:;3]" ..
                "field[3.0,2.0;1.5,1.5;start_x_offset_str;Left offset:;4]" ..
				"button_exit[1.8,3.5;1.5,1.0;create;Create]"
        minetest.show_formspec(player_name, "create_circuit_grid", formspec)
    end
})




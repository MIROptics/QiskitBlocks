-- TODO:
--  Define Quantum control block that creates circuit, etc.

-- our API object
q_command = {}

minetest.debug("In q_command/init.lua")

minetest.register_on_player_receive_fields(function(player, formname, fields)
    if(formname == "create_circuit_grid") then
        if fields.num_wires and fields.num_columns and
                fields.start_z_offset and fields.start_x_offset then
            minetest.chat_send_player(player:get_player_name(),
                    "Creating circuit grid with " ..
                            fields["num_wires"] .. " wires, " ..
                            fields["num_columns"] .. " columns, " ..
                            fields["start_z_offset"] .. " start_z_offset, " ..
                            fields["start_x_offset"] .. " start_x_offset"
            )
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




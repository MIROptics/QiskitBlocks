-- TODO:
--  Define Quantum control block that creates circuit, etc.

-- our API object
q_command = {}

minetest.debug("In q_command/init.lua")

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if(fields.leave) then
		minetest.kick_player(player:get_player_name(), S("You have voluntarily exited the tutorial."))
		return
	elseif(fields.teleport) then
		teleport_dialog(player)
		return
	elseif(fields.gotoend) then
		tutorial.go_to_end(player)
		return
	end
	if formname == "tutorial_teleport" then
		for id, data in pairs(tutorial.locations) do
			if(fields["teleport_"..id]) then
				tutorial.teleport(player, data[1], data[2], data[3])
				break
			end
		end
	end
end)

minetest.register_node("q_command:q_block", {
    description = "Q command block",
    tiles = {"q_command_block.png"},
    groups = {oddly_breakable_by_hand=2},
    on_construct = function(pos)
        local meta = minetest.get_meta(pos)
        meta:set_string("infotext", "Quantum circuit command block");
        meta:set_string("formspec",
                "size[3.0, 5.0]"..
                "field[1.0, 0.5; 1.5, 1.0; num_wires; Wires:; 3]" ..
                "field[1.0, 2.0; 1.5, 1.0; num_columns; Columns:; 8]" ..
				"button_exit[1.0, 3.5; 1.5, 1.0; create_circuit_grid; Create]"
		)
    end
})




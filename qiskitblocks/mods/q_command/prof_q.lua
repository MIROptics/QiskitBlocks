--[[
Copyright 2019 the original author or authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
--]]

--[[
Facility that guides the player through solving circuit puzzles and
other challenges, including navigation and understanding quantum
computing concepts. Includes chat and an NPC (non-player character)
--]]


-- our API object
prof_q = {}

-- Areas in the world in which Prof Q interacts with players
prof_q.areas = {}

-- Relevant data about areas
-- x_gate_escape:
prof_q.areas.x_gate_escape = {}
prof_q.areas.x_gate_escape.center_pos = {x = 238, y = 0, z = 72}
prof_q.areas.x_gate_escape.radius = 5
prof_q.areas.x_gate_escape.help_chat_msg = {
	"Hello test subject #10576, er, I mean esteemed colleague. My name is Professor Q.",
	"I'm standing behind this blast glass because we're going to try an experiment.",
	"Hopefully this won't scramble your molecules or vaporize you :-)",
	"Please grab the Pauli-X gate from the chest (right-click to open it),",
	"and place it on the circuit in the box with the dashed-lines (by right-clicking)"
}
prof_q.areas.x_gate_escape.help_success_msg = {
	"That was great how you used the Pauli-X gate, or NOT gate, to change the quantum",
	"state from |0> to the desired state shown on the wall. In addition to making the",
	"liquid levels show 100% probability of measurement resulting in |1>, notice that",
	"the marker on the Bloch sphere moved from the top representing |0>, to the bottom",
	"representing |1>. Congrats, and now on to the next circuit puzzle!"
}
prof_q.areas.x_gate_escape.help_chat_sent = false
prof_q.areas.x_gate_escape.success_chat_sent = false
prof_q.areas.x_gate_escape.q_block_pos = {x = 240, y = 0, z = 74}


-- x_gates_2_wire:
prof_q.areas.x_gates_2_wire = {}
prof_q.areas.x_gates_2_wire.center_pos = {x = 238, y = 0, z = 62}
prof_q.areas.x_gates_2_wire.radius = 5
prof_q.areas.x_gates_2_wire.help_chat_msg = {
	"I see that you survived the previous experiment! Now let's experiment with multi-qubit",
	"circuits like this one. Place one or more Pauli-X gates on the circuit so that its",
	"quantum state matches what is on the wall, namely |10>"
}
prof_q.areas.x_gates_2_wire.help_success_msg = {
	"Well done! You made the |10> quantum state that consists of two qubits by making",
	"the bottom wire |1> with an X gate and leaving the top wire unchanged at |0>. Now",
	"the liquid levels show 100% probability of measurement resulting in |10>, and the",
	"marker on the bottom Bloch sphere moved from representing |0> to representing |1>"
}
prof_q.areas.x_gates_2_wire.help_chat_sent = false
prof_q.areas.x_gates_2_wire.success_chat_sent = false
prof_q.areas.x_gates_2_wire.q_block_pos = {x = 240, y = 0, z = 65}


-- x_gates_3_wire:
prof_q.areas.x_gates_3_wire = {}
prof_q.areas.x_gates_3_wire.center_pos = {x = 248, y = 0, z = 62}
prof_q.areas.x_gates_3_wire.radius = 5
prof_q.areas.x_gates_3_wire.help_chat_msg = {
	"Here you'll do more of the same, but with one additional wire and twice the",
	"number of basis states."
}
prof_q.areas.x_gates_3_wire.help_success_msg = {
	"You're catching on quickly! You're also noticing that there are 2 to the n power of",
	"basis states, where n is the number of wires. Here, there are 3 wires, so 8 basis",
	"states, |000> through |111>"
}
prof_q.areas.x_gates_3_wire.help_chat_sent = false
prof_q.areas.x_gates_3_wire.success_chat_sent = false
prof_q.areas.x_gates_3_wire.q_block_pos = {x = 244, y = -1, z = 64}


-- h_gate_escape:
prof_q.areas.h_gate_escape = {}
prof_q.areas.h_gate_escape.center_pos = {x = 248, y = 0, z = 72}
prof_q.areas.h_gate_escape.radius = 5
prof_q.areas.h_gate_escape.help_chat_msg = {
	"This room is where Schroedinger's cat starts getting nervous. Put the qubit in an equal",
	"superposition of dead and alive, I mean |0> and |1>"
}
prof_q.areas.h_gate_escape.help_success_msg = {
	"You've successfully put the qubit in the |+> state where it has an equal probability of",
	"measurements resulting in |0> or |1>. You also made the marker on the Bloch sphere",
	"move to its equator, where the distances to the north pole |0> and the south pole |1> ",
	"are equal. Fun fact: The probability of a |0> measurement result is proportional to",
	"the vertical (Z axis) distance of the qubit's state to the south pole on the Bloch sphere!"
}
prof_q.areas.h_gate_escape.help_chat_sent = false
prof_q.areas.h_gate_escape.success_chat_sent = false
prof_q.areas.h_gate_escape.q_block_pos = {x = 247, y = 0, z = 74}


-- h_x_gate:
prof_q.areas.h_x_gate = {}
prof_q.areas.h_x_gate.center_pos = {x = 258, y = 0, z = 72}
prof_q.areas.h_x_gate.radius = 5
prof_q.areas.h_x_gate.help_chat_msg = {
	"Now let's visit the back side of the Bloch sphere, in a state commonly known as |->",
	"(where measurements resulting in |0> or |1> are also equally likely)"
}
prof_q.areas.h_x_gate.help_success_msg = {
	"Nice navigation! You're noticing how the quantum computing gates such as X and Hadamard",
	"may be represented as rotations on the Bloch sphere. The X gate rotates 180 degrees, also",
	"known as pi radians, around the X axis (which is the axis coming toward you but a bit down)",
	"and to the left). You also may have noticed that the H gate rotates pi radians around an",
	"axis that is halfway in-between the X and Z axes."
}
prof_q.areas.h_x_gate.help_chat_sent = false
prof_q.areas.h_x_gate.success_chat_sent = false
prof_q.areas.h_x_gate.q_block_pos = {x = 260, y = 0, z = 73}


-- h_z_gate:
prof_q.areas.h_z_gate = {}
prof_q.areas.h_z_gate.center_pos = {x = 258, y = 0, z = 62}
prof_q.areas.h_z_gate.radius = 5
prof_q.areas.h_z_gate.help_chat_msg = {
	"Let's take another trip to the |-> state, but this time via a different route."
}
prof_q.areas.h_z_gate.help_success_msg = {
	"I like how you've demonstrated that there several (an infinite number of) ways for a quantum",
	"state to evolve to a different quantum state. This time, you used the H gate to move to the",
	"|+> state, and then you changed the phase of the quantum state by pi radians, using the Z gate",
	"to rotate around the Z axis. You may have noticed that the arrows in the liquid blocks point",
	"in opposite directions (pi radians out of phase) when this one-qubit circuit is in the |-> state."
}
prof_q.areas.h_z_gate.help_chat_sent = false
prof_q.areas.h_z_gate.success_chat_sent = false
prof_q.areas.h_z_gate.q_block_pos = {x = 259, y = 0, z = 60}


-- hxx_gates_escape:
prof_q.areas.hxx_gates_escape = {}
prof_q.areas.hxx_gates_escape.center_pos = {x = 268, y = 0, z = 62}
prof_q.areas.hxx_gates_escape.radius = 5
prof_q.areas.hxx_gates_escape.help_chat_msg = {
	"Go ahead and solve this puzzle by thinking about one wire at a time"
}
prof_q.areas.hxx_gates_escape.help_success_msg = {
	"You're really getting the hang of this! By thinking about the effects of various gates on",
	"individual wires, you've successfully crafted the desired composite quantum state."
}
prof_q.areas.hxx_gates_escape.help_chat_sent = false
prof_q.areas.hxx_gates_escape.success_chat_sent = false
prof_q.areas.hxx_gates_escape.q_block_pos = {x = 271, y = -1, z = 66}


-- equal_super_2wire_escape:
prof_q.areas.equal_super_2wire_escape = {}
prof_q.areas.equal_super_2wire_escape.center_pos = {x = 268, y = 0, z = 72}
prof_q.areas.equal_super_2wire_escape.radius = 5
prof_q.areas.equal_super_2wire_escape.help_chat_msg = {
	"Welcome to this equal_super_2wire_escape circuit puzzle!"
}
prof_q.areas.equal_super_2wire_escape.help_success_msg = {
	"equal_super_2wire_escape Congratulations!"
}
prof_q.areas.equal_super_2wire_escape.help_chat_sent = false
prof_q.areas.equal_super_2wire_escape.success_chat_sent = false
prof_q.areas.equal_super_2wire_escape.q_block_pos = {x = 266, y = 0, z = 75}


-- equal_super_3wire_escape:
prof_q.areas.equal_super_3wire_escape = {}
prof_q.areas.equal_super_3wire_escape.center_pos = {x = 268, y = 0, z = 82}
prof_q.areas.equal_super_3wire_escape.radius = 5
prof_q.areas.equal_super_3wire_escape.help_chat_msg = {
	"Welcome to this equal_super_3wire_escape circuit puzzle!"
}
prof_q.areas.equal_super_3wire_escape.help_success_msg = {
	"equal_super_3wire_escape Congratulations!"
}
prof_q.areas.equal_super_3wire_escape.help_chat_sent = false
prof_q.areas.equal_super_3wire_escape.success_chat_sent = false
prof_q.areas.equal_super_3wire_escape.q_block_pos = {x = 264, y = -1, z = 78}


-- bell_phi_plus_escape:
prof_q.areas.bell_phi_plus_escape = {}
prof_q.areas.bell_phi_plus_escape.center_pos = {x = 268, y = 0, z = 92}
prof_q.areas.bell_phi_plus_escape.radius = 5
prof_q.areas.bell_phi_plus_escape.help_chat_msg = {
	"Welcome to this bell_phi_plus_escape circuit puzzle!"
}
prof_q.areas.bell_phi_plus_escape.help_success_msg = {
	"bell_phi_plus_escape Congratulations!"
}
prof_q.areas.bell_phi_plus_escape.help_chat_sent = false
prof_q.areas.bell_phi_plus_escape.success_chat_sent = false
prof_q.areas.bell_phi_plus_escape.q_block_pos = {x = 266, y = 0, z = 94}


-- bell_phi_minus_escape:
prof_q.areas.bell_phi_minus_escape = {}
prof_q.areas.bell_phi_minus_escape.center_pos = {x = 258, y = 0, z = 92}
prof_q.areas.bell_phi_minus_escape.radius = 5
prof_q.areas.bell_phi_minus_escape.help_chat_msg = {
	"Welcome to this bell_phi_minus_escape circuit puzzle!"
}
prof_q.areas.bell_phi_minus_escape.help_success_msg = {
	"bell_phi_minus_escape Congratulations!"
}
prof_q.areas.bell_phi_minus_escape.help_chat_sent = false
prof_q.areas.bell_phi_minus_escape.success_chat_sent = false
prof_q.areas.bell_phi_minus_escape.q_block_pos = {x = 256, y = 0, z = 90}


-- bell_psi_plus_escape:
prof_q.areas.bell_psi_plus_escape = {}
prof_q.areas.bell_psi_plus_escape.center_pos = {x = 258, y = 0, z = 82}
prof_q.areas.bell_psi_plus_escape.radius = 5
prof_q.areas.bell_psi_plus_escape.help_chat_msg = {
	"Welcome to this bell_psi_plus_escape circuit puzzle!"
}
prof_q.areas.bell_psi_plus_escape.help_success_msg = {
	"bell_psi_plus_escape Congratulations!"
}
prof_q.areas.bell_psi_plus_escape.help_chat_sent = false
prof_q.areas.bell_psi_plus_escape.success_chat_sent = false
prof_q.areas.bell_psi_plus_escape.q_block_pos = {x = 260, y = 0, z = 80}


-- bell_psi_minus_escape:
prof_q.areas.bell_psi_minus_escape = {}
prof_q.areas.bell_psi_minus_escape.center_pos = {x = 248, y = 0, z = 82}
prof_q.areas.bell_psi_minus_escape.radius = 5
prof_q.areas.bell_psi_minus_escape.help_chat_msg = {
	"Welcome to this bell_psi_minus_escape circuit puzzle!"
}
prof_q.areas.bell_psi_minus_escape.help_success_msg = {
	"bell_psi_minus_escape Congratulations!"
}
prof_q.areas.bell_psi_minus_escape.help_chat_sent = false
prof_q.areas.bell_psi_minus_escape.success_chat_sent = false
prof_q.areas.bell_psi_minus_escape.q_block_pos = {x = 245, y = 0, z = 80}


-- ghz_state_escape:
prof_q.areas.ghz_state_escape = {}
prof_q.areas.ghz_state_escape.center_pos = {x = 248, y = 0, z = 92}
prof_q.areas.ghz_state_escape.radius = 5
prof_q.areas.ghz_state_escape.help_chat_msg = {
	"Welcome to this ghz_state_escape circuit puzzle!"
}
prof_q.areas.ghz_state_escape.help_success_msg = {
	"ghz_state_escape Congratulations!"
}
prof_q.areas.ghz_state_escape.help_chat_sent = false
prof_q.areas.ghz_state_escape.success_chat_sent = false
prof_q.areas.ghz_state_escape.q_block_pos = {x = 244, y = 0, z = 96}


-- y_z_rot_1wire_escape:
prof_q.areas.y_z_rot_1wire_escape = {}
prof_q.areas.y_z_rot_1wire_escape.center_pos = {x = 238, y = 0, z = 92}
prof_q.areas.y_z_rot_1wire_escape.radius = 5
prof_q.areas.y_z_rot_1wire_escape.help_chat_msg = {
	"Welcome to this y_z_rot_1wire_escape circuit puzzle!"
}
prof_q.areas.y_z_rot_1wire_escape.help_success_msg = {
	"y_z_rot_1wire_escape Congratulations!"
}
prof_q.areas.y_z_rot_1wire_escape.help_chat_sent = false
prof_q.areas.y_z_rot_1wire_escape.success_chat_sent = false
prof_q.areas.y_z_rot_1wire_escape.q_block_pos = {x = 236, y = 0, z = 90}


-- phase_rot_2wire_escape:
prof_q.areas.phase_rot_2wire_escape = {}
prof_q.areas.phase_rot_2wire_escape.center_pos = {x = 238, y = 0, z = 82}
prof_q.areas.phase_rot_2wire_escape.radius = 5
prof_q.areas.phase_rot_2wire_escape.help_chat_msg = {
	"Welcome to this phase_rot_2wire_escape circuit puzzle!"
}
prof_q.areas.phase_rot_2wire_escape.help_success_msg = {
	"phase_rot_2wire_escape Congratulations!"
}
prof_q.areas.phase_rot_2wire_escape.help_chat_sent = false
prof_q.areas.phase_rot_2wire_escape.success_chat_sent = false
prof_q.areas.phase_rot_2wire_escape.q_block_pos = {x = 240, y = -1, z = 80}


-- Periodically check all areas for player
minetest.register_globalstep(function(dtime)

	for key, area in pairs(prof_q.areas) do
		for _,object in
		ipairs(minetest.get_objects_inside_radius(
				area.center_pos,
				area.radius)) do
			if object:is_player() then
				if not area.help_chat_sent then
					minetest.chat_send_player(object:get_player_name(), "----- Prof Q: -----")
					for idx = 1, #area.help_chat_msg do
        				minetest.chat_send_player(object:get_player_name(), area.help_chat_msg[idx])
      				end

					area.help_chat_sent = true
				end

				if area.q_block_pos and
						q_command:get_q_command_block(area.q_block_pos).circuit_puzzle_solved() and
						not area.success_chat_sent then
					minetest.chat_send_player(object:get_player_name(), "----- Prof Q: -----")
					for idx = 1, #area.help_success_msg do
        				minetest.chat_send_player(object:get_player_name(), area.help_success_msg[idx])
      				end
					area.success_chat_sent = true
				end
			end
		end
	end
end)


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
Elements of the q_command table that supply information about areas in the game
--]]

-- Escape room puzzles Level III ------------------------------------------------
-------- Room 1 (Level III)
q_command.areas.swap_escape = {}
q_command.areas.swap_escape.region = q_command.regions.esc_rooms_level_3
table.insert(q_command.regions.esc_rooms_level_3, q_command.areas.swap_escape)
q_command.areas.swap_escape.area_num = #q_command.regions.esc_rooms_level_3

q_command.areas.swap_escape.center_pos = {x = 208, y = 0, z = 42}
q_command.areas.swap_escape.radius = 5
q_command.areas.swap_escape.q_block_pos = {x = 212, y = 0, z = 38}

q_command.areas.swap_escape.door_pos = {x = 213, y = 0, z = 44}
q_command.areas.swap_escape.chest_pos = {x = 210, y = 0, z = 46}
q_command.areas.swap_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "circuit_blocks:circuit_blocks_gate_qubit_1", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "circuit_blocks:swap_tool", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "circuit_blocks:circuit_blocks_swap", [23] = "", [24] = "",
                [25] = "", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "",
                [31] = "", [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.swap_escape.solution_unitary =
{{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.swap_escape.help_chat_msg = {
	"Hello again, esteemed colleague! I'm sure you remember that my name is Professor Q ",
	"and that I'm standing behind this explosion-proof glass. For this experiment, make ",
	"a circuit that swaps the qubit states of two wires as shown on the wall. You may ",
	"place |1> blocks on wires to test input combinations without affecting the exit ",
    "door. "
}
q_command.areas.swap_escape.help_chat_sent = false
q_command.areas.swap_escape.help_success_msg = {
	"Well done! "
    -- TODO: Provide more explanation of what the player successfully did
}
q_command.areas.swap_escape.success_chat_sent = false

q_command.areas.swap_escape.help_btn_text = {}
q_command.areas.swap_escape.help_btn_text.en =
[[
Hello again, esteemed colleague! I'm sure you remember that my name is
Professor Q. and that I'm standing behind this explosion-proof glass.
For this experiment, make a circuit that swaps the qubit states of two
wires as shown on the wall. You may place |1> blocks on wires to test
input combinations without affecting the exit door.

Notes: Most of the help that you'll need for these 'escape room' circuit
puzzles will appear in the chat area (upper left corner of your window)
by Professor Q. For all of these puzzles, get blocks from the chest and
place them on the circuit. When you solve a puzzle, the Q block will
turn gold, celebration music will play, and the door to the next room
will open. Please solve the Levels I and II escape rooms if you haven't
already, as they help build knowledge and skills for these Level III
puzzles.

To perform a measurement on a circuit, right-click a measurement block.

TODO: Insert instructions for using a Swap block and Swap Tool
]]
q_command.areas.swap_escape.help_btn_text.es = q_command.areas.swap_escape.help_btn_text.en
q_command.areas.swap_escape.help_btn_text.ja = q_command.areas.swap_escape.help_btn_text.en
q_command.areas.swap_escape.help_btn_caption = {}
q_command.areas.swap_escape.help_btn_caption.en = "Swap the qubit states of two wires"
q_command.areas.swap_escape.help_btn_caption.es = q_command.areas.swap_escape.help_btn_caption.en
q_command.areas.swap_escape.help_btn_caption.ja = q_command.areas.swap_escape.help_btn_caption.en

-------- Room 2 (Level III)
q_command.areas.ctrl_swap_escape = {}
q_command.areas.ctrl_swap_escape.region = q_command.regions.esc_rooms_level_3
table.insert(q_command.regions.esc_rooms_level_3, q_command.areas.ctrl_swap_escape)
q_command.areas.ctrl_swap_escape.area_num = #q_command.regions.esc_rooms_level_3

q_command.areas.ctrl_swap_escape.center_pos = {x = 218, y = 0, z = 42}
q_command.areas.ctrl_swap_escape.radius = 5
q_command.areas.ctrl_swap_escape.q_block_pos = {x = 222, y = 0, z = 46}

q_command.areas.ctrl_swap_escape.door_pos = {x = 220, y = 0, z = 37}
q_command.areas.ctrl_swap_escape.chest_pos = {x = 214, y = 0, z = 40}
q_command.areas.ctrl_swap_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "circuit_blocks:circuit_blocks_gate_qubit_1", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "circuit_blocks:swap_tool", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "circuit_blocks:circuit_blocks_swap", [23] = "", [24] = "",
                [25] = "", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "",
                [31] = "circuit_blocks:control_tool", [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.ctrl_swap_escape.solution_unitary =
{{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.ctrl_swap_escape.help_chat_msg = {
	"Make a circuit that conditionally swaps the qubits as shown on the wall."
}
q_command.areas.ctrl_swap_escape.help_chat_sent = false
q_command.areas.ctrl_swap_escape.help_success_msg = {
	"Well done! "
    -- TODO: Provide more explanation of what the player successfully did
}
q_command.areas.ctrl_swap_escape.success_chat_sent = false

q_command.areas.ctrl_swap_escape.help_btn_text = {}
q_command.areas.ctrl_swap_escape.help_btn_text.en =
[[
Make a circuit that conditionally swaps the qubits as shown on the wall
]]
q_command.areas.ctrl_swap_escape.help_btn_text.es = q_command.areas.ctrl_swap_escape.help_btn_text.en
q_command.areas.ctrl_swap_escape.help_btn_text.ja = q_command.areas.ctrl_swap_escape.help_btn_text.en
q_command.areas.ctrl_swap_escape.help_btn_caption = {}
q_command.areas.ctrl_swap_escape.help_btn_caption.en = "Conditionally swap the qubit states of two wires"
q_command.areas.ctrl_swap_escape.help_btn_caption.es = q_command.areas.ctrl_swap_escape.help_btn_caption.en
q_command.areas.ctrl_swap_escape.help_btn_caption.ja = q_command.areas.ctrl_swap_escape.help_btn_caption.en
-- END Escape room puzzles Level III --------------------------------------------

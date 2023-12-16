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
Elements of the q_command table that supply information about areas in the game.
The "Note to devs" comments in Room 1 apply to all escape rooms in all levels
--]]

-------- Room 1 (Level III)
q_command.areas.swap_escape = {}
q_command.areas.swap_escape.region = q_command.regions.esc_rooms_level_3
table.insert(q_command.regions.esc_rooms_level_3, q_command.areas.swap_escape)
q_command.areas.swap_escape.area_num = #q_command.regions.esc_rooms_level_3

q_command.areas.swap_escape.center_pos = {x = 208, y = 0, z = 42}
q_command.areas.swap_escape.radius = 5
q_command.areas.swap_escape.q_block_pos = {x = 212, y = 0, z = 38}

q_command.areas.swap_escape.door_pos = {x = 213, y = 0, z = 44}
q_command.areas.swap_escape.portal_pos = {x = 213, y = 1, z = 43}
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
q_command.areas.ctrl_swap_escape.portal_pos = {x = 218, y = 1, z = 37}
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


-------- Room 3 (Level III)
q_command.areas.lev_3_rm_3 = {}
q_command.areas.lev_3_rm_3.region = q_command.regions.esc_rooms_level_3
table.insert(q_command.regions.esc_rooms_level_3, q_command.areas.lev_3_rm_3)
q_command.areas.lev_3_rm_3.area_num = #q_command.regions.esc_rooms_level_3

q_command.areas.lev_3_rm_3.center_pos = {x = 218, y = 0, z = 32}
q_command.areas.lev_3_rm_3.radius = 5
q_command.areas.lev_3_rm_3.q_block_pos = {x = 221, y = 0, z = 34}

q_command.areas.lev_3_rm_3.door_pos = {x = 213, y = 0, z = 30}
q_command.areas.lev_3_rm_3.portal_pos = {x = 223, y = 1, z = 35}
q_command.areas.lev_3_rm_3.chest_pos = {x = 216, y = 0, z = 28}
q_command.areas.lev_3_rm_3.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "", [5] = "", [6] = "",
                [7] = "",
                [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "", [13] = "", [14] = "",
                [15] = "",
                [16] = "",
                [17] = "",
                [18] = "",
                [19] = "",
                [20] = "circuit_blocks:circuit_blocks_sdg_gate",
                [21] = "circuit_blocks:circuit_blocks_tdg_gate",
                [22] = "",
                [23] = "",
                [24] = "",
                [25] = "",
                [26] = "",
                [27] = "",
                [28] = "circuit_blocks:circuit_blocks_s_gate",
                [29] = "circuit_blocks:circuit_blocks_t_gate",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "",
                [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
--[[
q_command.areas.lev_3_rm_3.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}
--]]

q_command.areas.lev_3_rm_3.solution_statevector =
{{r=0.5,i=0},{r=0.354,i=-0.354},{r=0,i=0.5},{r=0.354,i=0.354}}


q_command.areas.lev_3_rm_3.help_chat_msg = {
	"Make a circuit that produces the statevector shown on the wall."
}
q_command.areas.lev_3_rm_3.help_chat_msg.ja = q_command.areas.lev_3_rm_3.help_chat_msg
q_command.areas.lev_3_rm_3.help_chat_msg.es = q_command.areas.lev_3_rm_3.help_chat_msg
q_command.areas.lev_3_rm_3.help_chat_sent = false
q_command.areas.lev_3_rm_3.help_success_msg = {
	"Nice job. As you can see, the S and T gates rotate the phase by ",
    "pi/2 and pi/4 respectively."
}
q_command.areas.lev_3_rm_3.help_success_msg.ja = q_command.areas.lev_3_rm_3.help_success_msg
q_command.areas.lev_3_rm_3.help_success_msg.es = q_command.areas.lev_3_rm_3.help_success_msg
q_command.areas.lev_3_rm_3.success_chat_sent = false

q_command.areas.lev_3_rm_3.help_btn_text = {}
q_command.areas.lev_3_rm_3.help_btn_text.en =
[[
Make a circuit that produces the statevector shown on the wall.
]]
q_command.areas.lev_3_rm_3.help_btn_text.es = q_command.areas.lev_3_rm_3.help_btn_text.en
q_command.areas.lev_3_rm_3.help_btn_text.ja = q_command.areas.lev_3_rm_3.help_btn_text.en
q_command.areas.lev_3_rm_3.help_btn_caption = {}
q_command.areas.lev_3_rm_3.help_btn_caption.en = "Experiment with S and T gates"
q_command.areas.lev_3_rm_3.help_btn_caption.es = q_command.areas.lev_3_rm_3.help_btn_caption.en
q_command.areas.lev_3_rm_3.help_btn_caption.ja = q_command.areas.lev_3_rm_3.help_btn_caption.en


-------- Room 4 (Level III)
q_command.areas.lev_3_rm_4 = {}
q_command.areas.lev_3_rm_4.region = q_command.regions.esc_rooms_level_3
table.insert(q_command.regions.esc_rooms_level_3, q_command.areas.lev_3_rm_4)
q_command.areas.lev_3_rm_4.area_num = #q_command.regions.esc_rooms_level_3

q_command.areas.lev_3_rm_4.center_pos = {x = 208, y = 0, z = 32}
q_command.areas.lev_3_rm_4.radius = 5
q_command.areas.lev_3_rm_4.q_block_pos = {x = 206, y = 0, z = 35}

q_command.areas.lev_3_rm_4.door_pos = {x = 203, y = 0, z = 34}
q_command.areas.lev_3_rm_4.portal_pos = {x = 213, y = 1, z = 32}
q_command.areas.lev_3_rm_4.chest_pos = {x = 204, y = 0, z = 30}
q_command.areas.lev_3_rm_4.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "", [5] = "", [6] = "",
                [7] = "circuit_blocks:circuit_blocks_gate_qubit_0",
                [8] = "circuit_blocks:circuit_blocks_gate_qubit_1",
                [9] = "", [10] = "", [11] = "", [12] = "", [13] = "", [14] = "",
                [15] = "circuit_blocks:swap_tool",
                [16] = "circuit_blocks:circuit_blocks_if_c0_eq0",
                [17] = "circuit_blocks:circuit_blocks_rx_gate_0p16",
                [18] = "circuit_blocks:circuit_blocks_ry_gate_0p16",
                [19] = "circuit_blocks:circuit_blocks_rz_gate_0p16",
                [20] = "circuit_blocks:circuit_blocks_sdg_gate",
                [21] = "circuit_blocks:circuit_blocks_tdg_gate",
                [22] = "circuit_blocks:circuit_blocks_swap",
                [23] = "circuit_blocks:rotate_tool",
                [24] = "circuit_blocks:circuit_blocks_barrier",
                [25] = "circuit_blocks:circuit_blocks_x_gate",
                [26] = "circuit_blocks:circuit_blocks_y_gate",
                [27] = "circuit_blocks:circuit_blocks_z_gate",
                [28] = "circuit_blocks:circuit_blocks_s_gate",
                [29] = "circuit_blocks:circuit_blocks_t_gate",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool",
                [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.lev_3_rm_4.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_3_rm_4.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall. (4)"
}
q_command.areas.lev_3_rm_4.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_3_rm_4.help_chat_sent = false
q_command.areas.lev_3_rm_4.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_3_rm_4.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_3_rm_4.success_chat_sent = false

q_command.areas.lev_3_rm_4.help_btn_text = {}
q_command.areas.lev_3_rm_4.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_3_rm_4.help_btn_text.es = q_command.areas.lev_3_rm_4.help_btn_text.en
q_command.areas.lev_3_rm_4.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_3_rm_4.help_btn_caption = {}
q_command.areas.lev_3_rm_4.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_3_rm_4.help_btn_caption.es = q_command.areas.lev_3_rm_4.help_btn_caption.en
q_command.areas.lev_3_rm_4.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 5 (Level III)
q_command.areas.lev_3_rm_5 = {}
q_command.areas.lev_3_rm_5.region = q_command.regions.esc_rooms_level_3
table.insert(q_command.regions.esc_rooms_level_3, q_command.areas.lev_3_rm_5)
q_command.areas.lev_3_rm_5.area_num = #q_command.regions.esc_rooms_level_3

q_command.areas.lev_3_rm_5.center_pos = {x = 198, y = 0, z = 32}
q_command.areas.lev_3_rm_5.radius = 5
q_command.areas.lev_3_rm_5.q_block_pos = {x = 200, y = 0, z = 29}

q_command.areas.lev_3_rm_5.door_pos = {x = 200, y = 0, z = 37}
q_command.areas.lev_3_rm_5.portal_pos = {x = 203, y = 1, z = 32}
q_command.areas.lev_3_rm_5.chest_pos = {x = 196, y = 0, z = 36}
q_command.areas.lev_3_rm_5.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "", [5] = "", [6] = "",
                [7] = "circuit_blocks:circuit_blocks_gate_qubit_0",
                [8] = "circuit_blocks:circuit_blocks_gate_qubit_1",
                [9] = "", [10] = "", [11] = "", [12] = "", [13] = "", [14] = "",
                [15] = "circuit_blocks:swap_tool",
                [16] = "circuit_blocks:circuit_blocks_if_c0_eq0",
                [17] = "circuit_blocks:circuit_blocks_rx_gate_0p16",
                [18] = "circuit_blocks:circuit_blocks_ry_gate_0p16",
                [19] = "circuit_blocks:circuit_blocks_rz_gate_0p16",
                [20] = "circuit_blocks:circuit_blocks_sdg_gate",
                [21] = "circuit_blocks:circuit_blocks_tdg_gate",
                [22] = "circuit_blocks:circuit_blocks_swap",
                [23] = "circuit_blocks:rotate_tool",
                [24] = "circuit_blocks:circuit_blocks_barrier",
                [25] = "circuit_blocks:circuit_blocks_x_gate",
                [26] = "circuit_blocks:circuit_blocks_y_gate",
                [27] = "circuit_blocks:circuit_blocks_z_gate",
                [28] = "circuit_blocks:circuit_blocks_s_gate",
                [29] = "circuit_blocks:circuit_blocks_t_gate",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool",
                [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.lev_3_rm_5.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_3_rm_5.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall. (5)"
}
q_command.areas.lev_3_rm_5.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_3_rm_5.help_chat_sent = false
q_command.areas.lev_3_rm_5.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_3_rm_5.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_3_rm_5.success_chat_sent = false

q_command.areas.lev_3_rm_5.help_btn_text = {}
q_command.areas.lev_3_rm_5.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_3_rm_5.help_btn_text.es = q_command.areas.lev_3_rm_5.help_btn_text.en
q_command.areas.lev_3_rm_5.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_3_rm_5.help_btn_caption = {}
q_command.areas.lev_3_rm_5.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_3_rm_5.help_btn_caption.es = q_command.areas.lev_3_rm_5.help_btn_caption.en
q_command.areas.lev_3_rm_5.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 6 (Level III)
q_command.areas.lev_3_rm_6 = {}
q_command.areas.lev_3_rm_6.region = q_command.regions.esc_rooms_level_3
table.insert(q_command.regions.esc_rooms_level_3, q_command.areas.lev_3_rm_6)
q_command.areas.lev_3_rm_6.area_num = #q_command.regions.esc_rooms_level_3

q_command.areas.lev_3_rm_6.center_pos = {x = 198, y = 0, z = 42}
q_command.areas.lev_3_rm_6.radius = 5
q_command.areas.lev_3_rm_6.q_block_pos = {x = 196, y = 0, z = 45}

q_command.areas.lev_3_rm_6.door_pos = {x = 193, y = 0, z = 44}
q_command.areas.lev_3_rm_6.portal_pos = {x = 203, y = 1, z = 40}
q_command.areas.lev_3_rm_6.chest_pos = {x = 202, y = 0, z = 44}
q_command.areas.lev_3_rm_6.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "", [5] = "", [6] = "",
                [7] = "circuit_blocks:circuit_blocks_gate_qubit_0",
                [8] = "circuit_blocks:circuit_blocks_gate_qubit_1",
                [9] = "", [10] = "", [11] = "", [12] = "", [13] = "", [14] = "",
                [15] = "circuit_blocks:swap_tool",
                [16] = "circuit_blocks:circuit_blocks_if_c0_eq0",
                [17] = "circuit_blocks:circuit_blocks_rx_gate_0p16",
                [18] = "circuit_blocks:circuit_blocks_ry_gate_0p16",
                [19] = "circuit_blocks:circuit_blocks_rz_gate_0p16",
                [20] = "circuit_blocks:circuit_blocks_sdg_gate",
                [21] = "circuit_blocks:circuit_blocks_tdg_gate",
                [22] = "circuit_blocks:circuit_blocks_swap",
                [23] = "circuit_blocks:rotate_tool",
                [24] = "circuit_blocks:circuit_blocks_barrier",
                [25] = "circuit_blocks:circuit_blocks_x_gate",
                [26] = "circuit_blocks:circuit_blocks_y_gate",
                [27] = "circuit_blocks:circuit_blocks_z_gate",
                [28] = "circuit_blocks:circuit_blocks_s_gate",
                [29] = "circuit_blocks:circuit_blocks_t_gate",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool",
                [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.lev_3_rm_6.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_3_rm_6.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall. (6)"
}
q_command.areas.lev_3_rm_6.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_3_rm_6.help_chat_sent = false
q_command.areas.lev_3_rm_6.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_3_rm_6.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_3_rm_6.success_chat_sent = false

q_command.areas.lev_3_rm_6.help_btn_text = {}
q_command.areas.lev_3_rm_6.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_3_rm_6.help_btn_text.es = q_command.areas.lev_3_rm_6.help_btn_text.en
q_command.areas.lev_3_rm_6.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_3_rm_6.help_btn_caption = {}
q_command.areas.lev_3_rm_6.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_3_rm_6.help_btn_caption.es = q_command.areas.lev_3_rm_6.help_btn_caption.en
q_command.areas.lev_3_rm_6.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 7 (Level III)
q_command.areas.lev_3_rm_7 = {}
q_command.areas.lev_3_rm_7.region = q_command.regions.esc_rooms_level_3
table.insert(q_command.regions.esc_rooms_level_3, q_command.areas.lev_3_rm_7)
q_command.areas.lev_3_rm_7.area_num = #q_command.regions.esc_rooms_level_3

q_command.areas.lev_3_rm_7.center_pos = {x = 188, y = 0, z = 42}
q_command.areas.lev_3_rm_7.radius = 5
q_command.areas.lev_3_rm_7.q_block_pos = {x = 185, y = 0, z = 40}

q_command.areas.lev_3_rm_7.door_pos = {x = 186, y = 0, z = 37}
q_command.areas.lev_3_rm_7.portal_pos = {x = 193, y = 1, z = 42}
q_command.areas.lev_3_rm_7.chest_pos = {x = 190, y = 0, z = 46}
q_command.areas.lev_3_rm_7.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "", [5] = "", [6] = "",
                [7] = "circuit_blocks:circuit_blocks_gate_qubit_0",
                [8] = "circuit_blocks:circuit_blocks_gate_qubit_1",
                [9] = "", [10] = "", [11] = "", [12] = "", [13] = "", [14] = "",
                [15] = "circuit_blocks:swap_tool",
                [16] = "circuit_blocks:circuit_blocks_if_c0_eq0",
                [17] = "circuit_blocks:circuit_blocks_rx_gate_0p16",
                [18] = "circuit_blocks:circuit_blocks_ry_gate_0p16",
                [19] = "circuit_blocks:circuit_blocks_rz_gate_0p16",
                [20] = "circuit_blocks:circuit_blocks_sdg_gate",
                [21] = "circuit_blocks:circuit_blocks_tdg_gate",
                [22] = "circuit_blocks:circuit_blocks_swap",
                [23] = "circuit_blocks:rotate_tool",
                [24] = "circuit_blocks:circuit_blocks_barrier",
                [25] = "circuit_blocks:circuit_blocks_x_gate",
                [26] = "circuit_blocks:circuit_blocks_y_gate",
                [27] = "circuit_blocks:circuit_blocks_z_gate",
                [28] = "circuit_blocks:circuit_blocks_s_gate",
                [29] = "circuit_blocks:circuit_blocks_t_gate",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool",
                [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.lev_3_rm_7.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_3_rm_7.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall. (7)"
}
q_command.areas.lev_3_rm_7.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_3_rm_7.help_chat_sent = false
q_command.areas.lev_3_rm_7.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_3_rm_7.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_3_rm_7.success_chat_sent = false

q_command.areas.lev_3_rm_7.help_btn_text = {}
q_command.areas.lev_3_rm_7.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_3_rm_7.help_btn_text.es = q_command.areas.lev_3_rm_7.help_btn_text.en
q_command.areas.lev_3_rm_7.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_3_rm_7.help_btn_caption = {}
q_command.areas.lev_3_rm_7.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_3_rm_7.help_btn_caption.es = q_command.areas.lev_3_rm_7.help_btn_caption.en
q_command.areas.lev_3_rm_7.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 8 (Level III)
q_command.areas.lev_3_rm_8 = {}
q_command.areas.lev_3_rm_8.region = q_command.regions.esc_rooms_level_3
table.insert(q_command.regions.esc_rooms_level_3, q_command.areas.lev_3_rm_8)
q_command.areas.lev_3_rm_8.area_num = #q_command.regions.esc_rooms_level_3

q_command.areas.lev_3_rm_8.center_pos = {x = 188, y = 0, z = 32}
q_command.areas.lev_3_rm_8.radius = 5
q_command.areas.lev_3_rm_8.q_block_pos = {x = 191, y = 0, z = 34}

q_command.areas.lev_3_rm_8.door_pos = {x = 190, y = 0, z = 27}
q_command.areas.lev_3_rm_8.portal_pos = {x = 193, y = 1, z = 35}
q_command.areas.lev_3_rm_8.chest_pos = {x = 184, y = 0, z = 34}
q_command.areas.lev_3_rm_8.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "", [5] = "", [6] = "",
                [7] = "circuit_blocks:circuit_blocks_gate_qubit_0",
                [8] = "circuit_blocks:circuit_blocks_gate_qubit_1",
                [9] = "", [10] = "", [11] = "", [12] = "", [13] = "", [14] = "",
                [15] = "circuit_blocks:swap_tool",
                [16] = "circuit_blocks:circuit_blocks_if_c0_eq0",
                [17] = "circuit_blocks:circuit_blocks_rx_gate_0p16",
                [18] = "circuit_blocks:circuit_blocks_ry_gate_0p16",
                [19] = "circuit_blocks:circuit_blocks_rz_gate_0p16",
                [20] = "circuit_blocks:circuit_blocks_sdg_gate",
                [21] = "circuit_blocks:circuit_blocks_tdg_gate",
                [22] = "circuit_blocks:circuit_blocks_swap",
                [23] = "circuit_blocks:rotate_tool",
                [24] = "circuit_blocks:circuit_blocks_barrier",
                [25] = "circuit_blocks:circuit_blocks_x_gate",
                [26] = "circuit_blocks:circuit_blocks_y_gate",
                [27] = "circuit_blocks:circuit_blocks_z_gate",
                [28] = "circuit_blocks:circuit_blocks_s_gate",
                [29] = "circuit_blocks:circuit_blocks_t_gate",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool",
                [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.lev_3_rm_8.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_3_rm_8.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall. (8)"
}
q_command.areas.lev_3_rm_8.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_3_rm_8.help_chat_sent = false
q_command.areas.lev_3_rm_8.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_3_rm_8.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_3_rm_8.success_chat_sent = false

q_command.areas.lev_3_rm_8.help_btn_text = {}
q_command.areas.lev_3_rm_8.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_3_rm_8.help_btn_text.es = q_command.areas.lev_3_rm_8.help_btn_text.en
q_command.areas.lev_3_rm_8.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_3_rm_8.help_btn_caption = {}
q_command.areas.lev_3_rm_8.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_3_rm_8.help_btn_caption.es = q_command.areas.lev_3_rm_8.help_btn_caption.en
q_command.areas.lev_3_rm_8.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 9 (Level III)
q_command.areas.lev_3_rm_9 = {}
q_command.areas.lev_3_rm_9.region = q_command.regions.esc_rooms_level_3
table.insert(q_command.regions.esc_rooms_level_3, q_command.areas.lev_3_rm_9)
q_command.areas.lev_3_rm_9.area_num = #q_command.regions.esc_rooms_level_3

q_command.areas.lev_3_rm_9.center_pos = {x = 188, y = 0, z = 22}
q_command.areas.lev_3_rm_9.radius = 5
q_command.areas.lev_3_rm_9.q_block_pos = {x = 185, y = 0, z = 20}

q_command.areas.lev_3_rm_9.door_pos = {x = 186, y = 0, z = 17}
q_command.areas.lev_3_rm_9.portal_pos = {x = 193, y = 1, z = 22}
q_command.areas.lev_3_rm_9.chest_pos = {x = 186, y = 0, z = 26}
q_command.areas.lev_3_rm_9.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "", [5] = "", [6] = "",
                [7] = "circuit_blocks:circuit_blocks_gate_qubit_0",
                [8] = "circuit_blocks:circuit_blocks_gate_qubit_1",
                [9] = "", [10] = "", [11] = "", [12] = "", [13] = "", [14] = "",
                [15] = "circuit_blocks:swap_tool",
                [16] = "circuit_blocks:circuit_blocks_if_c0_eq0",
                [17] = "circuit_blocks:circuit_blocks_rx_gate_0p16",
                [18] = "circuit_blocks:circuit_blocks_ry_gate_0p16",
                [19] = "circuit_blocks:circuit_blocks_rz_gate_0p16",
                [20] = "circuit_blocks:circuit_blocks_sdg_gate",
                [21] = "circuit_blocks:circuit_blocks_tdg_gate",
                [22] = "circuit_blocks:circuit_blocks_swap",
                [23] = "circuit_blocks:rotate_tool",
                [24] = "circuit_blocks:circuit_blocks_barrier",
                [25] = "circuit_blocks:circuit_blocks_x_gate",
                [26] = "circuit_blocks:circuit_blocks_y_gate",
                [27] = "circuit_blocks:circuit_blocks_z_gate",
                [28] = "circuit_blocks:circuit_blocks_s_gate",
                [29] = "circuit_blocks:circuit_blocks_t_gate",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool",
                [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.lev_3_rm_9.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_3_rm_9.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall. (9)"
}
q_command.areas.lev_3_rm_9.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_3_rm_9.help_chat_sent = false
q_command.areas.lev_3_rm_9.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_3_rm_9.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_3_rm_9.success_chat_sent = false

q_command.areas.lev_3_rm_9.help_btn_text = {}
q_command.areas.lev_3_rm_9.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_3_rm_9.help_btn_text.es = q_command.areas.lev_3_rm_9.help_btn_text.en
q_command.areas.lev_3_rm_9.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_3_rm_9.help_btn_caption = {}
q_command.areas.lev_3_rm_9.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_3_rm_9.help_btn_caption.es = q_command.areas.lev_3_rm_9.help_btn_caption.en
q_command.areas.lev_3_rm_9.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 10 (Level III)
q_command.areas.lev_3_rm_10 = {}
q_command.areas.lev_3_rm_10.region = q_command.regions.esc_rooms_level_3
table.insert(q_command.regions.esc_rooms_level_3, q_command.areas.lev_3_rm_10)
q_command.areas.lev_3_rm_10.area_num = #q_command.regions.esc_rooms_level_3

q_command.areas.lev_3_rm_10.center_pos = {x = 188, y = 0, z = 12}
q_command.areas.lev_3_rm_10.radius = 5
q_command.areas.lev_3_rm_10.q_block_pos = {x = 190, y = 0, z = 9}

q_command.areas.lev_3_rm_10.door_pos = {x = 193, y = 0, z = 14}
q_command.areas.lev_3_rm_10.portal_pos = {x = 193, y = 1, z = 12}
q_command.areas.lev_3_rm_10.chest_pos = {x = 184, y = 0, z = 14}
q_command.areas.lev_3_rm_10.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "", [5] = "", [6] = "",
                [7] = "circuit_blocks:circuit_blocks_gate_qubit_0",
                [8] = "circuit_blocks:circuit_blocks_gate_qubit_1",
                [9] = "", [10] = "", [11] = "", [12] = "", [13] = "", [14] = "",
                [15] = "circuit_blocks:swap_tool",
                [16] = "circuit_blocks:circuit_blocks_if_c0_eq0",
                [17] = "circuit_blocks:circuit_blocks_rx_gate_0p16",
                [18] = "circuit_blocks:circuit_blocks_ry_gate_0p16",
                [19] = "circuit_blocks:circuit_blocks_rz_gate_0p16",
                [20] = "circuit_blocks:circuit_blocks_sdg_gate",
                [21] = "circuit_blocks:circuit_blocks_tdg_gate",
                [22] = "circuit_blocks:circuit_blocks_swap",
                [23] = "circuit_blocks:rotate_tool",
                [24] = "circuit_blocks:circuit_blocks_barrier",
                [25] = "circuit_blocks:circuit_blocks_x_gate",
                [26] = "circuit_blocks:circuit_blocks_y_gate",
                [27] = "circuit_blocks:circuit_blocks_z_gate",
                [28] = "circuit_blocks:circuit_blocks_s_gate",
                [29] = "circuit_blocks:circuit_blocks_t_gate",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool",
                [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.lev_3_rm_10.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_3_rm_10.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall. (10)"
}
q_command.areas.lev_3_rm_10.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_3_rm_10.help_chat_sent = false
q_command.areas.lev_3_rm_10.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_3_rm_10.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_3_rm_10.success_chat_sent = false

q_command.areas.lev_3_rm_10.help_btn_text = {}
q_command.areas.lev_3_rm_10.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_3_rm_10.help_btn_text.es = q_command.areas.lev_3_rm_10.help_btn_text.en
q_command.areas.lev_3_rm_10.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_3_rm_10.help_btn_caption = {}
q_command.areas.lev_3_rm_10.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_3_rm_10.help_btn_caption.es = q_command.areas.lev_3_rm_10.help_btn_caption.en
q_command.areas.lev_3_rm_10.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 11 (Level III)
q_command.areas.lev_3_rm_11 = {}
q_command.areas.lev_3_rm_11.region = q_command.regions.esc_rooms_level_3
table.insert(q_command.regions.esc_rooms_level_3, q_command.areas.lev_3_rm_11)
q_command.areas.lev_3_rm_11.area_num = #q_command.regions.esc_rooms_level_3

q_command.areas.lev_3_rm_11.center_pos = {x = 198, y = 0, z = 12}
q_command.areas.lev_3_rm_11.radius = 5
q_command.areas.lev_3_rm_11.q_block_pos = {x = 201, y = 0, z = 14}

q_command.areas.lev_3_rm_11.door_pos = {x = 200, y = 0, z = 17}
q_command.areas.lev_3_rm_11.portal_pos = {x = 203, y = 1, z = 15}
q_command.areas.lev_3_rm_11.chest_pos = {x = 196, y = 0, z = 16}
q_command.areas.lev_3_rm_11.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "", [5] = "", [6] = "",
                [7] = "circuit_blocks:circuit_blocks_gate_qubit_0",
                [8] = "circuit_blocks:circuit_blocks_gate_qubit_1",
                [9] = "", [10] = "", [11] = "", [12] = "", [13] = "", [14] = "",
                [15] = "circuit_blocks:swap_tool",
                [16] = "circuit_blocks:circuit_blocks_if_c0_eq0",
                [17] = "circuit_blocks:circuit_blocks_rx_gate_0p16",
                [18] = "circuit_blocks:circuit_blocks_ry_gate_0p16",
                [19] = "circuit_blocks:circuit_blocks_rz_gate_0p16",
                [20] = "circuit_blocks:circuit_blocks_sdg_gate",
                [21] = "circuit_blocks:circuit_blocks_tdg_gate",
                [22] = "circuit_blocks:circuit_blocks_swap",
                [23] = "circuit_blocks:rotate_tool",
                [24] = "circuit_blocks:circuit_blocks_barrier",
                [25] = "circuit_blocks:circuit_blocks_x_gate",
                [26] = "circuit_blocks:circuit_blocks_y_gate",
                [27] = "circuit_blocks:circuit_blocks_z_gate",
                [28] = "circuit_blocks:circuit_blocks_s_gate",
                [29] = "circuit_blocks:circuit_blocks_t_gate",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool",
                [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.lev_3_rm_11.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_3_rm_11.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall. (11)"
}
q_command.areas.lev_3_rm_11.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_3_rm_11.help_chat_sent = false
q_command.areas.lev_3_rm_11.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_3_rm_11.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_3_rm_11.success_chat_sent = false

q_command.areas.lev_3_rm_11.help_btn_text = {}
q_command.areas.lev_3_rm_11.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_3_rm_11.help_btn_text.es = q_command.areas.lev_3_rm_11.help_btn_text.en
q_command.areas.lev_3_rm_11.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_3_rm_11.help_btn_caption = {}
q_command.areas.lev_3_rm_11.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_3_rm_11.help_btn_caption.es = q_command.areas.lev_3_rm_11.help_btn_caption.en
q_command.areas.lev_3_rm_11.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 12 (Level III)
q_command.areas.lev_3_rm_12 = {}
q_command.areas.lev_3_rm_12.region = q_command.regions.esc_rooms_level_3
table.insert(q_command.regions.esc_rooms_level_3, q_command.areas.lev_3_rm_12)
q_command.areas.lev_3_rm_12.area_num = #q_command.regions.esc_rooms_level_3

q_command.areas.lev_3_rm_12.center_pos = {x = 198, y = 0, z = 22}
q_command.areas.lev_3_rm_12.radius = 5
q_command.areas.lev_3_rm_12.q_block_pos = {x = 195, y = 0, z = 20}

q_command.areas.lev_3_rm_12.door_pos = {x = 203, y = 0, z = 20}
q_command.areas.lev_3_rm_12.portal_pos = {x = 203, y = 1, z = 22}
q_command.areas.lev_3_rm_12.chest_pos = {x = 202, y = 0, z = 24}
q_command.areas.lev_3_rm_12.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "", [5] = "", [6] = "",
                [7] = "circuit_blocks:circuit_blocks_gate_qubit_0",
                [8] = "circuit_blocks:circuit_blocks_gate_qubit_1",
                [9] = "", [10] = "", [11] = "", [12] = "", [13] = "", [14] = "",
                [15] = "circuit_blocks:swap_tool",
                [16] = "circuit_blocks:circuit_blocks_if_c0_eq0",
                [17] = "circuit_blocks:circuit_blocks_rx_gate_0p16",
                [18] = "circuit_blocks:circuit_blocks_ry_gate_0p16",
                [19] = "circuit_blocks:circuit_blocks_rz_gate_0p16",
                [20] = "circuit_blocks:circuit_blocks_sdg_gate",
                [21] = "circuit_blocks:circuit_blocks_tdg_gate",
                [22] = "circuit_blocks:circuit_blocks_swap",
                [23] = "circuit_blocks:rotate_tool",
                [24] = "circuit_blocks:circuit_blocks_barrier",
                [25] = "circuit_blocks:circuit_blocks_x_gate",
                [26] = "circuit_blocks:circuit_blocks_y_gate",
                [27] = "circuit_blocks:circuit_blocks_z_gate",
                [28] = "circuit_blocks:circuit_blocks_s_gate",
                [29] = "circuit_blocks:circuit_blocks_t_gate",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool",
                [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.lev_3_rm_12.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_3_rm_12.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall. (12)"
}
q_command.areas.lev_3_rm_12.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_3_rm_12.help_chat_sent = false
q_command.areas.lev_3_rm_12.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_3_rm_12.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_3_rm_12.success_chat_sent = false

q_command.areas.lev_3_rm_12.help_btn_text = {}
q_command.areas.lev_3_rm_12.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_3_rm_12.help_btn_text.es = q_command.areas.lev_3_rm_12.help_btn_text.en
q_command.areas.lev_3_rm_12.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_3_rm_12.help_btn_caption = {}
q_command.areas.lev_3_rm_12.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_3_rm_12.help_btn_caption.es = q_command.areas.lev_3_rm_12.help_btn_caption.en
q_command.areas.lev_3_rm_12.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 13 (Level III)
q_command.areas.lev_3_rm_13 = {}
q_command.areas.lev_3_rm_13.region = q_command.regions.esc_rooms_level_3
table.insert(q_command.regions.esc_rooms_level_3, q_command.areas.lev_3_rm_13)
q_command.areas.lev_3_rm_13.area_num = #q_command.regions.esc_rooms_level_3

q_command.areas.lev_3_rm_13.center_pos = {x = 208, y = 0, z = 22}
q_command.areas.lev_3_rm_13.radius = 5
q_command.areas.lev_3_rm_13.q_block_pos = {x = 211, y = 0, z = 24}

q_command.areas.lev_3_rm_13.door_pos = {x = 206, y = 0, z = 17}
q_command.areas.lev_3_rm_13.portal_pos = {x = 213, y = 1, z = 19}
q_command.areas.lev_3_rm_13.chest_pos = {x = 210, y = 0, z = 26}
q_command.areas.lev_3_rm_13.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "", [5] = "", [6] = "",
                [7] = "circuit_blocks:circuit_blocks_gate_qubit_0",
                [8] = "circuit_blocks:circuit_blocks_gate_qubit_1",
                [9] = "", [10] = "", [11] = "", [12] = "", [13] = "", [14] = "",
                [15] = "circuit_blocks:swap_tool",
                [16] = "circuit_blocks:circuit_blocks_if_c0_eq0",
                [17] = "circuit_blocks:circuit_blocks_rx_gate_0p16",
                [18] = "circuit_blocks:circuit_blocks_ry_gate_0p16",
                [19] = "circuit_blocks:circuit_blocks_rz_gate_0p16",
                [20] = "circuit_blocks:circuit_blocks_sdg_gate",
                [21] = "circuit_blocks:circuit_blocks_tdg_gate",
                [22] = "circuit_blocks:circuit_blocks_swap",
                [23] = "circuit_blocks:rotate_tool",
                [24] = "circuit_blocks:circuit_blocks_barrier",
                [25] = "circuit_blocks:circuit_blocks_x_gate",
                [26] = "circuit_blocks:circuit_blocks_y_gate",
                [27] = "circuit_blocks:circuit_blocks_z_gate",
                [28] = "circuit_blocks:circuit_blocks_s_gate",
                [29] = "circuit_blocks:circuit_blocks_t_gate",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool",
                [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.lev_3_rm_13.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_3_rm_13.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall. (13)"
}
q_command.areas.lev_3_rm_13.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_3_rm_13.help_chat_sent = false
q_command.areas.lev_3_rm_13.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_3_rm_13.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_3_rm_13.success_chat_sent = false

q_command.areas.lev_3_rm_13.help_btn_text = {}
q_command.areas.lev_3_rm_13.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_3_rm_13.help_btn_text.es = q_command.areas.lev_3_rm_13.help_btn_text.en
q_command.areas.lev_3_rm_13.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_3_rm_13.help_btn_caption = {}
q_command.areas.lev_3_rm_13.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_3_rm_13.help_btn_caption.es = q_command.areas.lev_3_rm_13.help_btn_caption.en
q_command.areas.lev_3_rm_13.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 14 (Level III)
q_command.areas.lev_3_rm_14 = {}
q_command.areas.lev_3_rm_14.region = q_command.regions.esc_rooms_level_3
table.insert(q_command.regions.esc_rooms_level_3, q_command.areas.lev_3_rm_14)
q_command.areas.lev_3_rm_14.area_num = #q_command.regions.esc_rooms_level_3

q_command.areas.lev_3_rm_14.center_pos = {x = 208, y = 0, z = 12}
q_command.areas.lev_3_rm_14.radius = 5
q_command.areas.lev_3_rm_14.q_block_pos = {x = 205, y = 0, z = 10}

q_command.areas.lev_3_rm_14.door_pos = {x = 213, y = 0, z = 10}
q_command.areas.lev_3_rm_14.portal_pos = {x = 213, y = 1, z = 12}
q_command.areas.lev_3_rm_14.chest_pos = {x = 206, y = 0, z = 8}
q_command.areas.lev_3_rm_14.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "", [5] = "", [6] = "",
                [7] = "circuit_blocks:circuit_blocks_gate_qubit_0",
                [8] = "circuit_blocks:circuit_blocks_gate_qubit_1",
                [9] = "", [10] = "", [11] = "", [12] = "", [13] = "", [14] = "",
                [15] = "circuit_blocks:swap_tool",
                [16] = "circuit_blocks:circuit_blocks_if_c0_eq0",
                [17] = "circuit_blocks:circuit_blocks_rx_gate_0p16",
                [18] = "circuit_blocks:circuit_blocks_ry_gate_0p16",
                [19] = "circuit_blocks:circuit_blocks_rz_gate_0p16",
                [20] = "circuit_blocks:circuit_blocks_sdg_gate",
                [21] = "circuit_blocks:circuit_blocks_tdg_gate",
                [22] = "circuit_blocks:circuit_blocks_swap",
                [23] = "circuit_blocks:rotate_tool",
                [24] = "circuit_blocks:circuit_blocks_barrier",
                [25] = "circuit_blocks:circuit_blocks_x_gate",
                [26] = "circuit_blocks:circuit_blocks_y_gate",
                [27] = "circuit_blocks:circuit_blocks_z_gate",
                [28] = "circuit_blocks:circuit_blocks_s_gate",
                [29] = "circuit_blocks:circuit_blocks_t_gate",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool",
                [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.lev_3_rm_14.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_3_rm_14.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall. (14)"
}
q_command.areas.lev_3_rm_14.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_3_rm_14.help_chat_sent = false
q_command.areas.lev_3_rm_14.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_3_rm_14.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_3_rm_14.success_chat_sent = false

q_command.areas.lev_3_rm_14.help_btn_text = {}
q_command.areas.lev_3_rm_14.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_3_rm_14.help_btn_text.es = q_command.areas.lev_3_rm_14.help_btn_text.en
q_command.areas.lev_3_rm_14.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_3_rm_14.help_btn_caption = {}
q_command.areas.lev_3_rm_14.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_3_rm_14.help_btn_caption.es = q_command.areas.lev_3_rm_14.help_btn_caption.en
q_command.areas.lev_3_rm_14.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 15 (Level III)
q_command.areas.lev_3_rm_15 = {}
q_command.areas.lev_3_rm_15.region = q_command.regions.esc_rooms_level_3
table.insert(q_command.regions.esc_rooms_level_3, q_command.areas.lev_3_rm_15)
q_command.areas.lev_3_rm_15.area_num = #q_command.regions.esc_rooms_level_3

q_command.areas.lev_3_rm_15.center_pos = {x = 218, y = 0, z = 12}
q_command.areas.lev_3_rm_15.radius = 5
q_command.areas.lev_3_rm_15.q_block_pos = {x = 221, y = 0, z = 14}

q_command.areas.lev_3_rm_15.door_pos = {x = 220, y = 0, z = 17}
q_command.areas.lev_3_rm_15.portal_pos = {x = 223, y = 1, z = 9}
q_command.areas.lev_3_rm_15.chest_pos = {x = 216, y = 0, z = 8}
q_command.areas.lev_3_rm_15.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "", [5] = "", [6] = "",
                [7] = "circuit_blocks:circuit_blocks_gate_qubit_0",
                [8] = "circuit_blocks:circuit_blocks_gate_qubit_1",
                [9] = "", [10] = "", [11] = "", [12] = "", [13] = "", [14] = "",
                [15] = "circuit_blocks:swap_tool",
                [16] = "circuit_blocks:circuit_blocks_if_c0_eq0",
                [17] = "circuit_blocks:circuit_blocks_rx_gate_0p16",
                [18] = "circuit_blocks:circuit_blocks_ry_gate_0p16",
                [19] = "circuit_blocks:circuit_blocks_rz_gate_0p16",
                [20] = "circuit_blocks:circuit_blocks_sdg_gate",
                [21] = "circuit_blocks:circuit_blocks_tdg_gate",
                [22] = "circuit_blocks:circuit_blocks_swap",
                [23] = "circuit_blocks:rotate_tool",
                [24] = "circuit_blocks:circuit_blocks_barrier",
                [25] = "circuit_blocks:circuit_blocks_x_gate",
                [26] = "circuit_blocks:circuit_blocks_y_gate",
                [27] = "circuit_blocks:circuit_blocks_z_gate",
                [28] = "circuit_blocks:circuit_blocks_s_gate",
                [29] = "circuit_blocks:circuit_blocks_t_gate",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool",
                [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.lev_3_rm_15.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_3_rm_15.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall. (15)"
}
q_command.areas.lev_3_rm_15.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_3_rm_15.help_chat_sent = false
q_command.areas.lev_3_rm_15.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_3_rm_15.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_3_rm_15.success_chat_sent = false

q_command.areas.lev_3_rm_15.help_btn_text = {}
q_command.areas.lev_3_rm_15.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_3_rm_15.help_btn_text.es = q_command.areas.lev_3_rm_15.help_btn_text.en
q_command.areas.lev_3_rm_15.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_3_rm_15.help_btn_caption = {}
q_command.areas.lev_3_rm_15.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_3_rm_15.help_btn_caption.es = q_command.areas.lev_3_rm_15.help_btn_caption.en
q_command.areas.lev_3_rm_15.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 16 (Level III)
q_command.areas.lev_3_rm_16 = {}
q_command.areas.lev_3_rm_16.region = q_command.regions.esc_rooms_level_3
table.insert(q_command.regions.esc_rooms_level_3, q_command.areas.lev_3_rm_16)
q_command.areas.lev_3_rm_16.area_num = #q_command.regions.esc_rooms_level_3

q_command.areas.lev_3_rm_16.center_pos = {x = 218, y = 0, z = 22}
q_command.areas.lev_3_rm_16.radius = 5
q_command.areas.lev_3_rm_16.q_block_pos = {x = 215, y = 0, z = 20}

q_command.areas.lev_3_rm_16.door_pos = {x = 223, y = 0, z = 24}
q_command.areas.lev_3_rm_16.portal_pos = {x = 223, y = 1, z = 22}
q_command.areas.lev_3_rm_16.chest_pos = {x = 222, y = 0, z = 20}
q_command.areas.lev_3_rm_16.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "", [5] = "", [6] = "",
                [7] = "circuit_blocks:circuit_blocks_gate_qubit_0",
                [8] = "circuit_blocks:circuit_blocks_gate_qubit_1",
                [9] = "", [10] = "", [11] = "", [12] = "", [13] = "", [14] = "",
                [15] = "circuit_blocks:swap_tool",
                [16] = "circuit_blocks:circuit_blocks_if_c0_eq0",
                [17] = "circuit_blocks:circuit_blocks_rx_gate_0p16",
                [18] = "circuit_blocks:circuit_blocks_ry_gate_0p16",
                [19] = "circuit_blocks:circuit_blocks_rz_gate_0p16",
                [20] = "circuit_blocks:circuit_blocks_sdg_gate",
                [21] = "circuit_blocks:circuit_blocks_tdg_gate",
                [22] = "circuit_blocks:circuit_blocks_swap",
                [23] = "circuit_blocks:rotate_tool",
                [24] = "circuit_blocks:circuit_blocks_barrier",
                [25] = "circuit_blocks:circuit_blocks_x_gate",
                [26] = "circuit_blocks:circuit_blocks_y_gate",
                [27] = "circuit_blocks:circuit_blocks_z_gate",
                [28] = "circuit_blocks:circuit_blocks_s_gate",
                [29] = "circuit_blocks:circuit_blocks_t_gate",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool",
                [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.lev_3_rm_16.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_3_rm_16.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall. (16)"
}
q_command.areas.lev_3_rm_16.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_3_rm_16.help_chat_sent = false
q_command.areas.lev_3_rm_16.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_3_rm_16.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_3_rm_16.success_chat_sent = false

q_command.areas.lev_3_rm_16.help_btn_text = {}
q_command.areas.lev_3_rm_16.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_3_rm_16.help_btn_text.es = q_command.areas.lev_3_rm_16.help_btn_text.en
q_command.areas.lev_3_rm_16.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_3_rm_16.help_btn_caption = {}
q_command.areas.lev_3_rm_16.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_3_rm_16.help_btn_caption.es = q_command.areas.lev_3_rm_16.help_btn_caption.en
q_command.areas.lev_3_rm_16.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"



-- END Escape room puzzles Level III --------------------------------------------

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
Elements of the q_command table that supply information about areas in the game,
used by Professor Q to interact with the player
--]]

-- Escape room puzzles Level II -------------------------------------------------
-------- Room 1 (Level II)
q_command.areas.xor_escape = {}
q_command.areas.xor_escape.center_pos = {x = 218, y = 0, z = 72}
q_command.areas.xor_escape.radius = 5
q_command.areas.xor_escape.q_block_pos = {x = 215, y = 0, z = 70}

q_command.areas.xor_escape.door_pos = {x = 220, y = 0, z = 67}
q_command.areas.xor_escape.chest_pos = {x = 222, y = 0, z = 70}
q_command.areas.xor_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "circuit_blocks:circuit_blocks_gate_qubit_1", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "",
                [31] = "circuit_blocks:control_tool", [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.xor_escape.solution_unitary =
{{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}},
{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}}}

q_command.areas.xor_escape.help_chat_msg = {
	"We meet again, esteemed colleague! You may recall that my name is Professor Q and",
	"that I'm standing behind this glass because we're conducting quantum experiments.",
	"I'm sure that you'll be fine though :-) For this experiment, make a circuit that",
	"realizes a digital 'exclusive or' gate as shown on the wall. You may place |1>",
	"blocks on wires to test input combinations without affecting the exit door."
}
q_command.areas.xor_escape.help_chat_sent = false
q_command.areas.xor_escape.help_success_msg = {
	"Well done! You may know that the CNOT gate is its own inverse, so supplying the ",
	"output as input will give you the original input as output. That's reversible ",
	"computing, with no qubits falling in the bit bucket! Perhaps experiment with ",
	"that before leaving this room to see reversible computing in action."
}
q_command.areas.xor_escape.success_chat_sent = false

q_command.areas.xor_escape.help_btn_text = {}
q_command.areas.xor_escape.help_btn_text.en =
[[
We meet again, esteemed colleague! You may recall that my name is
Professor Q and that I'm standing behind this glass because we're
conducting quantum experiments. I'm sure that you'll be fine though :-)
For this experiment, make a circuit that realizes a digital
'exclusive or' gate as shown on the wall. You may place |1> blocks on
wires to test input combinations without affecting the exit door.

Notes: Most of the help that you'll need for these 'escape room' circuit
puzzles will appear in the chat area (upper left corner of your window)
by Professor Q. For all of these puzzles, get blocks from the chest and
place them on the circuit. When you solve a puzzle, the Q block will
turn gold, celebration music will play, and the door to the next room
will open. Please solve the Level I escape rooms if you haven't already,
as they help build knowledge and skills for these Level II puzzles.

To perform a measurement on a circuit, right-click a measurement block.

To convert an X gate into a controlled-X gate (and vice-versa),
left-click or right-click the block while wielding the Control Tool (the
wand-shaped tool in the chest). Left-clicking moves the control
qubit up one wire, and right-clicking moves the control qubit down one
wire. The controlled-X gate is also known as the controlled-NOT, or CNOT
gate. It acts on a pair of qubits, with one acting as control and the
other as target. It performs an X operation on the target whenever the
control is in state |1>. If the control qubit is in a superposition,
this gate creates entanglement.
]]
q_command.areas.xor_escape.help_btn_text.es = q_command.areas.xor_escape.help_btn_text.en
q_command.areas.xor_escape.help_btn_text.ja = q_command.areas.xor_escape.help_btn_text.en
q_command.areas.xor_escape.help_btn_caption = "Make a quantum logic XOR gate"

-------- Room 2 (Level II)
q_command.areas.dj_bal_flip_ora_escape = {}
q_command.areas.dj_bal_flip_ora_escape.center_pos = {x = 218, y = 0, z = 62}
q_command.areas.dj_bal_flip_ora_escape.radius = 5
q_command.areas.dj_bal_flip_ora_escape.q_block_pos = {x = 220, y = 0, z = 59}

q_command.areas.dj_bal_flip_ora_escape.door_pos = {x = 213, y = 0, z = 60}
q_command.areas.dj_bal_flip_ora_escape.chest_pos = {x = 222, y = 0, z = 64}
q_command.areas.dj_bal_flip_ora_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "circuit_blocks:circuit_blocks_gate_qubit_1", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "",
                [31] = "circuit_blocks:control_tool", [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.dj_bal_flip_ora_escape.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.dj_bal_flip_ora_escape.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall"
}
q_command.areas.dj_bal_flip_ora_escape.help_chat_sent = false
q_command.areas.dj_bal_flip_ora_escape.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.dj_bal_flip_ora_escape.success_chat_sent = false

q_command.areas.dj_bal_flip_ora_escape.help_btn_text = {}
q_command.areas.dj_bal_flip_ora_escape.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.dj_bal_flip_ora_escape.help_btn_text.es = q_command.areas.dj_bal_flip_ora_escape.help_btn_text.en
q_command.areas.dj_bal_flip_ora_escape.help_btn_text.ja = q_command.areas.dj_bal_flip_ora_escape.help_btn_text.en
q_command.areas.dj_bal_flip_ora_escape.help_btn_caption = "Make a NOT XOR quantum logic gate"


-------- Room 3 (Level II)
q_command.areas.toffoli_escape = {}
q_command.areas.toffoli_escape.center_pos = {x = 208, y = 0, z = 62}
q_command.areas.toffoli_escape.radius = 5
q_command.areas.toffoli_escape.q_block_pos = {x = 204, y = 0, z = 58}

q_command.areas.toffoli_escape.door_pos = {x = 206, y = 0, z = 67}
q_command.areas.toffoli_escape.chest_pos = {x = 210, y = 0, z = 66}
q_command.areas.toffoli_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "circuit_blocks:circuit_blocks_gate_qubit_1", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "",
                [31] = "circuit_blocks:control_tool", [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.toffoli_escape.solution_unitary =
{{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}}}

q_command.areas.toffoli_escape.help_chat_msg = {
	"Go ahead and create a circuit that realizes the logic shown on the wall. I'd",
	"suggest using a Toffoli gate, but you do you! :-)"
}
q_command.areas.toffoli_escape.help_chat_sent = false
q_command.areas.toffoli_escape.help_success_msg = {
	"Nicely done! Did you notice that this time the output isn't on one of the input",
	"wires, but rather, on an additional wire?"
}
q_command.areas.toffoli_escape.success_chat_sent = false

q_command.areas.toffoli_escape.help_btn_text = {}
q_command.areas.toffoli_escape.help_btn_text.en =
[[
Go ahead and create a circuit that realizes the logic shown on the wall.
I'd suggest using a Toffoli gate, but you do you! :-)

Note: To convert a controlled-X gate into a Toffoli gate (and vice-versa),
hold the Special key down while wielding the Control Tool and
left-clicking or right-clicking. Left-clicking moves the second control
qubit up one wire, and right-clicking moves the second control qubit
down one wire. There is a blue dot on the second control qubit to help
you distinguish it from the first control qubit. The Special key
mentioned earlier may be known, and set, by pausing the game and choosing
the Change Keys button.
]]
q_command.areas.toffoli_escape.help_btn_text.es = q_command.areas.toffoli_escape.help_btn_text.en
q_command.areas.toffoli_escape.help_btn_text.ja = q_command.areas.toffoli_escape.help_btn_text.en
q_command.areas.toffoli_escape.help_btn_caption = "Make a quantum logic AND gate"


-------- Room 4 (Level II)
q_command.areas.toffoli_nand_escape = {}
q_command.areas.toffoli_nand_escape.center_pos = {x = 208, y = 0, z = 72}
q_command.areas.toffoli_nand_escape.radius = 5
q_command.areas.toffoli_nand_escape.q_block_pos = {x = 212, y = 0, z = 76}

q_command.areas.toffoli_nand_escape.door_pos = {x = 210, y = 0, z = 77}
q_command.areas.toffoli_nand_escape.chest_pos = {x = 206, y = 0, z = 76}
q_command.areas.toffoli_nand_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "circuit_blocks:circuit_blocks_gate_qubit_1", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "",
                [31] = "circuit_blocks:control_tool", [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.toffoli_nand_escape.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.toffoli_nand_escape.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as indicated by the NAND",
	"(NOT AND) shown on the wall."
}
q_command.areas.toffoli_nand_escape.help_chat_sent = false
q_command.areas.toffoli_nand_escape.help_success_msg = {
	"You're really getting the hang of this. On to the next room!"
}
q_command.areas.toffoli_nand_escape.success_chat_sent = false

q_command.areas.toffoli_nand_escape.help_btn_text = {}
q_command.areas.toffoli_nand_escape.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as indicated by
the NAND (NOT AND) shown on the wall.
]]
q_command.areas.toffoli_nand_escape.help_btn_text.es = q_command.areas.toffoli_nand_escape.help_btn_text.en
q_command.areas.toffoli_nand_escape.help_btn_text.ja = q_command.areas.toffoli_nand_escape.help_btn_text.en
q_command.areas.toffoli_nand_escape.help_btn_caption = "Make a quantum logic NAND gate"


-------- Room 5 (Level II)
q_command.areas.or_escape = {}
q_command.areas.or_escape.center_pos = {x = 208, y = 0, z = 82}
q_command.areas.or_escape.radius = 5
q_command.areas.or_escape.q_block_pos = {x = 204, y = 0, z = 86}

q_command.areas.or_escape.door_pos = {x = 213, y = 0, z = 80}
q_command.areas.or_escape.chest_pos = {x = 207, y = 0, z = 78}
q_command.areas.or_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "circuit_blocks:circuit_blocks_gate_qubit_1", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "",
                [31] = "circuit_blocks:control_tool", [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.or_escape.solution_unitary =
{{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}}}

q_command.areas.or_escape.help_chat_msg = {
	"Again, make a circuit that realizes the logic on the wall."
}
q_command.areas.or_escape.help_chat_sent = false
q_command.areas.or_escape.help_success_msg = {
	"I like how you negated both inputs, as well as the output, of the",
	"previous AND circuit to make an OR circuit!"
}
q_command.areas.or_escape.success_chat_sent = false

q_command.areas.or_escape.help_btn_text = {}
q_command.areas.or_escape.help_btn_text.en =
[[
Again, make a circuit that realizes the logic on the wall.
]]
q_command.areas.or_escape.help_btn_text.es = q_command.areas.or_escape.help_btn_text.en
q_command.areas.or_escape.help_btn_text.ja = q_command.areas.or_escape.help_btn_text.en
q_command.areas.or_escape.help_btn_caption = "Make a quantum logic OR gate"


-------- Room 6 (Level II)
q_command.areas.nor_escape = {}
q_command.areas.nor_escape.center_pos = {x = 218, y = 0, z = 82}
q_command.areas.nor_escape.radius = 5
q_command.areas.nor_escape.q_block_pos = {x = 222, y = 0, z = 78}

q_command.areas.nor_escape.door_pos = {x = 220, y = 0, z = 87}
q_command.areas.nor_escape.chest_pos = {x = 214, y = 0, z = 84}
q_command.areas.nor_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "circuit_blocks:circuit_blocks_gate_qubit_1", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "",
                [31] = "circuit_blocks:control_tool", [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.nor_escape.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.nor_escape.help_chat_msg = {
	"Make a circuit similar to the last one, taking into account the NOR",
	"(NOT OR) shown on the wall."
}
q_command.areas.nor_escape.help_chat_sent = false
q_command.areas.nor_escape.help_success_msg = {
	"Nicely done. Carry on!"
}
q_command.areas.nor_escape.success_chat_sent = false

q_command.areas.nor_escape.help_btn_text = {}
q_command.areas.nor_escape.help_btn_text.en =
[[
Make a circuit similar to the last one, taking into account the NOR
(NOT OR) shown on the wall.
]]
q_command.areas.nor_escape.help_btn_text.es = q_command.areas.nor_escape.help_btn_text.en
q_command.areas.nor_escape.help_btn_text.ja = q_command.areas.nor_escape.help_btn_text.en
q_command.areas.nor_escape.help_btn_caption = "Make a quantum logic NOR gate"


-------- Room 7 (Level II)
q_command.areas.toffoli_mixed_escape = {}
q_command.areas.toffoli_mixed_escape.center_pos = {x = 218, y = 0, z = 92}
q_command.areas.toffoli_mixed_escape.radius = 5
q_command.areas.toffoli_mixed_escape.q_block_pos = {x = 214, y = 0, z = 96}

q_command.areas.toffoli_mixed_escape.door_pos = {x = 213, y = 0, z = 94}
q_command.areas.toffoli_mixed_escape.chest_pos = {x = 214, y = 0, z = 90}
q_command.areas.toffoli_mixed_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "circuit_blocks:circuit_blocks_gate_qubit_1", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "",
                [31] = "circuit_blocks:control_tool", [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.toffoli_mixed_escape.solution_unitary =
{{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.toffoli_mixed_escape.help_chat_msg = {
	"Go ahead and make a circuit that realizes the logic on the wall, remembering ",
	"that NOT takes precedence over AND in digital logic."
}
q_command.areas.toffoli_mixed_escape.help_chat_sent = false
q_command.areas.toffoli_mixed_escape.help_success_msg = {
	"Excellent! Did you notice that only digital logic has been demonstrated to this ",
	"point? We'll rectify that in the next room."
}
q_command.areas.toffoli_mixed_escape.success_chat_sent = false

q_command.areas.toffoli_mixed_escape.help_btn_text = {}
q_command.areas.toffoli_mixed_escape.help_btn_text.en =
[[
Go ahead and make a circuit that realizes the logic on the wall,
remembering that NOT takes precedence over AND in digital logic.
]]
q_command.areas.toffoli_mixed_escape.help_btn_text.es = q_command.areas.toffoli_mixed_escape.help_btn_text.en
q_command.areas.toffoli_mixed_escape.help_btn_text.ja = q_command.areas.toffoli_mixed_escape.help_btn_text.en
q_command.areas.toffoli_mixed_escape.help_btn_caption = "Make a quantum logic AND gate with negated input"


-------- Room 8 (Level II)
q_command.areas.superpos_logic_and_escape = {}
q_command.areas.superpos_logic_and_escape.center_pos = {x = 208, y = 0, z = 92}
q_command.areas.superpos_logic_and_escape.radius = 5
q_command.areas.superpos_logic_and_escape.q_block_pos = {x = 212, y = 0, z = 88}

q_command.areas.superpos_logic_and_escape.door_pos = {x = 203, y = 0, z = 90}
q_command.areas.superpos_logic_and_escape.chest_pos = {x = 210, y = 0, z = 96}
q_command.areas.superpos_logic_and_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "circuit_blocks:circuit_blocks_gate_qubit_1", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate", [26] = "",
                [27] = "", [28] = "",
                [29] = "", [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool", [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.superpos_logic_and_escape.solution_statevector =
{{r=0.5,i=0},{r=0.5,i=0},{r=0,i=0},{r=0.5,i=0},{r=0,i=0},{r=0,i=0},{r=0.5,i=0},{r=0,i=0}}

q_command.areas.superpos_logic_and_escape.help_chat_msg = {
	"For your next trick, realize the same logic as you did in the previous room.",
	"This time, however, compute the logic with its inputs in equal superposition,",
	"resulting in the state shown on the wall."
}
q_command.areas.superpos_logic_and_escape.help_chat_sent = false
q_command.areas.superpos_logic_and_escape.help_success_msg = {
	"Outstanding! You've managed to demonstrate quantum parallelism, in which all",
	"of the 2^n (where n is number of inputs) combinations and their associated",
	"outputs are represented in the state vector."
}
q_command.areas.superpos_logic_and_escape.success_chat_sent = false

q_command.areas.superpos_logic_and_escape.help_btn_text = {}
q_command.areas.superpos_logic_and_escape.help_btn_text.en =
[[
For your next trick, realize the same logic as you did in the previous
room. This time, however, compute the logic with its inputs in equal
superposition, resulting in the state shown on the wall.
]]
q_command.areas.superpos_logic_and_escape.help_btn_text.es = q_command.areas.superpos_logic_and_escape.help_btn_text.en
q_command.areas.superpos_logic_and_escape.help_btn_text.ja = q_command.areas.superpos_logic_and_escape.help_btn_text.en
q_command.areas.superpos_logic_and_escape.help_btn_caption = "Compute NOT a AND b in superposition"


-------- Room 9 (Level II)
q_command.areas.and_3_operands_x_escape = {}
q_command.areas.and_3_operands_x_escape.center_pos = {x = 198, y = 0, z = 92}
q_command.areas.and_3_operands_x_escape.radius = 5
q_command.areas.and_3_operands_x_escape.q_block_pos = {x = 194, y = -1, z = 88}

q_command.areas.and_3_operands_x_escape.door_pos = {x = 193, y = 0, z = 94}
q_command.areas.and_3_operands_x_escape.chest_pos = {x = 200, y = 0, z = 88}
q_command.areas.and_3_operands_x_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "circuit_blocks:circuit_blocks_gate_qubit_1", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "",
                [31] = "circuit_blocks:control_tool", [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.and_3_operands_x_escape.solution_unitary =
{{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.and_3_operands_x_escape.help_chat_msg = {
	"Here you'll realize a logical expression that contains more than one AND.",
	"I'd probably fashion a circuit out of a couple of Toffoli gates, adding",
	"a third to undo what the first one did. That's easy for me to say because",
	"I'm safely behind this explosion-proof glass, so use your best judgment :-)"
}
q_command.areas.and_3_operands_x_escape.help_chat_sent = false
q_command.areas.and_3_operands_x_escape.help_success_msg = {
	"Very impressive! You found a way to leverage Toffoli gates to realize logic ",
	"that consists of more than two inputs. You also used a technique known as ",
	"'uncomputing' to clean up after yourself, leaving a scratch qubit (AKA ancilla ",
	"qubit, labeled 'd' on the wall) the way you found it. Good qubit hygiene is",
	"important, especially when they are entangled."
}
q_command.areas.and_3_operands_x_escape.success_chat_sent = false

q_command.areas.and_3_operands_x_escape.help_btn_text = {}
q_command.areas.and_3_operands_x_escape.help_btn_text.en =
[[
Here you'll realize a logical expression that contains more than one AND.
I'd probably fashion a circuit out of a couple of Toffoli gates, adding
a third to undo what the first one did. That's easy for me to say because
I'm safely behind this explosion-proof glass, so use your best judgment :-)

Note: You can ignore the liquid blocks in this puzzle, as there are many
more of them than can be displayed here.
]]
q_command.areas.and_3_operands_x_escape.help_btn_text.es = q_command.areas.and_3_operands_x_escape.help_btn_text.en
q_command.areas.and_3_operands_x_escape.help_btn_text.ja = q_command.areas.and_3_operands_x_escape.help_btn_text.en
q_command.areas.and_3_operands_x_escape.help_btn_caption = "Create quantum logic gate with multiple operands"


-------- Room 10 (Level II)
q_command.areas.and_not_3_operands_x_escape = {}
q_command.areas.and_not_3_operands_x_escape.center_pos = {x = 188, y = 0, z = 92}
q_command.areas.and_not_3_operands_x_escape.radius = 5
q_command.areas.and_not_3_operands_x_escape.q_block_pos = {x = 184, y = 0, z = 88}

q_command.areas.and_not_3_operands_x_escape.door_pos = {x = 190, y = 0, z = 87}
q_command.areas.and_not_3_operands_x_escape.chest_pos = {x = 192, y = 0, z = 90}
q_command.areas.and_not_3_operands_x_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "circuit_blocks:circuit_blocks_gate_qubit_1", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "",
                [31] = "circuit_blocks:control_tool", [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.and_not_3_operands_x_escape.solution_unitary =
{{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=-0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
  {r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}}}

q_command.areas.and_not_3_operands_x_escape.help_chat_msg = {
	"Try your hand at creating a circuit that realizes the logic on the wall."
}
q_command.areas.and_not_3_operands_x_escape.help_chat_sent = false
q_command.areas.and_not_3_operands_x_escape.help_success_msg = {
	"Very nice! You've created lots of circuits to this point, each of which affect",
	"the magnitude of relevant states, and therefore measurement probabilities.",
	"Did you notice that this worked well when using |0> and |1> as inputs, but when",
	"computing in superposition all of the relevant probabilities were equal? To",
	"address that, I'll show you a helpful companion to magnitude quantum logic."
}
q_command.areas.and_not_3_operands_x_escape.success_chat_sent = false

q_command.areas.and_not_3_operands_x_escape.help_btn_text = {}
q_command.areas.and_not_3_operands_x_escape.help_btn_text.en =
[[
Try your hand at creating a circuit that realizes the logic on the wall.
]]
q_command.areas.and_not_3_operands_x_escape.help_btn_text.es = q_command.areas.and_not_3_operands_x_escape.help_btn_text.en
q_command.areas.and_not_3_operands_x_escape.help_btn_text.ja = q_command.areas.and_not_3_operands_x_escape.help_btn_text.en
q_command.areas.and_not_3_operands_x_escape.help_btn_caption = "Make quantum logic gate with multiple operands"


-------- Room 11 (Level II)
q_command.areas.phase_a_and_b_escape = {}
q_command.areas.phase_a_and_b_escape.center_pos = {x = 188, y = 0, z = 82}
q_command.areas.phase_a_and_b_escape.radius = 5
q_command.areas.phase_a_and_b_escape.q_block_pos = {x = 190, y = 0, z = 79}

q_command.areas.phase_a_and_b_escape.door_pos = {x = 193, y = 0, z = 80}
q_command.areas.phase_a_and_b_escape.chest_pos = {x = 192, y = 0, z = 84}
q_command.areas.phase_a_and_b_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "circuit_blocks:circuit_blocks_gate_qubit_1", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "", [26] = "", [27] = "circuit_blocks:circuit_blocks_z_gate", [28] = "",
                [29] = "", [30] = "",
                [31] = "circuit_blocks:control_tool", [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.phase_a_and_b_escape.solution_unitary =
{{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=-1,i=0}}}

q_command.areas.phase_a_and_b_escape.help_chat_msg = {
	"Go ahead and make the circuit realize the boolean expression on the wall, ",
	"with the appearance of the liquid blocks and phase arrows as indicated ",
	"(arrow points left when the inputs make the boolean expression true) "
}
q_command.areas.phase_a_and_b_escape.help_chat_sent = false
q_command.areas.phase_a_and_b_escape.help_success_msg = {
	"Well done! You made the phase rotate to pi radians whenever the boolean ",
	"expression on the wall is satisfied (made true) by your input. This type ",
	"of quantum logic is known as phase logic, so you just made a 'phase AND' ",
	"logic gate. Did you notice that the 'phase AND' required only two qubits?"
}
q_command.areas.phase_a_and_b_escape.success_chat_sent = false

q_command.areas.phase_a_and_b_escape.help_btn_text = {}
q_command.areas.phase_a_and_b_escape.help_btn_text.en =
[[
Go ahead and make the circuit realize the boolean expression on the
wall, with the appearance of the liquid blocks and phase arrows as
indicated (arrow points left when the inputs make the boolean
expression true)
]]
q_command.areas.phase_a_and_b_escape.help_btn_text.es = q_command.areas.phase_a_and_b_escape.help_btn_text.en
q_command.areas.phase_a_and_b_escape.help_btn_text.ja = q_command.areas.phase_a_and_b_escape.help_btn_text.en
q_command.areas.phase_a_and_b_escape.help_btn_caption = "Make two operand phase AND gate"


-------- Room 12 (Level II)
q_command.areas.superpos_phase_and_escape = {}
q_command.areas.superpos_phase_and_escape.center_pos = {x = 198, y = 0, z = 82}
q_command.areas.superpos_phase_and_escape.radius = 5
q_command.areas.superpos_phase_and_escape.q_block_pos = {x = 201, y = 0, z = 84}

q_command.areas.superpos_phase_and_escape.door_pos = {x = 196, y = 0, z = 77}
q_command.areas.superpos_phase_and_escape.chest_pos = {x = 200, y = 0, z = 78}
q_command.areas.superpos_phase_and_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "circuit_blocks:circuit_blocks_gate_qubit_1", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "", [26] = "",
                [27] = "circuit_blocks:circuit_blocks_z_gate", [28] = "",
                [29] = "", [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool", [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.superpos_phase_and_escape.solution_statevector =
{{r=0.5,i=0},{r=0.5,i=0},{r=0.5,i=0},{r=-0.5,i=0}}

q_command.areas.superpos_phase_and_escape.help_chat_msg = {
	"Now realize the same logic as you did in the previous room, but compute the",
	"logic with its inputs in equal superposition, resulting in the state shown",
	"on the wall."
}
q_command.areas.superpos_phase_and_escape.help_chat_sent = false
q_command.areas.superpos_phase_and_escape.help_success_msg = {
	"Excellent! You've again managed to demonstrate quantum parallelism, in which",
	"all of the 2^n combinations are represented in the state vector. This time",
	"the combinations that satisfy the boolean expression are marked by a phase."
}
q_command.areas.superpos_phase_and_escape.success_chat_sent = false

q_command.areas.superpos_phase_and_escape.help_btn_text = {}
q_command.areas.superpos_phase_and_escape.help_btn_text.en =
[[
Now realize the same logic as you did in the previous room, but compute
the logic with its inputs in equal superposition, resulting in the state
shown on the wall.
]]
q_command.areas.superpos_phase_and_escape.help_btn_text.es = q_command.areas.superpos_phase_and_escape.help_btn_text.en
q_command.areas.superpos_phase_and_escape.help_btn_text.ja = q_command.areas.superpos_phase_and_escape.help_btn_text.en
q_command.areas.superpos_phase_and_escape.help_btn_caption = "Compute phase a AND b in superposition"


-------- Room 13 (Level II)
q_command.areas.phase_a_or_b_escape = {}
q_command.areas.phase_a_or_b_escape.center_pos = {x = 198, y = 0, z = 72}
q_command.areas.phase_a_or_b_escape.radius = 5
q_command.areas.phase_a_or_b_escape.q_block_pos = {x = 201, y = 0, z = 69}

q_command.areas.phase_a_or_b_escape.door_pos = {x = 193, y = 0, z = 74}
q_command.areas.phase_a_or_b_escape.chest_pos = {x = 199, y = 0, z = 76}
q_command.areas.phase_a_or_b_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "circuit_blocks:circuit_blocks_gate_qubit_1", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "", [26] = "", [27] = "circuit_blocks:circuit_blocks_z_gate", [28] = "",
                [29] = "", [30] = "",
                [31] = "circuit_blocks:control_tool", [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.phase_a_or_b_escape.solution_unitary =
{{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=-1,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=-1,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=-1,i=0}}}

q_command.areas.phase_a_or_b_escape.help_chat_msg = {
	"Now make the circuit realize the boolean expression on the wall, with ",
	"the appearance of the liquid blocks and phase arrows as indicated",
}
q_command.areas.phase_a_or_b_escape.help_chat_sent = false
q_command.areas.phase_a_or_b_escape.help_success_msg = {
	"Congratulations! You just made a 'phase OR' logic gate"
}
q_command.areas.phase_a_or_b_escape.success_chat_sent = false

q_command.areas.phase_a_or_b_escape.help_btn_text = {}
q_command.areas.phase_a_or_b_escape.help_btn_text.en =
[[
Now make the circuit realize the boolean expression on the wall, with
the appearance of the liquid blocks and phase arrows as indicated
]]
q_command.areas.phase_a_or_b_escape.help_btn_text.es = q_command.areas.phase_a_or_b_escape.help_btn_text.en
q_command.areas.phase_a_or_b_escape.help_btn_text.ja = q_command.areas.phase_a_or_b_escape.help_btn_text.en
q_command.areas.phase_a_or_b_escape.help_btn_caption = "Make two operand phase OR gate"


-------- Room 14 (Level II)
q_command.areas.phase_a_and_b_no_z_escape = {}
q_command.areas.phase_a_and_b_no_z_escape.center_pos = {x = 188, y = 0, z = 72}
q_command.areas.phase_a_and_b_no_z_escape.radius = 5
q_command.areas.phase_a_and_b_no_z_escape.q_block_pos = {x = 185, y = 0, z = 69}

q_command.areas.phase_a_and_b_no_z_escape.door_pos = {x = 186, y = 0, z = 67}
q_command.areas.phase_a_and_b_no_z_escape.chest_pos = {x = 190, y = 0, z = 68}
q_command.areas.phase_a_and_b_no_z_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "circuit_blocks:circuit_blocks_gate_qubit_1", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool", [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.phase_a_and_b_no_z_escape.solution_unitary =
{{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=-1,i=0}}}

q_command.areas.phase_a_and_b_no_z_escape.help_chat_msg = {
	"Your challenge here will be to create a 'phase AND' logic gate ",
	"without a Z block as used previously."
}
q_command.areas.phase_a_and_b_no_z_escape.help_chat_sent = false
q_command.areas.phase_a_and_b_no_z_escape.help_success_msg = {
	"Very resourceful! You've found a combination of gates that perform the same",
	"conditional unitary evolution as a controlled-Z gate. This will be useful in",
	"more complex phase logic gates, as the Z gate may only have one control qubit,",
	"but the X gate may have two (in a Toffoli gate)."
}
q_command.areas.phase_a_and_b_no_z_escape.success_chat_sent = false

q_command.areas.phase_a_and_b_no_z_escape.help_btn_text = {}
q_command.areas.phase_a_and_b_no_z_escape.help_btn_text.en =
[[
Your challenge here will be to create a 'phase AND' logic gate
without a Z block as used previously.
]]
q_command.areas.phase_a_and_b_no_z_escape.help_btn_text.es = q_command.areas.phase_a_and_b_no_z_escape.help_btn_text.en
q_command.areas.phase_a_and_b_no_z_escape.help_btn_text.ja = q_command.areas.phase_a_and_b_no_z_escape.help_btn_text.en
q_command.areas.phase_a_and_b_no_z_escape.help_btn_caption = "Make two operand phase AND gate w/o Z gate"


-------- Room 15 (Level II)
q_command.areas.phase_a_and_b_and_c_escape = {}
q_command.areas.phase_a_and_b_and_c_escape.center_pos = {x = 188, y = 0, z = 62}
q_command.areas.phase_a_and_b_and_c_escape.radius = 5
q_command.areas.phase_a_and_b_and_c_escape.q_block_pos = {x = 184, y = 0, z = 58}

q_command.areas.phase_a_and_b_and_c_escape.door_pos = {x = 193, y = 0, z = 60}
q_command.areas.phase_a_and_b_and_c_escape.chest_pos = {x = 192, y = 0, z = 64}
q_command.areas.phase_a_and_b_and_c_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "circuit_blocks:circuit_blocks_gate_qubit_1", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool", [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.phase_a_and_b_and_c_escape.solution_unitary =
{{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},
 {{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=-1,i=0}}}

q_command.areas.phase_a_and_b_and_c_escape.help_chat_msg = {
	"Go ahead and make the circuit realize the boolean expression on the wall,",
	"with the appearance of the liquid blocks and phase arrows as indicated",
}
q_command.areas.phase_a_and_b_and_c_escape.help_chat_sent = false
q_command.areas.phase_a_and_b_and_c_escape.help_success_msg = {
	"Outstanding. See, I told you that an alternative to a controlled-Z gate",
	"would come in handy!"
}
q_command.areas.phase_a_and_b_and_c_escape.success_chat_sent = false

q_command.areas.phase_a_and_b_and_c_escape.help_btn_text = {}
q_command.areas.phase_a_and_b_and_c_escape.help_btn_text.en =
[[
Go ahead and make the circuit realize the boolean expression on the
wall, with the appearance of the liquid blocks and phase arrows as
indicated.
]]
q_command.areas.phase_a_and_b_and_c_escape.help_btn_text.es = q_command.areas.phase_a_and_b_and_c_escape.help_btn_text.en
q_command.areas.phase_a_and_b_and_c_escape.help_btn_text.ja = q_command.areas.phase_a_and_b_and_c_escape.help_btn_text.en
q_command.areas.phase_a_and_b_and_c_escape.help_btn_caption = "Make three operand phase AND gate"


-------- Room 16 (Level II)
q_command.areas.a_or_b_and_c_escape = {}
q_command.areas.a_or_b_and_c_escape.center_pos = {x = 198, y = 0, z = 62}
q_command.areas.a_or_b_and_c_escape.radius = 5
q_command.areas.a_or_b_and_c_escape.q_block_pos = {x = 202, y = 0, z = 66}

q_command.areas.a_or_b_and_c_escape.door_pos = {x = 199, y = 0, z = 56}
q_command.areas.a_or_b_and_c_escape.chest_pos = {x = 196, y = 0, z = 58}
q_command.areas.a_or_b_and_c_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "circuit_blocks:circuit_blocks_gate_qubit_1", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate", [26] = "", [27] = "circuit_blocks:circuit_blocks_z_gate", [28] = "",
                [29] = "", [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool", [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.a_or_b_and_c_escape.solution_unitary =
{{{r=1,i=-0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=-0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=-1,i=0},{r=0,i=0},{r=0,i=0},
{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=-1,i=0},{r=0,i=0},
{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=-1,i=0},
{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
{r=1,i=-0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
{r=0,i=0},{r=1,i=-0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
{r=0,i=0},{r=0,i=0},{r=1,i=-0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=-0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=-1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=-0},{r=0,i=0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=-0},{r=0,i=0}},
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},
{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=-0}}}

q_command.areas.a_or_b_and_c_escape.help_chat_msg = {
	"Here you may use a combination of magnitude logic and phase logic gates ",
	"to satisfy the boolean expression on the wall, with the liquid blocks ",
	"and phase arrows appearing as indicated. As a hint, remember to have good ",
	"qubit hygiene :-)  By the way, I put an H block in the chest in case you ",
	"want to compute the logic with its inputs in equal superposition."
}
q_command.areas.a_or_b_and_c_escape.help_chat_sent = false
q_command.areas.a_or_b_and_c_escape.help_success_msg = {
	"Excellent work! You've really done well in these quantum logic focused",
	"circuit puzzles. There is, however one more step required for being able",
	"to detect the marked states via measurement. This step is known as",
	"'amplitude amplification', and is an idea from Grover's algorithm. The",
	"circuit right outside the exit door demonstrates these concepts together."
}
q_command.areas.a_or_b_and_c_escape.success_chat_sent = false

q_command.areas.a_or_b_and_c_escape.help_btn_text = {}
q_command.areas.a_or_b_and_c_escape.help_btn_text.en =
[[
Here you may use a combination of magnitude logic and phase logic gates
to satisfy the boolean expression on the wall, with the liquid blocks
and phase arrows appearing as indicated. As a hint, remember to have
good qubit hygiene :-)  By the way, I put an H block in the chest in case
you want to compute the logic with its inputs in equal superposition.
]]
q_command.areas.a_or_b_and_c_escape.help_btn_text.es = q_command.areas.a_or_b_and_c_escape.help_btn_text.en
q_command.areas.a_or_b_and_c_escape.help_btn_text.ja = q_command.areas.a_or_b_and_c_escape.help_btn_text.en
q_command.areas.a_or_b_and_c_escape.help_btn_caption = "Make (a OR b) AND c"
-- END Escape room puzzles Level II ---------------------------------------------

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

dofile(minetest.get_modpath("circuit_blocks").."/circuit_node_types.lua");

-- Escape room puzzles Level VII ------------------------------------------------
-------- Room 1 (Level VII)
-- Note to devs: Use lev_X_rm_Y pattern, where X is level number and Y is room number
q_command.areas.lev_7_rm_1 = {}
q_command.areas.lev_7_rm_1.region = q_command.regions.esc_rooms_level_7
table.insert(q_command.regions.esc_rooms_level_7, q_command.areas.lev_7_rm_1)
q_command.areas.lev_7_rm_1.area_num = #q_command.regions.esc_rooms_level_7

-- Note to devs: The center_pos x/y/z values should indicate the position of the center
-- block in the floor of the room. This is used, along with radius, to identify when a
-- player is in the room. This enables mechanisms such as greeting the player and
-- erasing their inventory when they enter an escape room.
q_command.areas.lev_7_rm_1.center_pos = {x = 298, y = 0, z = -58}
q_command.areas.lev_7_rm_1.radius = 5

-- Note to devs: The q_block_pos x/y/z values should indicate where the Q block is,
-- for input to mechanisms such as opening the exit door when a puzzle is solved.
-- Since the escape rooms in this level are already pre-loaded with default circuit
-- puzzles, it will often be necessary to change the q_block_pos when replacing it
-- with a different sized puzzle. To delete a puzzle from an escape room, hold the
-- shift key while left-clicking the Q block. To create a circuit puzzle in a room,
-- search the inventory for a Q block by using the pattern "lev_X_rm_Y", where X is
-- level number and Y is room number. Right-click to place the Q block in the
-- desired location in the room, and supply the desired number of rows/columns in the
-- circuit. You'll need to be in Creative Mode to search the inventory for Q blocks.
q_command.areas.lev_7_rm_1.q_block_pos = {x = 298, y = 0, z = -61}

-- Note to devs: The door_pos x/y/z values should indicate where the exit door is.
q_command.areas.lev_7_rm_1.door_pos = {x = 293, y = 0, z = -56}

-- Note to devs: The portal_pos x/y/z values should indicate where the orange portal
-- is, so that it may be used to teleport from the hub into the room, and entered by
-- the player to teleport back to the hub. It is good practice to place it one block
-- above floor level so that player doesn't accidentally get teleported when bumping
-- into it. It is also good practice to place the portal to the West of the center_pos
-- if possible, so that the portal is behind the player when teleporting into the room
-- (players enter from the West into the blue portals in the portal room.)
q_command.areas.lev_7_rm_1.portal_pos = {x = 303, y = 1, z = -58}

-- Note to devs: The chest_pos x/y/z values should indicate where the chest is, so
-- that it may be restocked when a puzzle is solved.
q_command.areas.lev_7_rm_1.chest_pos = {x = 296, y = 0, z = -54}

-- Note to devs: Remove chest inventory items not required for the circuit puzzle,
-- by making their relevant strings empty.
q_command.areas.lev_7_rm_1.chest_inv = {
    inventory = {
        main = {[1] = "",
                [2] = "circuit_blocks:circuit_blocks_pulse_gaussian_x90_plus",
                [3] = "circuit_blocks:circuit_blocks_pulse_gaussian_x180_plus",
                [4] = "",
                [5] = "circuit_blocks:circuit_blocks_pulse_gaussian_y90_plus",
                [6] = "circuit_blocks:circuit_blocks_pulse_gaussian_y180_plus",
                [7] = "",
                [8] = "",

                [9] = "",
                [10] = "circuit_blocks:circuit_blocks_pulse_gaussian_x90_minus",
                [11] = "circuit_blocks:circuit_blocks_pulse_gaussian_x180_minus",
                [12] = "",
                [13] = "circuit_blocks:circuit_blocks_pulse_gaussian_y90_minus",
                [14] = "circuit_blocks:circuit_blocks_pulse_gaussian_y180_minus",
                [15] = "",
                [16] = "",

                [17] = "circuit_blocks:circuit_blocks_pulse_fractal_gaussian_zx45_plus",
                [18] = "circuit_blocks:circuit_blocks_pulse_fractal_gaussian_zx90_plus",
                [19] = "",
                [20] = "",
                [21] = "",
                [22] = "",
                [23] = "circuit_blocks:circuit_blocks_pulse_cancellation_plus",
                [24] = "circuit_blocks:circuit_blocks_pulse_fractal_gaussian_cancellation_plus",

                [25] = "circuit_blocks:circuit_blocks_pulse_fractal_gaussian_zx45_minus",
                [26] = "circuit_blocks:circuit_blocks_pulse_fractal_gaussian_zx90_minus",
                [27] = "",
                [28] = "",
                [29] = "",
                [30] = "",
                [31] = "circuit_blocks:circuit_blocks_pulse_cancellation_minus",
                [32] = "circuit_blocks:circuit_blocks_pulse_fractal_gaussian_cancellation_minus"
        }
    }
}

-- Note to devs: The variable ending in solution_unitary holds the unitary matrix
-- of complex numbers that represent the solution to a circuit puzzle. Use this
-- variable when the puzzle is expressed in terms of transforming various inputs
-- to corresponding outputs. For example, the circuit puzzle challenge in this
-- room is to create a CNOT gate, which is modeled by a unique unitary matrix.
-- To obtain the value to supply here, *temporarily* uncomment the relevant line
-- in the init.lua file in the q_command directory:
--      minetest.debug("unitary:\n" .. dump(unitary))
-- This will cause the unitary matrix to appear in the debug.txt log file every
-- time the circuit is modified or measured. This matrix can be quite large, so
-- remove spaces, tabs, and newline characters before inserting here.
--[[
q_command.areas.lev_7_rm_1.solution_unitary =
{{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}},
{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}}}
--]]

-- Note to devs: The variable ending in solution_statevector holds the statevector
-- of complex numbers that represent the solution to a circuit puzzle. Use this
-- variable when the puzzle is expressed in terms of its desired statevector.
-- To obtain the value to supply here, *temporarily* uncomment the relevant line
-- in the init.lua file in the q_command directory:
--      minetest.debug("statevector:\n" .. dump(statevector))
-- This will cause the statevector to appear in the debug.txt log file every
-- time the circuit is modified or measured. This vector can be quite large, so
-- remove spaces, tabs, and newline characters before inserting here.
--[[
q_command.areas.lev_7_rm_1.solution_statevector =
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}}
--]]

q_command.areas.lev_7_rm_1.solution_pulses =
{{CircuitNodeTypes.EMPTY,
  CircuitNodeTypes.EMPTY,
  CircuitNodeTypes.PULSE_FRACTAL_GAUSSIAN_ZX90_MINUS}}

-- Note to devs: The variable ending in help_chat_msg holds the English localized version
-- of the message that Professor Q will chat to the player when entering an escape room
-- for the first time since the application is invoked. Note that for help_chat_msg,
-- ".en" is *not* added to the end of the variable name for the English language.
q_command.areas.lev_7_rm_1.help_chat_msg = {
	"Let's assume a system composed of two qubits q0 and q1 coupled by a bus resonator. Each qubit has a drive ",
	"channel and pulse frequency of the channel is set to equal to the resonance frequency of connected qubit. ",
	"Additional control channel u0 is connected q0, and the pulse frequency of this channel is set to the resonance ",
	"frequency of q1. The system has no tunability of qubit frequencies. You can assume both qubits are two level ",
	"system and no cross-talk. Now you need to create a unitary of ZX(-pi/2) as a foundation of a CNOT gate."
}
-- Note to devs: The variable ending in help_chat_msg and a language code holds the
-- non-English localized version of the message that Professor Q will chat to the
-- player when entering an escape room for the first time since the application is invoked.
--[[
q_command.areas.lev_7_rm_1.help_chat_msg.ja = {
	"また会いましたね、尊敬する同僚！私の名前はQ教授で、量子実験を行っているため、このガ",
	"ラスの後ろに立っていることを思い出してください。私はあなたが元気だと確信しています:-)",
	"この実験では、壁にあるようにデジタルの「排他的OR」ゲートを実現する回路を作成します。",
	"出口のドアが開くかどうかに影響を与えることなく、入力をテストするために、ワイアー線上",
	"に|1>のブロックを配置できます。"
}
--]]
q_command.areas.lev_7_rm_1.help_chat_sent = false

-- Note to devs: The variable ending in help_success_msg holds the English localized
-- version of the message that Professor Q will chat to the player when solving an
-- escape room puzzle for the first time since the application is invoked. Note that
-- for help_success_msg, ".en" is *not* added to the end of the variable name for the
-- English language.
q_command.areas.lev_7_rm_1.help_success_msg = {
	"Well done! TODO: Supply more instructional feedback"
}
-- Note to devs: The variable ending in help_success_msg and a language code holds the
-- localized version of the message that Professor Q will chat to the player when
-- solving an escape room puzzle for the first time since the application is invoked.
q_command.areas.lev_7_rm_1.help_success_msg.ja = {
	"よくできました！ CNOTゲートはそれ自体が可逆であることがわかっているため、出力を入力 ",
	"として提供すると、元の入力が出力として提供されます。 これは、ビットのバケツに量子ビッ ",
	"トが入らないリバーシブルなコンピューティングです。この部屋を出る前にそれを試して、リ ",
	"バーシブルコンピューティングの動作を確認してください。"
}
q_command.areas.lev_7_rm_1.success_chat_sent = false

-- Note to devs: The variable ending in help_btn_text followed by a language code
-- holds the text that appears when right-clicking a help sign that contains a
-- question mark "?". When used in an escape room, the sign should be located directly
-- above the chest, and should start with the same message as the chat message held in
-- the localized help_chat_msg variables discussed previously. If it seems prudent,
-- additional notes and hints should be included in the text, but be careful not to
-- make it too easy for the player to solve the puzzle. Note that for help_btn_text
-- it is necessary to include the language code for all localized text, including
-- (".en") for English text.
-- Whenever you change the text on a sign, delete it from the wall by left-clicking,
-- and put it back on the wall by wielding the sign and right-clicking. To find the
-- sign in inventory for a given escape room, search with the pattern "lev_X_rm_Y",
-- where X is level number and Y is room number.
q_command.areas.lev_7_rm_1.help_btn_text = {}
q_command.areas.lev_7_rm_1.help_btn_text.en =
[[
We meet again, esteemed colleague! You may recall that my name is
Professor Q and that I'm standing behind this glass because we're
conducting quantum experiments. I'm sure that you'll be fine though :-)
For this experiment, let's assume a system composed of two qubits q0 and
q1 coupled by a bus resonator. Each qubit has a drive channel and pulse
frequency of the channel is set to equal to the resonance frequency of
connected qubit. Additional control channel u0 is connected q0, and the
pulse frequency of this channel is set to the resonance frequency of q1.
The system has no tunability of qubit frequencies. You can assume both
qubits are two level system and no cross-talk. Now you need to create a
unitary of ZX(-pi/2) as a foundation of a CNOT gate.
]]
q_command.areas.lev_7_rm_1.help_btn_text.es = q_command.areas.lev_7_rm_1.help_btn_text.en
q_command.areas.lev_7_rm_1.help_btn_text.ja = q_command.areas.lev_7_rm_1.help_btn_text.en


-- Note to devs: The variable ending in help_btn_caption followed by a language
-- code holds the text that appears in the caption of a help sign. Note that
-- for help_btn_caption it is necessary to include the language code for all
-- localized text, including (".en") for English text.
q_command.areas.lev_7_rm_1.help_btn_caption = {}
q_command.areas.lev_7_rm_1.help_btn_caption.en = "Make a quantum logic XOR gate"
q_command.areas.lev_7_rm_1.help_btn_caption.es = q_command.areas.lev_7_rm_1.help_btn_caption.en
q_command.areas.lev_7_rm_1.help_btn_caption.ja = q_command.areas.lev_7_rm_1.help_btn_caption.en


-------- Room 2 (Level VII)
q_command.areas.lev_7_rm_2 = {}
q_command.areas.lev_7_rm_2.region = q_command.regions.esc_rooms_level_7
table.insert(q_command.regions.esc_rooms_level_7, q_command.areas.lev_7_rm_2)
q_command.areas.lev_7_rm_2.area_num = #q_command.regions.esc_rooms_level_7

q_command.areas.lev_7_rm_2.center_pos = {x = 288, y = 0, z = -58}
q_command.areas.lev_7_rm_2.radius = 5
q_command.areas.lev_7_rm_2.q_block_pos = {x = 286, y = 0, z = -55}

q_command.areas.lev_7_rm_2.door_pos = {x = 286, y = 0, z = -63}
q_command.areas.lev_7_rm_2.portal_pos = {x = 293, y = 1, z = -58}
q_command.areas.lev_7_rm_2.chest_pos = {x = 284, y = 0, z = -60}
q_command.areas.lev_7_rm_2.chest_inv = {
    inventory = {
        main = {[1] = "",
                [2] = "circuit_blocks:circuit_blocks_pulse_gaussian_x90_plus",
                [3] = "circuit_blocks:circuit_blocks_pulse_gaussian_x180_plus",
                [4] = "",
                [5] = "circuit_blocks:circuit_blocks_pulse_gaussian_y90_plus",
                [6] = "circuit_blocks:circuit_blocks_pulse_gaussian_y180_plus",
                [7] = "",
                [8] = "",

                [9] = "",
                [10] = "circuit_blocks:circuit_blocks_pulse_gaussian_x90_minus",
                [11] = "circuit_blocks:circuit_blocks_pulse_gaussian_x180_minus",
                [12] = "",
                [13] = "circuit_blocks:circuit_blocks_pulse_gaussian_y90_minus",
                [14] = "circuit_blocks:circuit_blocks_pulse_gaussian_y180_minus",
                [15] = "",
                [16] = "",

                [17] = "circuit_blocks:circuit_blocks_pulse_fractal_gaussian_zx45_plus",
                [18] = "circuit_blocks:circuit_blocks_pulse_fractal_gaussian_zx90_plus",
                [19] = "",
                [20] = "",
                [21] = "",
                [22] = "",
                [23] = "circuit_blocks:circuit_blocks_pulse_cancellation_plus",
                [24] = "circuit_blocks:circuit_blocks_pulse_fractal_gaussian_cancellation_plus",

                [25] = "circuit_blocks:circuit_blocks_pulse_fractal_gaussian_zx45_minus",
                [26] = "circuit_blocks:circuit_blocks_pulse_fractal_gaussian_zx90_minus",
                [27] = "",
                [28] = "",
                [29] = "",
                [30] = "",
                [31] = "circuit_blocks:circuit_blocks_pulse_cancellation_minus",
                [32] = "circuit_blocks:circuit_blocks_pulse_fractal_gaussian_cancellation_minus"
        }
    }
}
q_command.areas.lev_7_rm_2.solution_pulses =
{{CircuitNodeTypes.PULSE_GAUSSIAN_X180_PLUS,            --d0
  CircuitNodeTypes.EMPTY,                               --d1
  CircuitNodeTypes.EMPTY},                              --u

 {CircuitNodeTypes.EMPTY,
  CircuitNodeTypes.EMPTY,
  CircuitNodeTypes.PULSE_FRACTAL_GAUSSIAN_ZX45_PLUS},

 {CircuitNodeTypes.PULSE_GAUSSIAN_X180_PLUS,
  CircuitNodeTypes.EMPTY,
  CircuitNodeTypes.EMPTY},

 {CircuitNodeTypes.EMPTY,
  CircuitNodeTypes.EMPTY,
  CircuitNodeTypes.PULSE_FRACTAL_GAUSSIAN_ZX45_MINUS}
}

q_command.areas.lev_7_rm_2.help_chat_msg = {
	"Qubits are multi-level systems in this challenge. By considering the effect from higher levels, some ",
    "noisy terms are induced to your Hamiltonian. Now you need to create ZX(-pi/2) by eliminating ",
    "those unwanted interactions. Typically two pulse echoed CR is used."
}
--[[
q_command.areas.lev_7_rm_2.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
--]]
q_command.areas.lev_7_rm_2.help_chat_sent = false
q_command.areas.lev_7_rm_2.help_success_msg = {
	"Nice job.  TODO: Supply more instructional feedback"
}
--[[
q_command.areas.lev_7_rm_2.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
--]]
q_command.areas.lev_7_rm_2.success_chat_sent = false

q_command.areas.lev_7_rm_2.help_btn_text = {}
q_command.areas.lev_7_rm_2.help_btn_text.en =
[[
Qubits are multi-level systems in this challenge. By considering the effect
from higher levels, some noisy terms are induced to your Hamiltonian. Now
you need to create ZX(-pi/2) by eliminating those unwanted interactions.
Typically two pulse echoed CR is used.
]]
q_command.areas.lev_7_rm_2.help_btn_text.es = q_command.areas.lev_7_rm_2.help_btn_text.en
q_command.areas.lev_7_rm_2.help_btn_text.ja = q_command.areas.lev_7_rm_2.help_btn_text.en
q_command.areas.lev_7_rm_2.help_btn_caption = {}
q_command.areas.lev_7_rm_2.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_7_rm_2.help_btn_caption.es = q_command.areas.lev_7_rm_2.help_btn_caption.en
q_command.areas.lev_7_rm_2.help_btn_caption.ja = q_command.areas.lev_7_rm_2.help_btn_caption.en


-------- Room 3 (Level VII)
q_command.areas.lev_7_rm_3 = {}
q_command.areas.lev_7_rm_3.region = q_command.regions.esc_rooms_level_7
table.insert(q_command.regions.esc_rooms_level_7, q_command.areas.lev_7_rm_3)
q_command.areas.lev_7_rm_3.area_num = #q_command.regions.esc_rooms_level_7

q_command.areas.lev_7_rm_3.center_pos = {x = 288, y = 0, z = -68}
q_command.areas.lev_7_rm_3.radius = 5
q_command.areas.lev_7_rm_3.q_block_pos = {x = 285, y = 0, z = -70}

q_command.areas.lev_7_rm_3.door_pos = {x = 293, y = 0, z = -70}
q_command.areas.lev_7_rm_3.portal_pos = {x = 293, y = 1, z = -68}
q_command.areas.lev_7_rm_3.chest_pos = {x = 290, y = 0, z = -72}
q_command.areas.lev_7_rm_3.chest_inv = {
    inventory = {
        main = {[1] = "",
                [2] = "circuit_blocks:circuit_blocks_pulse_gaussian_x90_plus",
                [3] = "circuit_blocks:circuit_blocks_pulse_gaussian_x180_plus",
                [4] = "",
                [5] = "circuit_blocks:circuit_blocks_pulse_gaussian_y90_plus",
                [6] = "circuit_blocks:circuit_blocks_pulse_gaussian_y180_plus",
                [7] = "",
                [8] = "",

                [9] = "",
                [10] = "circuit_blocks:circuit_blocks_pulse_gaussian_x90_minus",
                [11] = "circuit_blocks:circuit_blocks_pulse_gaussian_x180_minus",
                [12] = "",
                [13] = "circuit_blocks:circuit_blocks_pulse_gaussian_y90_minus",
                [14] = "circuit_blocks:circuit_blocks_pulse_gaussian_y180_minus",
                [15] = "",
                [16] = "",

                [17] = "circuit_blocks:circuit_blocks_pulse_fractal_gaussian_zx45_plus",
                [18] = "circuit_blocks:circuit_blocks_pulse_fractal_gaussian_zx90_plus",
                [19] = "",
                [20] = "",
                [21] = "",
                [22] = "",
                [23] = "circuit_blocks:circuit_blocks_pulse_cancellation_plus",
                [24] = "circuit_blocks:circuit_blocks_pulse_fractal_gaussian_cancellation_plus",

                [25] = "circuit_blocks:circuit_blocks_pulse_fractal_gaussian_zx45_minus",
                [26] = "circuit_blocks:circuit_blocks_pulse_fractal_gaussian_zx90_minus",
                [27] = "",
                [28] = "",
                [29] = "",
                [30] = "",
                [31] = "circuit_blocks:circuit_blocks_pulse_cancellation_minus",
                [32] = "circuit_blocks:circuit_blocks_pulse_fractal_gaussian_cancellation_minus"
        }
    }
}
q_command.areas.lev_7_rm_3.solution_pulses =
{{CircuitNodeTypes.PULSE_GAUSSIAN_X180_PLUS,            --d0
  CircuitNodeTypes.EMPTY,                               --d1
  CircuitNodeTypes.EMPTY},                              --u

 {CircuitNodeTypes.EMPTY,
  CircuitNodeTypes.PULSE_CANCELLATION_PLUS,
  CircuitNodeTypes.PULSE_FRACTAL_GAUSSIAN_ZX45_PLUS},

 {CircuitNodeTypes.PULSE_GAUSSIAN_X180_PLUS,
  CircuitNodeTypes.EMPTY,
  CircuitNodeTypes.EMPTY},

 {CircuitNodeTypes.EMPTY,
  CircuitNodeTypes.PULSE_CANCELLATION_MINUS,
  CircuitNodeTypes.PULSE_FRACTAL_GAUSSIAN_ZX45_MINUS}
}

q_command.areas.lev_7_rm_3.help_chat_msg = {
	"There is classical cross-talk in your system. This cross-talk induces another ",
    "noisy term in your Hamiltonian. Now you need to create ZX(-pi/2) by using ",
    "cancellation pulses."
}
--[[
q_command.areas.lev_7_rm_3.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
]]
q_command.areas.lev_7_rm_3.help_chat_sent = false
q_command.areas.lev_7_rm_3.help_success_msg = {
	"Great job! TODO: Supply more instructional feedback"
}
--[[
q_command.areas.lev_7_rm_3.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
--]]
q_command.areas.lev_7_rm_3.success_chat_sent = false

q_command.areas.lev_7_rm_3.help_btn_text = {}
q_command.areas.lev_7_rm_3.help_btn_text.en =
[[
There is classical cross-talk in your system. This cross-talk induces another
noisy term in your Hamiltonian. Now you need to create ZX(-pi/2) by using
cancellation pulses.
]]
q_command.areas.lev_7_rm_3.help_btn_text.es = q_command.areas.lev_7_rm_3.help_btn_text.en
q_command.areas.lev_7_rm_3.help_btn_text.ja = q_command.areas.lev_7_rm_3.help_btn_text.en
q_command.areas.lev_7_rm_3.help_btn_caption = {}
q_command.areas.lev_7_rm_3.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_7_rm_3.help_btn_caption.es = q_command.areas.lev_7_rm_3.help_btn_caption.en
q_command.areas.lev_7_rm_3.help_btn_caption.ja = q_command.areas.lev_7_rm_3.help_btn_caption.en


-------- Room 4 (Level VII)
q_command.areas.lev_7_rm_4 = {}
q_command.areas.lev_7_rm_4.region = q_command.regions.esc_rooms_level_7
table.insert(q_command.regions.esc_rooms_level_7, q_command.areas.lev_7_rm_4)
q_command.areas.lev_7_rm_4.area_num = #q_command.regions.esc_rooms_level_7

q_command.areas.lev_7_rm_4.center_pos = {x = 298, y = 0, z = -68}
q_command.areas.lev_7_rm_4.radius = 5
q_command.areas.lev_7_rm_4.q_block_pos = {x = 296, y = 0, z = -65}

q_command.areas.lev_7_rm_4.door_pos = {x = 303, y = 0, z = -66}
q_command.areas.lev_7_rm_4.portal_pos = {x = 303, y = 1, z = -68}
q_command.areas.lev_7_rm_4.chest_pos = {x = 302, y = 0, z = -70}
q_command.areas.lev_7_rm_4.chest_inv = {
    inventory = {
        main = {[1] = "",
                [2] = "circuit_blocks:circuit_blocks_pulse_gaussian_x90_plus",
                [3] = "circuit_blocks:circuit_blocks_pulse_gaussian_x180_plus",
                [4] = "",
                [5] = "circuit_blocks:circuit_blocks_pulse_gaussian_y90_plus",
                [6] = "circuit_blocks:circuit_blocks_pulse_gaussian_y180_plus",
                [7] = "",
                [8] = "",

                [9] = "",
                [10] = "circuit_blocks:circuit_blocks_pulse_gaussian_x90_minus",
                [11] = "circuit_blocks:circuit_blocks_pulse_gaussian_x180_minus",
                [12] = "",
                [13] = "circuit_blocks:circuit_blocks_pulse_gaussian_y90_minus",
                [14] = "circuit_blocks:circuit_blocks_pulse_gaussian_y180_minus",
                [15] = "",
                [16] = "",

                [17] = "circuit_blocks:circuit_blocks_pulse_fractal_gaussian_zx45_plus",
                [18] = "circuit_blocks:circuit_blocks_pulse_fractal_gaussian_zx90_plus",
                [19] = "",
                [20] = "",
                [21] = "",
                [22] = "",
                [23] = "circuit_blocks:circuit_blocks_pulse_cancellation_plus",
                [24] = "circuit_blocks:circuit_blocks_pulse_fractal_gaussian_cancellation_plus",

                [25] = "circuit_blocks:circuit_blocks_pulse_fractal_gaussian_zx45_minus",
                [26] = "circuit_blocks:circuit_blocks_pulse_fractal_gaussian_zx90_minus",
                [27] = "",
                [28] = "",
                [29] = "",
                [30] = "",
                [31] = "circuit_blocks:circuit_blocks_pulse_cancellation_minus",
                [32] = "circuit_blocks:circuit_blocks_pulse_fractal_gaussian_cancellation_minus"
        }
    }
}
q_command.areas.lev_7_rm_4.solution_pulses =
{{CircuitNodeTypes.PULSE_GAUSSIAN_Y180_MINUS,           --d0
  CircuitNodeTypes.PULSE_GAUSSIAN_X90_PLUS,             --d1
  CircuitNodeTypes.EMPTY},                              --u

 {CircuitNodeTypes.EMPTY,
  CircuitNodeTypes.PULSE_CANCELLATION_PLUS,
  CircuitNodeTypes.PULSE_FRACTAL_GAUSSIAN_ZX45_PLUS},

 {CircuitNodeTypes.PULSE_GAUSSIAN_X180_PLUS,
  CircuitNodeTypes.EMPTY,
  CircuitNodeTypes.EMPTY},

 {CircuitNodeTypes.EMPTY,
  CircuitNodeTypes.PULSE_CANCELLATION_MINUS,
  CircuitNodeTypes.PULSE_FRACTAL_GAUSSIAN_ZX45_MINUS}
}

q_command.areas.lev_7_rm_4.help_chat_msg = {
	"You need to create CNOT gate from ZX(-pi/2)."
}
--[[
q_command.areas.lev_7_rm_4.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
--]]
q_command.areas.lev_7_rm_4.help_chat_sent = false
q_command.areas.lev_7_rm_4.help_success_msg = {
	"Excellent!  TODO: Supply more instructional feedback"
}
--[[
q_command.areas.lev_7_rm_4.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
--]]
q_command.areas.lev_7_rm_4.success_chat_sent = false

q_command.areas.lev_7_rm_4.help_btn_text = {}
q_command.areas.lev_7_rm_4.help_btn_text.en =
[[
You need to create CNOT gate from ZX(-pi/2).
]]
q_command.areas.lev_7_rm_4.help_btn_text.es = q_command.areas.lev_7_rm_4.help_btn_text.en
q_command.areas.lev_7_rm_4.help_btn_text.ja = q_command.areas.lev_7_rm_4.help_btn_text.en
q_command.areas.lev_7_rm_4.help_btn_caption = {}
q_command.areas.lev_7_rm_4.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_7_rm_4.help_btn_caption.es = q_command.areas.lev_7_rm_4.help_btn_caption.en
q_command.areas.lev_7_rm_4.help_btn_caption.ja = q_command.areas.lev_7_rm_4.help_btn_caption.en


-------- Room 5 (Level VII)
q_command.areas.lev_7_rm_5 = {}
q_command.areas.lev_7_rm_5.region = q_command.regions.esc_rooms_level_7
table.insert(q_command.regions.esc_rooms_level_7, q_command.areas.lev_7_rm_5)
q_command.areas.lev_7_rm_5.area_num = #q_command.regions.esc_rooms_level_7

q_command.areas.lev_7_rm_5.center_pos = {x = 308, y = 0, z = -68}
q_command.areas.lev_7_rm_5.radius = 5
q_command.areas.lev_7_rm_5.q_block_pos = {x = 310, y = 0, z = -71}

q_command.areas.lev_7_rm_5.door_pos = {x = 306, y = 0, z = -63}
q_command.areas.lev_7_rm_5.portal_pos = {x = 313, y = 1, z = -68}
q_command.areas.lev_7_rm_5.chest_pos = {x = 310, y = 0, z = -64}
q_command.areas.lev_7_rm_5.chest_inv = {
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
q_command.areas.lev_7_rm_5.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_7_rm_5.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall."
}
q_command.areas.lev_7_rm_5.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_7_rm_5.help_chat_sent = false
q_command.areas.lev_7_rm_5.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_7_rm_5.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_7_rm_5.success_chat_sent = false

q_command.areas.lev_7_rm_5.help_btn_text = {}
q_command.areas.lev_7_rm_5.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_7_rm_5.help_btn_text.es = q_command.areas.lev_7_rm_5.help_btn_text.en
q_command.areas.lev_7_rm_5.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_7_rm_5.help_btn_caption = {}
q_command.areas.lev_7_rm_5.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_7_rm_5.help_btn_caption.es = q_command.areas.lev_7_rm_5.help_btn_caption.en
q_command.areas.lev_7_rm_5.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 6 (Level VII)
q_command.areas.lev_7_rm_6 = {}
q_command.areas.lev_7_rm_6.region = q_command.regions.esc_rooms_level_7
table.insert(q_command.regions.esc_rooms_level_7, q_command.areas.lev_7_rm_6)
q_command.areas.lev_7_rm_6.area_num = #q_command.regions.esc_rooms_level_7

q_command.areas.lev_7_rm_6.center_pos = {x = 306, y = 0, z = -58}
q_command.areas.lev_7_rm_6.radius = 5
q_command.areas.lev_7_rm_6.q_block_pos = {x = 306, y = 0, z = -55}

q_command.areas.lev_7_rm_6.door_pos = {x = 313, y = 0, z = -56}
q_command.areas.lev_7_rm_6.portal_pos = {x = 313, y = 1, z = -58}
q_command.areas.lev_7_rm_6.chest_pos = {x = 304, y = 0, z = -56}
q_command.areas.lev_7_rm_6.chest_inv = {
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
q_command.areas.lev_7_rm_6.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_7_rm_6.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall."
}
q_command.areas.lev_7_rm_6.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_7_rm_6.help_chat_sent = false
q_command.areas.lev_7_rm_6.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_7_rm_6.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_7_rm_6.success_chat_sent = false

q_command.areas.lev_7_rm_6.help_btn_text = {}
q_command.areas.lev_7_rm_6.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_7_rm_6.help_btn_text.es = q_command.areas.lev_7_rm_6.help_btn_text.en
q_command.areas.lev_7_rm_6.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_7_rm_6.help_btn_caption = {}
q_command.areas.lev_7_rm_6.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_7_rm_6.help_btn_caption.es = q_command.areas.lev_7_rm_6.help_btn_caption.en
q_command.areas.lev_7_rm_6.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 7 (Level VII)
q_command.areas.lev_7_rm_7 = {}
q_command.areas.lev_7_rm_7.region = q_command.regions.esc_rooms_level_7
table.insert(q_command.regions.esc_rooms_level_7, q_command.areas.lev_7_rm_7)
q_command.areas.lev_7_rm_7.area_num = #q_command.regions.esc_rooms_level_7

q_command.areas.lev_7_rm_7.center_pos = {x = 318, y = 0, z = -58}
q_command.areas.lev_7_rm_7.radius = 5
q_command.areas.lev_7_rm_7.q_block_pos = {x = 321, y = 0, z = -56}

q_command.areas.lev_7_rm_7.door_pos = {x = 320, y = 0, z = -63}
q_command.areas.lev_7_rm_7.portal_pos = {x = 323, y = 1, z = -55}
q_command.areas.lev_7_rm_7.chest_pos = {x = 316, y = 0, z = -54}
q_command.areas.lev_7_rm_7.chest_inv = {
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
q_command.areas.lev_7_rm_7.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_7_rm_7.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall."
}
q_command.areas.lev_7_rm_7.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_7_rm_7.help_chat_sent = false
q_command.areas.lev_7_rm_7.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_7_rm_7.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_7_rm_7.success_chat_sent = false

q_command.areas.lev_7_rm_7.help_btn_text = {}
q_command.areas.lev_7_rm_7.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_7_rm_7.help_btn_text.es = q_command.areas.lev_7_rm_7.help_btn_text.en
q_command.areas.lev_7_rm_7.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_7_rm_7.help_btn_caption = {}
q_command.areas.lev_7_rm_7.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_7_rm_7.help_btn_caption.es = q_command.areas.lev_7_rm_7.help_btn_caption.en
q_command.areas.lev_7_rm_7.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 8 (Level VII)
q_command.areas.lev_7_rm_8 = {}
q_command.areas.lev_7_rm_8.region = q_command.regions.esc_rooms_level_7
table.insert(q_command.regions.esc_rooms_level_7, q_command.areas.lev_7_rm_8)
q_command.areas.lev_7_rm_8.area_num = #q_command.regions.esc_rooms_level_7

q_command.areas.lev_7_rm_8.center_pos = {x = 318, y = 0, z = -68}
q_command.areas.lev_7_rm_8.radius = 5
q_command.areas.lev_7_rm_8.q_block_pos = {x = 315, y = 0, z = -70}

q_command.areas.lev_7_rm_8.door_pos = {x = 316, y = 0, z = -73}
q_command.areas.lev_7_rm_8.portal_pos = {x = 323, y = 1, z = -68}
q_command.areas.lev_7_rm_8.chest_pos = {x = 322, y = 0, z = -66}
q_command.areas.lev_7_rm_8.chest_inv = {
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
q_command.areas.lev_7_rm_8.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_7_rm_8.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall."
}
q_command.areas.lev_7_rm_8.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_7_rm_8.help_chat_sent = false
q_command.areas.lev_7_rm_8.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_7_rm_8.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_7_rm_8.success_chat_sent = false

q_command.areas.lev_7_rm_8.help_btn_text = {}
q_command.areas.lev_7_rm_8.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_7_rm_8.help_btn_text.es = q_command.areas.lev_7_rm_8.help_btn_text.en
q_command.areas.lev_7_rm_8.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_7_rm_8.help_btn_caption = {}
q_command.areas.lev_7_rm_8.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_7_rm_8.help_btn_caption.es = q_command.areas.lev_7_rm_8.help_btn_caption.en
q_command.areas.lev_7_rm_8.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 9 (Level VII)
q_command.areas.lev_7_rm_9 = {}
q_command.areas.lev_7_rm_9.region = q_command.regions.esc_rooms_level_7
table.insert(q_command.regions.esc_rooms_level_7, q_command.areas.lev_7_rm_9)
q_command.areas.lev_7_rm_9.area_num = #q_command.regions.esc_rooms_level_7

q_command.areas.lev_7_rm_9.center_pos = {x = 318, y = 0, z = -78}
q_command.areas.lev_7_rm_9.radius = 5
q_command.areas.lev_7_rm_9.q_block_pos = {x = 321, y = 0, z = -76}

q_command.areas.lev_7_rm_9.door_pos = {x = 320, y = 0, z = -83}
q_command.areas.lev_7_rm_9.portal_pos = {x = 323, y = 1, z = -75}
q_command.areas.lev_7_rm_9.chest_pos = {x = 320, y = 0, z = -74}
q_command.areas.lev_7_rm_9.chest_inv = {
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
q_command.areas.lev_7_rm_9.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_7_rm_9.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall."
}
q_command.areas.lev_7_rm_9.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_7_rm_9.help_chat_sent = false
q_command.areas.lev_7_rm_9.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_7_rm_9.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_7_rm_9.success_chat_sent = false

q_command.areas.lev_7_rm_9.help_btn_text = {}
q_command.areas.lev_7_rm_9.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_7_rm_9.help_btn_text.es = q_command.areas.lev_7_rm_9.help_btn_text.en
q_command.areas.lev_7_rm_9.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_7_rm_9.help_btn_caption = {}
q_command.areas.lev_7_rm_9.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_7_rm_9.help_btn_caption.es = q_command.areas.lev_7_rm_9.help_btn_caption.en
q_command.areas.lev_7_rm_9.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 10 (Level VII)
q_command.areas.lev_7_rm_10 = {}
q_command.areas.lev_7_rm_10.region = q_command.regions.esc_rooms_level_7
table.insert(q_command.regions.esc_rooms_level_7, q_command.areas.lev_7_rm_10)
q_command.areas.lev_7_rm_10.area_num = #q_command.regions.esc_rooms_level_7

q_command.areas.lev_7_rm_10.center_pos = {x = 318, y = 0, z = -88}
q_command.areas.lev_7_rm_10.radius = 5
q_command.areas.lev_7_rm_10.q_block_pos = {x = 320, y = 0, z = -91}

q_command.areas.lev_7_rm_10.door_pos = {x = 313, y = 0, z = -86}
q_command.areas.lev_7_rm_10.portal_pos = {x = 323, y = 1, z = -88}
q_command.areas.lev_7_rm_10.chest_pos = {x = 322, y = 0, z = -86}
q_command.areas.lev_7_rm_10.chest_inv = {
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
q_command.areas.lev_7_rm_10.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_7_rm_10.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall."
}
q_command.areas.lev_7_rm_10.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_7_rm_10.help_chat_sent = false
q_command.areas.lev_7_rm_10.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_7_rm_10.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_7_rm_10.success_chat_sent = false

q_command.areas.lev_7_rm_10.help_btn_text = {}
q_command.areas.lev_7_rm_10.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_7_rm_10.help_btn_text.es = q_command.areas.lev_7_rm_10.help_btn_text.en
q_command.areas.lev_7_rm_10.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_7_rm_10.help_btn_caption = {}
q_command.areas.lev_7_rm_10.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_7_rm_10.help_btn_caption.es = q_command.areas.lev_7_rm_10.help_btn_caption.en
q_command.areas.lev_7_rm_10.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 11 (Level VII)
q_command.areas.lev_7_rm_11 = {}
q_command.areas.lev_7_rm_11.region = q_command.regions.esc_rooms_level_7
table.insert(q_command.regions.esc_rooms_level_7, q_command.areas.lev_7_rm_11)
q_command.areas.lev_7_rm_11.area_num = #q_command.regions.esc_rooms_level_7

q_command.areas.lev_7_rm_11.center_pos = {x = 308, y = 0, z = -88}
q_command.areas.lev_7_rm_11.radius = 5
q_command.areas.lev_7_rm_11.q_block_pos = {x = 310, y = 0, z = -91}

q_command.areas.lev_7_rm_11.door_pos = {x = 306, y = 0, z = -83}
q_command.areas.lev_7_rm_11.portal_pos = {x = 313, y = 1, z = -88}
q_command.areas.lev_7_rm_11.chest_pos = {x = 310, y = 0, z = -84}
q_command.areas.lev_7_rm_11.chest_inv = {
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
q_command.areas.lev_7_rm_11.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_7_rm_11.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall."
}
q_command.areas.lev_7_rm_11.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_7_rm_11.help_chat_sent = false
q_command.areas.lev_7_rm_11.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_7_rm_11.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_7_rm_11.success_chat_sent = false

q_command.areas.lev_7_rm_11.help_btn_text = {}
q_command.areas.lev_7_rm_11.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_7_rm_11.help_btn_text.es = q_command.areas.lev_7_rm_11.help_btn_text.en
q_command.areas.lev_7_rm_11.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_7_rm_11.help_btn_caption = {}
q_command.areas.lev_7_rm_11.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_7_rm_11.help_btn_caption.es = q_command.areas.lev_7_rm_11.help_btn_caption.en
q_command.areas.lev_7_rm_11.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 12 (Level VII)
q_command.areas.lev_7_rm_12 = {}
q_command.areas.lev_7_rm_12.region = q_command.regions.esc_rooms_level_7
table.insert(q_command.regions.esc_rooms_level_7, q_command.areas.lev_7_rm_12)
q_command.areas.lev_7_rm_12.area_num = #q_command.regions.esc_rooms_level_7

q_command.areas.lev_7_rm_12.center_pos = {x = 308, y = 0, z = -78}
q_command.areas.lev_7_rm_12.radius = 5
q_command.areas.lev_7_rm_12.q_block_pos = {x = 311, y = 0, z = -76}

q_command.areas.lev_7_rm_12.door_pos = {x = 303, y = 0, z = -80}
q_command.areas.lev_7_rm_12.portal_pos = {x = 313, y = 1, z = -81}
q_command.areas.lev_7_rm_12.chest_pos = {x = 304, y = 0, z = -76}
q_command.areas.lev_7_rm_12.chest_inv = {
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
q_command.areas.lev_7_rm_12.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_7_rm_12.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall."
}
q_command.areas.lev_7_rm_12.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_7_rm_12.help_chat_sent = false
q_command.areas.lev_7_rm_12.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_7_rm_12.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_7_rm_12.success_chat_sent = false

q_command.areas.lev_7_rm_12.help_btn_text = {}
q_command.areas.lev_7_rm_12.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_7_rm_12.help_btn_text.es = q_command.areas.lev_7_rm_12.help_btn_text.en
q_command.areas.lev_7_rm_12.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_7_rm_12.help_btn_caption = {}
q_command.areas.lev_7_rm_12.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_7_rm_12.help_btn_caption.es = q_command.areas.lev_7_rm_12.help_btn_caption.en
q_command.areas.lev_7_rm_12.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 13 (Level VII)
q_command.areas.lev_7_rm_13 = {}
q_command.areas.lev_7_rm_13.region = q_command.regions.esc_rooms_level_7
table.insert(q_command.regions.esc_rooms_level_7, q_command.areas.lev_7_rm_13)
q_command.areas.lev_7_rm_13.area_num = #q_command.regions.esc_rooms_level_7

q_command.areas.lev_7_rm_13.center_pos = {x = 298, y = 0, z = -78}
q_command.areas.lev_7_rm_13.radius = 5
q_command.areas.lev_7_rm_13.q_block_pos = {x = 295, y = 0, z = -80}

q_command.areas.lev_7_rm_13.door_pos = {x = 300, y = 0, z = -83}
q_command.areas.lev_7_rm_13.portal_pos = {x = 303, y = 1, z = -78}
q_command.areas.lev_7_rm_13.chest_pos = {x = 296, y = 0, z = -74}
q_command.areas.lev_7_rm_13.chest_inv = {
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
q_command.areas.lev_7_rm_13.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_7_rm_13.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall."
}
q_command.areas.lev_7_rm_13.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_7_rm_13.help_chat_sent = false
q_command.areas.lev_7_rm_13.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_7_rm_13.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_7_rm_13.success_chat_sent = false

q_command.areas.lev_7_rm_13.help_btn_text = {}
q_command.areas.lev_7_rm_13.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_7_rm_13.help_btn_text.es = q_command.areas.lev_7_rm_13.help_btn_text.en
q_command.areas.lev_7_rm_13.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_7_rm_13.help_btn_caption = {}
q_command.areas.lev_7_rm_13.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_7_rm_13.help_btn_caption.es = q_command.areas.lev_7_rm_13.help_btn_caption.en
q_command.areas.lev_7_rm_13.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 14 (Level VII)
q_command.areas.lev_7_rm_14 = {}
q_command.areas.lev_7_rm_14.region = q_command.regions.esc_rooms_level_7
table.insert(q_command.regions.esc_rooms_level_7, q_command.areas.lev_7_rm_14)
q_command.areas.lev_7_rm_14.area_num = #q_command.regions.esc_rooms_level_7

q_command.areas.lev_7_rm_14.center_pos = {x = 298, y = 0, z = -88}
q_command.areas.lev_7_rm_14.radius = 5
q_command.areas.lev_7_rm_14.q_block_pos = {x = 301, y = 0, z = -86}

q_command.areas.lev_7_rm_14.door_pos = {x = 293, y = 0, z = -90}
q_command.areas.lev_7_rm_14.portal_pos = {x = 303, y = 1, z = -85}
q_command.areas.lev_7_rm_14.chest_pos = {x = 300, y = 0, z = -92}
q_command.areas.lev_7_rm_14.chest_inv = {
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
q_command.areas.lev_7_rm_14.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_7_rm_14.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall."
}
q_command.areas.lev_7_rm_14.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_7_rm_14.help_chat_sent = false
q_command.areas.lev_7_rm_14.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_7_rm_14.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_7_rm_14.success_chat_sent = false

q_command.areas.lev_7_rm_14.help_btn_text = {}
q_command.areas.lev_7_rm_14.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_7_rm_14.help_btn_text.es = q_command.areas.lev_7_rm_14.help_btn_text.en
q_command.areas.lev_7_rm_14.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_7_rm_14.help_btn_caption = {}
q_command.areas.lev_7_rm_14.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_7_rm_14.help_btn_caption.es = q_command.areas.lev_7_rm_14.help_btn_caption.en
q_command.areas.lev_7_rm_14.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 15 (Level VII)
q_command.areas.lev_7_rm_15 = {}
q_command.areas.lev_7_rm_15.region = q_command.regions.esc_rooms_level_7
table.insert(q_command.regions.esc_rooms_level_7, q_command.areas.lev_7_rm_15)
q_command.areas.lev_7_rm_15.area_num = #q_command.regions.esc_rooms_level_7

q_command.areas.lev_7_rm_15.center_pos = {x = 288, y = 0, z = -88}
q_command.areas.lev_7_rm_15.radius = 5
q_command.areas.lev_7_rm_15.q_block_pos = {x = 285, y = 0, z = -90}

q_command.areas.lev_7_rm_15.door_pos = {x = 286, y = 0, z = -83}
q_command.areas.lev_7_rm_15.portal_pos = {x = 293, y = 1, z = -88}
q_command.areas.lev_7_rm_15.chest_pos = {x = 290, y = 0, z = -92}
q_command.areas.lev_7_rm_15.chest_inv = {
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
q_command.areas.lev_7_rm_15.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_7_rm_15.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall."
}
q_command.areas.lev_7_rm_15.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_7_rm_15.help_chat_sent = false
q_command.areas.lev_7_rm_15.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_7_rm_15.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_7_rm_15.success_chat_sent = false

q_command.areas.lev_7_rm_15.help_btn_text = {}
q_command.areas.lev_7_rm_15.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_7_rm_15.help_btn_text.es = q_command.areas.lev_7_rm_15.help_btn_text.en
q_command.areas.lev_7_rm_15.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_7_rm_15.help_btn_caption = {}
q_command.areas.lev_7_rm_15.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_7_rm_15.help_btn_caption.es = q_command.areas.lev_7_rm_15.help_btn_caption.en
q_command.areas.lev_7_rm_15.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 16 (Level VII)
q_command.areas.lev_7_rm_16 = {}
q_command.areas.lev_7_rm_16.region = q_command.regions.esc_rooms_level_7
table.insert(q_command.regions.esc_rooms_level_7, q_command.areas.lev_7_rm_16)
q_command.areas.lev_7_rm_16.area_num = #q_command.regions.esc_rooms_level_7

q_command.areas.lev_7_rm_16.center_pos = {x = 288, y = 0, z = -78}
q_command.areas.lev_7_rm_16.radius = 5
q_command.areas.lev_7_rm_16.q_block_pos = {x = 291, y = 0, z = -76}

q_command.areas.lev_7_rm_16.door_pos = {x = 283, y = 0, z = -76}
q_command.areas.lev_7_rm_16.portal_pos = {x = 293, y = 1, z = -81}
q_command.areas.lev_7_rm_16.chest_pos = {x = 284, y = 0, z = -80}
q_command.areas.lev_7_rm_16.chest_inv = {
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
q_command.areas.lev_7_rm_16.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_7_rm_16.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall."
}
q_command.areas.lev_7_rm_16.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_7_rm_16.help_chat_sent = false
q_command.areas.lev_7_rm_16.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_7_rm_16.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_7_rm_16.success_chat_sent = false

q_command.areas.lev_7_rm_16.help_btn_text = {}
q_command.areas.lev_7_rm_16.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_7_rm_16.help_btn_text.es = q_command.areas.lev_7_rm_16.help_btn_text.en
q_command.areas.lev_7_rm_16.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_7_rm_16.help_btn_caption = {}
q_command.areas.lev_7_rm_16.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_7_rm_16.help_btn_caption.es = q_command.areas.lev_7_rm_16.help_btn_caption.en
q_command.areas.lev_7_rm_16.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"



-- END Escape room puzzles Level III --------------------------------------------

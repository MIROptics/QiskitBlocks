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

-- Escape room puzzles Level IV ------------------------------------------------
-------- Room 1 (Level IV)
-- Note to devs: Use lev_X_rm_Y pattern, where X is level number and Y is room number
q_command.areas.lev_4_rm_1 = {}
q_command.areas.lev_4_rm_1.region = q_command.regions.esc_rooms_level_4
table.insert(q_command.regions.esc_rooms_level_4, q_command.areas.lev_4_rm_1)
q_command.areas.lev_4_rm_1.area_num = #q_command.regions.esc_rooms_level_4

-- Note to devs: The center_pos x/y/z values should indicate the position of the center
-- block in the floor of the room. This is used, along with radius, to identify when a
-- player is in the room. This enables mechanisms such as greeting the player and
-- erasing their inventory when they enter an escape room.
q_command.areas.lev_4_rm_1.center_pos = {x = 238, y = 0, z = 32}
q_command.areas.lev_4_rm_1.radius = 5

-- Note to devs: The q_block_pos x/y/z values should indicate where the Q block is,
-- for input to mechanisms such as opening the exit door when a puzzle is solved.
-- Since the escape rooms in this level are already pre-loaded with default circuit
-- puzzles, it will often be necessary to change the q_block_pos when replacing it
-- with a different sized puzzle. To delete a puzzle from an escape room, hold the
-- shift key while left-clicking the Q block. To w a circuit puzzle in a room,
-- search the inventory for a Q block by using the pattern "lev_X_rm_Y", where X is
-- level number and Y is room number. Right-click to place the Q block in the
-- desired location in the room, and supply the desired number of rows/columns in the
-- circuit. You'll need to be in Creative Mode to search the inventory for Q blocks.
q_command.areas.lev_4_rm_1.q_block_pos = {x = 241, y = 0, z = 34}

-- Note to devs: The door_pos x/y/z values should indicate where the exit door is.
q_command.areas.lev_4_rm_1.door_pos = {x = 236, y = 0, z = 37}

-- Note to devs: The portal_pos x/y/z values should indicate where the orange portal
-- is, so that it may be used to teleport from the hub into the room, and entered by
-- the player to teleport back to the hub. It is good practice to place it one block
-- above floor level so that player doesn't accidentally get teleported when bumping
-- into it. It is also good practice to place the portal to the West of the center_pos
-- if possible, so that the portal is behind the player when teleporting into the room
-- (players enter from the West into the blue portals in the portal room.)
q_command.areas.lev_4_rm_1.portal_pos = {x = 243, y = 1, z = 35}

-- Note to devs: The chest_pos x/y/z values should indicate where the chest is, so
-- that it may be restocked when a puzzle is solved.
q_command.areas.lev_4_rm_1.chest_pos = {x = 234, y = 0, z = 34}

-- Note to devs: Remove chest inventory items not required for the circuit puzzle,
-- by making their relevant strings empty.
q_command.areas.lev_4_rm_1.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "", [5] = "", [6] = "",
                [7] = "circuit_blocks:circuit_blocks_gate_qubit_0",
                [8] = "circuit_blocks:circuit_blocks_gate_qubit_1",
                [9] = "", [10] = "", [11] = "", [12] = "", [13] = "", [14] = "",
                [15] = "circuit_blocks:swap_tool",
                [16] = "",
                [17] = "",
                [18] = "",
                [19] = "circuit_blocks:circuit_blocks_rz_gate_0p16",
                [20] = "",
                [21] = "",
                [22] = "circuit_blocks:circuit_blocks_swap",
                [23] = "circuit_blocks:rotate_tool",
                [24] = "",
                [25] = "",
                [26] = "",
                [27] = "",
                [28] = "",
                [29] = "",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool",
                [32] = ""
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
q_command.areas.lev_4_rm_1.solution_unitary ={{{r = 0.5,i = 0},{r = 0.5,i = 0},{r = 0.354,i = -0.354},{r = 0.354,i = -0.354}},{{r = 0.5,i = 0},{r = 0.5,i = 0},{r = -0.354,i = 0.354},{r = -0.354,i = 0.354}},{{r = 0.5,i = 0},{r = -0.5,i = 0},{r = 0.354,i = 0.354},{r = -0.354,i = -0.354}},{{r = 0.5,i = 0},{r = -0.5,i = 0},{r = -0.354,i = -0.354},{r = 0.354,i = 0.354}}}


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
q_command.areas.lev_4_rm_1.solution_statevector =
{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}}
--]]

-- Note to devs: The variable ending in help_chat_msg holds the English localized version
-- of the message that Professor Q will chat to the player when entering an escape room
-- for the first time since the application is invoked. Note that for help_chat_msg,
-- ".en" is *not* added to the end of the variable name for the English language.
q_command.areas.lev_4_rm_1.help_chat_msg = {
"We meet again, esteemed colleague! You may recall that my name is Professor Q",
"and that I'm standing behind this glass because we're conducting quantum experiments.",
"I'm sure that you'll be fine though :-). For this experiment, let's make a 2 qubit QFT circuit",
"To find out more about QFT,  right click on the question mark.",
}
-- Note to devs: The variable ending in help_chat_msg and a language code holds the
-- non-English localized version of the message that Professor Q will chat to the
-- player when entering an escape room for the first time since the application is invoked.
q_command.areas.lev_4_rm_1.help_chat_msg.ja = {
	"また会いましたね、尊敬する同僚！私の名前はQ教授で、量子実験を行っているため、このガ",
	"ラスの後ろに立っていることを思い出してください。私はあなたが元気だと確信しています:-)",
	"この実験では、壁にあるようにデジタルの「排他的OR」ゲートを実現する回路を作成します。",
	"出口のドアが開くかどうかに影響を与えることなく、入力をテストするために、ワイアー線上",
	"に|1>のブロックを配置できます。"
}
q_command.areas.lev_4_rm_1.help_chat_sent = false

-- Note to devs: The variable ending in help_success_msg holds the English localized
-- version of the message that Professor Q will chat to the player when solving an
-- escape room puzzle for the first time since the application is invoked. Note that
-- for help_success_msg, ".en" is *not* added to the end of the variable name for the
-- English language.
q_command.areas.lev_4_rm_1.help_success_msg = {
	"Well done!! You successfully created 2 qubit QFT!! :)",
  "The door to next level is open."
}
-- Note to devs: The variable ending in help_success_msg and a language code holds the
-- localized version of the message that Professor Q will chat to the player when
-- solving an escape room puzzle for the first time since the application is invoked.
q_command.areas.lev_4_rm_1.help_success_msg.ja = {
	"よくできました！ CNOTゲートはそれ自体が可逆であることがわかっているため、出力を入力 ",
	"として提供すると、元の入力が出力として提供されます。 これは、ビットのバケツに量子ビッ ",
	"トが入らないリバーシブルなコンピューティングです。この部屋を出る前にそれを試して、リ ",
	"バーシブルコンピューティングの動作を確認してください。"
}
q_command.areas.lev_4_rm_1.success_chat_sent = false

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
q_command.areas.lev_4_rm_1.help_btn_text = {}
q_command.areas.lev_4_rm_1.help_btn_text.en =
[[
Create two-qubit QFT

+++++Here’s how we create a QFT circuit++++
---For 2 Qubit---
Step 1: H gate on qubit A.
Step 2: CRz(Pi/2) gate with B being a control qubit on qubit A.
Step 3: H gate on qubit B.
Step 4: Swap gate between qubit A and B.
*|0>---qubit A
 |0>---qubit B
]]

q_command.areas.lev_4_rm_1.help_btn_text.es = q_command.areas.lev_4_rm_1.help_btn_text.en
q_command.areas.lev_4_rm_1.help_btn_text.ja =
[[
また会いましたね、尊敬する同僚！私の名前はQ教授で、量子実験を行っているため、このガ
ラスの後ろに立っていることを思い出してください。私はあなたが元気だと確信しています:-)
この実験では、壁にあるようにデジタルの「排他的OR」ゲートを実現する回路を作成します。
出口のドアが開くかどうかに影響を与えることなく、入力をテストするために、ワイアー線上
に|1>のブロックを配置できます。

注：これらの「脱出ルーム」サーキットパズルに必要なほとんどのヘルプは、教授Qのチャッ
トエリア（ウィンドウの左上隅）に表示されます。これらのパズルはみな、チェストからブ
ロックを取得し、回路に配置するというものです。パズルを解くと、Qブロックが金色に変
わって、お祝いの音楽がなり、隣の部屋への扉が開きます。レベル II パズルのための知識とス
キルの構築に役立つため、レベル I 脱出ルームをまだ解いていない場合は解いてから始めてく
ださい。

回路で測定を実行するには、測定ブロックを右クリックします。

Xゲートを制御Xゲートに（およびその逆に）変換するには、コントロールツール（チェストの
杖型ツール）を持ちながらブロックを左クリックまたは右クリックします。左クリックすると
制御量子ビットが1ワイヤ上に移動し、右クリックすると制御量子ビットが1ワイヤ下に移動し
ます。制御Xゲートは、制御NOTゲートまたはCNOTゲートとも呼ばれます。一対の量子ビッ
トに作用し、一方がコントロール側として機能し、もう一方がターゲット側として機能しま
す。コントロール側が|1>の状態の時、ターゲット側でX操作を実行します。制御量子ビットが
重ね合わせにある場合、このゲートはエンタングルメント状態を作ります。
]]


-- Note to devs: The variable ending in help_btn_caption followed by a language
-- code holds the text that appears in the caption of a help sign. Note that
-- for help_btn_caption it is necessary to include the language code for all
-- localized text, including (".en") for English text.
q_command.areas.lev_4_rm_1.help_btn_caption = {}
q_command.areas.lev_4_rm_1.help_btn_caption.en = "Create a 2 qubit QFT circuit"
q_command.areas.lev_4_rm_1.help_btn_caption.es = q_command.areas.lev_4_rm_1.help_btn_caption.en
q_command.areas.lev_4_rm_1.help_btn_caption.ja = "量子論理XORゲートを作る"


-------- Room 2 (Level IV)
q_command.areas.lev_4_rm_2 = {}
q_command.areas.lev_4_rm_2.region = q_command.regions.esc_rooms_level_4
table.insert(q_command.regions.esc_rooms_level_4, q_command.areas.lev_4_rm_2)
q_command.areas.lev_4_rm_2.area_num = #q_command.regions.esc_rooms_level_4

q_command.areas.lev_4_rm_2.center_pos = {x = 238, y = 0, z = 42}
q_command.areas.lev_4_rm_2.radius = 5
q_command.areas.lev_4_rm_2.q_block_pos = {x = 235, y = 0, z = 40}

q_command.areas.lev_4_rm_2.door_pos = {x = 243, y = 0, z = 44}
q_command.areas.lev_4_rm_2.portal_pos = {x = 243, y = 1, z = 42}
q_command.areas.lev_4_rm_2.chest_pos = {x = 240, y = 0, z = 46}
q_command.areas.lev_4_rm_2.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "", [5] = "", [6] = "",
                [7] = "circuit_blocks:circuit_blocks_gate_qubit_0",
                [8] = "circuit_blocks:circuit_blocks_gate_qubit_1",
                [9] = "", [10] = "", [11] = "", [12] = "", [13] = "", [14] = "",
                [15] = "circuit_blocks:swap_tool",
                [16] = "",
                [17] = "",
                [18] = "",
                [19] = "circuit_blocks:circuit_blocks_rz_gate_0p16",
                [20] = "",
                [21] = "",
                [22] = "circuit_blocks:circuit_blocks_swap",
                [23] = "circuit_blocks:rotate_tool",
                [24] = "",
                [25] = "",
                [26] = "",
                [27] = "",
                [28] = "",
                [29] = "",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool",
                [32] = ""
        }
    }
}
q_command.areas.lev_4_rm_2.solution_unitary =
{{{r = 0.354,i = 0},{r = 0.354,i = 0},{r = 0.25,i = -0.25},{r = 0.25,i = -0.25},{r = 0.135,i = -0.327},{r = 0.135,i = -0.327},{r = -0.135,i = -0.327},{r = -0.135,i = -0.327}},{{r = 0.354,i = 0},{r = 0.354,i = 0},{r = 0.25,i = -0.25},{r = 0.25,i = -0.25},{r = -0.135,i = 0.327},{r = -0.135,i = 0.327},{r = 0.135,i = 0.327},{r = 0.135,i = 0.327}},{{r = 0.354,i = 0},{r = 0.354,i = 0},{r = -0.25,i = 0.25},{r = -0.25,i = 0.25},{r = 0.327,i = 0.135},{r = 0.327,i = 0.135},{r = -0.327,i = 0.135},{r = -0.327,i = 0.135}},{{r = 0.354,i = 0},{r = 0.354,i = 0},{r = -0.25,i = 0.25},{r = -0.25,i = 0.25},{r = -0.327,i = -0.135},{r = -0.327,i = -0.135},{r = 0.327,i = -0.135},{r = 0.327,i = -0.135}},{{r = 0.354,i = 0},{r = -0.354,i = 0},{r = 0.25,i = 0.25},{r = -0.25,i = -0.25},{r = 0.327,i = -0.135},{r = -0.327,i = 0.135},{r = 0.327,i = 0.135},{r = -0.327,i = -0.135}},{{r = 0.354,i = 0},{r = -0.354,i = 0},{r = 0.25,i = 0.25},{r = -0.25,i = -0.25},{r = -0.327,i = 0.135},{r = 0.327,i = -0.135},{r = -0.327,i = -0.135},{r = 0.327,i = 0.135}},{{r = 0.354,i = 0},{r = -0.354,i = 0},{r = -0.25,i = -0.25},{r = 0.25,i = 0.25},{r = 0.135,i = 0.327},{r = -0.135,i = -0.327},{r = 0.135,i = -0.327},{r = -0.135,i = 0.327}},{{r = 0.354,i = 0},{r = -0.354,i = 0},{r = -0.25,i = -0.25},{r = 0.25,i = 0.25},{r = -0.135,i = -0.327},{r = 0.135,i = 0.327},{r = -0.135,i = 0.327},{r = 0.135,i = -0.327}}}

q_command.areas.lev_4_rm_2.help_chat_msg = {
	"Welcome, esteemed colleague!! Now you have to make a 3 qubit QFT to be able to go the next room.",
	"You made 2 qubit QFT circuit. Now, try to make 3 qubit QFT circuit with the hints given.:)",
	"Click on the question mark for the hints."
}
q_command.areas.lev_4_rm_2.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_4_rm_2.help_chat_sent = false
q_command.areas.lev_4_rm_2.help_success_msg = {
	"Well done. So, now you understand how to expand QFT circuits for more qubits."
}
q_command.areas.lev_4_rm_2.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_4_rm_2.success_chat_sent = false

q_command.areas.lev_4_rm_2.help_btn_text = {}
q_command.areas.lev_4_rm_2.help_btn_text.en =
[[
Create three-qubit QFT

+++++Here’s how we create a QFT circuit++++
---For 3 Qubit---
Step 1: H gate on qubit A.
Step 2: CRz(Pi/2) gate with B being a control qubit on qubit A.
Step 3: CRz(Pi/4) gate with C being a control qubit on qubit A.
Step 4: H gate on qubit B.
Step 5: CRz(Pi/2) gate with C being a control qubit on qubit B.
Step 6: H gate on qubit C.
Step 7: Swap gate between qubit A and C.
*|0>---qubit A
 |0>---qubit B
 |0>---qubit C
]]
q_command.areas.lev_4_rm_2.help_btn_text.es = q_command.areas.lev_4_rm_2.help_btn_text.en
q_command.areas.lev_4_rm_2.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_4_rm_2.help_btn_caption = {}
q_command.areas.lev_4_rm_2.help_btn_caption.en = "Create a 3 qubit QFT circuit"
q_command.areas.lev_4_rm_2.help_btn_caption.es = q_command.areas.lev_4_rm_2.help_btn_caption.en
q_command.areas.lev_4_rm_2.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 3 (Level IV)
q_command.areas.lev_4_rm_3 = {}
q_command.areas.lev_4_rm_3.region = q_command.regions.esc_rooms_level_4
table.insert(q_command.regions.esc_rooms_level_4, q_command.areas.lev_4_rm_3)
q_command.areas.lev_4_rm_3.area_num = #q_command.regions.esc_rooms_level_4

q_command.areas.lev_4_rm_3.center_pos = {x = 248, y = 0, z = 42}
q_command.areas.lev_4_rm_3.radius = 5
q_command.areas.lev_4_rm_3.q_block_pos = {x = 246, y = 0, z = 30}

q_command.areas.lev_4_rm_3.door_pos = {x = 246, y = 0, z = 27}
q_command.areas.lev_4_rm_3.portal_pos = {x = 253, y = 1, z = 42}
q_command.areas.lev_4_rm_3.chest_pos = {x = 252, y = 0, z = 40}
q_command.areas.lev_4_rm_3.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "", [5] = "", [6] = "",
                [7] = "circuit_blocks:circuit_blocks_gate_qubit_0",
                [8] = "circuit_blocks:circuit_blocks_gate_qubit_1",
                [9] = "", [10] = "", [11] = "", [12] = "", [13] = "", [14] = "",
                [15] = "circuit_blocks:swap_tool",
                [16] = "",
                [17] = "",
                [18] = "",
                [19] = "circuit_blocks:circuit_blocks_rz_gate_0p16",
                [20] = "",
                [21] = "",
                [22] = "circuit_blocks:circuit_blocks_swap",
                [23] = "circuit_blocks:rotate_tool",
                [24] = "",
                [25] = "",
                [26] = "",
                [27] = "",
                [28] = "",
                [29] = "",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool",
                [32] = ""
        }
    }
}
q_command.areas.lev_4_rm_3.solution_unitary =
{{{r = 0.25,i = 0},{r = 0.25,i = 0},{r = 0.177,i = -0.177},{r = 0.177,i = -0.177},{r = 0.096,i = -0.231},{r = 0.096,i = -0.231},{r = -0.096,i = -0.231},{r = -0.096,i = -0.231},{r = 0.049,i = -0.245},{r = 0.049,i = -0.245},{r = -0.139,i = -0.208},{r = -0.139,i = -0.208},{r = -0.208,i = -0.139},{r = -0.208,i = -0.139},{r = -0.245,i = 0.049},{r = -0.245,i = 0.049}},{{r = 0.25,i = 0},{r = 0.25,i = 0},{r = 0.177,i = -0.177},{r = 0.177,i = -0.177},{r = 0.096,i = -0.231},{r = 0.096,i = -0.231},{r = -0.096,i = -0.231},{r = -0.096,i = -0.231},{r = -0.049,i = 0.245},{r = -0.049,i = 0.245},{r = 0.139,i = 0.208},{r = 0.139,i = 0.208},{r = 0.208,i = 0.139},{r = 0.208,i = 0.139},{r = 0.245,i = -0.049},{r = 0.245,i = -0.049}},{{r = 0.25,i = 0},{r = 0.25,i = 0},{r = 0.177,i = -0.177},{r = 0.177,i = -0.177},{r = -0.096,i = 0.231},{r = -0.096,i = 0.231},{r = 0.096,i = 0.231},{r = 0.096,i = 0.231},{r = 0.245,i = 0.049},{r = 0.245,i = 0.049},{r = 0.208,i = -0.139},{r = 0.208,i = -0.139},{r = -0.139,i = 0.208},{r = -0.139,i = 0.208},{r = 0.049,i = 0.245},{r = 0.049,i = 0.245}},{{r = 0.25,i = 0},{r = 0.25,i = 0},{r = 0.177,i = -0.177},{r = 0.177,i = -0.177},{r = -0.096,i = 0.231},{r = -0.096,i = 0.231},{r = 0.096,i = 0.231},{r = 0.096,i = 0.231},{r = -0.245,i = -0.049},{r = -0.245,i = -0.049},{r = -0.208,i = 0.139},{r = -0.208,i = 0.139},{r = 0.139,i = -0.208},{r = 0.139,i = -0.208},{r = -0.049,i = -0.245},{r = -0.049,i = -0.245}},{{r = 0.25,i = 0},{r = 0.25,i = 0},{r = -0.177,i = 0.177},{r = -0.177,i = 0.177},{r = 0.231,i = 0.096},{r = 0.231,i = 0.096},{r = -0.231,i = 0.096},{r = -0.231,i = 0.096},{r = 0.208,i = -0.139},{r = 0.208,i = -0.139},{r = -0.049,i = 0.245},{r = -0.049,i = 0.245},{r = 0.245,i = -0.049},{r = 0.245,i = -0.049},{r = -0.139,i = 0.208},{r = -0.139,i = 0.208}},{{r = 0.25,i = 0},{r = 0.25,i = 0},{r = -0.177,i = 0.177},{r = -0.177,i = 0.177},{r = 0.231,i = 0.096},{r = 0.231,i = 0.096},{r = -0.231,i = 0.096},{r = -0.231,i = 0.096},{r = -0.208,i = 0.139},{r = -0.208,i = 0.139},{r = 0.049,i = -0.245},{r = 0.049,i = -0.245},{r = -0.245,i = 0.049},{r = -0.245,i = 0.049},{r = 0.139,i = -0.208},{r = 0.139,i = -0.208}},{{r = 0.25,i = 0},{r = 0.25,i = 0},{r = -0.177,i = 0.177},{r = -0.177,i = 0.177},{r = -0.231,i = -0.096},{r = -0.231,i = -0.096},{r = 0.231,i = -0.096},{r = 0.231,i = -0.096},{r = 0.139,i = 0.208},{r = 0.139,i = 0.208},{r = -0.245,i = -0.049},{r = -0.245,i = -0.049},{r = -0.049,i = -0.245},{r = -0.049,i = -0.245},{r = 0.208,i = 0.139},{r = 0.208,i = 0.139}},{{r = 0.25,i = 0},{r = 0.25,i = 0},{r = -0.177,i = 0.177},{r = -0.177,i = 0.177},{r = -0.231,i = -0.096},{r = -0.231,i = -0.096},{r = 0.231,i = -0.096},{r = 0.231,i = -0.096},{r = -0.139,i = -0.208},{r = -0.139,i = -0.208},{r = 0.245,i = 0.049},{r = 0.245,i = 0.049},{r = 0.049,i = 0.245},{r = 0.049,i = 0.245},{r = -0.208,i = -0.139},{r = -0.208,i = -0.139}},{{r = 0.25,i = 0},{r = -0.25,i = 0},{r = 0.177,i = 0.177},{r = -0.177,i = -0.177},{r = 0.231,i = -0.096},{r = -0.231,i = 0.096},{r = 0.231,i = 0.096},{r = -0.231,i = -0.096},{r = 0.139,i = -0.208},{r = -0.139,i = 0.208},{r = 0.245,i = -0.049},{r = -0.245,i = 0.049},{r = 0.049,i = -0.245},{r = -0.049,i = 0.245},{r = 0.208,i = -0.139},{r = -0.208,i = 0.139}},{{r = 0.25,i = 0},{r = -0.25,i = 0},{r = 0.177,i = 0.177},{r = -0.177,i = -0.177},{r = 0.231,i = -0.096},{r = -0.231,i = 0.096},{r = 0.231,i = 0.096},{r = -0.231,i = -0.096},{r = -0.139,i = 0.208},{r = 0.139,i = -0.208},{r = -0.245,i = 0.049},{r = 0.245,i = -0.049},{r = -0.049,i = 0.245},{r = 0.049,i = -0.245},{r = -0.208,i = 0.139},{r = 0.208,i = -0.139}},{{r = 0.25,i = 0},{r = -0.25,i = 0},{r = 0.177,i = 0.177},{r = -0.177,i = -0.177},{r = -0.231,i = 0.096},{r = 0.231,i = -0.096},{r = -0.231,i = -0.096},{r = 0.231,i = 0.096},{r = 0.208,i = 0.139},{r = -0.208,i = -0.139},{r = 0.049,i = 0.245},{r = -0.049,i = -0.245},{r = -0.245,i = -0.049},{r = 0.245,i = 0.049},{r = -0.139,i = -0.208},{r = 0.139,i = 0.208}},{{r = 0.25,i = 0},{r = -0.25,i = 0},{r = 0.177,i = 0.177},{r = -0.177,i = -0.177},{r = -0.231,i = 0.096},{r = 0.231,i = -0.096},{r = -0.231,i = -0.096},{r = 0.231,i = 0.096},{r = -0.208,i = -0.139},{r = 0.208,i = 0.139},{r = -0.049,i = -0.245},{r = 0.049,i = 0.245},{r = 0.245,i = 0.049},{r = -0.245,i = -0.049},{r = 0.139,i = 0.208},{r = -0.139,i = -0.208}},{{r = 0.25,i = 0},{r = -0.25,i = 0},{r = -0.177,i = -0.177},{r = 0.177,i = 0.177},{r = 0.096,i = 0.231},{r = -0.096,i = -0.231},{r = 0.096,i = -0.231},{r = -0.096,i = 0.231},{r = 0.245,i = -0.049},{r = -0.245,i = 0.049},{r = -0.208,i = -0.139},{r = 0.208,i = 0.139},{r = 0.139,i = 0.208},{r = -0.139,i = -0.208},{r = 0.049,i = -0.245},{r = -0.049,i = 0.245}},{{r = 0.25,i = 0},{r = -0.25,i = 0},{r = -0.177,i = -0.177},{r = 0.177,i = 0.177},{r = 0.096,i = 0.231},{r = -0.096,i = -0.231},{r = 0.096,i = -0.231},{r = -0.096,i = 0.231},{r = -0.245,i = 0.049},{r = 0.245,i = -0.049},{r = 0.208,i = 0.139},{r = -0.208,i = -0.139},{r = -0.139,i = -0.208},{r = 0.139,i = 0.208},{r = -0.049,i = 0.245},{r = 0.049,i = -0.245}},{{r = 0.25,i = 0},{r = -0.25,i = 0},{r = -0.177,i = -0.177},{r = 0.177,i = 0.177},{r = -0.096,i = -0.231},{r = 0.096,i = 0.231},{r = -0.096,i = 0.231},{r = 0.096,i = -0.231},{r = 0.049,i = 0.245},{r = -0.049,i = -0.245},{r = 0.139,i = -0.208},{r = -0.139,i = 0.208},{r = 0.208,i = -0.139},{r = -0.208,i = 0.139},{r = -0.245,i = -0.049},{r = 0.245,i = 0.049}},{{r = 0.25,i = 0},{r = -0.25,i = 0},{r = -0.177,i = -0.177},{r = 0.177,i = 0.177},{r = -0.096,i = -0.231},{r = 0.096,i = 0.231},{r = -0.096,i = 0.231},{r = 0.096,i = -0.231},{r = -0.049,i = -0.245},{r = 0.049,i = 0.245},{r = -0.139,i = 0.208},{r = 0.139,i = -0.208},{r = -0.208,i = 0.139},{r = 0.208,i = -0.139},{r = 0.245,i = 0.049},{r = -0.245,i = -0.049}}}
q_command.areas.lev_4_rm_3.help_chat_msg = {
	"You know, let's try the same with 4 qubits. ",
	"Let’s see, how you do without my help."
}
q_command.areas.lev_4_rm_3.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_4_rm_3.help_chat_sent = false
q_command.areas.lev_4_rm_3.help_success_msg = {
	"Well done, colleague!! Now go to the next room and see for yourself."
}
q_command.areas.lev_4_rm_3.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_4_rm_3.success_chat_sent = false

q_command.areas.lev_4_rm_3.help_btn_text = {}
q_command.areas.lev_4_rm_3.help_btn_text.en =
[[
Hints:
1. Order will be same H and then rotation gates.
2. Nth qubit will contain 3 - N cRz gate with rotations decreasing by a factor of 1/2.
3. No. of swaps depends upon integer part( total qubit / 2).
4. First swap is between top to bottom qubit and next one is between second and second from last and so on.
]]
q_command.areas.lev_4_rm_3.help_btn_text.es = q_command.areas.lev_4_rm_3.help_btn_text.en
q_command.areas.lev_4_rm_3.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_4_rm_3.help_btn_caption = {}
q_command.areas.lev_4_rm_3.help_btn_caption.en = "Create a 4-qubit circuit"
q_command.areas.lev_4_rm_3.help_btn_caption.es = q_command.areas.lev_4_rm_3.help_btn_caption.en
q_command.areas.lev_4_rm_3.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 4 (Level IV)
q_command.areas.lev_4_rm_4 = {}
q_command.areas.lev_4_rm_4.region = q_command.regions.esc_rooms_level_4
table.insert(q_command.regions.esc_rooms_level_4, q_command.areas.lev_4_rm_4)
q_command.areas.lev_4_rm_4.area_num = #q_command.regions.esc_rooms_level_4

q_command.areas.lev_4_rm_4.center_pos = {x = 248, y = 0, z = 22}
q_command.areas.lev_4_rm_4.radius = 5
q_command.areas.lev_4_rm_4.q_block_pos = {x = 251, y = 0, z = 24}

q_command.areas.lev_4_rm_4.door_pos = {x = 243, y = 0, z = 24}
q_command.areas.lev_4_rm_4.portal_pos = {x = 253, y = 1, z = 25}
q_command.areas.lev_4_rm_4.chest_pos = {x = 244, y = 0, z = 20}
q_command.areas.lev_4_rm_4.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "", [5] = "", [6] = "",
                [7] = "circuit_blocks:circuit_blocks_gate_qubit_0",
                [8] = "circuit_blocks:circuit_blocks_gate_qubit_1",
                [9] = "", [10] = "", [11] = "", [12] = "", [13] = "", [14] = "",
                [15] = "circuit_blocks:swap_tool",
                [16] = "",
                [17] = "",
                [18] = "",
                [19] = "circuit_blocks:circuit_blocks_rz_gate_0p16",
                [20] = "",
                [21] = "",
                [22] = "circuit_blocks:circuit_blocks_swap",
                [23] = "circuit_blocks:rotate_tool",
                [24] = "",
                [25] = "",
                [26] = "",
                [27] = "",
                [28] = "",
                [29] = "",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool",
                [32] = ""
        }
    }
}
q_command.areas.lev_4_rm_4.solution_unitary =
{{{r = 0.5,i = 0},{r = 0.5,i = 0},{r = 0.5,i = 0},{r = 0.5,i = 0}},{{r = 0.5,i = 0},{r = 0.5,i = 0},{r = -0.5,i = 0},{r = -0.5,i = 0}},{{r = -0.354,i = -0.354},{r = 0.354,i = 0.354},{r = -0.354,i = 0.354},{r = 0.354,i = -0.354}},{{r = -0.354,i = -0.354},{r = 0.354,i = 0.354},{r = 0.354,i = -0.354},{r = -0.354,i = 0.354}}}
q_command.areas.lev_4_rm_4.help_chat_msg = {
	"Hello colleague!!! Now again, we use 2 qubits.",
	"But this time you have to create a Inverse QFT circuit",
	"Check the help icon for more information."
}
q_command.areas.lev_4_rm_4.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_4_rm_4.help_chat_sent = false
q_command.areas.lev_4_rm_4.help_success_msg = {
	"Well done!! You're getting good at this .",
  "Go to the next room to get more of it."
}
q_command.areas.lev_4_rm_4.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_4_rm_4.success_chat_sent = false

q_command.areas.lev_4_rm_4.help_btn_text = {}
q_command.areas.lev_4_rm_4.help_btn_text.en =
[[
+++++++++Inverse Quantum Fourier Transform (IQFT)++++++++++

To make IQFT circuit, you need to put the inverse of gates of QFT circuit in reverse order.

Hints:
1. Inverse of H(Hadamard gate) is H.
2. Inverse of cRz(Theta) is cRz(-1*Theta)
]]
q_command.areas.lev_4_rm_4.help_btn_text.es = q_command.areas.lev_4_rm_4.help_btn_text.en
q_command.areas.lev_4_rm_4.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_4_rm_4.help_btn_caption = {}
q_command.areas.lev_4_rm_4.help_btn_caption.en = "Create a 2-qubit IQFT circuit"
q_command.areas.lev_4_rm_4.help_btn_caption.es = q_command.areas.lev_4_rm_4.help_btn_caption.en
q_command.areas.lev_4_rm_4.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 5 (Level IV)
q_command.areas.lev_4_rm_5 = {}
q_command.areas.lev_4_rm_5.region = q_command.regions.esc_rooms_level_4
table.insert(q_command.regions.esc_rooms_level_4, q_command.areas.lev_4_rm_5)
q_command.areas.lev_4_rm_5.area_num = #q_command.regions.esc_rooms_level_4

q_command.areas.lev_4_rm_5.center_pos = {x = 238, y = 0, z = 22}
q_command.areas.lev_4_rm_5.radius = 5
q_command.areas.lev_4_rm_5.q_block_pos = {x = 240, y = 0, z = 19}

q_command.areas.lev_4_rm_5.door_pos = {x = 236, y = 0, z = 17}
q_command.areas.lev_4_rm_5.portal_pos = {x = 243, y = 1, z = 22}
q_command.areas.lev_4_rm_5.chest_pos = {x = 236, y = 0, z = 26}
q_command.areas.lev_4_rm_5.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "", [5] = "", [6] = "",
                [7] = "circuit_blocks:circuit_blocks_gate_qubit_0",
                [8] = "circuit_blocks:circuit_blocks_gate_qubit_1",
                [9] = "", [10] = "", [11] = "", [12] = "", [13] = "", [14] = "",
                [15] = "circuit_blocks:swap_tool",
                [16] = "",
                [17] = "",
                [18] = "",
                [19] = "circuit_blocks:circuit_blocks_rz_gate_0p16",
                [20] = "",
                [21] = "",
                [22] = "circuit_blocks:circuit_blocks_swap",
                [23] = "circuit_blocks:rotate_tool",
                [24] = "",
                [25] = "",
                [26] = "",
                [27] = "",
                [28] = "",
                [29] = "",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool",
                [32] = ""
        }
    }
}
q_command.areas.lev_4_rm_5.solution_unitary =
{{{r = 0.354,i = 0},{r = 0.354,i = 0},{r = 0.354,i = 0},{r = 0.354,i = 0},{r = 0.354,i = 0},{r = 0.354,i = 0},{r = 0.354,i = 0},{r = 0.354,i = 0}},{{r = 0.354,i = 0},{r = 0.354,i = 0},{r = 0.354,i = 0},{r = 0.354,i = 0},{r = -0.354,i = 0},{r = -0.354,i = 0},{r = -0.354,i = 0},{r = -0.354,i = 0}},{{r = -0.25,i = -0.25},{r = -0.25,i = -0.25},{r = 0.25,i = 0.25},{r = 0.25,i = 0.25},{r = -0.25,i = 0.25},{r = -0.25,i = 0.25},{r = 0.25,i = -0.25},{r = 0.25,i = -0.25}},{{r = -0.25,i = -0.25},{r = -0.25,i = -0.25},{r = 0.25,i = 0.25},{r = 0.25,i = 0.25},{r = 0.25,i = -0.25},{r = 0.25,i = -0.25},{r = -0.25,i = 0.25},{r = -0.25,i = 0.25}},{{r = 0.135,i = 0.327},{r = -0.135,i = -0.327},{r = 0.327,i = -0.135},{r = -0.327,i = 0.135},{r = 0.327,i = 0.135},{r = -0.327,i = -0.135},{r = 0.135,i = -0.327},{r = -0.135,i = 0.327}},{{r = 0.135,i = 0.327},{r = -0.135,i = -0.327},{r = 0.327,i = -0.135},{r = -0.327,i = 0.135},{r = -0.327,i = -0.135},{r = 0.327,i = 0.135},{r = -0.135,i = 0.327},{r = 0.135,i = -0.327}},{{r = 0.135,i = -0.327},{r = -0.135,i = 0.327},{r = 0.327,i = 0.135},{r = -0.327,i = -0.135},{r = -0.327,i = 0.135},{r = 0.327,i = -0.135},{r = -0.135,i = -0.327},{r = 0.135,i = 0.327}},{{r = 0.135,i = -0.327},{r = -0.135,i = 0.327},{r = 0.327,i = 0.135},{r = -0.327,i = -0.135},{r = 0.327,i = -0.135},{r = -0.327,i = 0.135},{r = 0.135,i = 0.327},{r = -0.135,i = -0.327}}}
q_command.areas.lev_4_rm_5.help_chat_msg = {
	"Similar to QFT, now expand IQFT to 3-qubit."
}
q_command.areas.lev_4_rm_5.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_4_rm_5.help_chat_sent = false
q_command.areas.lev_4_rm_5.help_success_msg = {
	"Great! You completed the Level 4!",
	"You can go back by jumping into the portal.",
	"Or explore platform 9 and 3 quarters."
}
q_command.areas.lev_4_rm_5.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_4_rm_5.success_chat_sent = false

q_command.areas.lev_4_rm_5.help_btn_text = {}
q_command.areas.lev_4_rm_5.help_btn_text.en =
[[
Hint:
Invert the 3 qubit QFT cicuit.
]]
q_command.areas.lev_4_rm_5.help_btn_text.es = q_command.areas.lev_4_rm_5.help_btn_text.en
q_command.areas.lev_4_rm_5.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_4_rm_5.help_btn_caption = {}
q_command.areas.lev_4_rm_5.help_btn_caption.en = "Create a 3-qubit IQFT circuit"
q_command.areas.lev_4_rm_5.help_btn_caption.es = q_command.areas.lev_4_rm_5.help_btn_caption.en
q_command.areas.lev_4_rm_5.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 6 (Level IV)
--q_command.areas.lev_4_rm_6 = {}
--q_command.areas.lev_4_rm_6.region = q_command.regions.esc_rooms_level_4
--table.insert(q_command.regions.esc_rooms_level_4, q_command.areas.lev_4_rm_6)
--q_command.areas.lev_4_rm_6.area_num = #q_command.regions.esc_rooms_level_4
--
--q_command.areas.lev_4_rm_6.center_pos = {x = 238, y = 0, z = 22}
--q_command.areas.lev_4_rm_6.radius = 5
--q_command.areas.lev_4_rm_6.q_block_pos = {x = 240, y = 0, z = 19}

--q_command.areas.lev_4_rm_6.door_pos = {x = 236, y = 0, z = 17}
--q_command.areas.lev_4_rm_6.portal_pos = {x = 243, y = 1, z = 22}
--q_command.areas.lev_4_rm_6.chest_pos = {x = 236, y = 0, z = 26}
--q_command.areas.lev_4_rm_6.chest_inv = {
--    inventory = {
--        main = {[1] = "", [2] = "", [3] = "", [4] = "", [5] = "", [6] = "",
--                [7] = "circuit_blocks:circuit_blocks_gate_qubit_0",
--                [8] = "circuit_blocks:circuit_blocks_gate_qubit_1",
--                [9] = "", [10] = "", [11] = "", [12] = "", [13] = "", [14] = "",
--                [15] = "circuit_blocks:swap_tool",
--                [16] = "circuit_blocks:circuit_blocks_if_c0_eq0",
--                [17] = "circuit_blocks:circuit_blocks_rx_gate_0p16",
--                [18] = "circuit_blocks:circuit_blocks_ry_gate_0p16",
--                [19] = "circuit_blocks:circuit_blocks_rz_gate_0p16",
--                [20] = "circuit_blocks:circuit_blocks_sdg_gate",
--                [21] = "circuit_blocks:circuit_blocks_tdg_gate",
--                [22] = "circuit_blocks:circuit_blocks_swap",
--                [23] = "circuit_blocks:rotate_tool",
--              [24] = "circuit_blocks:circuit_blocks_barrier",
--                [25] = "circuit_blocks:circuit_blocks_x_gate",
--                [26] = "circuit_blocks:circuit_blocks_y_gate",
--                [27] = "circuit_blocks:circuit_blocks_z_gate",
--                [28] = "circuit_blocks:circuit_blocks_s_gate",
--                [29] = "circuit_blocks:circuit_blocks_t_gate",
--                [30] = "circuit_blocks:circuit_blocks_h_gate",
--                [31] = "circuit_blocks:control_tool",
--                [32] = "circuit_blocks:circuit_blocks_measure_z"
--        }
--    }
--}
--q_command.areas.lev_4_rm_6.solution_unitary =
--{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
--{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

--q_command.areas.lev_4_rm_6.help_chat_msg = {
--	"Make a circuit like the last one, but negate the output as shown on the wall. (6)"
--}
--q_command.areas.lev_4_rm_6.help_chat_msg.ja = {
--	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
--}
--q_command.areas.lev_4_rm_6.help_chat_sent = false
--q_command.areas.lev_4_rm_6.help_success_msg = {
--	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
--	"circuits with increasingly complex quantum logic in no time!"
--}
--q_command.areas.lev_4_rm_6.help_success_msg.ja = {
--	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
--	"ジックを備えた回路をすぐに作成できるようになります。"
--}
--q_command.areas.lev_4_rm_6.success_chat_sent = false
--
--q_command.areas.lev_4_rm_6.help_btn_text = {}
--q_command.areas.lev_4_rm_6.help_btn_text.en =
--[[
--Make a circuit like the last one, but negate the output as shown on the wall
--]]
--q_command.areas.lev_4_rm_6.help_btn_text.es = q_command.areas.lev_4_rm_6.help_btn_text.en
--q_command.areas.lev_4_rm_6.help_btn_text.ja =
--[[
--先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
--]]
--q_command.areas.lev_4_rm_6.help_btn_caption = {}
--q_command.areas.lev_4_rm_6.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
--q_command.areas.lev_4_rm_6.help_btn_caption.es = q_command.areas.lev_4_rm_6.help_btn_caption.en
--q_command.areas.lev_4_rm_6.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 7 (Level IV)
q_command.areas.lev_4_rm_7 = {}
q_command.areas.lev_4_rm_7.region = q_command.regions.esc_rooms_level_4
table.insert(q_command.regions.esc_rooms_level_4, q_command.areas.lev_4_rm_7)
q_command.areas.lev_4_rm_7.area_num = #q_command.regions.esc_rooms_level_4

q_command.areas.lev_4_rm_7.center_pos = {x = 238, y = 0, z = 12}
q_command.areas.lev_4_rm_7.radius = 5
q_command.areas.lev_4_rm_7.q_block_pos = {x = 240, y = 0, z = 9}

q_command.areas.lev_4_rm_7.door_pos = {x = 243, y = 0, z = 10}
q_command.areas.lev_4_rm_7.portal_pos = {x = 243, y = 1, z = 12}
q_command.areas.lev_4_rm_7.chest_pos = {x = 234, y = 0, z = 14}
q_command.areas.lev_4_rm_7.chest_inv = {
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
q_command.areas.lev_4_rm_7.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_4_rm_7.help_chat_msg = {
	"Very good colleague!! You found it.",
	"This in front of you is Phase Estimation Algorithm, which",
	"uses Inverse Quantum Fourier Transform and we shall be using this in the future. "
}
q_command.areas.lev_4_rm_7.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_4_rm_7.help_chat_sent = false
q_command.areas.lev_4_rm_7.help_success_msg = {
	"Well done. You just make a PEA algorithm and estimate that the phase of X gate is 0.10 = 1/2"

}
q_command.areas.lev_4_rm_7.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_4_rm_7.success_chat_sent = false

q_command.areas.lev_4_rm_7.help_btn_text = {}
q_command.areas.lev_4_rm_7.help_btn_text.en =
[[
You need H gate on Qubit A and B
Then CX with the B being control bit and control the last qubit
After that you only need IQFT on first 2 qubits.
]]
q_command.areas.lev_4_rm_7.help_btn_text.es = q_command.areas.lev_4_rm_7.help_btn_text.en
q_command.areas.lev_4_rm_7.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_4_rm_7.help_btn_caption = {}
q_command.areas.lev_4_rm_7.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_4_rm_7.help_btn_caption.es = q_command.areas.lev_4_rm_7.help_btn_caption.en
q_command.areas.lev_4_rm_7.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 8 (Level IV)
q_command.areas.lev_4_rm_8 = {}
q_command.areas.lev_4_rm_8.region = q_command.regions.esc_rooms_level_4
table.insert(q_command.regions.esc_rooms_level_4, q_command.areas.lev_4_rm_8)
q_command.areas.lev_4_rm_8.area_num = #q_command.regions.esc_rooms_level_4

q_command.areas.lev_4_rm_8.center_pos = {x = 248, y = 0, z = 12}
q_command.areas.lev_4_rm_8.radius = 5
q_command.areas.lev_4_rm_8.q_block_pos = {x = 246, y = 0, z = 15}

q_command.areas.lev_4_rm_8.door_pos = {x = 253, y = 0, z = 14}
q_command.areas.lev_4_rm_8.portal_pos = {x = 243, y = 1, z = 12}
q_command.areas.lev_4_rm_8.chest_pos = {x = 246, y = 0, z = 8}
q_command.areas.lev_4_rm_8.chest_inv = {
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
q_command.areas.lev_4_rm_8.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_4_rm_8.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall. (8)"
}
q_command.areas.lev_4_rm_8.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_4_rm_8.help_chat_sent = false
q_command.areas.lev_4_rm_8.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_4_rm_8.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_4_rm_8.success_chat_sent = false

q_command.areas.lev_4_rm_8.help_btn_text = {}
q_command.areas.lev_4_rm_8.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_4_rm_8.help_btn_text.es = q_command.areas.lev_4_rm_8.help_btn_text.en
q_command.areas.lev_4_rm_8.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_4_rm_8.help_btn_caption = {}
q_command.areas.lev_4_rm_8.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_4_rm_8.help_btn_caption.es = q_command.areas.lev_4_rm_8.help_btn_caption.en
q_command.areas.lev_4_rm_8.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 9 (Level IV)
q_command.areas.lev_4_rm_9 = {}
q_command.areas.lev_4_rm_9.region = q_command.regions.esc_rooms_level_4
table.insert(q_command.regions.esc_rooms_level_4, q_command.areas.lev_4_rm_9)
q_command.areas.lev_4_rm_9.area_num = #q_command.regions.esc_rooms_level_4

q_command.areas.lev_4_rm_9.center_pos = {x = 258, y = 0, z = 12}
q_command.areas.lev_4_rm_9.radius = 5
q_command.areas.lev_4_rm_9.q_block_pos = {x = 256, y = 0, z = 16}

q_command.areas.lev_4_rm_9.door_pos = {x = 263, y = 0, z = 10}
q_command.areas.lev_4_rm_9.portal_pos = {x = 263, y = 1, z = 12}
q_command.areas.lev_4_rm_9.chest_pos = {x = 254, y = 0, z = 10}
q_command.areas.lev_4_rm_9.chest_inv = {
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
q_command.areas.lev_4_rm_9.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_4_rm_9.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall. (9)"
}
q_command.areas.lev_4_rm_9.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_4_rm_9.help_chat_sent = false
q_command.areas.lev_4_rm_9.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_4_rm_9.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_4_rm_9.success_chat_sent = false

q_command.areas.lev_4_rm_9.help_btn_text = {}
q_command.areas.lev_4_rm_9.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_4_rm_9.help_btn_text.es = q_command.areas.lev_4_rm_9.help_btn_text.en
q_command.areas.lev_4_rm_9.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_4_rm_9.help_btn_caption = {}
q_command.areas.lev_4_rm_9.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_4_rm_9.help_btn_caption.es = q_command.areas.lev_4_rm_9.help_btn_caption.en
q_command.areas.lev_4_rm_9.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 10 (Level IV)
q_command.areas.lev_4_rm_10 = {}
q_command.areas.lev_4_rm_10.region = q_command.regions.esc_rooms_level_4
table.insert(q_command.regions.esc_rooms_level_4, q_command.areas.lev_4_rm_10)
q_command.areas.lev_4_rm_10.area_num = #q_command.regions.esc_rooms_level_4

q_command.areas.lev_4_rm_10.center_pos = {x = 268, y = 0, z = 12}
q_command.areas.lev_4_rm_10.radius = 5
q_command.areas.lev_4_rm_10.q_block_pos = {x = 271, y = 0, z = 14}

q_command.areas.lev_4_rm_10.door_pos = {x = 266, y = 0, z = 17}
q_command.areas.lev_4_rm_10.portal_pos = {x = 273, y = 1, z = 15}
q_command.areas.lev_4_rm_10.chest_pos = {x = 266, y = 0, z = 8}
q_command.areas.lev_4_rm_10.chest_inv = {
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
q_command.areas.lev_4_rm_10.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_4_rm_10.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall. (10)"
}
q_command.areas.lev_4_rm_10.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_4_rm_10.help_chat_sent = false
q_command.areas.lev_4_rm_10.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_4_rm_10.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_4_rm_10.success_chat_sent = false

q_command.areas.lev_4_rm_10.help_btn_text = {}
q_command.areas.lev_4_rm_10.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_4_rm_10.help_btn_text.es = q_command.areas.lev_4_rm_10.help_btn_text.en
q_command.areas.lev_4_rm_10.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_4_rm_10.help_btn_caption = {}
q_command.areas.lev_4_rm_10.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_4_rm_10.help_btn_caption.es = q_command.areas.lev_4_rm_10.help_btn_caption.en
q_command.areas.lev_4_rm_10.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 11 (Level IV)
q_command.areas.lev_4_rm_11 = {}
q_command.areas.lev_4_rm_11.region = q_command.regions.esc_rooms_level_4
table.insert(q_command.regions.esc_rooms_level_4, q_command.areas.lev_4_rm_11)
q_command.areas.lev_4_rm_11.area_num = #q_command.regions.esc_rooms_level_4

q_command.areas.lev_4_rm_11.center_pos = {x = 268, y = 0, z = 22}
q_command.areas.lev_4_rm_11.radius = 5
q_command.areas.lev_4_rm_11.q_block_pos = {x = 271, y = 0, z = 24}

q_command.areas.lev_4_rm_11.door_pos = {x = 263, y = 0, z = 24}
q_command.areas.lev_4_rm_11.portal_pos = {x = 273, y = 1, z = 19}
q_command.areas.lev_4_rm_11.chest_pos = {x = 264, y = 0, z = 20}
q_command.areas.lev_4_rm_11.chest_inv = {
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
q_command.areas.lev_4_rm_11.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_4_rm_11.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall. (11)"
}
q_command.areas.lev_4_rm_11.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_4_rm_11.help_chat_sent = false
q_command.areas.lev_4_rm_11.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_4_rm_11.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_4_rm_11.success_chat_sent = false

q_command.areas.lev_4_rm_11.help_btn_text = {}
q_command.areas.lev_4_rm_11.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_4_rm_11.help_btn_text.es = q_command.areas.lev_4_rm_11.help_btn_text.en
q_command.areas.lev_4_rm_11.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_4_rm_11.help_btn_caption = {}
q_command.areas.lev_4_rm_11.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_4_rm_11.help_btn_caption.es = q_command.areas.lev_4_rm_11.help_btn_caption.en
q_command.areas.lev_4_rm_11.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 12 (Level IV)
q_command.areas.lev_4_rm_12 = {}
q_command.areas.lev_4_rm_12.region = q_command.regions.esc_rooms_level_4
table.insert(q_command.regions.esc_rooms_level_4, q_command.areas.lev_4_rm_12)
q_command.areas.lev_4_rm_12.area_num = #q_command.regions.esc_rooms_level_4

q_command.areas.lev_4_rm_12.center_pos = {x = 258, y = 0, z = 22}
q_command.areas.lev_4_rm_12.radius = 5
q_command.areas.lev_4_rm_12.q_block_pos = {x = 260, y = 0, z = 19}

q_command.areas.lev_4_rm_12.door_pos = {x = 260, y = 0, z = 27}
q_command.areas.lev_4_rm_12.portal_pos = {x = 263, y = 1, z = 22}
q_command.areas.lev_4_rm_12.chest_pos = {x = 256, y = 0, z = 26}
q_command.areas.lev_4_rm_12.chest_inv = {
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
q_command.areas.lev_4_rm_12.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_4_rm_12.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall. (12)"
}
q_command.areas.lev_4_rm_12.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_4_rm_12.help_chat_sent = false
q_command.areas.lev_4_rm_12.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_4_rm_12.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_4_rm_12.success_chat_sent = false

q_command.areas.lev_4_rm_12.help_btn_text = {}
q_command.areas.lev_4_rm_12.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_4_rm_12.help_btn_text.es = q_command.areas.lev_4_rm_12.help_btn_text.en
q_command.areas.lev_4_rm_12.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_4_rm_12.help_btn_caption = {}
q_command.areas.lev_4_rm_12.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_4_rm_12.help_btn_caption.es = q_command.areas.lev_4_rm_12.help_btn_caption.en
q_command.areas.lev_4_rm_12.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 13 (Level IV)
q_command.areas.lev_4_rm_13 = {}
q_command.areas.lev_4_rm_13.region = q_command.regions.esc_rooms_level_4
table.insert(q_command.regions.esc_rooms_level_4, q_command.areas.lev_4_rm_13)
q_command.areas.lev_4_rm_13.area_num = #q_command.regions.esc_rooms_level_4

q_command.areas.lev_4_rm_13.center_pos = {x = 258, y = 0, z = 32}
q_command.areas.lev_4_rm_13.radius = 5
q_command.areas.lev_4_rm_13.q_block_pos = {x = 256, y = 0, z = 35}

q_command.areas.lev_4_rm_13.door_pos = {x = 263, y = 0, z = 30}
q_command.areas.lev_4_rm_13.portal_pos = {x = 263, y = 1, z = 32}
q_command.areas.lev_4_rm_13.chest_pos = {x = 254, y = 0, z = 34}
q_command.areas.lev_4_rm_13.chest_inv = {
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
q_command.areas.lev_4_rm_13.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_4_rm_13.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall. (13)"
}
q_command.areas.lev_4_rm_13.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_4_rm_13.help_chat_sent = false
q_command.areas.lev_4_rm_13.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_4_rm_13.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_4_rm_13.success_chat_sent = false

q_command.areas.lev_4_rm_13.help_btn_text = {}
q_command.areas.lev_4_rm_13.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_4_rm_13.help_btn_text.es = q_command.areas.lev_4_rm_13.help_btn_text.en
q_command.areas.lev_4_rm_13.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_4_rm_13.help_btn_caption = {}
q_command.areas.lev_4_rm_13.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_4_rm_13.help_btn_caption.es = q_command.areas.lev_4_rm_13.help_btn_caption.en
q_command.areas.lev_4_rm_13.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 14 (Level IV)
q_command.areas.lev_4_rm_14 = {}
q_command.areas.lev_4_rm_14.region = q_command.regions.esc_rooms_level_4
table.insert(q_command.regions.esc_rooms_level_4, q_command.areas.lev_4_rm_14)
q_command.areas.lev_4_rm_14.area_num = #q_command.regions.esc_rooms_level_4

q_command.areas.lev_4_rm_14.center_pos = {x = 268, y = 0, z = 32}
q_command.areas.lev_4_rm_14.radius = 5
q_command.areas.lev_4_rm_14.q_block_pos = {x = 236, y = 0, z = 35}

q_command.areas.lev_4_rm_14.door_pos = {x = 270, y = 0, z = 37}
q_command.areas.lev_4_rm_14.portal_pos = {x = 273, y = 1, z = 32}
q_command.areas.lev_4_rm_14.chest_pos = {x = 272, y = 0, z = 30}
q_command.areas.lev_4_rm_14.chest_inv = {
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
q_command.areas.lev_4_rm_14.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_4_rm_14.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall. (14)"
}
q_command.areas.lev_4_rm_14.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_4_rm_14.help_chat_sent = false
q_command.areas.lev_4_rm_14.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_4_rm_14.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_4_rm_14.success_chat_sent = false

q_command.areas.lev_4_rm_14.help_btn_text = {}
q_command.areas.lev_4_rm_14.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_4_rm_14.help_btn_text.es = q_command.areas.lev_4_rm_14.help_btn_text.en
q_command.areas.lev_4_rm_14.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_4_rm_14.help_btn_caption = {}
q_command.areas.lev_4_rm_14.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_4_rm_14.help_btn_caption.es = q_command.areas.lev_4_rm_14.help_btn_caption.en
q_command.areas.lev_4_rm_14.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 15 (Level IV)
q_command.areas.lev_4_rm_15 = {}
q_command.areas.lev_4_rm_15.region = q_command.regions.esc_rooms_level_4
table.insert(q_command.regions.esc_rooms_level_4, q_command.areas.lev_4_rm_15)
q_command.areas.lev_4_rm_15.area_num = #q_command.regions.esc_rooms_level_4

q_command.areas.lev_4_rm_15.center_pos = {x = 268, y = 0, z = 42}
q_command.areas.lev_4_rm_15.radius = 5
q_command.areas.lev_4_rm_15.q_block_pos = {x = 266, y = 0, z = 45}

q_command.areas.lev_4_rm_15.door_pos = {x = 263, y = 0, z = 44}
q_command.areas.lev_4_rm_15.portal_pos = {x = 273, y = 1, z = 42}
q_command.areas.lev_4_rm_15.chest_pos = {x = 272, y = 0, z = 40}
q_command.areas.lev_4_rm_15.chest_inv = {
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
q_command.areas.lev_4_rm_15.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_4_rm_15.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall. (15)"
}
q_command.areas.lev_4_rm_15.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_4_rm_15.help_chat_sent = false
q_command.areas.lev_4_rm_15.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_4_rm_15.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_4_rm_15.success_chat_sent = false

q_command.areas.lev_4_rm_15.help_btn_text = {}
q_command.areas.lev_4_rm_15.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_4_rm_15.help_btn_text.es = q_command.areas.lev_4_rm_15.help_btn_text.en
q_command.areas.lev_4_rm_15.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_4_rm_15.help_btn_caption = {}
q_command.areas.lev_4_rm_15.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_4_rm_15.help_btn_caption.es = q_command.areas.lev_4_rm_15.help_btn_caption.en
q_command.areas.lev_4_rm_15.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 16 (Level IV)
q_command.areas.lev_4_rm_16 = {}
q_command.areas.lev_4_rm_16.region = q_command.regions.esc_rooms_level_4
table.insert(q_command.regions.esc_rooms_level_4, q_command.areas.lev_4_rm_16)
q_command.areas.lev_4_rm_16.area_num = #q_command.regions.esc_rooms_level_4

q_command.areas.lev_4_rm_16.center_pos = {x = 258, y = 0, z = 42}
q_command.areas.lev_4_rm_16.radius = 5
q_command.areas.lev_4_rm_16.q_block_pos = {x = 255, y = 0, z = 40}

q_command.areas.lev_4_rm_16.door_pos = {x = 256, y = 0, z = 47}
q_command.areas.lev_4_rm_16.portal_pos = {x = 263, y = 1, z = 42}
q_command.areas.lev_4_rm_16.chest_pos = {x = 260, y = 0, z = 46}
q_command.areas.lev_4_rm_16.chest_inv = {
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
q_command.areas.lev_4_rm_16.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_4_rm_16.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall. (16)"
}
q_command.areas.lev_4_rm_16.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_4_rm_16.help_chat_sent = false
q_command.areas.lev_4_rm_16.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_4_rm_16.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_4_rm_16.success_chat_sent = false

q_command.areas.lev_4_rm_16.help_btn_text = {}
q_command.areas.lev_4_rm_16.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_4_rm_16.help_btn_text.es = q_command.areas.lev_4_rm_16.help_btn_text.en
q_command.areas.lev_4_rm_16.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_4_rm_16.help_btn_caption = {}
q_command.areas.lev_4_rm_16.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_4_rm_16.help_btn_caption.es = q_command.areas.lev_4_rm_16.help_btn_caption.en
q_command.areas.lev_4_rm_16.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"



-- END Escape room puzzles Level III --------------------------------------------
q_command.areas.level_4_entrance = {}
q_command.areas.level_4_entrance.help_btn_text = {}
q_command.areas.level_4_entrance.help_btn_text.en =
[[
In the Level4, let's make Quantum Fourier Transform.
QFT is an algorithm for quantum compuation  similar to DFT(discrete Fourier transformation) for classical computation.
DFT is a classical algorithm, used for signal processing, image processing and astrophysical data science.
QFT and it's inverse is used moslty as a part of quantum algorithms

Wherever you choose to begin, more help is available by right-clicking
the Help buttons (labeled with a question mark) as you encounter them.
Good luck!
]]
q_command.areas.level_4_entrance.help_btn_text.es =
[[
¡Bienvenido al mundo de los circuitos cuánticos! El mundo lleno de
bloques en el que te encuentras ha sido creado con la biblioteca de
código abierto Minetest.net. Una lista de controles para moverte y hacer
cosas en Minetest se encuentra disponible al pausar el juego (pulsando
la tecla Esc en algunas plataformas). Las puertas cuánticas y los
circuitos con los que interactuarás funcionan gracias a los simuladores
cuánticos de <https://qiskit.org>.

Existe un creciente número de salas que puedes explorar en este entorno.
Para empezar, sería conveniente que leyeras los símbolos en esta sala
(haciendo clic derecho en ellos), puesto que describen el comportamiento
de los múltiples bloques relacionados con la computación cuántica que
encontrarás. Por cierto, no hace falta que cojas los bloques y
herramientas de esta habitación puesto que los mismos se encuentran
disponibles en cofres por el camino. Puedes volver en cualquier momento
a esta sala si tienes dudas acerca del comportamiento o uso de
cualquiera de ellos.

Si quieres vivir una experiencia a lo escape room, prueba las
habitaciones-puzzle que se encuentran al final de las escaleras que
bajan, localizadas en este edificio. El Profesor Q te guiará a través de
los puzzles de circuitos mediante mensajes de texto que aparecerán en la
esquina superior izquierda.

Otro lugar fuera de esta sala que podrías querer visitar es el cajón de
arena de los gatos cuánticos. En este área, se muestra el comportamiento
de algunas puertas y circuitos cuánticos básicos mediante gatos gruñones
y felices, en lugar de los cúbits al uso. Para llegar hasta allí, sigue
los bloques de luz cerca de las puertas frontales, hacia los bosques.

Otros lugares a visitar incluyen el jardín de los circuitos cuánticos,
al otro lado de la gran pared, saliendo por las puertas frontales y el
"Abismo OpenQASM”. rodeado por una puerta de madera.

Sea por donde sea que decidas comenzar, más información se encuentra
disponible haciendo clic derecho sobre los bloques de ayuda (marcados
con un símbolo de interrogación) conforme te los encuentres.
¡Buena suerte!
]]
q_command.areas.level_4_entrance.help_btn_text.ja =
[[
量子計算回路の世界へようこそ！ 今、あなたがいるブロック世界の環境は、
Minetest.net オープン・ソース・ライブラリーを使用して作成されています。 Minetest
を操作するためのコントロール・リストを表示するには、ゲームを一時停止（例えば、
あるプラットフォームではEscキーを使用）します。あなたが相互作用する量子ゲート
と量子回路は、<https://qiskit.org/> の量子シミュレーターを使用しています。

この環境の中で、あなたが探検できるエリアは増え続けています。 最初に、この部屋
にある？の標識を右クリックして読むと役立ちます。これらの標識は、さまざまな量子
計算に関連するブロックの動作を説明しています。 ちなみに、ブロックやツールは、
道においてあるチェスト(箱)から使うことができるので、この部屋から持ち出す必要は
ありません。ブロックやツールは、この部屋に残し、それらがどんな動きをして、どの
ように使うのか知りたくなったら、いつでも戻って来てください。

脱出ルームのような体験が必要な場合は、この建物にあるはしごの下にあるパズルルー
ムをチェックしてください。Q教授が、あなたのウィンドウの左上にチャットメッセー
ジを送信して、回路パズルをガイドします。

この部屋の外には、量子猫のサンドボックスのエリアがあります。 そこでは、基本的
な量子計算回路と量子ゲートが、通常の量子ビットの代わりに不機嫌な猫または幸せな
猫で示されています。 そこに行くには、正面玄関のすぐ外にあるライトのついたブ
ロックをたどって森に入ります。

そのほかには、正面玄関の外側の大きな壁の反対側に量子回路ガーデン、また木製の
ゲートに囲まれた「OpenQASM Chasm」があります。

どの場所から始めても、ヘルプボタン（?マークが付いている）を右クリックすると、
ヘルプが表示されます。 幸運をお祈りします！
]]
q_command.areas.level_4_entrance.help_btn_caption = {}
q_command.areas.level_4_entrance.help_btn_caption.en = "Quantum Fourier Transform"
q_command.areas.level_4_entrance.help_btn_caption.es = q_command.areas.level_4_entrance.help_btn_caption.en
q_command.areas.level_4_entrance.help_btn_caption.ja = "最初にお読みください"

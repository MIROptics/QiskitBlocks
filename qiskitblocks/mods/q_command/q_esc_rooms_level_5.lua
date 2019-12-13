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

-- Escape room puzzles Level V ------------------------------------------------
-------- Room 1 (Level V)
-- Note to devs: Use lev_X_rm_Y pattern, where X is level number and Y is room number
q_command.areas.lev_5_rm_1 = {}
q_command.areas.lev_5_rm_1.region = q_command.regions.esc_rooms_level_5
table.insert(q_command.regions.esc_rooms_level_5, q_command.areas.lev_5_rm_1)
q_command.areas.lev_5_rm_1.area_num = #q_command.regions.esc_rooms_level_5

-- Note to devs: The center_pos x/y/z values should indicate the position of the center
-- block in the floor of the room. This is used, along with radius, to identify when a
-- player is in the room. This enables mechanisms such as greeting the player and
-- erasing their inventory when they enter an escape room.
q_command.areas.lev_5_rm_1.center_pos = {x = 308, y = 0, z = 42}
q_command.areas.lev_5_rm_1.radius = 5

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
q_command.areas.lev_5_rm_1.q_block_pos = {x = 312, y = 0, z = 39}

-- Note to devs: The door_pos x/y/z values should indicate where the exit door is.
q_command.areas.lev_5_rm_1.door_pos = {x = 313, y = 0, z = 44}

-- Note to devs: The portal_pos x/y/z values should indicate where the orange portal
-- is, so that it may be used to teleport from the hub into the room, and entered by
-- the player to teleport back to the hub. It is good practice to place it one block
-- above floor level so that player doesn't accidentally get teleported when bumping
-- into it. It is also good practice to place the portal to the West of the center_pos
-- if possible, so that the portal is behind the player when teleporting into the room
-- (players enter from the West into the blue portals in the portal room.)
q_command.areas.lev_5_rm_1.portal_pos = {x = 313, y = 1, z = 42}

-- Note to devs: The chest_pos x/y/z values should indicate where the chest is, so
-- that it may be restocked when a puzzle is solved.
q_command.areas.lev_5_rm_1.chest_pos = {x = 310, y = 0, z = 46}

-- Note to devs: Remove chest inventory items not required for the circuit puzzle,
-- by making their relevant strings empty.
q_command.areas.lev_5_rm_1.chest_inv = {
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
                [20] = "",
                [21] = "",
                [22] = "",
                [23] = "",
                [24] = "",
                [25] = "",
                [26] = "",
                [27] = "",
                [28] = "",
                [29] = "",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "",
                [32] = "circuit_blocks:circuit_blocks_measure_z"
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
--q_command.areas.lev_5_rm_1.solution_unitary =
--{{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}},
--{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}}}

-- Note to devs: The variable ending in solution_statevector holds the statevector
-- of complex numbers that represent the solution to a circuit puzzle. Use this
-- variable when the puzzle is expressed in terms of its desired statevector.
-- To obtain the value to supply here, *temporarily* uncomment the relevant line
-- in the init.lua file in the q_command directory:
--      minetest.debug("statevector:\n" .. dump(statevector))
-- This will cause the statevector to appear in the debug.txt log file every
-- time the circuit is modified or measured. This vector can be quite large, so
-- remove spaces, tabs, and newline characters before inserting here.

q_command.areas.lev_5_rm_1.solution_statevector =
{{r=0.354,i=0},{r=0.354,i=0},{r=0.354,i=0},{r=0.354,i=0},
{r=0.354,i=0},{r=0.354,i=0},{r=0.354,i=0},{r=0.354,i=0}}

-- Note to devs: The variable ending in help_chat_msg holds the English localized version
-- of the message that Professor Q will chat to the player when entering an escape room
-- for the first time since the application is invoked. Note that for help_chat_msg,
-- ".en" is *not* added to the end of the variable name for the English language.
q_command.areas.lev_5_rm_1.help_chat_msg = {
"Hello, I am Ryoko, prof.Q's assistant. ",
"Now, Dr. Q is trapped in one of eight quantum universes. Please help me find out Dr. Q by solving following puzzles.",
"First, try to create the states which shown on the wall.",
"This process will create a portal that can access all the quantum universes with equal possibilities,",
"so we can use it to travel to all the universes at the same time."


}
-- Note to devs: The variable ending in help_chat_msg and a language code holds the
-- non-English localized version of the message that Professor Q will chat to the
-- player when entering an escape room for the first time since the application is invoked.
q_command.areas.lev_5_rm_1.help_chat_msg.ja = {
	"また会いましたね、尊敬する同僚！私の名前はQ教授で、量子実験を行っているため、このガ",
	"ラスの後ろに立っていることを思い出してください。私はあなたが元気だと確信しています:-)",
	"この実験では、壁にあるようにデジタルの「排他的OR」ゲートを実現する回路を作成します。",
	"出口のドアが開くかどうかに影響を与えることなく、入力をテストするために、ワイアー線上",
	"に|1>のブロックを配置できます。"
}

q_command.areas.lev_5_rm_1.help_chat_msg.zh_TW = {
	"你好，我是亮子小姐，Q教授的助手",
	"現在Q教授被困在八個量子宇宙其中的一個，請幫助我解決以下的問題來找到Q教授",
	"首先，請試著創造出跟牆上所描述的一樣的狀態",
	"這個步驟會幫助我們創造出一個傳送門，用相同的機率通往這各個量子宇宙",
	"因此我們可以利用這個傳送門通向這八個量子宇宙"
}

q_command.areas.lev_5_rm_1.help_chat_sent = false

-- Note to devs: The variable ending in help_success_msg holds the English localized
-- version of the message that Professor Q will chat to the player when solving an
-- escape room puzzle for the first time since the application is invoked. Note that
-- for help_success_msg, ".en" is *not* added to the end of the variable name for the
-- English language.
q_command.areas.lev_5_rm_1.help_success_msg = {
	"Congratulations, you did a good job"
}
-- Note to devs: The variable ending in help_success_msg and a language code holds the
-- localized version of the message that Professor Q will chat to the player when
-- solving an escape room puzzle for the first time since the application is invoked.
q_command.areas.lev_5_rm_1.help_success_msg.ja = {
	"よくできました！ CNOTゲートはそれ自体が可逆であることがわかっているため、出力を入力 ",
	"として提供すると、元の入力が出力として提供されます。 これは、ビットのバケツに量子ビッ ",
	"トが入らないリバーシブルなコンピューティングです。この部屋を出る前にそれを試して、リ ",
	"バーシブルコンピューティングの動作を確認してください。"
}
q_command.areas.lev_5_rm_1.help_success_msg.zh_TW = {
	"太棒了，你做得非常好!"
}

q_command.areas.lev_5_rm_1.success_chat_sent = false

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
q_command.areas.lev_5_rm_1.help_btn_text = {}
q_command.areas.lev_5_rm_1.help_btn_text.en =
[[
Make the states which shown on the wall.
]]
q_command.areas.lev_5_rm_1.help_btn_text.es = q_command.areas.lev_5_rm_1.help_btn_text.en
q_command.areas.lev_5_rm_1.help_btn_text.ja =
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
q_command.areas.lev_5_rm_1.help_btn_text.zh_TW =
[[
請做出牆上的圖案。
]]


-- Note to devs: The variable ending in help_btn_caption followed by a language
-- code holds the text that appears in the caption of a help sign. Note that
-- for help_btn_caption it is necessary to include the language code for all
-- localized text, including (".en") for English text.
q_command.areas.lev_5_rm_1.help_btn_caption = {}
q_command.areas.lev_5_rm_1.help_btn_caption.en = "Make a quantum  superposition state"
q_command.areas.lev_5_rm_1.help_btn_caption.es = q_command.areas.lev_5_rm_1.help_btn_caption.en
q_command.areas.lev_5_rm_1.help_btn_caption.ja = "量子論理XORゲートを作る"


-------- Room 2 (Level V)
q_command.areas.lev_5_rm_2 = {}
q_command.areas.lev_5_rm_2.region = q_command.regions.esc_rooms_level_5
table.insert(q_command.regions.esc_rooms_level_5, q_command.areas.lev_5_rm_2)
q_command.areas.lev_5_rm_2.area_num = #q_command.regions.esc_rooms_level_5

q_command.areas.lev_5_rm_2.center_pos = {x = 318, y = 0, z = 42}
q_command.areas.lev_5_rm_2.radius = 5
q_command.areas.lev_5_rm_2.q_block_pos = {x = 316, y = 0, z = 41}

q_command.areas.lev_5_rm_2.door_pos = {x = 320, y = 0, z = 37}
q_command.areas.lev_5_rm_2.portal_pos = {x = 323, y = 1, z = 42}
q_command.areas.lev_5_rm_2.chest_pos = {x = 322, y = 0, z = 40}
q_command.areas.lev_5_rm_2.chest_inv = {
      inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "", [5] = "", [6] = "",
                [7] = "",
                [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "", [13] = "", [14] = "",
                [15] = "",
                [16] = "",
                [17] = "",
                [18] = "",
                [19] = "circuit_blocks:circuit_blocks_z_gate",
                [20] = "",
                [21] = "",
                [22] = "",
                [23] = "",
                [24] = "",
                [25] = "circuit_blocks:control_tool",
                [26] = "",
                [27] = "",
                [28] = "",
                [29] = "",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "",
                [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.lev_5_rm_2.solution_statevector =
{{r=0.5,i=0},{r=0.5,i=0},{r=0.5,i=0},{r=-0.5,i=0}}

q_command.areas.lev_5_rm_2.help_chat_msg = {
	"Ms.Ryoko: Aimless travel in the quantum universe is very dangerous.",
	"So let me show you how to mark the target.",
	"If we wish to travel to a particular quantum universe. We need to mark it",
	"To simplified, Let's start with just four universe (two qubits), and try to label the fourth quantum universes(|11>).",
	"Please finish the puzzle on the wall"

}
q_command.areas.lev_5_rm_2.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_5_rm_2.help_chat_msg.zh_TW = {
	"亮子小姐: 在宇宙中漫無目的的飛行是很危險的",
	"所以我來教你如何標記想去的目標",
	"如果我們想去到特定的量子宇宙，這是必須做的準備工作",
	"我們先用4個量子宇宙(只有兩個量子位元)當例子，試試看標記第四個量子宇宙(|11>).",
	"請完成牆上的問題"

}

q_command.areas.lev_5_rm_2.help_chat_sent = false
q_command.areas.lev_5_rm_2.help_success_msg = {
	"Ms.Ryoko: Nice job. you have change the phase and target the |11> universe, this process is the so-called Oracle.",
	"Now I'll keep adding one more qubits on the circuits",
	"Circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_5_rm_2.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_5_rm_2.help_chat_sent = false
q_command.areas.lev_5_rm_2.help_success_msg.zh_TW = {
	"做得很好. 你成功的把|11> 的相位變為負並標記它，這動作就是所謂的 Oracle.",
	"現在我要在電路上再加一个量子位元",
	"量子電路將會變得更為複雜"
}
q_command.areas.lev_5_rm_2.success_chat_sent = false

q_command.areas.lev_5_rm_2.help_btn_text = {}
q_command.areas.lev_5_rm_2.help_btn_text.en =
[[
Please finish the puzzle shown on the wall.
]]
q_command.areas.lev_5_rm_2.help_btn_text.es = q_command.areas.lev_5_rm_2.help_btn_text.en
q_command.areas.lev_5_rm_2.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_5_rm_2.help_btn_text.zh_TW =
[[
請做出牆上的狀態。
]]
q_command.areas.lev_5_rm_2.help_btn_caption = {}
q_command.areas.lev_5_rm_2.help_btn_caption.en = "Make a mark to the target universe."
q_command.areas.lev_5_rm_2.help_btn_caption.es = q_command.areas.lev_5_rm_2.help_btn_caption.en
q_command.areas.lev_5_rm_2.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 3 (Level V)
q_command.areas.lev_5_rm_3 = {}
q_command.areas.lev_5_rm_3.region = q_command.regions.esc_rooms_level_5
table.insert(q_command.regions.esc_rooms_level_5, q_command.areas.lev_5_rm_3)
q_command.areas.lev_5_rm_3.area_num = #q_command.regions.esc_rooms_level_5

q_command.areas.lev_5_rm_3.center_pos = {x = 318, y = 0, z = 32}
q_command.areas.lev_5_rm_3.radius = 5
q_command.areas.lev_5_rm_3.q_block_pos = {x = 321, y = 0, z = 34}

q_command.areas.lev_5_rm_3.door_pos = {x = 313, y = 0, z = 30}
q_command.areas.lev_5_rm_3.portal_pos = {x = 323, y = 1, z = 35}
q_command.areas.lev_5_rm_3.chest_pos = {x = 316, y = 0, z = 28}
q_command.areas.lev_5_rm_3.chest_inv = {
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
                [20] = "",
                [21] = "",
                [22] = "",
                [23] = "",
                [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate",
                [26] = "",
                [27] = "",
                [28] = "",
                [29] = "",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool",
                [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.lev_5_rm_3.solution_statevector =
{{r=0.354,i=0},{r=0.354,i=0},{r=0.354,i=0},{r=0.354,i=0},{r=0.354,i=0},{r=0.354,i=0},{r=0.354,i=0},{r=-0.354,i=0}}

q_command.areas.lev_5_rm_3.help_chat_msg = {
	"Ms.Ryoko: When we travel to more than four quantum universes, which means the number of qubits in circuits is more than 2,",
	"In this scenario, we need to exploit the CCZ gate to help us to make a mark on the goal.",
	"We can create CCZ gate very easily with H and CCX, just remember that H X H is equal to Z gate"
}
q_command.areas.lev_5_rm_3.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_5_rm_3.help_chat_msg.zh_TW = {
	"亮子小姐: 當我們想要在超過四個量子宇宙航行，這意味著我們需要超過2顆的量子位元",
	"在這種情況，我們會需要利用CCZ gate來幫助我們標記目標",
	"我們可以很輕鬆的利用H gate跟CCX gate來製作CCZ gate, 你只需要記得 H X H 會等於 Z gate。"
}

q_command.areas.lev_5_rm_3.help_chat_sent = false
q_command.areas.lev_5_rm_3.help_success_msg = {
	"Ms.Ryoko: Nice job."
}
q_command.areas.lev_5_rm_3.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_5_rm_3.help_success_msg.zh_TW = {
	"亮子小姐:做的好!"
}

q_command.areas.lev_5_rm_3.success_chat_sent = false

q_command.areas.lev_5_rm_3.help_btn_text = {}
q_command.areas.lev_5_rm_3.help_btn_text.en =
[[
Please help me to finish the puzzle shown on the wall.
Hint: H X H is equal to Z gate, and please refer to the room2-1 if you cannot create CCZ gate successfully.
]]
q_command.areas.lev_5_rm_3.help_btn_text.es = q_command.areas.lev_5_rm_3.help_btn_text.en
q_command.areas.lev_5_rm_3.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_5_rm_3.help_btn_text.zh_TW =
[[
請幫助我得到牆上的狀態
提示: H X H 放在一起會等於 Z gate。
]]
q_command.areas.lev_5_rm_3.help_btn_caption = {}
q_command.areas.lev_5_rm_3.help_btn_caption.en = "Make a CCZ quantum logic gate"
q_command.areas.lev_5_rm_3.help_btn_caption.es = q_command.areas.lev_5_rm_3.help_btn_caption.en
q_command.areas.lev_5_rm_3.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 4 (Level V)
q_command.areas.lev_5_rm_4 = {}
q_command.areas.lev_5_rm_4.region = q_command.regions.esc_rooms_level_5
table.insert(q_command.regions.esc_rooms_level_5, q_command.areas.lev_5_rm_4)
q_command.areas.lev_5_rm_4.area_num = #q_command.regions.esc_rooms_level_5

q_command.areas.lev_5_rm_4.center_pos = {x = 308, y = 0, z = 32}
q_command.areas.lev_5_rm_4.radius = 5
q_command.areas.lev_5_rm_4.q_block_pos = {x = 306, y = 0, z = 35}

q_command.areas.lev_5_rm_4.door_pos = {x = 303, y = 0, z = 34}
q_command.areas.lev_5_rm_4.portal_pos = {x = 313, y = 1, z = 32}
q_command.areas.lev_5_rm_4.chest_pos = {x = 304, y = 0, z = 30}
q_command.areas.lev_5_rm_4.chest_inv = {
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
                [20] = "",
                [21] = "",
                [22] = "",
                [23] = "",
                [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate",
                [26] = "",
                [27] = "circuit_blocks:circuit_blocks_z_gate",
                [28] = "",
                [29] = "",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool",
                [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.lev_5_rm_4.solution_statevector =
{{r=0.354,i=0},{r=0.354,i=0},{r=-0.354,i=0},{r=0.354,i=0},
{r=0.354,i=0},{r=0.354,i=0},{r=0.354,i=0},{r=0.354,i=0}}

q_command.areas.lev_5_rm_4.help_chat_msg = {
	"Ms.Ryoko: let us now try to make the mark on the |010> quantum universe.",
	"Please follow the equation on the wall, which means change the state of |010> to minus"

}
q_command.areas.lev_5_rm_4.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_5_rm_4.help_chat_msg.zh_TW = {
	"亮子小姐: 現在讓我們試著標記 |010>這個量子宇宙",
	"請照著牆上的公式完成，這公式意味著將|010>的狀態改為負號。"

}

q_command.areas.lev_5_rm_4.help_chat_sent = false
q_command.areas.lev_5_rm_4.help_success_msg = {
	"Ms.Ryoko: Nice job."
}
q_command.areas.lev_5_rm_4.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_5_rm_4.help_success_msg.zh_TW = {
	"亮子小姐: 做的好。"
}

q_command.areas.lev_5_rm_4.success_chat_sent = false

q_command.areas.lev_5_rm_4.help_btn_text = {}
q_command.areas.lev_5_rm_4.help_btn_text.en =
[[
Make a circuit just like the room 2, but in 3 Qubit. So you need to exploit the CCZ gate which we mentioned in Room3.
]]
q_command.areas.lev_5_rm_4.help_btn_text.es = q_command.areas.lev_5_rm_4.help_btn_text.en
q_command.areas.lev_5_rm_4.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_5_rm_4.help_btn_text.zh_TW =
[[
做出跟房間2相似的電路，但此次是3顆量子位元。
因此你必須要利用CCZ gate，我們在曾房間3提到過。
]]
q_command.areas.lev_5_rm_4.help_btn_caption = {}
q_command.areas.lev_5_rm_4.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_5_rm_4.help_btn_caption.es = q_command.areas.lev_5_rm_4.help_btn_caption.en
q_command.areas.lev_5_rm_4.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 5 (Level V)
q_command.areas.lev_5_rm_5 = {}
q_command.areas.lev_5_rm_5.region = q_command.regions.esc_rooms_level_5
table.insert(q_command.regions.esc_rooms_level_5, q_command.areas.lev_5_rm_5)
q_command.areas.lev_5_rm_5.area_num = #q_command.regions.esc_rooms_level_5

q_command.areas.lev_5_rm_5.center_pos = {x = 298, y = 0, z = 32}
q_command.areas.lev_5_rm_5.radius = 5
q_command.areas.lev_5_rm_5.q_block_pos = {x = 300, y = 0, z = 29}

q_command.areas.lev_5_rm_5.door_pos = {x = 300, y = 0, z = 37}
q_command.areas.lev_5_rm_5.portal_pos = {x = 303, y = 1, z = 32}
q_command.areas.lev_5_rm_5.chest_pos = {x = 296, y = 0, z = 36}
q_command.areas.lev_5_rm_5.chest_inv = {
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
                [20] = "",
                [21] = "",
                [22] = "",
                [23] = "",
                [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate",
                [26] = "",
                [27] = "circuit_blocks:circuit_blocks_z_gate",
                [28] = "",
                [29] = "",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool",
                [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.lev_5_rm_5.solution_statevector =
{{r=-0.354,i=0},{r=0.354,i=0},{r=0.354,i=0},{r=0.354,i=0},
{r=0.354,i=0},{r=0.354,i=0},{r=0.354,i=0},{r=0.354,i=0}}

q_command.areas.lev_5_rm_5.help_chat_msg = {
	"Ms.Ryoko: After marked the target, We need the engine which is named Gover’s search engine to guide and operate our spaceship to the target.",
	"Use the similar method of the previous room, and create the equation shown on the wall.",

}
q_command.areas.lev_5_rm_5.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_5_rm_5.help_chat_msg.zh_TW = {
	"亮子小姐: 在成功標記目標以後，我們還需要一種名為 Gover搜索引擎的工具來操作並導引我們的飛船駛向目標",
	"請用與前面幾個房間相似的方法，做出牆上的狀態",

}

q_command.areas.lev_5_rm_5.help_chat_sent = false

q_command.areas.lev_5_rm_5.help_success_msg = {
	"Ms.Ryoko: Excellent.",
	"Actually, this process is to design an operate I-2|0><0|, which is a core part of Grover’s algorithm."

}
q_command.areas.lev_5_rm_5.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_5_rm_5.help_success_msg.zh_TW = {
	"亮子小姐: 太完美了 ",
	"事實上，這個步驟是設計一個I-2|0><0|的算符，同時也是Grover’s搜索演算法的核心部分。"
}

q_command.areas.lev_5_rm_5.success_chat_sent = false

q_command.areas.lev_5_rm_5.help_btn_text = {}
q_command.areas.lev_5_rm_5.help_btn_text.en =
[[
Using the similar method of the previous room, make the circuit identical to the equation shown on the wall.
]]
q_command.areas.lev_5_rm_5.help_btn_text.es = q_command.areas.lev_5_rm_5.help_btn_text.en
q_command.areas.lev_5_rm_5.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_5_rm_5.help_btn_text.zh_TW =
[[
請用與前面幾個房間相似的方法，做出牆上的狀態。
]]

q_command.areas.lev_5_rm_5.help_btn_caption = {}
q_command.areas.lev_5_rm_5.help_btn_caption.en = "Make a Grover's algorithm "
q_command.areas.lev_5_rm_5.help_btn_caption.es = q_command.areas.lev_5_rm_5.help_btn_caption.en
q_command.areas.lev_5_rm_5.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 6 (Level V)
q_command.areas.lev_5_rm_6 = {}
q_command.areas.lev_5_rm_6.region = q_command.regions.esc_rooms_level_5
table.insert(q_command.regions.esc_rooms_level_5, q_command.areas.lev_5_rm_6)
q_command.areas.lev_5_rm_6.area_num = #q_command.regions.esc_rooms_level_5

q_command.areas.lev_5_rm_6.center_pos = {x = 298, y = 0, z = 42}
q_command.areas.lev_5_rm_6.radius = 5
q_command.areas.lev_5_rm_6.q_block_pos = {x = 296, y = 0, z = 45}

q_command.areas.lev_5_rm_6.door_pos = {x = 293, y = 0, z = 44}
q_command.areas.lev_5_rm_6.portal_pos = {x = 303, y = 1, z = 42}
q_command.areas.lev_5_rm_6.chest_pos = {x = 302, y = 0, z = 44}
q_command.areas.lev_5_rm_6.chest_inv = {
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
q_command.areas.lev_5_rm_6.solution_statevector =
{{r=-0.177,i=0},{r=-0.177,i=0},{r=-0.884,i=0},{r=-0.177,i=0},{r=-0.177,i=0},{r=-0.177,i=0},{r=-0.177,i=0},{r=-0.177,i=0}}

q_command.areas.lev_5_rm_6.help_chat_msg = {
	"Ms.Ryoko: I just heard that Dr.Q is trapped in the |010> universe.",
	"Now, use what you have learned in 1,4 and 5 rooms and try to combine and finish circuits",
	"Then we can use Grover's search to operate our spaceship to |010> quantum universe.",
	"Hints: Two Hadamard gates will be equal to an identity (H H=I)."
}
q_command.areas.lev_5_rm_6.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_5_rm_6.help_chat_msg.zh_TW = {
	"亮子小姐: 我剛剛得到消息，Dr.Q被困在|010>這個量子宇宙 ",
	"現在，請試著利用你在第1，4，以及5個房間所學的一切，結合它們並完成電路",
	"這樣我們就能利用Grover搜索法來操總我們的飛船航向|010>這個量子宇宙。",
	"提示: 兩個 Hadamard gates 合併會變為 identity (H H=I)."
}

q_command.areas.lev_5_rm_6.help_chat_sent = false


q_command.areas.lev_5_rm_6.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_5_rm_6.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_5_rm_6.success_chat_sent = false

q_command.areas.lev_5_rm_6.help_btn_text = {}
q_command.areas.lev_5_rm_6.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_5_rm_6.help_btn_text.es = q_command.areas.lev_5_rm_6.help_btn_text.en
q_command.areas.lev_5_rm_6.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_5_rm_6.help_btn_caption = {}
q_command.areas.lev_5_rm_6.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_5_rm_6.help_btn_caption.es = q_command.areas.lev_5_rm_6.help_btn_caption.en
q_command.areas.lev_5_rm_6.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 7 (Level V)
q_command.areas.lev_5_rm_7 = {}
q_command.areas.lev_5_rm_7.region = q_command.regions.esc_rooms_level_5
table.insert(q_command.regions.esc_rooms_level_5, q_command.areas.lev_5_rm_7)
q_command.areas.lev_5_rm_7.area_num = #q_command.regions.esc_rooms_level_5

q_command.areas.lev_5_rm_7.center_pos = {x = 288, y = 0, z = 42}
q_command.areas.lev_5_rm_7.radius = 5
q_command.areas.lev_5_rm_7.q_block_pos = {x = 285, y = 0, z = 40}

q_command.areas.lev_5_rm_7.door_pos = {x = 286, y = 0, z = 37}
q_command.areas.lev_5_rm_7.portal_pos = {x = 293, y = 1, z = 42}
q_command.areas.lev_5_rm_7.chest_pos = {x = 290, y = 0, z = 46}
q_command.areas.lev_5_rm_7.chest_inv = {
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
                [20] = "",
                [21] = "",
                [22] = "",
                [23] = "",
                [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate",
                [26] = "",
                [27] = "circuit_blocks:circuit_blocks_z_gate",
                [28] = "",
                [29] = "",
                [30] = "circuit_blocks:circuit_blocks_h_gate",
                [31] = "circuit_blocks:control_tool",
                [32] = "circuit_blocks:circuit_blocks_measure_z"
        }
    }
}
q_command.areas.lev_5_rm_7.solution_statevector =
{{r=-0.177,i=0},{r=-0.177,i=0},{r=-0.884,i=0},{r=-0.177,i=0},{r=-0.177,i=0},{r=-0.177,i=0},{r=-0.177,i=0},{r=-0.177,i=0}}

q_command.areas.lev_5_rm_7.help_chat_msg = {
    "Ms.Ryoko: I just heard that Dr.Q is trapped in the |010> universe.",
	"Now, use what you have learned in 1,4 and 5 rooms and try to combine and finish circuits",
	"Then we can use Grover's search to operate our spaceship to |010> quantum universe.",
	"Hints: Two Hadamard gates will be equal to an identity (H H=I)."
}
q_command.areas.lev_5_rm_7.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_5_rm_7.help_chat_msg.zh_TW = {
	"亮子小姐: 我剛剛得到消息，Dr.Q被困在|010>這個量子宇宙 ",
	"現在，請試著利用你在第1，4，以及5個房間所學的一切，結合它們並完成這個電路",
	"這樣我們就能利用Grover搜索法來操總我們的飛船航向|010>這個量子宇宙。",
	"提示: 兩個 Hadamard gates 合併會變為 identity (H H=I)."
}
q_command.areas.lev_5_rm_7.help_chat_sent = false
q_command.areas.lev_5_rm_7.help_success_msg = {
	"Ms.Ryoko: Nice job.The right door for Dr.Q universe has been opened"

}
q_command.areas.lev_5_rm_7.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_5_rm_7.help_success_msg.zh_TW = {
	"亮子小姐: 太棒了，通往正確的宇宙之門已經開啟"

}
q_command.areas.lev_5_rm_7.success_chat_sent = false

q_command.areas.lev_5_rm_7.help_btn_text = {}
q_command.areas.lev_5_rm_7.help_btn_text.en =
[[
Use what you have learned in 1,4 and 5 rooms and try to combine and finish the circuits.
Hints: Two Hadamard gates will be equal to an identity (H H=I).
]]
q_command.areas.lev_5_rm_7.help_btn_text.es = q_command.areas.lev_5_rm_7.help_btn_text.en
q_command.areas.lev_5_rm_7.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_5_rm_7.help_btn_text.zh_TW =
[[
請試著利用你在第1，4，以及5個房間所學的一切，結合它們並完成這個電路
提示: 兩個 Hadamard gates 合併會變為 identity (H H=I)。
]]

q_command.areas.lev_5_rm_7.help_btn_caption = {}
q_command.areas.lev_5_rm_7.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_5_rm_7.help_btn_caption.es = q_command.areas.lev_5_rm_7.help_btn_caption.en
q_command.areas.lev_5_rm_7.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 8 (Level V)
q_command.areas.lev_5_rm_8 = {}
q_command.areas.lev_5_rm_8.region = q_command.regions.esc_rooms_level_5
table.insert(q_command.regions.esc_rooms_level_5, q_command.areas.lev_5_rm_8)
q_command.areas.lev_5_rm_8.area_num = #q_command.regions.esc_rooms_level_5

q_command.areas.lev_5_rm_8.center_pos = {x = 288, y = 0, z = 32}
q_command.areas.lev_5_rm_8.radius = 5
q_command.areas.lev_5_rm_8.q_block_pos = {x = 291, y = 0, z = 34}

q_command.areas.lev_5_rm_8.door_pos = {x = 290, y = 0, z = 27}
q_command.areas.lev_5_rm_8.portal_pos = {x = 293, y = 1, z = 35}
q_command.areas.lev_5_rm_8.chest_pos = {x = 284, y = 0, z = 34}
q_command.areas.lev_5_rm_8.chest_inv = {
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
q_command.areas.lev_5_rm_8.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_5_rm_8.help_chat_msg = {
	"Dr.Q : Thank you so much for save me, don't forget to open the chest and check what's inside before you leave"
}
q_command.areas.lev_5_rm_8.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_5_rm_8.help_chat_msg.zh_TW = {
	"Dr.Q : 十分感謝你找到我並拯救了我，在你離開前，別忘了打開並看看箱子裡有什麼。"
}


q_command.areas.lev_5_rm_8.help_chat_sent = false
q_command.areas.lev_5_rm_8.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_5_rm_8.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_5_rm_8.success_chat_sent = false

q_command.areas.lev_5_rm_8.help_btn_text = {}
q_command.areas.lev_5_rm_8.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_5_rm_8.help_btn_text.es = q_command.areas.lev_5_rm_8.help_btn_text.en
q_command.areas.lev_5_rm_8.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_5_rm_8.help_btn_caption = {}
q_command.areas.lev_5_rm_8.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_5_rm_8.help_btn_caption.es = q_command.areas.lev_5_rm_8.help_btn_caption.en
q_command.areas.lev_5_rm_8.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 9 (Level V)
q_command.areas.lev_5_rm_9 = {}
q_command.areas.lev_5_rm_9.region = q_command.regions.esc_rooms_level_5
table.insert(q_command.regions.esc_rooms_level_5, q_command.areas.lev_5_rm_9)
q_command.areas.lev_5_rm_9.area_num = #q_command.regions.esc_rooms_level_5

q_command.areas.lev_5_rm_9.center_pos = {x = 288, y = 0, z = 22}
q_command.areas.lev_5_rm_9.radius = 5
q_command.areas.lev_5_rm_9.q_block_pos = {x = 290, y = 0, z = 19}

q_command.areas.lev_5_rm_9.door_pos = {x = 286, y = 0, z = 17}
q_command.areas.lev_5_rm_9.portal_pos = {x = 293, y = 1, z = 22}
q_command.areas.lev_5_rm_9.chest_pos = {x = 286, y = 0, z = 26}
q_command.areas.lev_5_rm_9.chest_inv = {
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
q_command.areas.lev_5_rm_9.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_5_rm_9.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall."
}
q_command.areas.lev_5_rm_9.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_5_rm_9.help_chat_sent = false
q_command.areas.lev_5_rm_9.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_5_rm_9.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_5_rm_9.success_chat_sent = false

q_command.areas.lev_5_rm_9.help_btn_text = {}
q_command.areas.lev_5_rm_9.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_5_rm_9.help_btn_text.es = q_command.areas.lev_5_rm_9.help_btn_text.en
q_command.areas.lev_5_rm_9.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_5_rm_9.help_btn_caption = {}
q_command.areas.lev_5_rm_9.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_5_rm_9.help_btn_caption.es = q_command.areas.lev_5_rm_9.help_btn_caption.en
q_command.areas.lev_5_rm_9.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 10 (Level V)
q_command.areas.lev_5_rm_10 = {}
q_command.areas.lev_5_rm_10.region = q_command.regions.esc_rooms_level_5
table.insert(q_command.regions.esc_rooms_level_5, q_command.areas.lev_5_rm_10)
q_command.areas.lev_5_rm_10.area_num = #q_command.regions.esc_rooms_level_5

q_command.areas.lev_5_rm_10.center_pos = {x = 288, y = 0, z = 12}
q_command.areas.lev_5_rm_10.radius = 5
q_command.areas.lev_5_rm_10.q_block_pos = {x = 290, y = 0, z = 9}

q_command.areas.lev_5_rm_10.door_pos = {x = 293, y = 0, z = 14}
q_command.areas.lev_5_rm_10.portal_pos = {x = 293, y = 1, z = 12}
q_command.areas.lev_5_rm_10.chest_pos = {x = 284, y = 0, z = 14}
q_command.areas.lev_5_rm_10.chest_inv = {
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
q_command.areas.lev_5_rm_10.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_5_rm_10.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall."
}
q_command.areas.lev_5_rm_10.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_5_rm_10.help_chat_sent = false
q_command.areas.lev_5_rm_10.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_5_rm_10.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_5_rm_10.success_chat_sent = false

q_command.areas.lev_5_rm_10.help_btn_text = {}
q_command.areas.lev_5_rm_10.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_5_rm_10.help_btn_text.es = q_command.areas.lev_5_rm_10.help_btn_text.en
q_command.areas.lev_5_rm_10.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_5_rm_10.help_btn_caption = {}
q_command.areas.lev_5_rm_10.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_5_rm_10.help_btn_caption.es = q_command.areas.lev_5_rm_10.help_btn_caption.en
q_command.areas.lev_5_rm_10.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 11 (Level V)
q_command.areas.lev_5_rm_11 = {}
q_command.areas.lev_5_rm_11.region = q_command.regions.esc_rooms_level_5
table.insert(q_command.regions.esc_rooms_level_5, q_command.areas.lev_5_rm_11)
q_command.areas.lev_5_rm_11.area_num = #q_command.regions.esc_rooms_level_5

q_command.areas.lev_5_rm_11.center_pos = {x = 298, y = 0, z = 12}
q_command.areas.lev_5_rm_11.radius = 5
q_command.areas.lev_5_rm_11.q_block_pos = {x = 300, y = 0, z = 9}

q_command.areas.lev_5_rm_11.door_pos = {x = 300, y = 0, z = 17}
q_command.areas.lev_5_rm_11.portal_pos = {x = 303, y = 1, z = 12}
q_command.areas.lev_5_rm_11.chest_pos = {x = 296, y = 0, z = 16}
q_command.areas.lev_5_rm_11.chest_inv = {
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
q_command.areas.lev_5_rm_11.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_5_rm_11.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall."
}
q_command.areas.lev_5_rm_11.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_5_rm_11.help_chat_sent = false
q_command.areas.lev_5_rm_11.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_5_rm_11.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_5_rm_11.success_chat_sent = false

q_command.areas.lev_5_rm_11.help_btn_text = {}
q_command.areas.lev_5_rm_11.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_5_rm_11.help_btn_text.es = q_command.areas.lev_5_rm_11.help_btn_text.en
q_command.areas.lev_5_rm_11.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_5_rm_11.help_btn_caption = {}
q_command.areas.lev_5_rm_11.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_5_rm_11.help_btn_caption.es = q_command.areas.lev_5_rm_11.help_btn_caption.en
q_command.areas.lev_5_rm_11.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 12 (Level V)
q_command.areas.lev_5_rm_12 = {}
q_command.areas.lev_5_rm_12.region = q_command.regions.esc_rooms_level_5
table.insert(q_command.regions.esc_rooms_level_5, q_command.areas.lev_5_rm_12)
q_command.areas.lev_5_rm_12.area_num = #q_command.regions.esc_rooms_level_5

q_command.areas.lev_5_rm_12.center_pos = {x = 298, y = 0, z = 22}
q_command.areas.lev_5_rm_12.radius = 5
q_command.areas.lev_5_rm_12.q_block_pos = {x = 295, y = 0, z = 20}

q_command.areas.lev_5_rm_12.door_pos = {x = 303, y = 0, z = 20}
q_command.areas.lev_5_rm_12.portal_pos = {x = 303, y = 1, z = 22}
q_command.areas.lev_5_rm_12.chest_pos = {x = 302, y = 0, z = 24}
q_command.areas.lev_5_rm_12.chest_inv = {
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
q_command.areas.lev_5_rm_12.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_5_rm_12.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall."
}
q_command.areas.lev_5_rm_12.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_5_rm_12.help_chat_sent = false
q_command.areas.lev_5_rm_12.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_5_rm_12.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_5_rm_12.success_chat_sent = false

q_command.areas.lev_5_rm_12.help_btn_text = {}
q_command.areas.lev_5_rm_12.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_5_rm_12.help_btn_text.es = q_command.areas.lev_5_rm_12.help_btn_text.en
q_command.areas.lev_5_rm_12.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_5_rm_12.help_btn_caption = {}
q_command.areas.lev_5_rm_12.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_5_rm_12.help_btn_caption.es = q_command.areas.lev_5_rm_12.help_btn_caption.en
q_command.areas.lev_5_rm_12.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 13 (Level V)
q_command.areas.lev_5_rm_13 = {}
q_command.areas.lev_5_rm_13.region = q_command.regions.esc_rooms_level_5
table.insert(q_command.regions.esc_rooms_level_5, q_command.areas.lev_5_rm_13)
q_command.areas.lev_5_rm_13.area_num = #q_command.regions.esc_rooms_level_5

q_command.areas.lev_5_rm_13.center_pos = {x = 308, y = 0, z = 22}
q_command.areas.lev_5_rm_13.radius = 5
q_command.areas.lev_5_rm_13.q_block_pos = {x = 311, y = 0, z = 24}

q_command.areas.lev_5_rm_13.door_pos = {x = 306, y = 0, z = 17}
q_command.areas.lev_5_rm_13.portal_pos = {x = 313, y = 1, z = 19}
q_command.areas.lev_5_rm_13.chest_pos = {x = 310, y = 0, z = 26}
q_command.areas.lev_5_rm_13.chest_inv = {
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
q_command.areas.lev_5_rm_13.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_5_rm_13.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall."
}
q_command.areas.lev_5_rm_13.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_5_rm_13.help_chat_sent = false
q_command.areas.lev_5_rm_13.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_5_rm_13.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_5_rm_13.success_chat_sent = false

q_command.areas.lev_5_rm_13.help_btn_text = {}
q_command.areas.lev_5_rm_13.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_5_rm_13.help_btn_text.es = q_command.areas.lev_5_rm_13.help_btn_text.en
q_command.areas.lev_5_rm_13.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_5_rm_13.help_btn_caption = {}
q_command.areas.lev_5_rm_13.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_5_rm_13.help_btn_caption.es = q_command.areas.lev_5_rm_13.help_btn_caption.en
q_command.areas.lev_5_rm_13.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 14 (Level V)
q_command.areas.lev_5_rm_14 = {}
q_command.areas.lev_5_rm_14.region = q_command.regions.esc_rooms_level_5
table.insert(q_command.regions.esc_rooms_level_5, q_command.areas.lev_5_rm_14)
q_command.areas.lev_5_rm_14.area_num = #q_command.regions.esc_rooms_level_5

q_command.areas.lev_5_rm_14.center_pos = {x = 308, y = 0, z = 12}
q_command.areas.lev_5_rm_14.radius = 5
q_command.areas.lev_5_rm_14.q_block_pos = {x = 311, y = 0, z = 14}

q_command.areas.lev_5_rm_14.door_pos = {x = 313, y = 0, z = 10}
q_command.areas.lev_5_rm_14.portal_pos = {x = 313, y = 1, z = 15}
q_command.areas.lev_5_rm_14.chest_pos = {x = 306, y = 0, z = 8}
q_command.areas.lev_5_rm_14.chest_inv = {
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
q_command.areas.lev_5_rm_14.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_5_rm_14.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall."
}
q_command.areas.lev_5_rm_14.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_5_rm_14.help_chat_sent = false
q_command.areas.lev_5_rm_14.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_5_rm_14.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_5_rm_14.success_chat_sent = false

q_command.areas.lev_5_rm_14.help_btn_text = {}
q_command.areas.lev_5_rm_14.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_5_rm_14.help_btn_text.es = q_command.areas.lev_5_rm_14.help_btn_text.en
q_command.areas.lev_5_rm_14.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_5_rm_14.help_btn_caption = {}
q_command.areas.lev_5_rm_14.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_5_rm_14.help_btn_caption.es = q_command.areas.lev_5_rm_14.help_btn_caption.en
q_command.areas.lev_5_rm_14.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 15 (Level V)
q_command.areas.lev_5_rm_15 = {}
q_command.areas.lev_5_rm_15.region = q_command.regions.esc_rooms_level_5
table.insert(q_command.regions.esc_rooms_level_5, q_command.areas.lev_5_rm_15)
q_command.areas.lev_5_rm_15.area_num = #q_command.regions.esc_rooms_level_5

q_command.areas.lev_5_rm_15.center_pos = {x = 318, y = 0, z = 12}
q_command.areas.lev_5_rm_15.radius = 5
q_command.areas.lev_5_rm_15.q_block_pos = {x = 321, y = 0, z = 14}

q_command.areas.lev_5_rm_15.door_pos = {x = 320, y = 0, z = 17}
q_command.areas.lev_5_rm_15.portal_pos = {x = 323, y = 1, z = 9}
q_command.areas.lev_5_rm_15.chest_pos = {x = 316, y = 0, z = 8}
q_command.areas.lev_5_rm_15.chest_inv = {
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
q_command.areas.lev_5_rm_15.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_5_rm_15.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall."
}
q_command.areas.lev_5_rm_15.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_5_rm_15.help_chat_sent = false
q_command.areas.lev_5_rm_15.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_5_rm_15.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_5_rm_15.success_chat_sent = false

q_command.areas.lev_5_rm_15.help_btn_text = {}
q_command.areas.lev_5_rm_15.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_5_rm_15.help_btn_text.es = q_command.areas.lev_5_rm_15.help_btn_text.en
q_command.areas.lev_5_rm_15.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_5_rm_15.help_btn_caption = {}
q_command.areas.lev_5_rm_15.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_5_rm_15.help_btn_caption.es = q_command.areas.lev_5_rm_15.help_btn_caption.en
q_command.areas.lev_5_rm_15.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 16 (Level V)
q_command.areas.lev_5_rm_16 = {}
q_command.areas.lev_5_rm_16.region = q_command.regions.esc_rooms_level_5
table.insert(q_command.regions.esc_rooms_level_5, q_command.areas.lev_5_rm_16)
q_command.areas.lev_5_rm_16.area_num = #q_command.regions.esc_rooms_level_5

q_command.areas.lev_5_rm_16.center_pos = {x = 318, y = 0, z = 22}
q_command.areas.lev_5_rm_16.radius = 5
q_command.areas.lev_5_rm_16.q_block_pos = {x = 316, y = 0, z = 25}

q_command.areas.lev_5_rm_16.door_pos = {x = 323, y = 0, z = 24}
q_command.areas.lev_5_rm_16.portal_pos = {x = 323, y = 1, z = 22}
q_command.areas.lev_5_rm_16.chest_pos = {x = 322, y = 0, z = 20}
q_command.areas.lev_5_rm_16.chest_inv = {
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
q_command.areas.lev_5_rm_16.solution_unitary =
{{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}},{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}},
{{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}},{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0}}}

q_command.areas.lev_5_rm_16.help_chat_msg = {
	"Make a circuit like the last one, but negate the output as shown on the wall."
}
q_command.areas.lev_5_rm_16.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.lev_5_rm_16.help_chat_sent = false
q_command.areas.lev_5_rm_16.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.lev_5_rm_16.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.lev_5_rm_16.success_chat_sent = false

q_command.areas.lev_5_rm_16.help_btn_text = {}
q_command.areas.lev_5_rm_16.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.lev_5_rm_16.help_btn_text.es = q_command.areas.lev_5_rm_16.help_btn_text.en
q_command.areas.lev_5_rm_16.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.lev_5_rm_16.help_btn_caption = {}
q_command.areas.lev_5_rm_16.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.lev_5_rm_16.help_btn_caption.es = q_command.areas.lev_5_rm_16.help_btn_caption.en
q_command.areas.lev_5_rm_16.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"



-- END Escape room puzzles Level III --------------------------------------------

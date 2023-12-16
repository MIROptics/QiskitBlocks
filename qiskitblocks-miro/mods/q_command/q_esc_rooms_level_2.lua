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

-- Escape room puzzles Level II -------------------------------------------------
-------- Room 1 (Level II)
q_command.areas.xor_escape = {}
q_command.areas.xor_escape.region = q_command.regions.esc_rooms_level_2
table.insert(q_command.regions.esc_rooms_level_2, q_command.areas.xor_escape)
q_command.areas.xor_escape.area_num = #q_command.regions.esc_rooms_level_2

q_command.areas.xor_escape.center_pos = {x = 218, y = 0, z = 72}
q_command.areas.xor_escape.radius = 5
q_command.areas.xor_escape.q_block_pos = {x = 215, y = 0, z = 70}

q_command.areas.xor_escape.door_pos = {x = 220, y = 0, z = 67}
q_command.areas.xor_escape.portal_pos = {x = 223, y = 1, z = 72}
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
q_command.areas.xor_escape.help_chat_msg.ja = {
	"また会いましたね、尊敬する同僚！私の名前はQ教授で、量子実験を行っているため、このガ",
	"ラスの後ろに立っていることを思い出してください。私はあなたが元気だと確信しています:-)",
	"この実験では、壁にあるようにデジタルの「排他的OR」ゲートを実現する回路を作成します。",
	"出口のドアが開くかどうかに影響を与えることなく、入力をテストするために、ワイアー線上",
	"に|1>のブロックを配置できます。"
}
q_command.areas.xor_escape.help_chat_sent = false
q_command.areas.xor_escape.help_success_msg = {
	"Well done! You may know that the CNOT gate is its own inverse, so supplying the ",
	"output as input will give you the original input as output. That's reversible ",
	"computing, with no qubits falling in the bit bucket! Perhaps experiment with ",
	"that before leaving this room to see reversible computing in action."
}
q_command.areas.xor_escape.help_success_msg.ja = {
	"よくできました！ CNOTゲートはそれ自体が可逆であることがわかっているため、出力を入力 ",
	"として提供すると、元の入力が出力として提供されます。 これは、ビットのバケツに量子ビッ ",
	"トが入らないリバーシブルなコンピューティングです。この部屋を出る前にそれを試して、リ ",
	"バーシブルコンピューティングの動作を確認してください。"
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
q_command.areas.xor_escape.help_btn_text.ja =
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
q_command.areas.xor_escape.help_btn_caption = {}
q_command.areas.xor_escape.help_btn_caption.en = "Make a quantum logic XOR gate"
q_command.areas.xor_escape.help_btn_caption.es = q_command.areas.xor_escape.help_btn_caption.en
q_command.areas.xor_escape.help_btn_caption.ja = "量子論理XORゲートを作る"

-------- Room 2 (Level II)
q_command.areas.dj_bal_flip_ora_escape = {}
q_command.areas.dj_bal_flip_ora_escape.region = q_command.regions.esc_rooms_level_2
table.insert(q_command.regions.esc_rooms_level_2, q_command.areas.dj_bal_flip_ora_escape)
q_command.areas.dj_bal_flip_ora_escape.area_num = #q_command.regions.esc_rooms_level_2

q_command.areas.dj_bal_flip_ora_escape.center_pos = {x = 218, y = 0, z = 62}
q_command.areas.dj_bal_flip_ora_escape.radius = 5
q_command.areas.dj_bal_flip_ora_escape.q_block_pos = {x = 220, y = 0, z = 59}

q_command.areas.dj_bal_flip_ora_escape.door_pos = {x = 213, y = 0, z = 60}
q_command.areas.dj_bal_flip_ora_escape.portal_pos = {x = 223, y = 1, z = 62}
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
	"Make a circuit like the last one, but negate the output as shown on the wall."
}
q_command.areas.dj_bal_flip_ora_escape.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。"
}
q_command.areas.dj_bal_flip_ora_escape.help_chat_sent = false
q_command.areas.dj_bal_flip_ora_escape.help_success_msg = {
	"Nice job. I'll keep adding twists like that X gate so you'll be creating ",
	"circuits with increasingly complex quantum logic in no time!"
}
q_command.areas.dj_bal_flip_ora_escape.help_success_msg.ja = {
	"良くやりました。Xゲートのような反転を追加し続けることで、ますます複雑化する量子ロ ",
	"ジックを備えた回路をすぐに作成できるようになります。"
}
q_command.areas.dj_bal_flip_ora_escape.success_chat_sent = false

q_command.areas.dj_bal_flip_ora_escape.help_btn_text = {}
q_command.areas.dj_bal_flip_ora_escape.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as shown on the wall
]]
q_command.areas.dj_bal_flip_ora_escape.help_btn_text.es = q_command.areas.dj_bal_flip_ora_escape.help_btn_text.en
q_command.areas.dj_bal_flip_ora_escape.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に示されているように出力を否定します。
]]
q_command.areas.dj_bal_flip_ora_escape.help_btn_caption = {}
q_command.areas.dj_bal_flip_ora_escape.help_btn_caption.en = "Make a NOT XOR quantum logic gate"
q_command.areas.dj_bal_flip_ora_escape.help_btn_caption.es = q_command.areas.dj_bal_flip_ora_escape.help_btn_caption.en
q_command.areas.dj_bal_flip_ora_escape.help_btn_caption.ja = "NOT XOR量子論理ゲートを作る"


-------- Room 3 (Level II)
q_command.areas.toffoli_escape = {}
q_command.areas.toffoli_escape.region = q_command.regions.esc_rooms_level_2
table.insert(q_command.regions.esc_rooms_level_2, q_command.areas.toffoli_escape)
q_command.areas.toffoli_escape.area_num = #q_command.regions.esc_rooms_level_2

q_command.areas.toffoli_escape.center_pos = {x = 208, y = 0, z = 62}
q_command.areas.toffoli_escape.radius = 5
q_command.areas.toffoli_escape.q_block_pos = {x = 204, y = 0, z = 58}

q_command.areas.toffoli_escape.door_pos = {x = 206, y = 0, z = 67}
q_command.areas.toffoli_escape.portal_pos = {x = 213, y = 1, z = 62}
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
	"Go ahead and create a circuit that realizes the logic shown on the wall. I'd ",
	"suggest using a Toffoli gate, but you do you! :-)"
}
q_command.areas.toffoli_escape.help_chat_msg.ja = {
	"壁に示されているロジックを実現する回路を作成します。 トフォリ(Toffoli)ゲートを使用する ",
	"ことをお勧めしますが、あなた自身で好きに作ってください！ :-)"
}
q_command.areas.toffoli_escape.help_chat_sent = false
q_command.areas.toffoli_escape.help_success_msg = {
	"Nicely done! Did you notice that this time the output isn't on one of the input ",
	"wires, but rather, on an additional wire?"
}
q_command.areas.toffoli_escape.help_success_msg.ja = {
	"うまくできました！ 今回は出力が入力線のうちの1つではなく、追加の線上にあることに気付 ",
	"きましたか？"
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
q_command.areas.toffoli_escape.help_btn_text.ja =
[[
壁に示されているロジックを実現する回路を作成します。 トフォリ(Toffoli)ゲートを使用する
ことをお勧めしますが、あなた自身で好きに作ってください！ :-)

注：制御されたXゲートをトフォリゲートに変換するには（逆も同様です）、コントロール
ツールを使用して左クリックまたは右クリックしながら、スペシャルキーを押したままにしま
す。 左クリックすると、2番目の制御量子ビットが1ワイヤ上に移動し、右クリックすると、2
番目の制御量子ビットが1ワイヤ下に移動します。 2番目の制御量子ビットには、最初の制御量
子ビットと区別するのに役立つ青い点があります。 スペシャルキーは、ゲームを一時停止し、
[キーの変更]ボタンを選択すると、何に設定されているか分かり、また変更することもできま
す。
]]
q_command.areas.toffoli_escape.help_btn_caption = {}
q_command.areas.toffoli_escape.help_btn_caption.en = "Make a quantum logic AND gate"
q_command.areas.toffoli_escape.help_btn_caption.es = q_command.areas.toffoli_escape.help_btn_caption.en
q_command.areas.toffoli_escape.help_btn_caption.ja = "量子論理ANDゲートを作る"


-------- Room 4 (Level II)
q_command.areas.toffoli_nand_escape = {}
q_command.areas.toffoli_nand_escape.region = q_command.regions.esc_rooms_level_2
table.insert(q_command.regions.esc_rooms_level_2, q_command.areas.toffoli_nand_escape)
q_command.areas.toffoli_nand_escape.area_num = #q_command.regions.esc_rooms_level_2

q_command.areas.toffoli_nand_escape.center_pos = {x = 208, y = 0, z = 72}
q_command.areas.toffoli_nand_escape.radius = 5
q_command.areas.toffoli_nand_escape.q_block_pos = {x = 212, y = 0, z = 76}

q_command.areas.toffoli_nand_escape.door_pos = {x = 210, y = 0, z = 77}
q_command.areas.toffoli_nand_escape.portal_pos = {x = 208, y = 1, z = 67}
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
q_command.areas.toffoli_nand_escape.help_chat_msg.ja = {
	"先ほどと同じような回路を作成しますが、壁に表示されているようにNAND（NOT AND）で出 ",
	"力を否定します。"
}
q_command.areas.toffoli_nand_escape.help_chat_sent = false
q_command.areas.toffoli_nand_escape.help_success_msg = {
	"You're really getting the hang of this. On to the next room!"
}
q_command.areas.toffoli_nand_escape.help_success_msg.ja = {
	"あなたは本当にこつを得ていますね。 次の部屋へ！"
}
q_command.areas.toffoli_nand_escape.success_chat_sent = false

q_command.areas.toffoli_nand_escape.help_btn_text = {}
q_command.areas.toffoli_nand_escape.help_btn_text.en =
[[
Make a circuit like the last one, but negate the output as indicated by
the NAND (NOT AND) shown on the wall.
]]
q_command.areas.toffoli_nand_escape.help_btn_text.es = q_command.areas.toffoli_nand_escape.help_btn_text.en
q_command.areas.toffoli_nand_escape.help_btn_text.ja =
[[
先ほどと同じような回路を作成しますが、壁に表示されているようにNAND（NOT AND）で出
力を否定します。
]]
q_command.areas.toffoli_nand_escape.help_btn_caption = {}
q_command.areas.toffoli_nand_escape.help_btn_caption.en = "Make a quantum logic NAND gate"
q_command.areas.toffoli_nand_escape.help_btn_caption.es = q_command.areas.toffoli_nand_escape.help_btn_caption.en
q_command.areas.toffoli_nand_escape.help_btn_caption.ja = "量子論理NANDゲートを作る"


-------- Room 5 (Level II)
q_command.areas.or_escape = {}
q_command.areas.or_escape.region = q_command.regions.esc_rooms_level_2
table.insert(q_command.regions.esc_rooms_level_2, q_command.areas.or_escape)
q_command.areas.or_escape.area_num = #q_command.regions.esc_rooms_level_2

q_command.areas.or_escape.center_pos = {x = 208, y = 0, z = 82}
q_command.areas.or_escape.radius = 5
q_command.areas.or_escape.q_block_pos = {x = 204, y = 0, z = 86}

q_command.areas.or_escape.door_pos = {x = 213, y = 0, z = 80}
q_command.areas.or_escape.portal_pos = {x = 213, y = 1, z = 85}
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
q_command.areas.or_escape.help_chat_msg.ja = {
	"再び、壁のロジックを実現する回路を作成します。"
}
q_command.areas.or_escape.help_chat_sent = false
q_command.areas.or_escape.help_success_msg = {
	"I like how you negated both inputs, as well as the output, of the",
	"previous AND circuit to make an OR circuit!"
}
q_command.areas.or_escape.help_success_msg.ja = {
	"前のAND回路の入力と出力の両方を否定してOR回路を作成する方法が気に入っています！"
}
q_command.areas.or_escape.success_chat_sent = false

q_command.areas.or_escape.help_btn_text = {}
q_command.areas.or_escape.help_btn_text.en =
[[
Again, make a circuit that realizes the logic on the wall.
]]
q_command.areas.or_escape.help_btn_text.es = q_command.areas.or_escape.help_btn_text.en
q_command.areas.or_escape.help_btn_text.ja =
[[
再び、壁のロジックを実現する回路を作成します。
]]
q_command.areas.or_escape.help_btn_caption = {}
q_command.areas.or_escape.help_btn_caption.en = "Make a quantum logic OR gate"
q_command.areas.or_escape.help_btn_caption.es = q_command.areas.or_escape.help_btn_caption.en
q_command.areas.or_escape.help_btn_caption.ja = "量子論理ORゲートを作る"


-------- Room 6 (Level II)
q_command.areas.nor_escape = {}
q_command.areas.nor_escape.region = q_command.regions.esc_rooms_level_2
table.insert(q_command.regions.esc_rooms_level_2, q_command.areas.nor_escape)
q_command.areas.nor_escape.area_num = #q_command.regions.esc_rooms_level_2

q_command.areas.nor_escape.center_pos = {x = 218, y = 0, z = 82}
q_command.areas.nor_escape.radius = 5
q_command.areas.nor_escape.q_block_pos = {x = 222, y = 0, z = 78}

q_command.areas.nor_escape.door_pos = {x = 220, y = 0, z = 87}
q_command.areas.nor_escape.portal_pos = {x = 223, y = 1, z = 79}
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
q_command.areas.nor_escape.help_chat_msg.ja = {
	"壁に表示されているNOR（NOT OR）を考慮して、さきほどと似たような回路を作成します。"
}
q_command.areas.nor_escape.help_chat_sent = false
q_command.areas.nor_escape.help_success_msg = {
	"Nicely done. Carry on!"
}
q_command.areas.nor_escape.help_success_msg.ja = {
	"よくできました。 続けましょう！"
}
q_command.areas.nor_escape.success_chat_sent = false

q_command.areas.nor_escape.help_btn_text = {}
q_command.areas.nor_escape.help_btn_text.en =
[[
Make a circuit similar to the last one, taking into account the NOR
(NOT OR) shown on the wall.
]]
q_command.areas.nor_escape.help_btn_text.es = q_command.areas.nor_escape.help_btn_text.en
q_command.areas.nor_escape.help_btn_text.ja =
[[
壁に表示されているNOR（NOT OR）を考慮して、さきほどと似たような回路を作成します。
]]
q_command.areas.nor_escape.help_btn_caption = {}
q_command.areas.nor_escape.help_btn_caption.en = "Make a quantum logic NOR gate"
q_command.areas.nor_escape.help_btn_caption.es = q_command.areas.nor_escape.help_btn_caption.en
q_command.areas.nor_escape.help_btn_caption.ja = "量子論理NORゲートを作る"


-------- Room 7 (Level II)
q_command.areas.toffoli_mixed_escape = {}
q_command.areas.toffoli_mixed_escape.region = q_command.regions.esc_rooms_level_2
table.insert(q_command.regions.esc_rooms_level_2, q_command.areas.toffoli_mixed_escape)
q_command.areas.toffoli_mixed_escape.area_num = #q_command.regions.esc_rooms_level_2

q_command.areas.toffoli_mixed_escape.center_pos = {x = 218, y = 0, z = 92}
q_command.areas.toffoli_mixed_escape.radius = 5
q_command.areas.toffoli_mixed_escape.q_block_pos = {x = 214, y = 0, z = 96}

q_command.areas.toffoli_mixed_escape.door_pos = {x = 213, y = 0, z = 94}
q_command.areas.toffoli_mixed_escape.portal_pos = {x = 221, y = 1, z = 87}
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
q_command.areas.toffoli_mixed_escape.help_chat_msg.ja = {
	"壁のロジックを実現する回路を作成します。デジタル回路ではNOTがANDに優先することを忘 ",
	"れないでください。"
}
q_command.areas.toffoli_mixed_escape.help_chat_sent = false
q_command.areas.toffoli_mixed_escape.help_success_msg = {
	"Excellent! Did you notice that only digital logic has been demonstrated to this ",
	"point? We'll rectify that in the next room."
}
q_command.areas.toffoli_mixed_escape.help_success_msg.ja = {
	"素晴らしいです！ この時点でデジタルのロジックのみが実証されていることに気付き ",
	"ましたか？ 次の部屋でそれを変えていきます。"
}
q_command.areas.toffoli_mixed_escape.success_chat_sent = false

q_command.areas.toffoli_mixed_escape.help_btn_text = {}
q_command.areas.toffoli_mixed_escape.help_btn_text.en =
[[
Go ahead and make a circuit that realizes the logic on the wall,
remembering that NOT takes precedence over AND in digital logic.
]]
q_command.areas.toffoli_mixed_escape.help_btn_text.es = q_command.areas.toffoli_mixed_escape.help_btn_text.en
q_command.areas.toffoli_mixed_escape.help_btn_text.ja =
[[
壁のロジックを実現する回路を作成します。デジタル回路ではNOTがANDに優先することを忘
れないでください。
]]
q_command.areas.toffoli_mixed_escape.help_btn_caption = {}
q_command.areas.toffoli_mixed_escape.help_btn_caption.en = "Make a quantum logic AND gate with negated input"
q_command.areas.toffoli_mixed_escape.help_btn_caption.es = q_command.areas.toffoli_mixed_escape.help_btn_caption.en
q_command.areas.toffoli_mixed_escape.help_btn_caption.ja = "入力を否定した量子論理ANDゲートを作る"


-------- Room 8 (Level II)
q_command.areas.superpos_logic_and_escape = {}
q_command.areas.superpos_logic_and_escape.region = q_command.regions.esc_rooms_level_2
table.insert(q_command.regions.esc_rooms_level_2, q_command.areas.superpos_logic_and_escape)
q_command.areas.superpos_logic_and_escape.area_num = #q_command.regions.esc_rooms_level_2

q_command.areas.superpos_logic_and_escape.center_pos = {x = 208, y = 0, z = 92}
q_command.areas.superpos_logic_and_escape.radius = 5
q_command.areas.superpos_logic_and_escape.q_block_pos = {x = 212, y = 0, z = 88}

q_command.areas.superpos_logic_and_escape.door_pos = {x = 203, y = 0, z = 90}
q_command.areas.superpos_logic_and_escape.portal_pos = {x = 213, y = 1, z = 92}
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
q_command.areas.superpos_logic_and_escape.help_chat_msg.ja = {
	"次のトリックでは、前に入った部屋で行ったのと同じロジックを実現します。 ただし、今回は ",
	"均等な重ね合わせを入力に使うと、壁に表示される状態になります。"
}
q_command.areas.superpos_logic_and_escape.help_chat_sent = false
q_command.areas.superpos_logic_and_escape.help_success_msg = {
	"Outstanding! You've managed to demonstrate quantum parallelism, in which all ",
	"of the 2^n (where n is number of inputs) combinations and their associated ",
	"outputs are represented in the state vector."
}
q_command.areas.superpos_logic_and_escape.help_success_msg.ja = {
	"素晴らしい！ 2 ^ n（nは入力の数）のすべての組み合わせとそれらに関連する出力が状 ",
	"態ベクトルで表される量子の並列性を実証できました。"
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
q_command.areas.superpos_logic_and_escape.help_btn_text.ja =
[[
次のトリックでは、前に入った部屋で行ったのと同じロジックを実現します。 ただし、今回は
均等な重ね合わせを入力に使うと、壁に表示される状態になります。
]]
q_command.areas.superpos_logic_and_escape.help_btn_caption = {}
q_command.areas.superpos_logic_and_escape.help_btn_caption.en = "Compute NOT a AND b in superposition"
q_command.areas.superpos_logic_and_escape.help_btn_caption.es = q_command.areas.superpos_logic_and_escape.help_btn_caption.en
q_command.areas.superpos_logic_and_escape.help_btn_caption.ja = "重ね合わせでNOT a AND bを計算する"


-------- Room 9 (Level II)
q_command.areas.and_3_operands_x_escape = {}
q_command.areas.and_3_operands_x_escape.region = q_command.regions.esc_rooms_level_2
table.insert(q_command.regions.esc_rooms_level_2, q_command.areas.and_3_operands_x_escape)
q_command.areas.and_3_operands_x_escape.area_num = #q_command.regions.esc_rooms_level_2

q_command.areas.and_3_operands_x_escape.center_pos = {x = 198, y = 0, z = 92}
q_command.areas.and_3_operands_x_escape.radius = 5
q_command.areas.and_3_operands_x_escape.q_block_pos = {x = 194, y = -1, z = 88}

q_command.areas.and_3_operands_x_escape.door_pos = {x = 193, y = 0, z = 94}
q_command.areas.and_3_operands_x_escape.portal_pos = {x = 203, y = 1, z = 92}
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
q_command.areas.and_3_operands_x_escape.help_chat_msg.ja = {
	"ここでは、複数のANDを含む論理式を実現します。 おそらく、いくつかのトフォリゲートから ",
	"回路を作り、最初のゲートを元に戻すために3つ目を追加します。 私はこの防爆ガラスの後ろ ",
	"に安全にいるので簡単に言うことができますが、最善の判断をしてください:-)"
}
q_command.areas.and_3_operands_x_escape.help_chat_sent = false
q_command.areas.and_3_operands_x_escape.help_success_msg = {
	"Very impressive! You found a way to leverage Toffoli gates to realize logic ",
	"that consists of more than two inputs. You also used a technique known as ",
	"'uncomputing' to clean up after yourself, leaving a scratch qubit (AKA ancilla ",
	"qubit, labeled 'd' on the wall) the way you found it. Good qubit hygiene is",
	"important, especially when they are entangled."
}
q_command.areas.and_3_operands_x_escape.help_success_msg.ja = {
	"大変お見事です！ トフォリゲートを使って、3つ以上の入力で構成されるロジックを実 ",
	"現する方法を見つけました。 また、「uncomputing」と呼ばれる手法を使用して、最 ",
	"後にクリーンアップし、スクラッチ量子ビット（壁に「d」というラベルが付けられ ",
	"た、別名補助量子ビット）を残します。特にエンタングル状態では、量子ビットを健全 ",
	"に保つことが重要です。"
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
q_command.areas.and_3_operands_x_escape.help_btn_text.ja =
[[
ここでは、複数のANDを含む論理式を実現します。 おそらく、いくつかのトフォリゲートから
回路を作り、最初のゲートを元に戻すために3つ目を追加します。 私はこの防爆ガラスの後ろ
に安全にいるので簡単に言うことができますが、最善の判断をしてください:-)

注：ここでは、液体ブロックの状態が表示できるよりも多くあるため、このパズルの液体ブ
ロックは無視してください。
]]
q_command.areas.and_3_operands_x_escape.help_btn_caption = {}
q_command.areas.and_3_operands_x_escape.help_btn_caption.en = "Create quantum logic gate with multiple operands"
q_command.areas.and_3_operands_x_escape.help_btn_caption.es = q_command.areas.and_3_operands_x_escape.help_btn_caption.en
q_command.areas.and_3_operands_x_escape.help_btn_caption.ja = "複数のオペランドを持つ量子論理ゲートを作る"


-------- Room 10 (Level II)
q_command.areas.and_not_3_operands_x_escape = {}
q_command.areas.and_not_3_operands_x_escape.region = q_command.regions.esc_rooms_level_2
table.insert(q_command.regions.esc_rooms_level_2, q_command.areas.and_not_3_operands_x_escape)
q_command.areas.and_not_3_operands_x_escape.area_num = #q_command.regions.esc_rooms_level_2

q_command.areas.and_not_3_operands_x_escape.center_pos = {x = 188, y = 0, z = 92}
q_command.areas.and_not_3_operands_x_escape.radius = 5
q_command.areas.and_not_3_operands_x_escape.q_block_pos = {x = 184, y = 0, z = 88}

q_command.areas.and_not_3_operands_x_escape.door_pos = {x = 190, y = 0, z = 87}
q_command.areas.and_not_3_operands_x_escape.portal_pos = {x = 193, y = 1, z = 92}
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
q_command.areas.and_not_3_operands_x_escape.help_chat_msg.ja = {
	"壁のロジックを実現する回路を作成してみてください。"
}
q_command.areas.and_not_3_operands_x_escape.help_chat_sent = false
q_command.areas.and_not_3_operands_x_escape.help_success_msg = {
	"Very nice! You've created lots of circuits to this point, each of which affect",
	"the magnitude of relevant states, and therefore measurement probabilities.",
	"Did you notice that this worked well when using |0> and |1> as inputs, but when",
	"computing in superposition all of the relevant probabilities were equal? To",
	"address that, I'll show you a helpful companion to magnitude quantum logic."
}
q_command.areas.and_not_3_operands_x_escape.help_success_msg.ja = {
	"非常に素晴らしいです！ これまでに多くの回路を作成しましたが、それぞれが関連する状態の ",
	"大きさ、つまり測定確率に影響します。 入力として|0>および|1>を使用した場合、うまく機能 ",
	"しましたが、重ね合わせで計算した場合、すべての確率が等しいことに気付きましたか？ これ ",
	"を理解するために、大きさの量子ロジックに役立つ仲間を紹介します。"
}
q_command.areas.and_not_3_operands_x_escape.success_chat_sent = false

q_command.areas.and_not_3_operands_x_escape.help_btn_text = {}
q_command.areas.and_not_3_operands_x_escape.help_btn_text.en =
[[
Try your hand at creating a circuit that realizes the logic on the wall.
]]
q_command.areas.and_not_3_operands_x_escape.help_btn_text.es = q_command.areas.and_not_3_operands_x_escape.help_btn_text.en
q_command.areas.and_not_3_operands_x_escape.help_btn_text.ja =
[[
壁のロジックを実現する回路を作成してみてください。
]]
q_command.areas.and_not_3_operands_x_escape.help_btn_caption = {}
q_command.areas.and_not_3_operands_x_escape.help_btn_caption.en = "Make quantum logic gate with multiple operands"
q_command.areas.and_not_3_operands_x_escape.help_btn_caption.es = q_command.areas.and_not_3_operands_x_escape.help_btn_caption.en
q_command.areas.and_not_3_operands_x_escape.help_btn_caption.ja = "複数のオペランドを持つ量子論理ゲートを作る"


-------- Room 11 (Level II)
q_command.areas.phase_a_and_b_escape = {}
q_command.areas.phase_a_and_b_escape.region = q_command.regions.esc_rooms_level_2
table.insert(q_command.regions.esc_rooms_level_2, q_command.areas.phase_a_and_b_escape)
q_command.areas.phase_a_and_b_escape.area_num = #q_command.regions.esc_rooms_level_2

q_command.areas.phase_a_and_b_escape.center_pos = {x = 188, y = 0, z = 82}
q_command.areas.phase_a_and_b_escape.radius = 5
q_command.areas.phase_a_and_b_escape.q_block_pos = {x = 190, y = 0, z = 79}

q_command.areas.phase_a_and_b_escape.door_pos = {x = 193, y = 0, z = 80}
q_command.areas.phase_a_and_b_escape.portal_pos = {x = 193, y = 1, z = 82}
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
q_command.areas.phase_a_and_b_escape.help_chat_msg.ja = {
	"壁にあるブール式を回路で実現し、液体ブロックの見た目と位相の矢印が示されたようになる ",
	"ようにします（入力がブール式を真にすると矢印が左向きになります）。"
}
q_command.areas.phase_a_and_b_escape.help_chat_sent = false
q_command.areas.phase_a_and_b_escape.help_success_msg = {
	"Well done! You made the phase rotate to pi radians whenever the boolean ",
	"expression on the wall is satisfied (made true) by your input. This type ",
	"of quantum logic is known as phase logic, so you just made a 'phase AND' ",
	"logic gate. Did you notice that the 'phase AND' required only two qubits?"
}
q_command.areas.phase_a_and_b_escape.help_success_msg.ja = {
	"よくやりました！壁のブール式が入力によって満たされる（真になる）たびに、位相をπラジ ",
	"アン回転させました。 このタイプの量子ロジックは位相ロジックとして知られていて、つま ",
	"り、あなたは「位相AND」ロジックゲートを作成したということです。 「位相AND」に必要な ",
	"量子ビットは2つだけということに気づきましたか？"
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
q_command.areas.phase_a_and_b_escape.help_btn_text.ja =
[[
壁にあるブール式を回路で実現し、液体ブロックの見た目と位相の矢印が示されたようになる
ようにします（入力がブール式を真にすると矢印が左向きになります）。
]]
q_command.areas.phase_a_and_b_escape.help_btn_caption = {}
q_command.areas.phase_a_and_b_escape.help_btn_caption.en = "Make two operand phase AND gate"
q_command.areas.phase_a_and_b_escape.help_btn_caption.es = q_command.areas.phase_a_and_b_escape.help_btn_caption.en
q_command.areas.phase_a_and_b_escape.help_btn_caption.ja = "2つのオペランドの位相ANDゲートを作る"


-------- Room 12 (Level II)
q_command.areas.superpos_phase_and_escape = {}
q_command.areas.superpos_phase_and_escape.region = q_command.regions.esc_rooms_level_2
table.insert(q_command.regions.esc_rooms_level_2, q_command.areas.superpos_phase_and_escape)
q_command.areas.superpos_phase_and_escape.area_num = #q_command.regions.esc_rooms_level_2

q_command.areas.superpos_phase_and_escape.center_pos = {x = 198, y = 0, z = 82}
q_command.areas.superpos_phase_and_escape.radius = 5
q_command.areas.superpos_phase_and_escape.q_block_pos = {x = 201, y = 0, z = 84}

q_command.areas.superpos_phase_and_escape.door_pos = {x = 196, y = 0, z = 77}
q_command.areas.superpos_phase_and_escape.portal_pos = {x = 198, y = 1, z = 87}
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
	"Now realize the same logic as you did in the previous room, but compute the ",
	"logic with its inputs in equal superposition, resulting in the state shown ",
	"on the wall."
}
q_command.areas.superpos_phase_and_escape.help_chat_msg.ja = {
	"ここでは、前の部屋で行ったのと同じロジックを実現しますが、均等な重ね合わせを入力する ",
	"と、壁に表示される状態になります。"
}
q_command.areas.superpos_phase_and_escape.help_chat_sent = false
q_command.areas.superpos_phase_and_escape.help_success_msg = {
	"Excellent! You've again managed to demonstrate quantum parallelism, in which",
	"all of the 2^n combinations are represented in the state vector. This time",
	"the combinations that satisfy the boolean expression are marked by a phase."
}
q_command.areas.superpos_phase_and_escape.help_success_msg.ja = {
	"優秀です！ 2^ nのすべての組み合わせが状態ベクトルで表された、量子並列性を再び実証する ",
	"ことができました。 今回は、ブール式を満たす組み合わせが位相でマークされます。"
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
q_command.areas.superpos_phase_and_escape.help_btn_text.ja =
[[
ここでは、前の部屋で行ったのと同じロジックを実現しますが、均等な重ね合わせを入力する
と、壁に表示される状態になります。
]]
q_command.areas.superpos_phase_and_escape.help_btn_caption = {}
q_command.areas.superpos_phase_and_escape.help_btn_caption.en = "Compute phase a AND b in superposition"
q_command.areas.superpos_phase_and_escape.help_btn_caption.es = q_command.areas.superpos_phase_and_escape.help_btn_caption.en
q_command.areas.superpos_phase_and_escape.help_btn_caption.ja = "重ね合わせで位相 a AND b を計算する"


-------- Room 13 (Level II)
q_command.areas.phase_a_or_b_escape = {}
q_command.areas.phase_a_or_b_escape.region = q_command.regions.esc_rooms_level_2
table.insert(q_command.regions.esc_rooms_level_2, q_command.areas.phase_a_or_b_escape)
q_command.areas.phase_a_or_b_escape.area_num = #q_command.regions.esc_rooms_level_2

q_command.areas.phase_a_or_b_escape.center_pos = {x = 198, y = 0, z = 72}
q_command.areas.phase_a_or_b_escape.radius = 5
q_command.areas.phase_a_or_b_escape.q_block_pos = {x = 201, y = 0, z = 69}

q_command.areas.phase_a_or_b_escape.door_pos = {x = 193, y = 0, z = 74}
q_command.areas.phase_a_or_b_escape.portal_pos = {x = 203, y = 1, z = 71}
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
q_command.areas.phase_a_or_b_escape.help_chat_msg.ja = {
	"液体ブロックと位相矢印の見た目と同じになるように、壁のブール式を回路で実現します。",
}
q_command.areas.phase_a_or_b_escape.help_chat_sent = false
q_command.areas.phase_a_or_b_escape.help_success_msg = {
	"Congratulations! You just made a 'phase OR' logic gate."
}
q_command.areas.phase_a_or_b_escape.help_success_msg.ja = {
	"おめでとうございます！ 「位相OR」論理ゲートを作成しました。"
}
q_command.areas.phase_a_or_b_escape.success_chat_sent = false

q_command.areas.phase_a_or_b_escape.help_btn_text = {}
q_command.areas.phase_a_or_b_escape.help_btn_text.en =
[[
Now make the circuit realize the boolean expression on the wall, with
the appearance of the liquid blocks and phase arrows as indicated
]]
q_command.areas.phase_a_or_b_escape.help_btn_text.es = q_command.areas.phase_a_or_b_escape.help_btn_text.en
q_command.areas.phase_a_or_b_escape.help_btn_text.ja =
[[
液体ブロックと位相矢印の見た目と同じになるように、壁のブール式を回路で実現します。
]]
q_command.areas.phase_a_or_b_escape.help_btn_caption = {}
q_command.areas.phase_a_or_b_escape.help_btn_caption.en = "Make two operand phase OR gate"
q_command.areas.phase_a_or_b_escape.help_btn_caption.es = q_command.areas.phase_a_or_b_escape.help_btn_caption.en
q_command.areas.phase_a_or_b_escape.help_btn_caption.ja = "2つのオペランドの位相ORゲートを作る"


-------- Room 14 (Level II)
q_command.areas.phase_a_and_b_no_z_escape = {}
q_command.areas.phase_a_and_b_no_z_escape.region = q_command.regions.esc_rooms_level_2
table.insert(q_command.regions.esc_rooms_level_2, q_command.areas.phase_a_and_b_no_z_escape)
q_command.areas.phase_a_and_b_no_z_escape.area_num = #q_command.regions.esc_rooms_level_2

q_command.areas.phase_a_and_b_no_z_escape.center_pos = {x = 188, y = 0, z = 72}
q_command.areas.phase_a_and_b_no_z_escape.radius = 5
q_command.areas.phase_a_and_b_no_z_escape.q_block_pos = {x = 185, y = 0, z = 69}

q_command.areas.phase_a_and_b_no_z_escape.door_pos = {x = 186, y = 0, z = 67}
q_command.areas.phase_a_and_b_no_z_escape.portal_pos = {x = 193, y = 1, z = 72}
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
q_command.areas.phase_a_and_b_no_z_escape.help_chat_msg.ja = {
	"ここでの課題は、Zブロックなしで「位相AND」論理ゲートを作成することです。"
}
q_command.areas.phase_a_and_b_no_z_escape.help_chat_sent = false
q_command.areas.phase_a_and_b_no_z_escape.help_success_msg = {
	"Very resourceful! You've found a combination of gates that perform the same",
	"conditional unitary evolution as a controlled-Z gate. This will be useful in",
	"more complex phase logic gates, as the Z gate may only have one control qubit,",
	"but the X gate may have two (in a Toffoli gate)."
}
q_command.areas.phase_a_and_b_no_z_escape.help_success_msg.ja = {
	"とても賢いですね！ 制御Zゲートと同じ条件付きユニタリーの変化を実行するゲートの組み合 ",
	"わせが見つかりました。 これは、Zゲートには制御量子ビットが1つしかありませんが、Xゲー ",
	"トには（トフォリゲート内に）2つあるため、より複雑な位相ロジックゲートで役立ちます。"
}
q_command.areas.phase_a_and_b_no_z_escape.success_chat_sent = false

q_command.areas.phase_a_and_b_no_z_escape.help_btn_text = {}
q_command.areas.phase_a_and_b_no_z_escape.help_btn_text.en =
[[
Your challenge here will be to create a 'phase AND' logic gate
without a Z block as used previously.
]]
q_command.areas.phase_a_and_b_no_z_escape.help_btn_text.es = q_command.areas.phase_a_and_b_no_z_escape.help_btn_text.en
q_command.areas.phase_a_and_b_no_z_escape.help_btn_text.ja =
[[
ここでの課題は、Zブロックなしで「位相AND」論理ゲートを作成することです。
]]
q_command.areas.phase_a_and_b_no_z_escape.help_btn_caption = {}
q_command.areas.phase_a_and_b_no_z_escape.help_btn_caption.en = "Make two operand phase AND gate w/o Z gate"
q_command.areas.phase_a_and_b_no_z_escape.help_btn_caption.es = q_command.areas.phase_a_and_b_no_z_escape.help_btn_caption.en
q_command.areas.phase_a_and_b_no_z_escape.help_btn_caption.ja = "2つのオペランドの位相ANDゲートをZゲートなしで作る"


-------- Room 15 (Level II)
q_command.areas.phase_a_and_b_and_c_escape = {}
q_command.areas.phase_a_and_b_and_c_escape.region = q_command.regions.esc_rooms_level_2
table.insert(q_command.regions.esc_rooms_level_2, q_command.areas.phase_a_and_b_and_c_escape)
q_command.areas.phase_a_and_b_and_c_escape.area_num = #q_command.regions.esc_rooms_level_2

q_command.areas.phase_a_and_b_and_c_escape.center_pos = {x = 188, y = 0, z = 62}
q_command.areas.phase_a_and_b_and_c_escape.radius = 5
q_command.areas.phase_a_and_b_and_c_escape.q_block_pos = {x = 184, y = 0, z = 58}

q_command.areas.phase_a_and_b_and_c_escape.door_pos = {x = 193, y = 0, z = 60}
q_command.areas.phase_a_and_b_and_c_escape.portal_pos = {x = 193, y = 1, z = 62}
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
	"Go ahead and make the circuit realize the boolean expression on the wall, ",
	"with the appearance of the liquid blocks and phase arrows as indicated",
}
q_command.areas.phase_a_and_b_and_c_escape.help_chat_msg.ja = {
	"先に進み、液体ブロックと位相矢印の見た目と同じになるように、壁のブール式を回路で実現 ",
	"します。",
}
q_command.areas.phase_a_and_b_and_c_escape.help_chat_sent = false
q_command.areas.phase_a_and_b_and_c_escape.help_success_msg = {
	"Outstanding. See, I told you that an alternative to a controlled-Z gate",
	"would come in handy!"
}
q_command.areas.phase_a_and_b_and_c_escape.help_success_msg.ja = {
	"非常に素晴らしいです。 見てください。先ほど、私が制御Zゲートの代替品は便利だと言った ",
	"通りになりました！"
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
q_command.areas.phase_a_and_b_and_c_escape.help_btn_text.ja =
[[
先に進み、液体ブロックと位相矢印の見た目と同じになるように、壁のブール式を回路で実現
します。
]]
q_command.areas.phase_a_and_b_and_c_escape.help_btn_caption = {}
q_command.areas.phase_a_and_b_and_c_escape.help_btn_caption.en = "Make three operand phase AND gate"
q_command.areas.phase_a_and_b_and_c_escape.help_btn_caption.es = q_command.areas.phase_a_and_b_and_c_escape.help_btn_caption.en
q_command.areas.phase_a_and_b_and_c_escape.help_btn_caption.ja = "3つのオペランドの位相ANDゲートを作る"


-------- Room 16 (Level II)
q_command.areas.a_or_b_and_c_escape = {}
q_command.areas.a_or_b_and_c_escape.region = q_command.regions.esc_rooms_level_2
table.insert(q_command.regions.esc_rooms_level_2, q_command.areas.a_or_b_and_c_escape)
q_command.areas.a_or_b_and_c_escape.area_num = #q_command.regions.esc_rooms_level_2

q_command.areas.a_or_b_and_c_escape.center_pos = {x = 198, y = 0, z = 62}
q_command.areas.a_or_b_and_c_escape.radius = 5
q_command.areas.a_or_b_and_c_escape.q_block_pos = {x = 202, y = 0, z = 66}

q_command.areas.a_or_b_and_c_escape.door_pos = {x = 199, y = 0, z = 56}
q_command.areas.a_or_b_and_c_escape.portal_pos = {x = 198, y = 1, z = 57}
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
q_command.areas.a_or_b_and_c_escape.help_chat_msg.ja = {
	"ここでは、絶対値のロジックと位相ロジックゲートの組み合わせを使用して、液体ブロックと ",
	"位相の矢印の見た目と同じになるように、壁のブール式を満たすようにします。ヒントとし ",
	"て、量子ビットの健康状態に注意してください:-) ところで、均等な重ね合わせを入力に使いた ",
	"い場合に備えて、チェストにHブロックを置きました。"
}
q_command.areas.a_or_b_and_c_escape.help_chat_sent = false
q_command.areas.a_or_b_and_c_escape.help_success_msg = {
	"Excellent work! You've really done well in these quantum logic focused",
	"circuit puzzles. There is, however, one more step required for being able",
	"to detect the marked states via measurement. This step is known as",
	"'amplitude amplification', and is an idea from Grover's algorithm. The",
	"circuit right outside the exit door demonstrates these concepts together."
}
q_command.areas.a_or_b_and_c_escape.help_success_msg.ja = {
	"すばらしい仕事です！ あなたはこれらの量子ロジックにフォーカスした回路パズルで本当によ ",
	"くやりました。 ただし、測定によってマークされた状態を検出できるようにするには、もう1 ",
	"つの手順が必要です。 このステップは「振幅増幅」として知られ、グローバーのアルゴリズム ",
	"のアイデアです。 出口ドアのすぐ外側の回路は、この概念を示しています。"
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
q_command.areas.a_or_b_and_c_escape.help_btn_text.ja =
[[
ここでは、絶対値のロジックと位相ロジックゲートの組み合わせを使用して、液体ブロックと
位相の矢印の見た目と同じになるように、壁のブール式を満たすようにします。ヒントとし
て、量子ビットの健康状態に注意してください:-) ところで、均等な重ね合わせを入力に使いた
い場合に備えて、チェストにHブロックを置きました。
]]
q_command.areas.a_or_b_and_c_escape.help_btn_caption = {}
q_command.areas.a_or_b_and_c_escape.help_btn_caption.en = "Make (a OR b) AND c"
q_command.areas.a_or_b_and_c_escape.help_btn_caption.es = q_command.areas.a_or_b_and_c_escape.help_btn_caption.en
q_command.areas.a_or_b_and_c_escape.help_btn_caption.ja = "(a OR b) AND c を作る"
-- END Escape room puzzles Level II ---------------------------------------------

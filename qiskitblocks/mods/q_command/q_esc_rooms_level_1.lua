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

-- Escape room puzzles Level I -------------------------------------------------
-------- Room 1 (Level I)
q_command.areas.x_gate_escape = {}
q_command.areas.x_gate_escape.region = q_command.regions.esc_rooms_level_1
table.insert(q_command.regions.esc_rooms_level_1, q_command.areas.x_gate_escape)
q_command.areas.x_gate_escape.area_num = #q_command.regions.esc_rooms_level_1

q_command.areas.x_gate_escape.center_pos = {x = 238, y = 0, z = 72}
q_command.areas.x_gate_escape.radius = 5
q_command.areas.x_gate_escape.q_block_pos = {x = 240, y = 0, z = 74}

q_command.areas.x_gate_escape.door_pos = {x = 236, y = 0, z = 67}
q_command.areas.x_gate_escape.portal_pos = {x = 242, y = 1, z = 72}
q_command.areas.x_gate_escape.chest_pos = {x = 236, y = 0, z = 76}
q_command.areas.x_gate_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "", [31] = "", [32] = ""
        }
    }
}
q_command.areas.x_gate_escape.solution_statevector =
{{r=0,i=0},{r=1,i=0}}

q_command.areas.x_gate_escape.help_chat_msg = {
	"Hello test subject #576, I mean esteemed colleague! My name is Professor Q and I'm",
	"standing behind this blast glass because we're going to try an experiment. Hopefully",
	"it won't vaporize you or scramble your molecules :-) For this experiment, change the",
	"quantum state of the circuit from |0> to the state shown on the wall."
}
q_command.areas.x_gate_escape.help_chat_msg.es = {
	"Hola, sujeto #576, digo... ¡estimado colega! Mi nombre es Profesor Q y me encuentro aquí,",
	"detrás de esta mampara de cristal porque vamos a probar un experimento. Con suerte, ni te",
	"vaporizará, ni esparcirá tus moléculas por ahí. Para este experimento, cambia el estado",
	"cuántico del circuito de |0> al estado que se muestra en la pared."
}
q_command.areas.x_gate_escape.help_chat_msg.ja = {
	"被験者＃576さん、こんにちは！（尊敬する同僚という意味ですよ！）私の名前はQ教 ",
	"授です。実験しようと思っているので、この防風ガラスの後ろに立っています。あなた ",
	"を気化したり、あなたの分子を奪ったりしないこと願っています:-) この実験では、回 ",
	"路の量子状態を|0>から壁に表示されている状態に変更します。"
}
q_command.areas.x_gate_escape.help_chat_sent = false
q_command.areas.x_gate_escape.help_success_msg = {
	"That was great how you used the Pauli-X gate, or NOT gate, to change the quantum",
	"state from |0> to |1>. In addition to making the liquid levels show 100% probability",
	"that measurements will result in |1>, notice that the marker on the Bloch sphere moved",
	"from the top representing |0>, to the bottom representing |1>. Congrats, and now please",
	"move on to the next circuit puzzle!"
}
q_command.areas.x_gate_escape.help_success_msg.es = {
	"Ha estado muy bien cómo has usado la puerta Pauli-X, también conocida como puerta NOT,",
	"para cambiar el estado cuántico de |0> a |1>. Fíjate cómo la marca en la esfera de",
	"Bloch se ha movido de arriba, representando |0>, a abajo, representando |1>.",
	"¡Enhorabuena! Ahora, procede al siguiente puzzle."
}
q_command.areas.x_gate_escape.help_success_msg.ja = {
	"素晴らしいです。パウリのXゲート (NOTゲート)を使って、量子状態を|0>から|1>に変 ",
	"えました。液体の水準レベルが、測定すると|1>になる確率が100%になったことに加え ",
	"て、ブロッホ球上のマーカーが|0>を表すトップ側から|1>を表すボトム側に移動したこ ",
	"とに注意してください。 おめでとう！次の回路パズルに進んでください！"
}
q_command.areas.x_gate_escape.success_chat_sent = false

q_command.areas.x_gate_escape.help_btn_text = {}
q_command.areas.x_gate_escape.help_btn_text.en =
[[
TLDR: Most of the help that you'll need for these 'escape room' circuit
puzzles will appear in the chat area (upper left corner of your window)
by Professor Q. For all of these puzzles, get blocks from the chest and
place them on the circuit. The door to the next room will open when the
liquid levels and arrows in the blue blocks correspond to the quantum
state displayed on the wall behind the circuit in Dirac notation. The
Bloch sphere at the end of each wire estimates the state of its qubit,
and right-clicking it performs a measurement of the circuit.
----

This circuit, consisting of only one wire, leverages the X gate, also
known as the Pauli-X, NOT, or bit-flip, gate. Its effect on the |0>
state is to make it |1>, and vice-versa. To work through this puzzle,
take the following steps:

1) Notice that the blue liquid indicates there is a 100% probability
that the result will be |0> when the circuit is measured. Go ahead and
right-click the measurement block several times to verify that |0> is
always the result.

2) Get an X block out of the chest.

3) While wielding the X block, position the cursor on the empty place
on the circuit wire, and right-click.

4) Notice that the blue liquid now indicates there is a 100% probability
that the result will be |1> when the circuit is measured. Go ahead and
right-click the measurement block several times to verify that |1> is
always the result.

If the Q block turned gold, congratulations on solving the puzzle!
]]
q_command.areas.x_gate_escape.help_btn_text.es = q_command.areas.x_gate_escape.help_btn_text.en
q_command.areas.x_gate_escape.help_btn_text.ja =
[[
TLDR：この「脱出ルーム」型の回路パズルに必要なほとんどのヘルプは、Q教授の
チャットエリア（ウィンドウの左上）に表示されます。すべてのパズルは、チェストか
らブロックを取って、それを回路に置くというものです。 青いブロック内の液体レベ
ルと矢印が、壁に表示されているディラック表記法での回路の量子状態に合致すると、
隣の部屋へ行くドアが開きます。 各線の最後にあるブロッホ球は量子ビットの状態の
見積もりを示し、右クリックするとその回路の測定を実行します。

1本の線のみで構成されるこの回路は、Xゲート（パウリX、NOT、またはビット・フ
リップ・ゲートともよばれる）を活用します。 これは、|0>状態を|1>にすることであ
り、またその逆も同様です。 このパズルを解くには、次の手順を実行します。

1）   青い液体は、回路を測定したときに結果が|0>になる確率が100％であることを示
していることに注意してください。 先に進んで、測定ブロックを数回右クリックし
て、常に結果が|0>であることを確認します。

2） チェストからXブロックを取り出します。

3） Xブロックを保持しながら、回路上の空いている場所にカーソルを置き、右クリッ
クします。

4） 青い液体が、今度は、回路を測定したときに |1>になる確率が100％になっている
ことに注意してください。 先に進み、測定ブロックを数回右クリックして、常に結果
が|1>であることを確認します。

Qブロックがゴールドになったとき、パズルが解けたという意味です。おめでとうござ
います！
]]
q_command.areas.x_gate_escape.help_btn_caption = {}
q_command.areas.x_gate_escape.help_btn_caption.en = "Make quantum state of |1>"
q_command.areas.x_gate_escape.help_btn_caption.es = q_command.areas.x_gate_escape.help_btn_caption.en
q_command.areas.x_gate_escape.help_btn_caption.ja = "|1>の量子状態を作る"


-------- Room 2 (Level I)
q_command.areas.x_gates_2_wire = {}
q_command.areas.x_gates_2_wire.region = q_command.regions.esc_rooms_level_1
table.insert(q_command.regions.esc_rooms_level_1, q_command.areas.x_gates_2_wire)
q_command.areas.x_gates_2_wire.area_num = #q_command.regions.esc_rooms_level_1 -- Escape room 2 of 16 in Level I

q_command.areas.x_gates_2_wire.center_pos = {x = 238, y = 0, z = 62}
q_command.areas.x_gates_2_wire.radius = 5
q_command.areas.x_gates_2_wire.q_block_pos = {x = 240, y = 0, z = 65}

q_command.areas.x_gates_2_wire.door_pos = {x = 243, y = 0, z = 60}
q_command.areas.x_gates_2_wire.portal_pos = {x = 243, y = 1, z = 62}
q_command.areas.x_gates_2_wire.chest_pos = {x = 234, y = 0, z = 64}
q_command.areas.x_gates_2_wire.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "", [31] = "", [32] = ""
        }
    }
}
q_command.areas.x_gates_2_wire.solution_statevector =
{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}}

q_command.areas.x_gates_2_wire.help_chat_msg = {
	"Now let's play with multi-qubit circuits like this one. Please make its quantum state",
	"match the state on the wall.",
}
q_command.areas.x_gates_2_wire.help_chat_msg.es = {
	"Vamos a trabajar ahora con circuitos multi-cúbit, como este. Por favor, haz que el",
	"estado cuántico del mismo se corresponda con el estado en la pared.",
}
q_command.areas.x_gates_2_wire.help_chat_msg.ja = {
	"それでは、ここにある複数量子ビットの回路で遊んでみましょう。 量子状態を壁に表 ",
	"示されている状態と一致させてください。 "
}
q_command.areas.x_gates_2_wire.help_chat_sent = false
q_command.areas.x_gates_2_wire.help_success_msg = {
	"Well done! Now the liquid levels show 100% probability that measurements will",
	"result in |10>",
	"Also, the marker on the bottom Bloch sphere moved from representing |0> to |1>"
}
q_command.areas.x_gates_2_wire.help_success_msg.es = {
	"¡Bien hecho! Ahora los niveles de líquido muestran que, al 100% de probabilidad,",
	"las mediciones resultarán en |10>. Además, la marca en la esfera de Bloch se ha",
	"movido desde la representación de |0> a |1>."
}
q_command.areas.x_gates_2_wire.help_success_msg.ja = {
	"よくできました！ 現在、液体の水準レベルは、測定結果が|10>になる確率100%を示し ",
	"ています。 ",
	"また、下部のブロッホ球上のマーカーは、|0>の場所から|1>の場所に移動しました。 "
}
q_command.areas.x_gates_2_wire.success_chat_sent = false

q_command.areas.x_gates_2_wire.help_btn_text = {}
q_command.areas.x_gates_2_wire.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to a quantum state of |10>
Measure the circuit several times as extra validation of the correct solution.
----

This circuit, consisting of two wires, demonstrates that one or more X
gates may be leveraged to create a classical state. To work through this
puzzle, take the following steps:

1) Notice that the blue liquid indicates there is a 100% probability
that the result will be |00> when the circuit is measured. Go ahead and
right-click the measurement block several times to verify that |00> is
always the result.

2) Get an X block out of the chest.

3) While wielding the X block, position the cursor on the circuit wire
corresponding to each |1> qubit in the desired measurement result, and
right-click. Note that the bottom-most wire corresponds to the left-most
qubit.

4) Notice that the blue liquid now indicates there is a 100% probability
that the result will be |10> when the circuit is measured. Go ahead and
right-click the measurement block several times to verify that |10> is
always the result.

If the Q block turned gold, congratulations on solving the puzzle!
]]
q_command.areas.x_gates_2_wire.help_btn_text.es = q_command.areas.x_gates_2_wire.help_btn_text.en
q_command.areas.x_gates_2_wire.help_btn_text.ja =
[[
TLDR：青い液体レベルを量子状態|10>に対応させます。解が正しいことを追加検証するため
に、回路を数回測定します。
----

2本の線で構成されるこの回路は、1つ以上のXゲートを活用して古典的な状態を作成できるこ
とを示しています。このパズルを解くには、次の手順を実行します。

1）青い液体は、回路の測定時に結果が|00>になる確率が100％を示していることに注目してく
ださい。測定ブロックを数回右クリックして、|00>が常に結果であることを確認します。

2）チェストからXブロックを取り出します。

3）Xブロックを使用しながら、目的の測定結果の各|1>量子ビットに対応する回路の線にカー
ソルを置き、右クリックします。一番下の線が一番左の量子ビットに対応することに注意して
ください。

4）青い液体は、回路を測定したときに結果が|10>になる確率が100％を示していることに注目
してください。測定ブロックを数回右クリックして、常に結果が|10>であることを確認しま
す。

Qブロックがゴールドになったら、パズルが解けたという意味です。おめでとうございます！
]]
q_command.areas.x_gates_2_wire.help_btn_caption = {}
q_command.areas.x_gates_2_wire.help_btn_caption.en = "Make quantum state of |10>"
q_command.areas.x_gates_2_wire.help_btn_caption.es = q_command.areas.x_gates_2_wire.help_btn_caption.en
q_command.areas.x_gates_2_wire.help_btn_caption.ja = "|10>の量子状態を作る"


-------- Room 3 (Level I)
q_command.areas.x_gates_3_wire = {}
q_command.areas.x_gates_3_wire.region = q_command.regions.esc_rooms_level_1
table.insert(q_command.regions.esc_rooms_level_1, q_command.areas.x_gates_3_wire)
q_command.areas.x_gates_3_wire.area_num = #q_command.regions.esc_rooms_level_1

q_command.areas.x_gates_3_wire.center_pos = {x = 248, y = 0, z = 62}
q_command.areas.x_gates_3_wire.radius = 5
q_command.areas.x_gates_3_wire.q_block_pos = {x = 244, y = -1, z = 64}

q_command.areas.x_gates_3_wire.door_pos = {x = 250, y = 0, z = 67}
q_command.areas.x_gates_3_wire.portal_pos = {x = 253, y = 0, z = 61}
q_command.areas.x_gates_3_wire.chest_pos = {x = 252, y = 0, z = 60}
q_command.areas.x_gates_3_wire.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "", [31] = "", [32] = ""
        }
    }
}
q_command.areas.x_gates_3_wire.solution_statevector =
{{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0}}

q_command.areas.x_gates_3_wire.help_chat_msg = {
	"Here you'll do more of the same, but with one additional wire and twice the",
	"number of basis states."
}
q_command.areas.x_gates_3_wire.help_chat_msg.es = {
	"Aquí vas a hacer lo mismo, pero con una línea adicional y el doble de estados base."
}
q_command.areas.x_gates_3_wire.help_chat_msg.ja = {
	"ここでは、同じことを行いますが、線を1本追加し、基底状態の数を2倍にします。 "
}
q_command.areas.x_gates_3_wire.help_chat_sent = false
q_command.areas.x_gates_3_wire.help_success_msg = {
	"You're catching on quickly! You're also noticing that there are 2 to the n power of",
	"basis states, where n is the number of wires. Here, there are 3 wires, so 8 basis",
	"states, |000> through |111>"
}
q_command.areas.x_gates_3_wire.help_success_msg.es = {
	"¡Lo pillas rápido! También te habrás dado cuenta de que el número de estados bae es 2",
	"elevado a la n potencia, donde n es el número de líneas. En este caso hay 3 líneas,",
	"luego 8 estados base, del |000> al |111>"
}
q_command.areas.x_gates_3_wire.help_success_msg.ja = {
	"すぐにできましたね！ また、2のn乗個の基底状態があることに気づきましたね（nは線 ",
	"の数です）。 ここでは、3つの線があるため、|000>から|111> の8つの基底状態があり ",
	"ます。 "
}
q_command.areas.x_gates_3_wire.success_chat_sent = false

q_command.areas.x_gates_3_wire.help_btn_text = {}
q_command.areas.x_gates_3_wire.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to a quantum state of |011>
The exit door is behind the circuit, so use the ladder.
----

This circuit, consisting of three wires, demonstrates that one or more X
gates may be leveraged to create a classical state. To work through this
puzzle, take the following steps:

1) Notice that the blue liquid indicates there is a 100% probability
that the result will be |000> when the circuit is measured. Go ahead and
right-click the measurement block several times to verify that |000> is
always the result.

2) Get an X block out of the chest.

3) While wielding the X block, position the cursor on the circuit wire
corresponding to each |1> qubit in the desired measurement result, and
right-click. Note that the bottom-most wire corresponds to the left-most
qubit.

4) Notice that the blue liquid now indicates there is a 100% probability
that the result will be |011> when the circuit is measured. Go ahead and
right-click the measurement block several times to verify that |011> is
always the result.

If the Q block turned gold, congratulations on solving the puzzle!
]]
q_command.areas.x_gates_3_wire.help_btn_text.es = q_command.areas.x_gates_3_wire.help_btn_text.en
q_command.areas.x_gates_3_wire.help_btn_text.ja =
[[
TLDR：青い液体レベルを量子状態|011>に対応させます。出口のドアは回路の後ろにあるの
で、はしごを使用します。
----

3本のワイヤで構成されるこの回路は、1つ以上のXゲートを活用して古典的な状態を作成でき
ることを示しています。このパズルを解くには、次の手順を実行します。

1）青い液体は、回路を測定したときに結果が|000>になる確率が100％であることを示してい
ることに注意してください。測定ブロックを数回右クリックして、​​常に結果が|000>であること
を確認します。

2）チェストからXブロックを取り出します。

3）Xブロックを使用しながら、目的の測定結果の各|1>の量子ビットに対応する回路の線に
カーソルを置き、右クリックします。一番下の線が一番左の量子ビットに対応することに注意
してください。

4）青い液体が、回路の測定時に結果が|011>になる確率が100％であることを示していること
に注意してください。測定ブロックを数回右クリックして、|011>が常に結果であることを確認
します。

Qブロックがゴールドになったら、パズルが解けたという意味です。おめでとうございます！
]]
q_command.areas.x_gates_3_wire.help_btn_caption = {}
q_command.areas.x_gates_3_wire.help_btn_caption.en = "Make quantum state of |011>"
q_command.areas.x_gates_3_wire.help_btn_caption.es = q_command.areas.x_gates_3_wire.help_btn_caption.en
q_command.areas.x_gates_3_wire.help_btn_caption.ja = "|011>の量子状態を作る"


-------- Room 4 (Level I)
q_command.areas.h_gate_escape = {}
q_command.areas.h_gate_escape.region = q_command.regions.esc_rooms_level_1
table.insert(q_command.regions.esc_rooms_level_1, q_command.areas.h_gate_escape)
q_command.areas.h_gate_escape.area_num = #q_command.regions.esc_rooms_level_1

q_command.areas.h_gate_escape.center_pos = {x = 248, y = 0, z = 72}
q_command.areas.h_gate_escape.radius = 5
q_command.areas.h_gate_escape.q_block_pos = {x = 247, y = 0, z = 74}

q_command.areas.h_gate_escape.door_pos = {x = 253, y = 0, z = 70}
q_command.areas.h_gate_escape.portal_pos = {x = 253, y = 1, z = 72}
q_command.areas.h_gate_escape.chest_pos = {x = 244, y = 0, z = 70}
q_command.areas.h_gate_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "circuit_blocks:circuit_blocks_h_gate", [31] = "", [32] = ""
        }
    }
}
q_command.areas.h_gate_escape.solution_statevector =
{{r=0.707,i=0},{r=0.707,i=0}}

q_command.areas.h_gate_escape.help_chat_msg = {
	"This room is where Schroedinger's cat starts getting nervous. Put the qubit in an equal",
	"superposition of dead and alive, I mean |0> and |1>"
}
q_command.areas.h_gate_escape.help_chat_msg.es = {
	"Esta es la habitación donde el gato de Schrodinger comienza a ponerse nervioso. Pon",
	"el cúbit en igual superposición de vivo y muerto. Quiero decir, de |0> y |1>"
}
q_command.areas.h_gate_escape.help_chat_msg.ja = {
	"この部屋はシュレーディンガーの猫が緊張しはじめる場所です。 量子ビットを死んで ",
	"いるか生きているかの、つまり|0>と|1>の均等な重ね合わせ状態に置きます。 "
}
q_command.areas.h_gate_escape.help_chat_sent = false
q_command.areas.h_gate_escape.help_success_msg = {
	"You've put the qubit in the |+> (pronounced 'plus') state where it has an equal probability",
	"that measurements will result in |0> or |1>. You also made the marker on the Bloch sphere",
	"move to its equator, where the distances to the north pole |0> and the south pole |1>",
	"are equal. Fun fact: The probability of a |0> measurement result is proportional to",
	"the vertical (Z axis) distance of the qubit's state to the south pole on the Bloch sphere!"
}
q_command.areas.h_gate_escape.help_success_msg.es = {
	"Acabas de poner el cúbit en el estado |+> (pronunciado, “más”). También has hecho que la",
	"marca de la esfera de Bloch se mueva hacia el ecuador, donde las distancias al polo norte,",
	"|0>, y al polo sur, |1>, son iguales. Dato interesante: la probabilidad de medir |0> es",
	"proporcional a la distancia vertical (eje Z) del estado del cúbit al polo sur, en la",
	"esfera de Bloch."
}
q_command.areas.h_gate_escape.help_success_msg.ja = {
	"量子ビットを|+>（「プラス」と発音）状態、つまり、|0>または|1>が測定される確率が ",
	"等しい状態にしました。 また、ブロッホ球上のマーカーが赤道上に移動しました。赤 ",
	"道は、北極|0>と南極|1>までの距離が等しくなっています。 おもしろい事実：|0>が測 ",
	"定される確率は、ブロッホ球上の南極までの量子ビットの状態の垂直（Z軸上）の距離 ",
	"に比例します！"
}
q_command.areas.h_gate_escape.success_chat_sent = false

q_command.areas.h_gate_escape.help_btn_text = {}
q_command.areas.h_gate_escape.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to a quantum state of
sqrt(1/2) |0> + sqrt(1/2) |1>, which is commonly referred to as |+>
----

This circuit, consisting of only one wire, leverages the H gate, also
known as the the Hadamard gate. Its effect on the |0> state is to put it
into an equal superposition of |0> and |1>. Therefore, when the qubit is
measured, there is a 50% probability that the result will be |0>, and a
50% probability that the result will be |1>. To work through this
puzzle, take the following steps:

1) Notice that the blue liquid indicates there is a 100% probability
that the result will be |0> when the circuit is measured. Go ahead and
right-click the measurement block several times to verify that |0> is
always the result.

2) Get an H block out of the chest.

3) While wielding the H block, position the cursor on the empty place
on the circuit wire, and right-click.

4) Notice that the blue liquid now indicates there is a 50% probability
that the result will be |0> when the circuit is measured, and a 50%
probability that the result will be |1> when the circuit is measured. Go
ahead and right-click the measurement block several times to verify that
the results are fairly evenly distributed between |0> and |1>.

If the Q block turned gold, congratulations on solving the puzzle!
]]
q_command.areas.h_gate_escape.help_btn_text.es = q_command.areas.h_gate_escape.help_btn_text.en
q_command.areas.h_gate_escape.help_btn_text.ja =
[[
TLDR：青い液体レベルをsqrt（1/2）|0> + sqrt（1/2）|1>の量子状態に対応させます。これは
一般に|+>と呼ばれます
----

1本の線のみで構成されるこの回路は、アダマールゲートとも呼ばれるHゲートを活用します。
Hは、|0>状態を|0>と|1>の等しい重ね合わせします。したがって、量子ビットを測定すると
50%の確率で結果が|0>になり、50%の確率で結果が|1>になります。このパズルを解くには、
次の手順を実行します。

1）青い液体は、回路を測定したときに結果が|0>になる確率が100％であることを示している
ことに注意してください。測定ブロックを数回右クリックして、結果が常に|0>であることを確
認します。

2）チェストからHブロックを取り出します。

3）Hブロックを保持しながら、回路の線の空いている場所にカーソルを置き、右クリックしま
す。

4）青色の液体は、回路の測定結果が|0>になる確率が50％であり、|1>となる確率が50％であ
ることに注意してください。次に、測定ブロックを数回右クリックして、結果が|0>と|1>の間
でほぼ均等に分布していることを確認します。

Qブロックがゴールドになったら、パズルが解けたという意味です。おめでとうございます！
]]
q_command.areas.h_gate_escape.help_btn_caption = {}
q_command.areas.h_gate_escape.help_btn_caption.en = "Make a quantum state of |+>"
q_command.areas.h_gate_escape.help_btn_caption.es = q_command.areas.h_gate_escape.help_btn_caption.en
q_command.areas.h_gate_escape.help_btn_caption.ja = "|+>の量子状態を作る"


-------- Room 5 (Level I)
q_command.areas.h_x_gate = {}
q_command.areas.h_x_gate.region = q_command.regions.esc_rooms_level_1
table.insert(q_command.regions.esc_rooms_level_1, q_command.areas.h_x_gate)
q_command.areas.h_x_gate.area_num = #q_command.regions.esc_rooms_level_1

q_command.areas.h_x_gate.center_pos = {x = 258, y = 0, z = 72}
q_command.areas.h_x_gate.radius = 5
q_command.areas.h_x_gate.q_block_pos = {x = 260, y = 0, z = 73}

q_command.areas.h_x_gate.door_pos = {x = 256, y = 0, z = 67}
q_command.areas.h_x_gate.portal_pos = {x = 263, y = 1, z = 72}
q_command.areas.h_x_gate.chest_pos = {x = 256, y = 0, z = 76}
q_command.areas.h_x_gate.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "circuit_blocks:circuit_blocks_h_gate", [31] = "", [32] = ""
        }
    }
}
q_command.areas.h_x_gate.solution_statevector =
{{r=0.707,i=0},{r=-0.707,i=0}}

q_command.areas.h_x_gate.help_chat_msg = {
	"Now let's visit the back side of the Bloch sphere, in a state commonly known as |->",
	"(pronounced 'minus'), where measurements resulting in |0> or |1> are also equally likely"
}
q_command.areas.h_x_gate.help_chat_msg.es = {
	"Visitemos ahora el otro lado de la esfera de Bloch, un estado conocido como |-> (pronunciado",
	"“menos”), donde las mediciones que resultan en |0> o |1> son igualmente probables."
}
q_command.areas.h_x_gate.help_chat_msg.ja = {
	"ここで、ブロッホ球の裏側を見てみましょう。一般に |->（「マイナス」と発音）と呼 ",
	"ばれる状態で、測定結果が同じように|0>または|1>になる可能性が等しい状態です。"
}
q_command.areas.h_x_gate.help_chat_sent = false
q_command.areas.h_x_gate.help_success_msg = {
	"Nice navigation! You're noticing how the quantum computing gates such as X and Hadamard",
	"may be represented as rotations on the Bloch sphere. The X gate rotates 180 degrees, also",
	"known as pi (3.14...) radians, around the X axis (which is the axis coming toward you)",
	"but a bit down and to the left). You also may have noticed that the H gate rotates pi",
	"radians around an axis that is halfway in-between the X and Z axes."
}
q_command.areas.h_x_gate.help_success_msg.es = {
	"¡Bien dirigido! Te estarás percatando de cómo las puertas X y Hadamard se pueden",
	"representar como rotaciones en la esfera de Bloch. La puerta X rota 180 grados, o PI (3.14…) ",
	"radianes, la marca, alrededor del eje X (que es el eje que apunta hacia ti, aunque un",
	"poco más hacia abajo y a la izquierda). También habrás notado que la puerta H rota PI",
	"radianes la marca, alrededor de un eje que se encuentra a medio camino entre los ejes X y Z."
}
q_command.areas.h_x_gate.help_success_msg.ja = {
	"素晴らしいナビゲーションです！ Xやアダマールなどの量子コンピューティングゲート ",
	"が、ブロッホ球上でどのような回転となるか分かっているようですね。XゲートはX軸 ",
	"（あなた側に向かっている軸・図では少し左下向きですが）を中心に180度（π（3.14 ...）",
	"ラジアン）回転とします。また、HゲートがX軸とZ軸の中間の軸を中心にπ回転す ",
	"ることも分かりましたね。"
}
q_command.areas.h_x_gate.success_chat_sent = false

q_command.areas.h_x_gate.help_btn_text = {}
q_command.areas.h_x_gate.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to a quantum state of
sqrt(1/2) |0> - sqrt(1/2) |1>, which is commonly referred to as |->
----

This circuit, consisting of only one wire, demonstrates that the order
of gates on a wire often matters. It also show that the basis states in
a quantum state may have different phases. To work through this puzzle,
take the following steps:

1) Notice that the blue liquid indicates there is a 100% probability
that the result will be |0> when the circuit is measured. Go ahead and
right-click the measurement block several times to verify that |0> is
always the result.

2) Get an H block and an X block out of the chest, placing both on the
circuit.

3) The solution will have probabilities indicating that measurement
results |0> and |1> are equally likely, as well has having opposite
phases. The notation for a phase on these block-world circuits is an
arrow that points in a direction signifying its counterclockwise
rotation, from 0 radians pointing rightward. As an example, a leftward
pointing arrow signifies a phase of pi radians.

4) The blue liquid should indicate there is a 50% probability that the
result will be |0> when the circuit is measured, and a 50% probability
that the result will be |1> when the circuit is measured. Go ahead and
right-click the measurement block several times to verify that the
results are fairly evenly distributed between |0> and |1>.

If the Q block turned gold, congratulations on solving the puzzle!
]]
q_command.areas.h_x_gate.help_btn_text.es = q_command.areas.h_x_gate.help_btn_text.en
q_command.areas.h_x_gate.help_btn_text.ja =
[[
TLDR：青い液体レベルをsqrt（1/2）|0>-sqrt（1/2）|1>の量子状態に対応させます。これは一
般的に|->と呼ばれます
----

1本の線のみで構成されるこの回路は、線上のゲートの順序が重要であることを示します。ま
た、量子状態の基底状態は異なる位相を持つ可能性があることも示しています。このパズルを
解くには、次の手順を実行します。

1）青い液体は、回路を測定したときに結果が|0>になる確率が100％であることを示している
ことに注意してください。測定ブロックを数回右クリックして、常に測定結果が |0>であるこ
とを確認します。

2）チェストからHブロックとXブロックを取り出し、両方を回路に置きます。

3）解は、測定結果が|0>と|1>が等しく存在し、位相が逆である確率をもちます。ここのブロッ
クワールドの回路上の位相の表記は、右向き矢印が0ラジアンで、そこから反時計回りの回転
です。例として、左向きの矢印は、πラジアンの位相を示します。

4）青い液体は、回路が測定されると結果が|0>になる確率が50％、|1>となる確率が50％であ
ることを示している必要があります。測定ブロックを数回右クリックして、結果が|0>と|1>の
間でほぼ均等に分布していることを確認します。

Qブロックがゴールドになったら、パズルが解けたという意味です。おめでとうございます！
]]
q_command.areas.h_x_gate.help_btn_caption = {}
q_command.areas.h_x_gate.help_btn_caption.en = "Make a quantum state of |->"
q_command.areas.h_x_gate.help_btn_caption.es = q_command.areas.h_x_gate.help_btn_caption.en
q_command.areas.h_x_gate.help_btn_caption.ja = "|->の量子状態を作る"


-------- Room 6 (Level I)
q_command.areas.h_z_gate = {}
q_command.areas.h_z_gate.region = q_command.regions.esc_rooms_level_1
table.insert(q_command.regions.esc_rooms_level_1, q_command.areas.h_z_gate)
q_command.areas.h_z_gate.area_num = #q_command.regions.esc_rooms_level_1

q_command.areas.h_z_gate.center_pos = {x = 258, y = 0, z = 62}
q_command.areas.h_z_gate.radius = 5
q_command.areas.h_z_gate.q_block_pos = {x = 259, y = 0, z = 60}

q_command.areas.h_z_gate.door_pos = {x = 263, y = 0, z = 60}
q_command.areas.h_z_gate.portal_pos = {x = 263, y = 1, z = 62}
q_command.areas.h_z_gate.chest_pos = {x = 254, y = 0, z = 64}
q_command.areas.h_z_gate.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "", [26] = "", [27] = "circuit_blocks:circuit_blocks_z_gate", [28] = "",
                [29] = "", [30] = "circuit_blocks:circuit_blocks_h_gate", [31] = "", [32] = ""
        }
    }
}
q_command.areas.h_z_gate.solution_statevector =
{{r=0.707,i=0},{r=-0.707,i=0}}

q_command.areas.h_z_gate.help_chat_msg = {
	"Let's take another trip to the |-> state, but this time via a different route. I've taken",
	"the liberty of replacing your X gate with a Z gate, so you'll need to experiment. Good luck!"
}
q_command.areas.h_z_gate.help_chat_msg.es = {
	"Vamos a alcanzar de nuevo el estado |->, esta vez siguiendo otra ruta. Me he tomado",
	"la libertad de reemplazar tu puerta X con una puerta Z, así que tendrás que experimentar",
	"un poco. ¡Buena suerte!"
}
q_command.areas.h_z_gate.help_chat_msg.ja = {
	"また別の|->状態に旅してみましょう。今回は別のルートを通ります。 私が、Xゲート ",
	"をZゲートに置き換えてみたので、あなたは実験する必要があります。 幸運を祈ってい ",
	"ます！"
}
q_command.areas.h_z_gate.help_chat_sent = false
q_command.areas.h_z_gate.help_success_msg = {
	"Fascinating! You've demonstrated that there are several different ways (an infinite amount)",
	"for a quantum state to evolve to a different quantum state. This time, you used the H gate to",
	"move to the |+> state, and then you changed the phase of the quantum state by pi radians, using",
	"the Z gate to rotate around the Z axis. Did you notice that the arrows in the liquid blocks point",
	"in opposite directions (pi radians out of phase) when this one-qubit circuit is in the |-> state?"
}
q_command.areas.h_z_gate.help_success_msg.es = {
	"¡Fascinante! Acabas de demostrar que existen distintas formas (infinitas, de hecho) para que un estado",
	"cuántico evolucione hacia otro distinto. Esta vez, has usado una puerta H para alcanzar el estado |+>,",
	"y después has cambiado la fase del estado cuántico en PI radianes, usando la puerta Z para rotar alrededor",
	"del eje Z. ¿Te has dado cuenta de que las flechas de los bloques líquidos apuntan en direcciones",
	"opuestas (desfasadas PI radianes), cuando este circuito de un cúbit se encuentra en el estado |->?"
}
q_command.areas.h_z_gate.help_success_msg.ja = {
	"すばらしいです！ あなたは、量子状態が異なる量子状態に進化するのに、いくつかの ",
	"異なる方法（無限の量）があることを実証しました。 今回は、Hゲートを使用して|+> ",
	"状態に移動し、Zゲートを使用してZ軸を中心に回転して、量子状態の位相をπ単位で変 ",
	"化させました。 この1量子ビットの回路が|->状態にあるとき、液体ブロックの矢印が ",
	"反対方向を指している（位相がπずれている）ことに気付きましたか？"
}
q_command.areas.h_z_gate.success_chat_sent = false

q_command.areas.h_z_gate.help_btn_text = {}
q_command.areas.h_z_gate.help_btn_text.en =
[[
TLDR: Using a Z gate and one other gate, make the blue liquid levels
correspond to a quantum state of sqrt(1/2) |0> - sqrt(1/2) |1>, which is
commonly referred to as |->
----

This circuit, consisting of only one wire, demonstrates how a block
sphere models the state of a qubit. To work through this puzzle, take
the following steps:

1) Notice that instead of the usual measurement block, this circuit has
a (very pixelated) Bloch sphere. You can read more about this Bloch
sphere in the building you started in when first playing this game.

2) Get an H block and a Z block out of the chest, placing them on the
circuit. As you place each one, notice how the Bloch sphere changes,
reflecting the updated state of the qubit. Try placing them in a
different order, noticing the effects on the Bloch sphere and liquid
blocks.

3) The solution will have probabilities indicating that measurement
results |0> and |1> are equally likely, as well has having opposite
phases. Note that both the Bloch sphere, and the blue liquid blocks,
reflect these probabilities and phases.

If the Q block turned gold, congratulations on solving the puzzle!
]]
q_command.areas.h_z_gate.help_btn_text.es = q_command.areas.h_z_gate.help_btn_text.en
q_command.areas.h_z_gate.help_btn_text.ja =
[[
TLDR：Zゲートと他の1つのゲートを使用して、青い液体レベルをsqrt（1/2）|0>-sqrt（1/2）|1>
の量子状態に対応させます。これは一般に|->と呼ばれます
----

1本の線のみで構成されるこの回路は、ブロッホ球が量子ビットの状態をモデル化する方法を
示しています。このパズルを解くには、次の手順を実行します。

1）通常の測定ブロックの代わりに、この回路には（ピクセル化された）ブロッホ球がありま
す。このゲームを初めてプレイしたときにいた建物で、このブロッホ球体について詳しく読む
ことができます。

2）チェストからHブロックとZブロックを取り出し、回路に配置します。それぞれを配置する
ときに、更新された量子ビットの状態を反映して、ブロッホ球がどのように変化するかに注目
してください。ブロッホ球と液体ブロックにどのように影響するか注目しながら、それらを異
なる順序で配置してみてください。

3）解は、測定結果|0>と|1>が等しい確率で存在し、逆の位相を持つことを示しています。ブ
ロッホ球と青い液体ブロックの両方がこれらの確率と位相を反映していることに注目してくだ
さい。

Qブロックがゴールドになったら、パズルが解けたという意味です。おめでとうございます！
]]
q_command.areas.h_z_gate.help_btn_caption = {}
q_command.areas.h_z_gate.help_btn_caption.en = "Make a quantum state of |-> using gates including Z"
q_command.areas.h_z_gate.help_btn_caption.es = q_command.areas.h_z_gate.help_btn_caption.en
q_command.areas.h_z_gate.help_btn_caption.ja = "Zを含むゲートを使用して|->の量子状態を作る"


-------- Room 7 (Level I)
q_command.areas.hxx_gates_escape = {}
q_command.areas.hxx_gates_escape.region = q_command.regions.esc_rooms_level_1
table.insert(q_command.regions.esc_rooms_level_1, q_command.areas.hxx_gates_escape)
q_command.areas.hxx_gates_escape.area_num = #q_command.regions.esc_rooms_level_1

q_command.areas.hxx_gates_escape.center_pos = {x = 268, y = 0, z = 62}
q_command.areas.hxx_gates_escape.radius = 5
q_command.areas.hxx_gates_escape.q_block_pos = {x = 271, y = -1, z = 66}

q_command.areas.hxx_gates_escape.door_pos = {x = 266, y = 0, z = 67}
q_command.areas.hxx_gates_escape.portal_pos = {x = 268, y = 1, z = 67}
q_command.areas.hxx_gates_escape.chest_pos = {x = 266, y = 0, z = 58}
q_command.areas.hxx_gates_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "circuit_blocks:circuit_blocks_h_gate", [31] = "", [32] = ""
        }
    }
}
q_command.areas.hxx_gates_escape.solution_statevector =
{{r=0,i=0},{r=0.707,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0.707,i=0},{r=0,i=0},{r=0,i=0}}

q_command.areas.hxx_gates_escape.help_chat_msg = {
	"Go ahead and solve this puzzle by thinking about one wire at a time"
}
q_command.areas.hxx_gates_escape.help_chat_msg.es = {
	"Continua y resuelve este puzzle línea por línea."
}
q_command.areas.hxx_gates_escape.help_chat_msg.ja = {
	"一度に1本の線について考えることで、このパズルを解いてください。"
}
q_command.areas.hxx_gates_escape.help_chat_sent = false
q_command.areas.hxx_gates_escape.help_success_msg = {
	"You're really getting the hang of this! By thinking about the effects of various gates on",
	"individual wires, you've successfully crafted the desired composite quantum state."
}
q_command.areas.hxx_gates_escape.help_success_msg.es = {
	"¡Le vas cogiendo el truco! Pensando en el efecto de múltiples puertas en líneas individuales,",
	"has conseguido crear el estado cuántico deseado."
}
q_command.areas.hxx_gates_escape.help_success_msg.ja = {
	"あなたは本当にコツが分かっていますね！ 個々の線に対するさまざまなゲートの影響 ",
	"を考えることで、目的の複合量子状態を作成できました。"
}
q_command.areas.hxx_gates_escape.success_chat_sent = false

q_command.areas.hxx_gates_escape.help_btn_text = {}
q_command.areas.hxx_gates_escape.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to a quantum state of
sqrt(1/2) |001> + sqrt(1/2) |101>
----

This circuit leverages Hadamard and X gates to create a quantum state in
which the measurement results |001> and |101> are equally likely, and no
other measurement results are possible. This quantum state could be
expressed as |001> + |101>

To solve this circuit puzzle, place an H gate and an X gate on the
appropriate wires.

Hint: Use what you already have learned about the behaviors of H and X
gates on single-wire circuits.

If the Q block turned gold, congratulations on solving the puzzle!
]]
q_command.areas.hxx_gates_escape.help_btn_text.es = q_command.areas.hxx_gates_escape.help_btn_text.en
q_command.areas.hxx_gates_escape.help_btn_text.ja =
[[
TLDR：HおよびXゲートのみを使用して、青い液体レベルをsqrt（1/2）|001> +
sqrt（1/2）|101>の量子状態に対応させます。
----

この回路は、アダマールゲートとXゲートを活用して、測定結果が|001>または|101>に
なる可能性が等しく、その他の測定結果が得られない量子状態を作成します。 この量
子状態は、|001> + |101>と表現できます。

この回路パズルを解決するには、適切な線にHゲートとXゲートを配置します。

ヒント：単線回路でのHゲートおよびXゲートの動作について既に学んだことを使用し
てください。

Qブロックがゴールドになったら、パズルが解けたという意味です。おめでとうござい
ます！
]]
q_command.areas.hxx_gates_escape.help_btn_caption = {}
q_command.areas.hxx_gates_escape.help_btn_caption.en = "Make |001> + |101> quantum state"
q_command.areas.hxx_gates_escape.help_btn_caption.es = q_command.areas.hxx_gates_escape.help_btn_caption.en
q_command.areas.hxx_gates_escape.help_btn_caption.ja = "|001> + |101> の量子状態を作る"


-------- Room 8 (Level I)
q_command.areas.equal_super_2wire_escape = {}
q_command.areas.equal_super_2wire_escape.region = q_command.regions.esc_rooms_level_1
table.insert(q_command.regions.esc_rooms_level_1, q_command.areas.equal_super_2wire_escape)
q_command.areas.equal_super_2wire_escape.area_num = #q_command.regions.esc_rooms_level_1

q_command.areas.equal_super_2wire_escape.center_pos = {x = 268, y = 0, z = 72}
q_command.areas.equal_super_2wire_escape.radius = 5
q_command.areas.equal_super_2wire_escape.q_block_pos = {x = 266, y = 0, z = 75}

q_command.areas.equal_super_2wire_escape.door_pos = {x = 270, y = 0, z = 77}
q_command.areas.equal_super_2wire_escape.portal_pos = {x = 273, y = 1, z = 72}
q_command.areas.equal_super_2wire_escape.chest_pos = {x = 264, y = 0, z = 70}
q_command.areas.equal_super_2wire_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "circuit_blocks:circuit_blocks_h_gate", [31] = "", [32] = ""
        }
    }
}
q_command.areas.equal_super_2wire_escape.solution_statevector =
{{r=0.5,i=0},{r=0.5,i=0},{r=0.5,i=0},{r=0.5,i=0}}

q_command.areas.equal_super_2wire_escape.help_chat_msg = {
	"Now put four basis states into equal superpositions"
}
q_command.areas.equal_super_2wire_escape.help_chat_msg.es = {
	"Ahora pon los cuatro estados base en igual superposición."
}
q_command.areas.equal_super_2wire_escape.help_chat_msg.ja = {
	"今度は、4つの基底状態を均等な重ね合わせ状態にします。"
}
q_command.areas.equal_super_2wire_escape.help_chat_sent = false
q_command.areas.equal_super_2wire_escape.help_success_msg = {
	"Incredible! By putting each wire into a superposition, you've caused all four of the",
	"basis states in this quantum state to be in equal superpositions. As indicated by the",
	"formula on the wall, each state has a 1/4 probability of being the result when measured.",
	"Note that the measurement probability of a given basis state is the square of its",
	"coefficient (referred to by physicists as its amplitude)"
}
q_command.areas.equal_super_2wire_escape.help_success_msg.es = {
	"¡Increíble! Poniendo cada línea en superposición, has hecho que los cuatro estados base de",
	"este estado cuántico estén en igual superposición. Como indica la fórmula en la pared, cada",
	"estado tiene una probabilidad de ¼ de ser el resultado, tras una medición. Fíjate que la",
	"probabilidad de medición de un estado base cualquiera es el cuadrado de su coeficiente",
	"(llamado “amplitud”, por los físicos)."
}
q_command.areas.equal_super_2wire_escape.help_success_msg.ja = {
	"信じられません！ 各線をそれぞれ重ね合わせにすることで、この量子状態の4つの基底 ",
	"状態が均等な重ね合わせ状態になります。 壁の式に示されているように、各状態は、 ",
	"測定される確率が1/4ずつあります。 与えられた基底状態の測定される確率は、その係 ",
	"数（物理学者は振幅と呼びます）の2乗であることに注意してください。"
}
q_command.areas.equal_super_2wire_escape.success_chat_sent = false

q_command.areas.equal_super_2wire_escape.help_btn_text = {}
q_command.areas.equal_super_2wire_escape.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to the following quantum
state, commonly referred to as an equal superposition:
sqrt(1/4) |00> + sqrt(1/4) |01> + sqrt(1/4) |10> + sqrt(1/4) |11>
----

This circuit leverages two Hadamard gates to create an equal
superposition of |00>, |01>, |10>, and |11>. To solve this circuit
puzzle, place an H block on each wire. Notice how the outcome
probabilities and measurement results change as these gates are removed
and added. This pattern of placing an H gate on each wire of a circuit
is commonly used to create a superposition consisting of 2^numQubits
states.

If the Q block turned gold, congratulations on solving the puzzle!
]]
q_command.areas.equal_super_2wire_escape.help_btn_text.es = q_command.areas.equal_super_2wire_escape.help_btn_text.en
q_command.areas.equal_super_2wire_escape.help_btn_text.ja =
[[
TLDR：青色の液体レベルを一般に、均等な重ね合わせと呼ばれる次の量子状態に対応させま
す：sqrt（1/4）|00> + sqrt（1/4）|01> + sqrt（1/4）|10>+ SQRT（1/4）|11>
----

この回路は、2つのアダマールゲートを活用して、|00>、|01>、|10>、および|11>の均等な重ね
合わせを作成します。 この回路パズルを解くには、各線上にHブロックを配置します。 これら
のHゲートが削除または追加されたとき、結果の確率と測定結果がどのように変化するかに注
目してみてください。 回路の各ワイヤにHゲートを配置するこのパターンは、2 ^ 量子ビット
数　の状態の重ね合わせを作るために一般に使用されます。

Qブロックがゴールドになったら、パズルが解けたという意味です。おめでとうござい
ます！
]]
q_command.areas.equal_super_2wire_escape.help_btn_caption = {}
q_command.areas.equal_super_2wire_escape.help_btn_caption.en = "Equal superposition with two qubits"
q_command.areas.equal_super_2wire_escape.help_btn_caption.es = q_command.areas.equal_super_2wire_escape.help_btn_caption.en
q_command.areas.equal_super_2wire_escape.help_btn_caption.ja = "2量子ビットの均等な重ね合わせ"


-------- Room 9 (Level I)
q_command.areas.equal_super_3wire_escape = {}
q_command.areas.equal_super_3wire_escape.region = q_command.regions.esc_rooms_level_1
table.insert(q_command.regions.esc_rooms_level_1, q_command.areas.equal_super_3wire_escape)
q_command.areas.equal_super_3wire_escape.area_num = #q_command.regions.esc_rooms_level_1

q_command.areas.equal_super_3wire_escape.center_pos = {x = 268, y = 0, z = 82}
q_command.areas.equal_super_3wire_escape.radius = 5
q_command.areas.equal_super_3wire_escape.q_block_pos = {x = 264, y = -1, z = 78}

q_command.areas.equal_super_3wire_escape.door_pos = {x = 270, y = 0, z = 87}
q_command.areas.equal_super_3wire_escape.portal_pos = {x = 273, y = 1, z = 82}
q_command.areas.equal_super_3wire_escape.chest_pos = {x = 272, y = 0, z = 80}
q_command.areas.equal_super_3wire_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "circuit_blocks:circuit_blocks_h_gate", [31] = "", [32] = ""
        }
    }
}
q_command.areas.equal_super_3wire_escape.solution_statevector =
{{r=0.354,i=0},{r=0.354,i=0},{r=0.354,i=0},{r=0.354,i=0},{r=0.354,i=0},{r=0.354,i=0},{r=0.354,i=0},{r=0.354,i=0}}

q_command.areas.equal_super_3wire_escape.help_chat_msg = {
	"This time, put eight basis states into equal superpositions"
}
q_command.areas.equal_super_3wire_escape.help_chat_msg.es = {
	"Esta vez, pon ocho estados base en igual superposición."
}
q_command.areas.equal_super_3wire_escape.help_chat_msg.ja = {
	"今度は、8つの基底状態を均等な重ね合わせ状態にします。"
}
q_command.areas.equal_super_3wire_escape.help_chat_sent = false
q_command.areas.equal_super_3wire_escape.help_success_msg = {
	"You've got this! You may be familiar with the 'sum' notation on the wall, which",
	"provides a succinct way to express this state in which all of the basis states have",
	"the same amplitude."
}
q_command.areas.equal_super_3wire_escape.help_success_msg.es = {
	"¡Ya lo has pillado! Puede que te suene la notación “sumatorio” de la pared, que proporciona",
	"una forma breve de expresar este estado en el que todos los estados base tienen la misma",
	"amplitud."
}
q_command.areas.equal_super_3wire_escape.help_success_msg.ja = {
	"やりましたね！ 壁の「和」の表記をよく知っているかもしれません。これは、すべて ",
	"の基底状態が同じ振幅を持つ、この状態を簡単に表現する方法です。"
}
q_command.areas.equal_super_3wire_escape.success_chat_sent = false

q_command.areas.equal_super_3wire_escape.help_btn_text = {}
q_command.areas.equal_super_3wire_escape.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to an equal superposition
of its eight basis states.
----

This circuit leverages two Hadamard gates to create an equal
superposition of |000>, |001>, |010>, |011>, |100>, |101>, |110> and
|111>. A convenient way to express this state is to use the math sum
symbol as shown on the wall. To solve this circuit puzzle, place an H
block on each wire. Notice how the outcome probabilities and measurement
results change as these gates are removed and added. This pattern of
placing an H gate on each wire of a circuit is commonly used to create a
superposition consisting of 2^numQubits states.

If the Q block turned gold, congratulations on solving the puzzle!
]]
q_command.areas.equal_super_3wire_escape.help_btn_text.es = q_command.areas.equal_super_3wire_escape.help_btn_text.en
q_command.areas.equal_super_3wire_escape.help_btn_text.ja =
[[
この回路は、2つのアダマールゲートを活用して、|000>、|001>、|010>、|011>、|100>、
|101>、|110>および|111>の等しい重ね合わせを作成します。 この状態を表現する便利な方法
は、壁に示されているように数学和記号を使用することです。 この回路パズルを解決するに
は、各ワイヤにHブロックを配置します。 これらのゲートが削除および追加されると、結果の
確率と測定結果がどのように変化するかに注目してください。 回路の各線にHゲートを配置す
るこのパターンは、2 ^ （量子ビット数）個の状態で構成される重ね合わせを作成するために
一般的に使用されます。

Qブロックがゴールドになったら、パズルが解けたという意味です。おめでとうございます！
]]
q_command.areas.equal_super_3wire_escape.help_btn_caption = {}
q_command.areas.equal_super_3wire_escape.help_btn_caption.en = "Equal superposition with three qubits"
q_command.areas.equal_super_3wire_escape.help_btn_caption.es = q_command.areas.equal_super_3wire_escape.help_btn_caption.en
q_command.areas.equal_super_3wire_escape.help_btn_caption.ja = "3量子ビットの均等な重ね合わせ"


-------- Room 10 (Level I)
q_command.areas.bell_phi_plus_escape = {}
q_command.areas.bell_phi_plus_escape.region = q_command.regions.esc_rooms_level_1
table.insert(q_command.regions.esc_rooms_level_1, q_command.areas.bell_phi_plus_escape)
q_command.areas.bell_phi_plus_escape.area_num = #q_command.regions.esc_rooms_level_1

q_command.areas.bell_phi_plus_escape.center_pos = {x = 268, y = 0, z = 92}
q_command.areas.bell_phi_plus_escape.radius = 5
q_command.areas.bell_phi_plus_escape.q_block_pos = {x = 266, y = 0, z = 94}

q_command.areas.bell_phi_plus_escape.door_pos = {x = 263, y = 0, z = 94}
q_command.areas.bell_phi_plus_escape.portal_pos = {x = 273, y = 1, z = 92}
q_command.areas.bell_phi_plus_escape.chest_pos = {x = 272, y = 0, z = 90}
q_command.areas.bell_phi_plus_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "circuit_blocks:circuit_blocks_h_gate", [31] = "circuit_blocks:control_tool", [32] = ""
        }
    }
}
q_command.areas.bell_phi_plus_escape.solution_statevector =
{{r=0.707,i=0},{r=0,i=0},{r=0,i=0},{r=0.707,i=0}}

q_command.areas.bell_phi_plus_escape.help_chat_msg = {
	"Now we'll experiment with a phenomenon known as 'quantum entanglement' that Einstein",
	"referred to as 'spooky actions at a distance'. Your challenge is to entangle two",
	"qubits so that each one will have the same measurement result. Hint: You'll click the",
	"X gate while wielding the Control Tool to turn in into a CNOT gate."
}
q_command.areas.bell_phi_plus_escape.help_chat_msg.es = {
	"Ahora vamos a experimentar con un fenómeno llamado “entrelazamiento cuántico”, y al que",
	"Einstein se refería como “acciones espeluznantes a distancia”. El reto consiste en entrelazar",
	"dos cubits de tal forma que se obtenga la misma medida para ambos. Pista: sostén la",
	"Herramienta Control y haz clic en la puerta X para convertirla en una puerta CNOT."
}
q_command.areas.bell_phi_plus_escape.help_chat_msg.ja = {
	"次に、アインシュタインが「不気味な遠隔作用」とよんだ「量子もつれ」の現象を実験 ",
	"します。 あなたの課題は、それぞれが同じ測定結果を持つように、2つの量子ビットを ",
	"エンタングルすることです。 ヒント：コントロールツールを使用してXゲートをクリッ ",
	"クすると、CNOTゲートに変わります。"
}
q_command.areas.bell_phi_plus_escape.help_chat_sent = false
q_command.areas.bell_phi_plus_escape.help_success_msg = {
	"Amazing! You've just entangled two qubits in one of the four Bell states. This one is",
	"known as the 'phi +' state. Did you notice that the Bloch spheres have question marks",
	"in them? That's because an entangled state can't be expressed in terms of the states of",
	"its qubits."
}
q_command.areas.bell_phi_plus_escape.help_success_msg.es = {
	"¡Impresionante! Acabas de entrelazar dos cubits en uno de los cuatro estados de Bell. Este se",
	"conoce con el nombre de estado “phi +”. ¿Te has dado cuenta de que la esfera de Bloch",
	"muestra símbolos de interrogación en ella? Esto se debe a que un estado entrelazado no",
	"puede exprese en términos de los estados de sus cúbits."
}
q_command.areas.bell_phi_plus_escape.help_success_msg.ja = {
	"すごいです！ 4つのベル状態のうちの1つである、2つの量子ビットがもつれた状態になりまし ",
	"た。 これは「Φ+」状態として知られています。 ブロッホ球に？マークがついていることに気 ",
	"づきましたか？ エンタングルメント状態は、一つの量子ビットの状態で表せないからです。"
}
q_command.areas.bell_phi_plus_escape.success_chat_sent = false

q_command.areas.bell_phi_plus_escape.help_btn_text = {}
q_command.areas.bell_phi_plus_escape.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to a quantum state of
sqrt(1/2) |00> + sqrt(1/2) |11> which is referred to as the phi+ Bell
state.
----

The four simplest examples of quantum entanglement are the Bell states.
The most well-known Bell state, symbolized by phi+, may be
realized with a Hadamard gate and a CNOT gate. The CNOT gate is a
two-wire gate that has the appearance of cross-hairs and a vertical line
with a dot. The cross-hairs symbol has the functionality of the X gate,
with the difference being that it is conditional on the state of the
other wire, performing the NOT operation whenever the other wire is |1>.

Measuring one of the qubits results in the measured state of the other
qubit to be determined. A correct phi+ Bell state solution will have
probabilities indicating that measurement results |00> and |11> are
equally likely, as well has having identical phases. The notation for a
phase on these block-world circuits is an arrow that points in a
direction signifying its counterclockwise rotation, from 0 radians
pointing rightward.

One way to realize this state is to place a Hadamard gate on the top
wire, and an X gate on the second wire in a column to the right of the
Hadamard gate. Then select the control tool from the hotbar (after
having retrieved it from the chest). While positioning the cursor on the
X gate in the circuit, left-click until the control qubit is on the same
wire as the Hadamard gate.

If the Q block turned gold, congratulations on solving the puzzle!
]]
q_command.areas.bell_phi_plus_escape.help_btn_text.es = q_command.areas.bell_phi_plus_escape.help_btn_text.en
q_command.areas.bell_phi_plus_escape.help_btn_text.ja =
[[
TLDR：青い液体レベルを、phi +ベル状態と呼ばれるsqrt（1/2）|00> + sqrt（1/2）|11>の量子
状態に対応させます。
----

量子エンタングルメントの最もシンプルな4つの例は、ベル状態です。Φ+に象徴される最も有
名なベル状態は、アダマールゲートとCNOTゲートで実現できます。 CNOTゲートは、十字線
と点のある垂直線の外観を持つ2線式のゲートです。十字記号にはXゲートの機能があります
が、違いはもう一方の線の状態を条件とし、その線が|1>である場合は常にNOT演算を実行する
ことです。

片方の量子ビットを測定すると、もう一方の量子ビットの測定状態が決定されます。正しいΦ+
のベル状態の解には、|00>と|11>の測定される確率が等しく、同じ位相になります。ここのブ
ロックワールドの回路上の位相の表記は、右向き矢印が 0ラジアンで、そこから反時計回りの
回転です。

この状態を実現する1つの方法は、上の線にアダマールゲートを配置し、アダマールゲートの
右の列の上から2番目の線にXゲートを配置し、ホットバーからコントロールツールを選択
（チェストから取得した後）します。 回路内のXゲートにカーソルを置きながら、制御量子ビッ
トがアダマールゲートと同じ線上にくるまで左クリックします。

Qブロックがゴールドになったら、パズルが解けたという意味です。おめでとうございます！
]]
q_command.areas.bell_phi_plus_escape.help_btn_caption = {}
q_command.areas.bell_phi_plus_escape.help_btn_caption.en = "Make the phi+ Bell state"
q_command.areas.bell_phi_plus_escape.help_btn_caption.es = q_command.areas.bell_phi_plus_escape.help_btn_caption.en
q_command.areas.bell_phi_plus_escape.help_btn_caption.ja = "Φ+ のベル状態を作る"


-------- Room 11 (Level I)
q_command.areas.bell_phi_minus_escape = {}
q_command.areas.bell_phi_minus_escape.region = q_command.regions.esc_rooms_level_1
table.insert(q_command.regions.esc_rooms_level_1, q_command.areas.bell_phi_minus_escape)
q_command.areas.bell_phi_minus_escape.area_num = #q_command.regions.esc_rooms_level_1

q_command.areas.bell_phi_minus_escape.center_pos = {x = 258, y = 0, z = 92}
q_command.areas.bell_phi_minus_escape.radius = 5
q_command.areas.bell_phi_minus_escape.q_block_pos = {x = 256, y = 0, z = 90}

q_command.areas.bell_phi_minus_escape.door_pos = {x = 256, y = 0, z = 87}
q_command.areas.bell_phi_minus_escape.portal_pos = {x = 263, y = 1, z = 92}
q_command.areas.bell_phi_minus_escape.chest_pos = {x = 260, y = 0, z = 96}
q_command.areas.bell_phi_minus_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "circuit_blocks:circuit_blocks_h_gate", [31] = "circuit_blocks:control_tool", [32] = ""
        }
    }
}
q_command.areas.bell_phi_minus_escape.solution_statevector =
{{r=0.707,i=0},{r=0,i=0},{r=0,i=0},{r=-0.707,i=0}}

q_command.areas.bell_phi_minus_escape.help_chat_msg = {
	"Now entangle two qubits in another way, known as the 'phi -' Bell state."
}
q_command.areas.bell_phi_minus_escape.help_chat_msg.es = {
	"Ahora entrelaza dos cúbits de otra manera, conocida como el estado de Bell “phi -“."
}
q_command.areas.bell_phi_minus_escape.help_chat_msg.ja = {
	"さあ、「Φ-」のベル状態として知られる、別の方法で2つの量子ビットをエンタングル ",
	"さえましょう。"
}
q_command.areas.bell_phi_minus_escape.help_chat_sent = false
q_command.areas.bell_phi_minus_escape.help_success_msg = {
	"Congratulations! You entangled those qubits in such a way that the measurement results",
	"are the same as the previous, 'phi +', Bell state. But did you notice that the phases",
	"in the relevant basis states are pi radians out of phase?"
}
q_command.areas.bell_phi_minus_escape.help_success_msg.es = {
	"¡Enhorabuena! Has entrelazado esos cúbits de forma que los resultados medidos son los",
	"mismos que en el estado anterior, “phi +”. ¿Pero te has dado cuenta de que las fases de los",
	"estados se encuentran desfasadas PI radianes?"
}
q_command.areas.bell_phi_minus_escape.help_success_msg.ja = {
	"おめでとうございます！ 前の「Φ+」のベル状態と同じ測定結果になるように、量子 ",
	"ビットをエンタングルさせることができました。 ただし、基底状態の位相がπずれてい ",
	"ることに気づきましたか？"
}
q_command.areas.bell_phi_minus_escape.success_chat_sent = false

q_command.areas.bell_phi_minus_escape.help_btn_text = {}
q_command.areas.bell_phi_minus_escape.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to a quantum state of
sqrt(1/2) |00> - sqrt(1/2) |11> which is referred to as the phi- Bell
state.
----

The four simplest examples of quantum entanglement are the Bell states.
One of these Bell states, symbolized by phi- (phi minus), may be realized
by placing an X gate on the top wire, and adding the phi+ Bell state
circuit (as instructed in another puzzle) to the right of the X gate.

Measuring one of the qubits results in the measured state of the other
qubit to be determined. A correct phi- Bell state solution will have
probabilities indicating that measurement results |00> and |11> are
equally likely, as well has having opposite phases. The notation for a
phase on these block-world circuits is an arrow that points in a
direction signifying its counterclockwise rotation, from 0 radians
pointing rightward. As an example, a leftward pointing arrow signifies a
phase of pi radians.

If the Q block turned gold, congratulations on solving the puzzle!
]]
q_command.areas.bell_phi_minus_escape.help_btn_text.es = q_command.areas.bell_phi_minus_escape.help_btn_text.en
q_command.areas.bell_phi_minus_escape.help_btn_text.ja =
[[
TLDR：青い液体レベルを、sqrt（1/2）|00>-sqrt（1/2）|11>の量子状態に対応させます。これ
は、Φ-のベル状態と呼ばれます。
----

量子エンタングルメントの最もシンプルな4つの例は、ベル状態です。これらのベル状態の1つ
は、Φ-（phi -）と呼ばれXゲートを上の線に配置し、Xゲートの右側にΦ+ のベル状態回路（別
のパズルで示しました）を追加することで実現できます。

片方の量子ビットを測定すると、もう一方の量子ビットの測定状態が決定されます。正しいΦ-
のベル状態の解は、|00>と|11>の測定される確率が等しく、位相が逆です。ここのブロック
ワールドの回路上の位相の表記は、右向き矢印が 0ラジアンで、そこから反時計回りの回転で
す。例として、左向きの矢印は、πラジアンの位相を示します。

Qブロックがゴールドになったら、パズルが解けたという意味です。おめでとうございます！
]]
q_command.areas.bell_phi_minus_escape.help_btn_caption = {}
q_command.areas.bell_phi_minus_escape.help_btn_caption.en = "Make the phi- Bell state"
q_command.areas.bell_phi_minus_escape.help_btn_caption.es = q_command.areas.bell_phi_minus_escape.help_btn_caption.en
q_command.areas.bell_phi_minus_escape.help_btn_caption.ja = "Φ- のベル状態を作る"


-------- Room 12 (Level I)
q_command.areas.bell_psi_plus_escape = {}
q_command.areas.bell_psi_plus_escape.region = q_command.regions.esc_rooms_level_1
table.insert(q_command.regions.esc_rooms_level_1, q_command.areas.bell_psi_plus_escape)
q_command.areas.bell_psi_plus_escape.area_num = #q_command.regions.esc_rooms_level_1

q_command.areas.bell_psi_plus_escape.center_pos = {x = 258, y = 0, z = 82}
q_command.areas.bell_psi_plus_escape.radius = 5
q_command.areas.bell_psi_plus_escape.q_block_pos = {x = 260, y = 0, z = 80}

q_command.areas.bell_psi_plus_escape.door_pos = {x = 253, y = 0, z = 80}
q_command.areas.bell_psi_plus_escape.portal_pos = {x = 263, y = 1, z = 82}
q_command.areas.bell_psi_plus_escape.chest_pos = {x = 254, y = 0, z = 84}
q_command.areas.bell_psi_plus_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "circuit_blocks:circuit_blocks_h_gate", [31] = "circuit_blocks:control_tool", [32] = ""
        }
    }
}
q_command.areas.bell_psi_plus_escape.solution_statevector =
{{r=0,i=0},{r=0.707,i=0},{r=0.707,i=0},{r=0,i=0}}

q_command.areas.bell_psi_plus_escape.help_chat_msg = {
	"Go ahead and entangle the two qubits in yet another way, this time in which the",
	"measurement result of one qubit is the opposite result of measuring the other qubit."
}
q_command.areas.bell_psi_plus_escape.help_chat_msg.es = {
	"Continua y entrelaza ambos cúbits de otra forma más, esta vez en una en la que el resultado",
	"de un cúbit sea siempre opuesto al resultado del otro."
}
q_command.areas.bell_psi_plus_escape.help_chat_msg.ja = {
	"先に進み、2つの量子ビットをさらに別の方法でエンタングルさせます。今回は、一つ ",
	"の量子ビットの測定結果が、もう一つの量子ビットの測定結果の逆になります。"
}
q_command.areas.bell_psi_plus_escape.help_chat_sent = false
q_command.areas.bell_psi_plus_escape.help_success_msg = {
	"Well done! The state you made is known as the 'psi +', Bell state."
}
q_command.areas.bell_psi_plus_escape.help_success_msg.es = {
	"¡Bien hecho! Este estado se conoce como el estado de Bell “psi +”."
}
q_command.areas.bell_psi_plus_escape.help_success_msg.ja = {
	"よくできました！ あなたが作った状態は、「Ψ+」のベル状態として知られています。"
}
q_command.areas.bell_psi_plus_escape.success_chat_sent = false

q_command.areas.bell_psi_plus_escape.help_btn_text = {}
q_command.areas.bell_psi_plus_escape.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to a quantum state of
sqrt(1/2) |01> + sqrt(1/2) |10> which is referred to as the psi+ Bell
state.
----

The four simplest examples of quantum entanglement are the Bell states.
One of these Bell states, symbolized by psi+ (psi plus), may be realized
by placing an X gate on the second wire, and adding the phi+ Bell state
circuit (as instructed in another puzzle) to the right of the X gate,

Measuring one of the qubits results in the measured state of the other
qubit to be determined. A correct psi+ Bell state solution will have
probabilities indicating that measurement results |01> and |10> are
equally likely, as well has having identical phases. The notation for a
phase on these block-world circuits is an arrow that points in a
direction signifying its counterclockwise rotation, from 0 radians
pointing rightward. The psi+ Bell state is known as one of the singlet
states, where measuring one of the qubits determines that the other
qubit will be measured as the opposite state.

If the Q block turned gold, congratulations on solving the puzzle!
]]
q_command.areas.bell_psi_plus_escape.help_btn_text.es = q_command.areas.bell_psi_plus_escape.help_btn_text.en
q_command.areas.bell_psi_plus_escape.help_btn_text.ja =
[[
TLDR：青い液体レベルをΨ+ のベル状態と呼ばれるsqrt（1/2）|01> + sqrt（1/2）|10>の量子状
態に対応させます。
----

量子エンタングルメントの最もシンプルな4つの例は、ベル状態です。これらのベル状態の1つ
は、Ψ+（psi +）で表され、2番目の線にXゲートを配置し、Xゲートの右側にΦ+のベル状態回
路（別のパズルで指示されています）を追加することで実現できます。

片方の量子ビットを測定すると、もう一方の量子ビットの測定状態が決定されます。正しいΨ+
のベル状態の解は、 |01>と|10>が測定される可能性が等しく、位相が等しくなります。ここの
ブロックワールドの回路上の位相の表記は、右向き矢印が 0ラジアンで、そこから反時計回り
の回転です。Ψ+のベル状態は一重項状態の1つとして知られており、量子ビットの1つを測定
すると、もう一方の量子ビットが反対の状態となることが決まります。

Qブロックがゴールドになったら、パズルが解けたという意味です。おめでとうございます！
]]
q_command.areas.bell_psi_plus_escape.help_btn_caption = {}
q_command.areas.bell_psi_plus_escape.help_btn_caption.en = "Make the psi+ Bell state"
q_command.areas.bell_psi_plus_escape.help_btn_caption.es = q_command.areas.bell_psi_plus_escape.help_btn_caption.en
q_command.areas.bell_psi_plus_escape.help_btn_caption.ja = "Ψ+ のベル状態を作る"


-------- Room 13 (Level I)
q_command.areas.bell_psi_minus_escape = {}
q_command.areas.bell_psi_minus_escape.region = q_command.regions.esc_rooms_level_1
table.insert(q_command.regions.esc_rooms_level_1, q_command.areas.bell_psi_minus_escape)
q_command.areas.bell_psi_minus_escape.area_num = #q_command.regions.esc_rooms_level_1

q_command.areas.bell_psi_minus_escape.center_pos = {x = 248, y = 0, z = 82}
q_command.areas.bell_psi_minus_escape.radius = 5
q_command.areas.bell_psi_minus_escape.q_block_pos = {x = 245, y = 0, z = 80}

q_command.areas.bell_psi_minus_escape.door_pos = {x = 250, y = 0, z = 87}
q_command.areas.bell_psi_minus_escape.portal_pos = {x = 253, y = 1, z = 82}
q_command.areas.bell_psi_minus_escape.chest_pos = {x = 250, y = 0, z = 78}
q_command.areas.bell_psi_minus_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate", [26] = "", [27] = "circuit_blocks:circuit_blocks_z_gate", [28] = "",
                [29] = "", [30] = "circuit_blocks:circuit_blocks_h_gate", [31] = "circuit_blocks:control_tool", [32] = ""
        }
    }
}
q_command.areas.bell_psi_minus_escape.solution_statevector =
{{r=0,i=0},{r=0.707,i=0},{r=-0.707,i=0},{r=0,i=0}}

q_command.areas.bell_psi_minus_escape.help_chat_msg = {
	"Let's tackle the fourth and final Bell state, this time also using a Z gate."
}
q_command.areas.bell_psi_minus_escape.help_chat_msg.es = {
	"Vamos a por el cuarto estado de Bell, esta vez usando una puerta Z."
}
q_command.areas.bell_psi_minus_escape.help_chat_msg.ja = {
	"4番目のそして最後のベル状態に取り組みましょう。今度はZゲートを使います。"
}
q_command.areas.bell_psi_minus_escape.help_chat_sent = false
q_command.areas.bell_psi_minus_escape.help_success_msg = {
	"Awesome! This one is called the 'psi -', Bell state."
}
q_command.areas.bell_psi_minus_escape.help_success_msg.es = {
	"¡Alucinante! Este es el estado de Bell “psi -“."
}
q_command.areas.bell_psi_minus_escape.help_success_msg.ja = {
	"お見事です！ これは「Ψ-」のベル状態と呼ばれます。"
}
q_command.areas.bell_psi_minus_escape.success_chat_sent = false

q_command.areas.bell_psi_minus_escape.help_btn_text = {}
q_command.areas.bell_psi_minus_escape.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to a quantum state of
sqrt(1/2) |01> - sqrt(1/2) |10> which is referred to as the psi- Bell
state.
----

The four simplest examples of quantum entanglement are the Bell states.
One of these Bell states, symbolized by psi- (psi minus), may be realized
by placing an X gate on the second wire, adding the phi+ Bell state
circuit (as instructed in another puzzle) to the right of the X gate,
and adding a Z gate to the second wire after the phi+ Bell state circuit.

Measuring one of the qubits results in the measured state of the other
qubit to be determined. A correct psi- Bell state solution will have
probabilities indicating that measurement results |01> and |10> are
equally likely, as well has having opposite phases. The notation for a
phase on these block-world circuits is an arrow that points in a
direction signifying its counterclockwise rotation, from 0 radians
pointing rightward. As an example, a leftward pointing arrow signifies a
phase of pi radians. The psi- Bell state is known as one of the singlet
states, where measuring one of the qubits determines that the other
qubit will be measured as the opposite state.

If the Q block turned gold, congratulations on solving the puzzle!
]]
q_command.areas.bell_psi_minus_escape.help_btn_text.es = q_command.areas.bell_psi_minus_escape.help_btn_text.en
q_command.areas.bell_psi_minus_escape.help_btn_text.ja =
[[
TLDR：青い液体レベルをsqrt（1/2）|01>-sqrt（1/2）|10>の量子状態に対応させます。これ
は、Ψ-のベル状態と呼ばれます。
----

量子エンタングルメントの最もシンプルな4つの例は、ベル状態です。これらのベル状態の1つ
は、Ψ-（psi -）と呼ばれ、Xゲートを2番目の線に配置し、Xゲートの右側にΦ +のベル状態の
回路（別のパズルで示されました）を追加し、その後に2番目の線にZゲートを追加することで
実現できます。

片方の量子ビットを測定すると、もう片方の量子ビットの測定状態が決定されます。正確なΨ-
のベル状態の解は、|01>と|10>が測定される確率が等しく、逆の位相を持ちます。ここのブ
ロックワールドの回路上の位相の表記は、右向き矢印が 0ラジアンで、そこから反時計回りの
回転です。例として、左向きの矢印は、πラジアンの位相を示します。 Ψ-のベル状態は一重項
状態の1つとして知られており、片方の量子ビットを測定すると、もう片方の量子ビットが反
対の状態となることが決まります。

Qブロックがゴールドになったら、パズルが解けたという意味です。おめでとうございます！
]]
q_command.areas.bell_psi_minus_escape.help_btn_caption = {}
q_command.areas.bell_psi_minus_escape.help_btn_caption.en = "Make the psi- Bell state"
q_command.areas.bell_psi_minus_escape.help_btn_caption.es = q_command.areas.bell_psi_minus_escape.help_btn_caption.en
q_command.areas.bell_psi_minus_escape.help_btn_caption.ja = "Ψ- のベル状態を作る"


-------- Room 14 (Level I)
q_command.areas.ghz_state_escape = {}
q_command.areas.ghz_state_escape.region = q_command.regions.esc_rooms_level_1
table.insert(q_command.regions.esc_rooms_level_1, q_command.areas.ghz_state_escape)
q_command.areas.ghz_state_escape.area_num = #q_command.regions.esc_rooms_level_1

q_command.areas.ghz_state_escape.center_pos = {x = 248, y = 0, z = 92}
q_command.areas.ghz_state_escape.radius = 5
q_command.areas.ghz_state_escape.q_block_pos = {x = 244, y = 0, z = 96}

q_command.areas.ghz_state_escape.door_pos = {x = 243, y = 0, z = 94}
q_command.areas.ghz_state_escape.portal_pos = {x = 253, y = 1, z = 92}
q_command.areas.ghz_state_escape.chest_pos = {x = 252, y = 0, z = 90}
q_command.areas.ghz_state_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "", [20] = "",
                [21] = "", [22] = "", [23] = "", [24] = "",
                [25] = "circuit_blocks:circuit_blocks_x_gate", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "circuit_blocks:circuit_blocks_h_gate", [31] = "circuit_blocks:control_tool", [32] = ""
        }
    }
}
q_command.areas.ghz_state_escape.solution_statevector =
{{r=0.707,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0.707,i=0}}

q_command.areas.ghz_state_escape.help_chat_msg = {
	"Next you'll entangle three qubits so that they all either measure 0s or 1s"
}
q_command.areas.ghz_state_escape.help_chat_msg.es = {
	"Ahora entrelazarás tres cúbits de forma que todos midan o 0, o 1."
}
q_command.areas.ghz_state_escape.help_chat_msg.ja = {
	"次は、3つの量子ビットをエンタングルして、すべてが0またはすべてが1に測定される ",
	"状態を作ります。"
}
q_command.areas.ghz_state_escape.help_chat_sent = false
q_command.areas.ghz_state_escape.help_success_msg = {
	"Congratulations! You've successfully created a state known as GHZ."
}
q_command.areas.ghz_state_escape.help_success_msg.es = {
	"¡Enhorabuena! Has creado el estado conocido como “GHZ”."
}
q_command.areas.ghz_state_escape.help_success_msg.ja = {
	"おめでとうございます！ GHZとよばれる状態を正しく作成しました。"
}
q_command.areas.ghz_state_escape.success_chat_sent = false

q_command.areas.ghz_state_escape.help_btn_text = {}
q_command.areas.ghz_state_escape.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to a quantum state of
sqrt(1/2) |000> - sqrt(1/2) |111> which is referred to as the GHZ state.
----

GHZ (Greenberger–Horne–Zeilinger) states are entangled states involving
three or more qubits, where the basis states involved contain all zeros
or all ones. For example, the entangled state in this three-wire circuit
puzzle has equal probabilities of being measured as |000> and |111>.
Please refer to the Bell state circuit puzzles for more information on
entanglement.

One way to realize this state is to place a Hadamard gate on the top
wire, and an X gate on the second wire in a column to the right of the
Hadamard gate. Then select the control tool from the hotbar (after
having retrieved it from the chest). While positioning the cursor on the
X gate in the circuit, convert it to a CNOT gate by left-clicking, until
the control qubit is on the same wire as the Hadamard gate. Repeat this
process to place another CNOT gate whose X gate is on the third wire and
control qubit is on the top wire.

Note that measuring the circuit (by right-clicking the measurement
blocks) results in either |000> or |111> each time.

If the Q block turned gold, congratulations on solving the puzzle!
]]
q_command.areas.ghz_state_escape.help_btn_text.es = q_command.areas.ghz_state_escape.help_btn_text.en
q_command.areas.ghz_state_escape.help_btn_text.ja =
[[
TLDR：青い液体レベルをGHZ状態と呼ばれるsqrt（1/2）|000>-sqrt（1/2）|111>の量子状態に
対応させます。
----

GHZ（グリーンバーガー＝ホーン＝ツァイリンガー）状態は、3つ以上の量子ビットが関与す
るもつれ状態であり、基底状態はすべて0またはすべて1です。たとえば、この3線式回路パズ
ルのもつれ状態は、|000>と|111>の測定される確率が等しくなります。エンタングルメントの
詳細については、ベル状態の回路パズルを参照してください。

この状態を実現する1つの方法は、上の線にアダマールゲートを配置し、アダマールゲートの
右側の列の2番目の線にXゲートを配置し、次に、ホットバーからコントロールツールを選択
（チェストから取得した後）します。回路内のXゲートにカーソルを置きながら、制御量子
ビットがアダマールゲートと同じ線上に来るまで左クリックして、カーソルをCNOTゲートに
変換します。同じようにして、Xゲートを3番目に、制御量子ビットが最上部の線にあるように
別のCNOTゲートを配置します。

（測定ブロックを右クリックして）回路を測定すると、毎回|000>または|111>になります。

Qブロックがゴールドになったら、パズルが解けたという意味です。おめでとうござい
ます！
]]
q_command.areas.ghz_state_escape.help_btn_caption = {}
q_command.areas.ghz_state_escape.help_btn_caption.en = "Make the GHZ state"
q_command.areas.ghz_state_escape.help_btn_caption.es = q_command.areas.ghz_state_escape.help_btn_caption.en
q_command.areas.ghz_state_escape.help_btn_caption.ja = "GHZ状態を作る"


-------- Room 15 (Level I)
q_command.areas.y_z_rot_1wire_escape = {}
q_command.areas.y_z_rot_1wire_escape.region = q_command.regions.esc_rooms_level_1
table.insert(q_command.regions.esc_rooms_level_1, q_command.areas.y_z_rot_1wire_escape)
q_command.areas.y_z_rot_1wire_escape.area_num = #q_command.regions.esc_rooms_level_1

q_command.areas.y_z_rot_1wire_escape.center_pos = {x = 238, y = 0, z = 92}
q_command.areas.y_z_rot_1wire_escape.radius = 5
q_command.areas.y_z_rot_1wire_escape.q_block_pos = {x = 236, y = 0, z = 90}

q_command.areas.y_z_rot_1wire_escape.door_pos = {x = 236, y = 0, z = 87}
q_command.areas.y_z_rot_1wire_escape.portal_pos = {x = 243, y = 1, z = 92}
q_command.areas.y_z_rot_1wire_escape.chest_pos = {x = 240, y = 0, z = 96}
q_command.areas.y_z_rot_1wire_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "circuit_blocks:circuit_blocks_ry_gate_0p16", [19] = "circuit_blocks:circuit_blocks_rz_gate_0p16", [20] = "",
                [21] = "", [22] = "", [23] = "circuit_blocks:rotate_tool", [24] = "",
                [25] = "", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "", [31] = "", [32] = ""
        }
    }
}
q_command.areas.y_z_rot_1wire_escape.solution_statevector =
{{r=0.924,i=0},{r=-0,i=0.383}}

q_command.areas.y_z_rot_1wire_escape.help_chat_msg = {
	"In this puzzle you'll experiment with the effects of rotating the state of a",
	"qubit in the Y and Z axes. Hint: You'll click the Ry and Rz blocks while wielding",
	"the Rotate Tool."
}
q_command.areas.y_z_rot_1wire_escape.help_chat_msg.es = {
	"En este puzzle experimentarás con los efectos de rotar el estado de un cúbit alrededor de los",
	"ejes Y y Z. Pista: sostén la Herramienta Rotación y haz clic en los bloques Ry y Rz."
}
q_command.areas.y_z_rot_1wire_escape.help_chat_msg.ja = {
	"このパズルでは、Y軸とZ軸で量子ビットの状態を回転させる効果を実験します。 ヒン ",
	"ト：回転ツールを使用しながら、RyブロックとRzブロックをクリックします。"
}
q_command.areas.y_z_rot_1wire_escape.help_chat_sent = false
q_command.areas.y_z_rot_1wire_escape.help_success_msg = {
	"Nice work! Did you notice that rotating the qubit on the Y axis changed the",
	"measurement probabilities, but rotating on the Z axis didn't?"
}
q_command.areas.y_z_rot_1wire_escape.help_success_msg.es = {
	"¡Bien hecho! ¿Te has dado cuenta de que, rotando el cúbit alrededor del eje Y, cambian las",
	"probabilidades de la medida, pero rotándolo alrededor de Z, no cambian?"
}
q_command.areas.y_z_rot_1wire_escape.help_success_msg.ja = {
	"よくできました！ Y軸で量子ビットを回転させると測定される確率は変わりますが、Z ",
	"軸で回転させても変わらないということに気づきましたか？"
}
q_command.areas.y_z_rot_1wire_escape.success_chat_sent = false

q_command.areas.y_z_rot_1wire_escape.help_btn_text = {}
q_command.areas.y_z_rot_1wire_escape.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to the following quantum
state:
sqrt(0.85) |0> + sqrt(0.15) e^i pi/2 |1>
----

This circuit leverages Ry and Rz gates to create a state that has approx
85% probability of measuring |0> and approx 15% probability of measuring
|1>. The latter basis states has a phase of pi/2. To solve this
circuit puzzle, place Ry and Rz gates on the wire, and change their
rotation angles by left and right-clicking the rotate tool until the
desired state is achieved.

If the Q block turned gold, congratulations on solving the puzzle!
]]
q_command.areas.y_z_rot_1wire_escape.help_btn_text.es = q_command.areas.y_z_rot_1wire_escape.help_btn_text.en
q_command.areas.y_z_rot_1wire_escape.help_btn_text.ja =
[[
TLDR：青い液体レベルを次の量子状態に対応させます：
sqrt（0.85）|0> + sqrt（0.15）e ^ i pi/2 |1>
----

この回路は、RyおよびRzゲートを使って、|0>を測定する確率が約85％、|1>を測定する確率が
約15％になる状態を作成します。 後者の基底状態の位相はpi/2です。 この回路パズルを解くに
は、線上にRyおよびRzゲートを配置し、回転ツールを左および右クリックして、目的の状態に
なるまで回転角度を調整します。

Qブロックがゴールドになったら、パズルが解けたという意味です。おめでとうござい
ます！
]]
q_command.areas.y_z_rot_1wire_escape.help_btn_caption = {}
q_command.areas.y_z_rot_1wire_escape.help_btn_caption.en = "Rotate a qubit into a desired state"
q_command.areas.y_z_rot_1wire_escape.help_btn_caption.es = q_command.areas.y_z_rot_1wire_escape.help_btn_caption.en
q_command.areas.y_z_rot_1wire_escape.help_btn_caption.ja = "量子ビットを求める状態に回転する"


-------- Room 16 (Level I)
q_command.areas.phase_rot_2wire_escape = {}
q_command.areas.phase_rot_2wire_escape.region = q_command.regions.esc_rooms_level_1
table.insert(q_command.regions.esc_rooms_level_1, q_command.areas.phase_rot_2wire_escape)
q_command.areas.phase_rot_2wire_escape.area_num = #q_command.regions.esc_rooms_level_1

q_command.areas.phase_rot_2wire_escape.center_pos = {x = 238, y = 0, z = 82}
q_command.areas.phase_rot_2wire_escape.radius = 5
q_command.areas.phase_rot_2wire_escape.q_block_pos = {x = 240, y = -1, z = 80}

q_command.areas.phase_rot_2wire_escape.door_pos = {x = 233, y = 0, z = 80}
q_command.areas.phase_rot_2wire_escape.portal_pos = {x = 243, y = 1, z = 82}
q_command.areas.phase_rot_2wire_escape.chest_pos = {x = 234, y = 0, z = 84}
q_command.areas.phase_rot_2wire_escape.chest_inv = {
    inventory = {
        main = {[1] = "", [2] = "", [3] = "", [4] = "",
                [5] = "", [6] = "", [7] = "", [8] = "",
                [9] = "", [10] = "", [11] = "", [12] = "",
                [13] = "", [14] = "", [15] = "", [16] = "",
                [17] = "", [18] = "", [19] = "circuit_blocks:circuit_blocks_rz_gate_0p16", [20] = "",
                [21] = "", [22] = "", [23] = "circuit_blocks:rotate_tool", [24] = "",
                [25] = "", [26] = "", [27] = "", [28] = "",
                [29] = "", [30] = "circuit_blocks:circuit_blocks_h_gate", [31] = "", [32] = ""
        }
    }
}
q_command.areas.phase_rot_2wire_escape.solution_statevector =
{{r=0.5,i=0},{r=-0,i=0.5},{r=0,i=-0.5},{r=0.5,i=0}}

q_command.areas.phase_rot_2wire_escape.help_chat_msg = {
	"Now you'll experiment with a pattern commonly used in quantum computing algorithms,",
	"in which Z axis rotations are sandwiched between pairs of H gates."
}
q_command.areas.phase_rot_2wire_escape.help_chat_msg.es = {
	"Ahora experimentarás con un patrón comúnmente utilizado en algoritmos cuánticos, donde",
	"rotaciones alrededor del eje Z se encuentran en medio de pares de puertas H, como si fueran",
	"el relleno de un sándwich."
}
q_command.areas.phase_rot_2wire_escape.help_chat_msg.ja = {
	"次に、量子計算アルゴリズムで一般的に使用されるパターンを実験します。このパター ",
	"ンでは、Z軸の回転がHゲートのペアの間に挟まれています。"
}
q_command.areas.phase_rot_2wire_escape.help_chat_sent = false
q_command.areas.phase_rot_2wire_escape.help_success_msg = {
	"Well done! The H gates transformed changes in phase to changes in measurement",
	"probabilities.",
	"Congratulations on solving these circuit puzzles! Feel free to revisit any of them,",
	"and then explore other areas after climbing the ladder back to the main room."
}
q_command.areas.phase_rot_2wire_escape.help_success_msg.es = {
	"¡Muy bien! Las puertas H transforman cambios en la fase en cambios en la probabilidad.",
	"¡Mi más sentida enhorabuena por haber resuelto estos puzzles de circuitos! Vuelve a",
	"cualquiera de ellos si quieres y explora otras áreas tras subir las escaleras de vuelta",
	"a la habitación principal."
}
q_command.areas.phase_rot_2wire_escape.help_success_msg.ja = {
	"よくできました！ Hゲートによって、位相の変化を測定される確率の変化に変換しま ",
	"した。おめでとうございます！ ここのすべての回路パズルを解きました。ここへは、 ",
	"いつでも自由に戻ってこられます。次は、はしごを登ってメインルームに戻り、他のエ ",
	"リアも探索してみてください。"
}
q_command.areas.phase_rot_2wire_escape.success_chat_sent = false

q_command.areas.phase_rot_2wire_escape.help_btn_text = {}
q_command.areas.phase_rot_2wire_escape.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to the following quantum
state:
sqrt(1/4) |00> + sqrt(1/4) e^i pi/2 |01> +
sqrt(1/4) e^i 3pi/2 |10> + sqrt(1/4) |11>
----

This circuit leverages Hadamard gates and Rz gates to create a state
that has equal probabilities of measuring |00>, |01>, |10> and |11>,
with these basis states having various phase rotations. To solve this
circuit puzzle, place an Rz between two H blocks on each wire. Then
rotate the Rx gated by left and right-clicking them until the desired
state is achieved. Notice that phase (Z axis) rotations that you apply
become rotations on the X axis when sandwiched in-between Hadamard gates,
converting changes in phase to changes in measurement probabilities.

If the Q block turned gold, congratulations on solving the puzzle!
]]
q_command.areas.phase_rot_2wire_escape.help_btn_text.es = q_command.areas.phase_rot_2wire_escape.help_btn_text.en
q_command.areas.phase_rot_2wire_escape.help_btn_text.ja =
[[
TLDR：青い液体レベルを次の量子状態に対応させます：
sqrt（1/4）|00> + sqrt（1/4）e ^ i pi/2 |01> +
sqrt（1/4）e ^ i 3pi/2 |10> + sqrt（1/4）|11>
----

この回路は、アダマールゲートとRzゲートを使って、|00>、|01>、|10>、および|11>が等しい
確率で測定される状態を作ります。これらの基底状態はさまざまに回転された位相を持ちま
す。 この回路パズルを解くには、各線の2つのHブロックの間にRzを配置し、 目的の状態にな
るまで、Rzを左および右クリックして回転させます。 適用する位相（Z軸）回転は、アダマー
ルゲートの間に挟まれるとX軸の回転になり、位相の変化を測定確率の変化に変換することに
注意してください。

Qブロックがゴールドになったら、パズルが解けたという意味です。おめでとうございます！
]]
q_command.areas.phase_rot_2wire_escape.help_btn_caption = {}
q_command.areas.phase_rot_2wire_escape.help_btn_caption.en = "Convert phase rotations into measurement probabilities"
q_command.areas.phase_rot_2wire_escape.help_btn_caption.es = q_command.areas.phase_rot_2wire_escape.help_btn_caption.en
q_command.areas.phase_rot_2wire_escape.help_btn_caption.ja = "位相回転を測定確率に変換する"
-- END Escape room puzzles Level I ---------------------------------------------


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

-- Starting room TARDIS
q_command.areas.starting_room_tardis = {}
q_command.areas.starting_room_tardis.region = q_command.regions.starting_room
table.insert(q_command.regions.starting_room, q_command.areas.starting_room_tardis)
q_command.areas.starting_room_tardis.area_num = #q_command.regions.starting_room
q_command.areas.starting_room_tardis.center_pos = {x = 227, y = 9, z = 79}
q_command.areas.starting_room_tardis.radius = 4
q_command.areas.starting_room_tardis.portal_pos = {x = 227, y = 9, z = 81}
q_command.areas.starting_room_tardis.help_chat_msg = {
	"Walk into the TARDIS (blue box) for the portal room"
}


-- Starting room help buttons ------------------------------------------------
q_command.areas.quantum_circuit_world = {}
q_command.areas.quantum_circuit_world.help_btn_text = {}
q_command.areas.quantum_circuit_world.help_btn_text.en =
[[
Welcome to the world of quantum computing circuits! The block-world
environment you are currently in is created with the Minetest.net
open-source library. A list of controls for getting around and doing
things in Minetest are available by pausing the game (e.g. with the Esc
key on some platforms). The quantum gates and circuits with which you
will interact are powered by <https://qiskit.org/> quantum simulators.

There are an increasing number of areas that you may explore in this
environment. First, it would be helpful to read the signs in this room
(by right-clicking them), as they describe the behavior of various
quantum computing related blocks that you will encounter. By the way,
there is no need to take the blocks and tools from this room, as they
will be available in chests along the way. Please leave them in this
room, and come back anytime you have questions about what they do or how
to use them.

If want an escape room-like experience, check out the puzzle rooms at
the bottom of the ladder located in this building. Professor Q will help
guide you through the circuit puzzles by sending chat message to the
upper-left corner of your window.

Another place outside this room that you may want to visit is the
quantum cats sandbox. In that area, some basic quantum computing
circuits and gates are demonstrated with grumpy and happy cats instead
of the usual qubits. To get there, follow the light blocks just outside
the front doors into the woods.

Other places to visit include the quantum circuit garden on the other
side of the large wall outside the front doors, and the 'OpenQASM Chasm'
surrounded by a wooden gate.

Wherever you choose to begin, more help is available by right-clicking
the Help buttons (labeled with a question mark) as you encounter them.
Good luck!
]]
q_command.areas.quantum_circuit_world.help_btn_text.es =
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
q_command.areas.quantum_circuit_world.help_btn_text.ja =
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
q_command.areas.quantum_circuit_world.help_btn_caption = {}
q_command.areas.quantum_circuit_world.help_btn_caption.en = "Read me first!"
q_command.areas.quantum_circuit_world.help_btn_caption.es = q_command.areas.quantum_circuit_world.help_btn_caption.en
q_command.areas.quantum_circuit_world.help_btn_caption.ja = "最初にお読みください"

----------------------------
q_command.areas.x_rx_gates = {}
q_command.areas.x_rx_gates.help_btn_text = {}
q_command.areas.x_rx_gates.help_btn_text.en =
[[
The X and Rx gates rotate a qubit state around the X axis of a Bloch
sphere (refer to the Bloch spheres on the wall). While wielding one of
these gates, right-click to place it on a quantum circuit. The X gate is
often referred to the NOT gate because it flips the |0> state to |1> and
vice-versa.

Once placed, left-click or right-click the Rotate Tool (the rounded tool
spinning on the floor) to rotate its state in increments of π/16 radians
(11.25 degrees), or -π/16 radians, respectively. When first placed, an
Rx gate has a rotation of 0 radians around the X axis. An X gate when
first placed has a rotation of π radians (180 degrees) around the X axis.

To convert an X gate into a controlled-X gate (and vice-versa),
left-click or right-click the block while wielding the Control Tool (the
wand-shaped tool spinning on the floor). Left-clicking moves the control
qubit up one wire, and right-clicking moves the control qubit down one
wire. The controlled-X gate is also known as the controlled-NOT, or CNOT
gate. It acts on a pair of qubits, with one acting as control and the
other as target. It performs an X operation on the target whenever the
control is in state |1>. If the control qubit is in a superposition,
this gate creates entanglement.

To convert a controlled-X gate into a Toffoli gate (and vice-versa),
hold the Special key down while wielding the Control Tool and
left-clicking or right-clicking. Left-clicking moves the second control
qubit up one wire, and right-clicking moves the second control qubit
down one wire. There is a blue dot on the second control qubit to help
you distinguish it from the first control qubit. The Special key
mentioned earlier may be known, and set, by pausing the game and choosing
the Change Keys button.

To remove an X gate, or any other gate from a circuit, left-click it
while wielding a block (or empty-handed if you are close enough).
]]
q_command.areas.x_rx_gates.help_btn_text.es = q_command.areas.x_rx_gates.help_btn_text.en
q_command.areas.x_rx_gates.help_btn_text.ja =
[[
XゲートとRxゲートは、ブロッホ球のX軸を中心に量子ビットの状態を回転させます
（壁にあるブロッホ球を参照）。ゲートを量子回路に配置するには、そのゲートを保持
しながら、右クリックします。 Xゲートは、|0>状態を|1>に反転、またはその逆に反転
させるため、NOTゲートともよばれます。

ゲートを配置したら、回転ツール（床で回っている丸いツール）を左クリックまたは右
クリックして、その状態をそれぞれπ/16ラジアン（11.25度）または-π/16ラジアン単位
で回転させます。最初に配置されたとき、RxゲートはX軸を中心に0ラジアンの回転と
して設定されています。 Xゲートは、X軸を中心にπラジアン（180度）回転に設定され
ています。

Xゲートを制御Xゲートに（およびその逆に）変換するには、コントロールツール（床
で回っている杖型のツール）を保持しながらブロックを左クリックまたは右クリックし
ます。左クリックすると制御量子ビットが一つ上の線に移動し、右クリックすると制御
量子ビットが1つ下の線に移動します。制御Xゲートは、制御NOTゲートまたはCNOT
ゲートともよばれます。これは、一対の量子ビットのペアに作用し、一方が制御側、他
方がターゲット側として機能します。制御量子ビットが状態|1>のとき、ターゲット
ビットにX操作を実行します。制御量子ビットが重ね合わせ状態にあるとき、このゲー
トはエンタングルメント状態を作ります。

制御Xゲートをトフォリゲートに変換するには（逆も同様です）、コントロールツール
を保持し、スペシャルキーを押しながら、左クリックまたは右クリックします。左ク
リックすると、2番目の制御量子ビットが1つ上の線に、右クリックすると2番目の制御
量子ビットが1つ下の線に出ます。 2番目の制御量子ビットには、最初の制御量子ビッ
トと区別するために青い点があります。スペシャルキーは、ゲームを一時停止し、
[キー変更]メニューを選択することで知ることができ、また設定可能です。

回路からXゲートまたはその他のゲートを削除するには、ブロックを保持しながら（ま
たは十分に近い場合は手ぶらで）左クリックします。
]]
q_command.areas.x_rx_gates.help_btn_caption = {}
q_command.areas.x_rx_gates.help_btn_caption.en = "X and Rx gates"
q_command.areas.x_rx_gates.help_btn_caption.es = q_command.areas.x_rx_gates.help_btn_caption.en
q_command.areas.x_rx_gates.help_btn_caption.ja = "XおよびRxゲート"

----------------------------
q_command.areas.y_ry_gates = {}
q_command.areas.y_ry_gates.help_btn_text = {}
q_command.areas.y_ry_gates.help_btn_text.en =
[[
The Y and Ry gates rotate a qubit state around the Y axis of a Bloch
sphere (refer to a Bloch sphere on the wall). While wielding one of
these gates, right-click to place it on a quantum circuit.

Once placed, left-click or right-click the Rotate Tool (the rounded tool
spinning on the floor) to rotate its state in increments of π/16 radians
(11.25 degrees), or -π/16 radians, respectively. When first placed, an
Rx gate has a rotation of 0 radians around the Y axis. A Y gate when
first placed has a rotation of π radians (180 degrees) around the Y axis.

To convert a Y gate into a controlled-Y gate (and vice-versa),
left-click or right-click the block while wielding the Control Tool (the
wand-shaped tool spinning on the floor). Left-clicking moves the control
qubit up one wire, and right-clicking moves the control qubit down one
wire. The controlled-Y gate acts on a pair of qubits, with one acting as
control and the other as target. It performs a Y operation on the target
whenever the control is in state |1>.

To remove a Y gate, or any other gate from a circuit, left-click it
while wielding a block (or empty-handed if you are close enough).
]]
q_command.areas.y_ry_gates.help_btn_text.es = q_command.areas.y_ry_gates.help_btn_text.en
q_command.areas.y_ry_gates.help_btn_text.ja =
[[
YゲートとRyゲートは、ブロッホ球のY軸を中心に量子ビットの状態を回転させます
（壁にあるブロッホ球を参照）。ゲートを量子回路に配置するには、そのゲートを保持
しながら、右クリックします。

配置したら、回転ツール（床で回っている丸いツール）を左クリックまたは右クリック
して、その状態をπ/16ラジアン（11.25度）または-π/16ラジアン単位で回転させます。
最初に設置されたとき、Rxゲートの回転はY軸を中心に0ラジアンに設定されていま
す。 Yゲートは、Y軸を中心にπラジアン（180度）回転に設定されています。

Yゲートを制御Yゲートに（およびその逆に）変換するには、コントロールツール（床
で回っている杖型のツール）を保持しながら、ブロックを左クリックまたは右クリック
します。左クリックすると制御量子ビットが1つ上の線に移動し、右クリックすると制
御量子ビットが1つ下の線に移動します。制御Yゲートは、一対の量子ビットのペアに
作用し、1つが制御側、もう1つがターゲット側として機能します。制御側が|1>の状態
にあるとき、ターゲット側にY操作が実行されます。

回路からYゲート、その他のゲートを削除するには、そのブロックを保持しながら（ま
たは十分に近い場合は手ぶらで）左クリックします。
]]
q_command.areas.y_ry_gates.help_btn_caption = {}
q_command.areas.y_ry_gates.help_btn_caption.en = "Y and Ry gates"
q_command.areas.y_ry_gates.help_btn_caption.es = q_command.areas.y_ry_gates.help_btn_caption.en
q_command.areas.y_ry_gates.help_btn_caption.ja = "Y および Ryゲート"

----------------------------
q_command.areas.z_rz_gates = {}
q_command.areas.z_rz_gates.help_btn_text = {}
q_command.areas.z_rz_gates.help_btn_text.en =
[[
The Z and Rz gates rotate a qubit state around the Z axis of a Bloch
sphere, shifting its phase (refer to a Bloch sphere on the wall). While
wielding one of these gates, right-click to place it on a quantum circuit.

Once placed, left-click or right-click the Rotate Tool (the rounded tool
spinning on the floor) to rotate its state in increments of π/16 radians
(11.25 degrees), or -π/16 radians, respectively. When first placed, an
Rz gate has a rotation of 0 radians around the Z axis. A Z gate when
first placed has a rotation of π radians (180 degrees) around the Z axis.

To convert a Z gate into a controlled-Z gate (and vice-versa),
left-click or right-click the block while wielding the Control Tool (the
wand-shaped tool spinning on the floor). Left-clicking moves the control
qubit up one wire, and right-clicking moves the control qubit down one
wire. The controlled-Z gate acts on a pair of qubits, with one acting as
control and the other as target. It performs a Z operation on the target
whenever the control is in state |1>. A Z gate may be rotated even if it
has a control qubit, in which case it is known as a controlled-Rz gate.

To remove a Z gate, or any other gate from a circuit, left-click it
while wielding a block (or empty-handed if you are close enough).
]]
q_command.areas.z_rz_gates.help_btn_text.es = q_command.areas.z_rz_gates.help_btn_text.en
q_command.areas.z_rz_gates.help_btn_text.ja =
[[
ZゲートおよびRzゲートは、ブロッホ球のZ軸を中心に量子ビットの状態を回転させ、
その位相をシフトします（壁にあるブロッホ球を参照）。ゲートを量子回路に配置する
には、そのゲートを保持しながら、右クリックします。

配置したら、回転ツール（床で回っている丸いツール）を左クリックまたは右クリック
して、その状態をπ/16ラジアン（11.25度）または-π/16ラジアン単位で回転させます。
最初に配置されたとき、Rzゲートの回転はZ軸を中心に0ラジアンに設定されていま
す。 Zゲートは、Z軸を中心にπラジアン（180度）回転に設定されています。

Zゲートを制御Zゲートに（およびその逆に）変換するには、コントロールツール（床
で回っている杖型のツール）を保持しながら、ブロックを左クリックまたは右クリック
します。左クリックすると制御量子ビットが1つ上の線に移動し、右クリックすると制
御量子ビットが1つ下の線に移動します。制御Zゲートは、一対の量子ビットのペアに
作用し、1つが制御側、もう1つがターゲット側として機能します。制御ビットが|1>の
状態にあるとき、ターゲット側にZ操作が実行されます。 Zゲートは、制御量子ビット
がある場合でも回転できます。この場合、Zゲートは制御Rzゲートとして知られていま
す。

回路からZゲート、または他のゲートを削除するには、そのブロックを保持しながら
（十分に近い場合は手ぶらで）、左クリックします。
]]
q_command.areas.z_rz_gates.help_btn_caption = {}
q_command.areas.z_rz_gates.help_btn_caption.en = "Z and Rz gates"
q_command.areas.z_rz_gates.help_btn_caption.es = q_command.areas.z_rz_gates.help_btn_caption.en
q_command.areas.z_rz_gates.help_btn_caption.ja = "Z および Rzゲート"

----------------------------
q_command.areas.h_gate_desc = {}
q_command.areas.h_gate_desc.help_btn_text = {}
q_command.areas.h_gate_desc.help_btn_text.en =
[[
The H (for Hadamard) gate rotates a qubit state around the diagonal X+Z
axis of a Bloch sphere (refer to a Bloch spheres on the wall). For
example, it rotates the state from |0> (see top-left Bloch sphere on the
wall) to |+> (see top-right Bloch sphere on the wall) and vice-versa.
Another common example is that it rotates the state from |1> (see
bottom-left Bloch sphere on the wall) to |-> (see bottom-right Bloch
sphere on the wall) and vice-versa. The H gate is used in many quantum
algorithms to create superpositions. As a Clifford gate, the Hadamard
gate is useful for moving information between the X and Z bases.

While wielding an H gate, right-click to place it on a quantum circuit.

To convert an H gate into a controlled-H gate (and vice-versa),
left-click or right-click the block while wielding the Control Tool (the
wand-shaped tool spinning on the floor). Left-clicking moves the control
qubit up one wire, and right-clicking moves the control qubit down one
wire. The controlled-H gate acts on a pair of qubits, with one acting as
control and the other as target. It performs an H operation on the
target whenever the control is in state |1>.

To remove an H gate, or any other gate from a circuit, left-click it
while wielding a block (or empty-handed if you are close enough).
]]
q_command.areas.h_gate_desc.help_btn_text.es = q_command.areas.h_gate_desc.help_btn_text.en
q_command.areas.h_gate_desc.help_btn_text.ja =
[[
H（アダマール）ゲートは、ブロッホ球のX軸 + Z軸の対角線の周りに量子ビットの状
態を回転させます（壁にあるブロッホ球を参照）。たとえば、状態を|0>（壁の左上の
ブロッホ球を参照）から|+>（壁の右上のブロッホ球を参照）に、またはその逆に回転
させます。別の一般的な例は、状態を|1>（壁の左下のブロッホ球を参照）から|->（壁
の右下のブロッホ球を参照）に、またはその逆に回転させることです。 Hゲートは、
重ね合わせを作成するために多くの量子アルゴリズムで使用されます。クリフォード
ゲートとして、アダマールゲートは、X基底とZ基底の間で情報を移動するのにも使わ
れます。

量子回路にHゲートを配置するには、ゲートを保持しながら、右クリックします。

Hゲートを制御Hゲートに変換する（またはその逆）には、コントロールツール（床で
回っている杖型のツール）を保持しながら、ブロックを左クリックまたは右クリックし
ます。左クリックすると制御量子ビットが1つ上の線に移動し、右クリックすると制御
量子ビットが1つ下の線に移動します。制御Hゲートは、一対の量子ビットのペアに作
用し、1つが制御側、もう1つがターゲット側として機能します。制御ビットが|1>の状
態にあるとき、ターゲット側にH操作が実行されます。

回路から、Hゲート、または他のゲートを削除するには、ブロックを保持しながら（ま
たは十分近い場合は手ぶらで）、左クリックします。
]]
q_command.areas.h_gate_desc.help_btn_caption = {}
q_command.areas.h_gate_desc.help_btn_caption.en = "Hadamard gate"
q_command.areas.h_gate_desc.help_btn_caption.es = q_command.areas.h_gate_desc.help_btn_caption.en
q_command.areas.h_gate_desc.help_btn_caption.ja = "アダマールゲート"

----------------------------
q_command.areas.swap_gate_desc = {}
q_command.areas.swap_gate_desc.help_btn_text = {}
q_command.areas.swap_gate_desc.help_btn_text.en =
[[
The Swap gate swaps the states of the qubits on two wires with each
other. While wielding a Swap gate block, right-click to place it on one
of the desired wires. Then while wielding the Swap Tool (the saw-like
tool spinning on the floor), left-click or right-click the block to
navigate to the other desired wire. Left-clicking moves the other swap
qubit up one wire, and right-clicking moves it down one wire. Note that
this other swap qubit has a slightly different appearance (less pixels)
so that it may be distinguished from the originally placed Swap gate
block.

To convert a Swap gate into a controlled-Swap gate (and vice-versa),
left-click or right-click the original block placed while wielding the
Control Tool (the wand-shaped tool spinning on the floor). Left-clicking
moves the control qubit up one wire, and right-clicking moves the
control qubit down one wire. The controlled-Swap gate acts on the qubits
in a Swap gate by performing a Swap operation on the qubits whenever the
control qubit is in state |1>.

To remove a Swap gate, or any other gate from a circuit, left-click it
while wielding a block (or empty-handed if you are close enough).
]]
q_command.areas.swap_gate_desc.help_btn_text.es = q_command.areas.swap_gate_desc.help_btn_text.en
q_command.areas.swap_gate_desc.help_btn_text.ja =
[[
スワップゲートは、2本の線上の量子ビットの状態をお互いに交換します。スワップ
ゲートブロックを保持しながら、右クリックして目的の線の1つに配置します。次に、
スワップツール（床で回転するのこぎりのようなツール）を保持しながら、ブロックを
左クリックまたは右クリックして、もう一方の線に配置します。左クリックすると、も
う一方のスワップ量子ビットが1本の上の線に移動し、右クリックすると、それが1本
の下の線に移動します。このもう一方のスワップ量子ビットの外観はわずかに異なる
（ピクセルが少ない）ため、元々配置されていたスワップゲートブロックと区別できま
す。

スワップゲートを制御スワップゲート（およびその逆）に変換するには、コントロール
ツール（床で回っている杖型のツール）を保持しながら、配置された元のブロックを左
クリックまたは右クリックします。左クリックすると制御量子ビットが1本上の線に、
右クリックすると制御量子ビットが1本下の線になります。制御スワップゲートは、制
御量子ビットが|1>の状態にあるとき、スワップゲートのある量子ビットにスワップ操
作が実行されます。

スワップゲートまたはその他のゲートを回路から削除するには、そのブロックを保持し
ながら（または十分に近い場合は手ぶらで）左クリックします。
]]
q_command.areas.swap_gate_desc.help_btn_caption = {}
q_command.areas.swap_gate_desc.help_btn_caption.en = "Swap gate"
q_command.areas.swap_gate_desc.help_btn_caption.es = q_command.areas.swap_gate_desc.help_btn_caption.en
q_command.areas.swap_gate_desc.help_btn_caption.ja = "スワップゲート"

----------------------------
q_command.areas.s_sdg_gates_desc = {}
q_command.areas.s_sdg_gates_desc.help_btn_text = {}
q_command.areas.s_sdg_gates_desc.help_btn_text.en =
[[
The S, and Sdg, gates rotate a qubit state around the Z axis of a Bloch
sphere, shifting its phase (refer to a Bloch sphere on the wall). The S
gate performs a rotation of π/2 radians, which is a quarter of the way
counterclockwise around the Bloch sphere. The Sdg (pronounced S dagger)
gate performs a rotation of -π/2 radians, which is a quarter of the way
clockwise around the Bloch sphere.

As Clifford gates, both are useful for moving information between the x
and y bases. While wielding one of these gates, right-click to place it
on a quantum circuit.

To remove an S gate, or any other gate from a circuit, left-click it
while wielding a block (or empty-handed if you are close enough).
]]
q_command.areas.s_sdg_gates_desc.help_btn_text.es = q_command.areas.s_sdg_gates_desc.help_btn_text.en
q_command.areas.s_sdg_gates_desc.help_btn_text.ja =
[[
SゲートおよびSdgゲートは、ブロッホ球のZ軸の周りに量子ビットの状態を回転さ
せ、その位相をシフトします（壁にあるブロッホ球を参照）。 Sゲートは、π/2ラジア
ンの回転を実行します。これは、ブロッホ球の周りを反時計回りに4分の1回転するこ
とに相当します。 Sdg（Sダガーと発音）ゲートは、-π/ 2ラジアンの回転を実行しま
す。これは、ブロッホ球の周りに時計回りに4分の1回転することに相当します。

クリフォードゲートとして、両方ともX基底とY基底の間で情報を交換します。 これら
のゲートを量子回路に配置するには、ゲートを保持しながら、右クリックします。

Sゲート、または他のゲートを回路から削除するには、ブロックを保持しながら（また
は十分に近い場合は手ぶらで）、左クリックします。
]]
q_command.areas.s_sdg_gates_desc.help_btn_caption = {}
q_command.areas.s_sdg_gates_desc.help_btn_caption.en = "S and Sdg gates"
q_command.areas.s_sdg_gates_desc.help_btn_caption.es = q_command.areas.s_sdg_gates_desc.help_btn_caption.en
q_command.areas.s_sdg_gates_desc.help_btn_caption.ja = "S および Sdg ゲート"

----------------------------
q_command.areas.t_tdg_gates_desc = {}
q_command.areas.t_tdg_gates_desc.help_btn_text = {}
q_command.areas.t_tdg_gates_desc.help_btn_text.en =
[[
The T, and Tdg, gates rotate a qubit state around the Z axis of a Bloch
sphere, shifting its phase (refer to a Bloch sphere on the wall). The T
gate performs a rotation of π/4 radians, which is an eighth of the way
counterclockwise around the Bloch sphere . The Tdg (pronounced T dagger)
gate performs a rotation of -π/4 radians, which is an eighth of the way
clockwise around the Bloch sphere.

Fault-tolerant quantum computers will compile all quantum programs down
to just these gates, as well as the Clifford gates. While wielding one
of these gates, right-click to place it on a quantum circuit.

To remove a T gate, or any other gate from a circuit, left-click it
while wielding a block (or empty-handed if you are close enough).
]]
q_command.areas.t_tdg_gates_desc.help_btn_text.es = q_command.areas.t_tdg_gates_desc.help_btn_text.en
q_command.areas.t_tdg_gates_desc.help_btn_text.ja =
[[
TゲートおよびTdgゲートは、ブロッホ球のZ軸の周りに量子ビットの状態を回転させ、
その位相をシフトします（壁にあるブロッホ球を参照）。 Tゲートは、π/ 4ラジアンの
回転です。これは、ブロッホ球の周りに反時計回りに8分の1回転することに相当しま
す。 Tdg（Tダガーと発音）ゲートは、-π/ 4ラジアンの回転です。これは、ブロッホ球
の周りに時計回りに8分の1回転することに相当します。

フォールトトレラントな量子コンピューターは、これまで説明した量子ゲートだけでな
くクリフォードゲートを含めすべての量子プログラムをコンパイルします。これらの
ゲートを量子回路に配置するには、そのゲートを保持しながら、右クリックします。

Tゲート、または他のゲートを回路から削除するには、ブロックを保持しながら（十分
近い場合は手ぶらで）、左クリックします。
]]
q_command.areas.t_tdg_gates_desc.help_btn_caption = {}
q_command.areas.t_tdg_gates_desc.help_btn_caption.en = "T and Tdg gates"
q_command.areas.t_tdg_gates_desc.help_btn_caption.es = q_command.areas.t_tdg_gates_desc.help_btn_caption.en
q_command.areas.t_tdg_gates_desc.help_btn_caption.ja = "T および Tdg ゲート"

----------------------------
q_command.areas.measurement_z_desc = {}
q_command.areas.measurement_z_desc.help_btn_text = {}
q_command.areas.measurement_z_desc.help_btn_text.en =
[[
The Measurement block performs a measurement on a qubit in the Z basis,
which is also called the computational, or standard, basis. Referring to
a Bloch sphere on the wall, note that this basis may be represented by a
plane cutting through its equator. After measurement, the state of a
qubit will either be |0> (represented by the top left Bloch sphere) or
|1> (represented by the bottom left Bloch sphere).

While wielding a measurement block, right-click to place it on a quantum
circuit.

To make a measurement in the Z basis, right click the Measurement block.
Measurement in other bases may be accomplished by rotating the qubit
state with appropriate gates prior to performing a measurement with this
block. Measurement is not a reversible operation.

The Measurement block may be turned into a Bloch sphere that displays an
estimation of the qubit state before measurement. To accomplish this,
right-click the Measurement block while holding down the Special key.
This will insert state tomography measurements into the circuit,
calculating and displaying the estimated state. The Special key may be
known, and set, by pausing the game and choosing the Change Keys button.

Note: Whenever a Bloch sphere is on a circuit, the QASM simulator will
automatically be run whenever the any changes to the circuit occur.

To remove a Measurement block, or any other block from a circuit,
left-click it while wielding a block (or empty-handed if you are close
enough).
]]
q_command.areas.measurement_z_desc.help_btn_text.es = q_command.areas.measurement_z_desc.help_btn_text.en
q_command.areas.measurement_z_desc.help_btn_text.ja =
[[
測定ブロックは、Z基底で量子ビットを測定します（計算基底または標準基底ともよば
れます）。壁のブロッホ球を参照し、この基底は赤道を切断する平面で表されることに
注意してください。測定後、量子ビットの状態は|0>（左上のブロッホ球で表される）
または|1>（左下のブロッホ球で表される）になります。測定ブロックを量子回路に配
置するには、ブロックを保持しながら、右クリックします。

Z基底で測定を行うには、測定ブロックを右クリックします。他の基底での測定は、こ
のブロックで測定を実行する前に適切なゲートで量子ビットの状態を回転させることで
実現できます。測定は可逆的な操作ではありません。

測定ブロックは、測定前に量子ビットの状態の推定値を表示するブロッホ球に変換でき
ます。これを行うには、スペシャルキーを押しながら測定ブロックを右クリックしま
す。これにより、状態トモグラフィ測定が回路に挿入され、予想される状態が計算され
表示されます。スペシャルキーは、ゲームを一時停止し、[キー変更]メニューを選択す
ることで知ることができ、また設定可能です。

注：ブロッホ球が回路上にあるときは常に、回路に何らかの変更が発生するたびに
QASMシミュレーターが自動的に実行されます。

測定ブロック、または他のブロックを回路から削除するには、そのブロックを保持しな
がら（または十分に近い場合は手ぶらで）、左クリックします。
]]
q_command.areas.measurement_z_desc.help_btn_caption = {}
q_command.areas.measurement_z_desc.help_btn_caption.en = "Measurement in Z basis"
q_command.areas.measurement_z_desc.help_btn_caption.es = q_command.areas.measurement_z_desc.help_btn_caption.en
q_command.areas.measurement_z_desc.help_btn_caption.ja = "Z基底での測定"

----------------------------
q_command.areas.bloch_sphere_block_desc = {}
q_command.areas.bloch_sphere_block_desc.help_btn_text = {}
q_command.areas.bloch_sphere_block_desc.help_btn_text.en =
[[
A Bloch sphere, like these on the wall, represents the quantum state of
a qubit. Anywhere on the surface of the sphere is a valid quantum state.
For example, the top-left Bloch sphere represents state |0> and the
bottom-left Bloch sphere represents state |1>. Note that these Bloch
spheres are rotated slightly clockwise and tilted toward you. The green
markers represent states on the visible side of a Bloch sphere, and the
blue markers represent states on its hidden side.

While wielding a Bloch sphere block, right-click to place it on a
quantum circuit.

The Bloch sphere blocks use state tomography, making measurements in the
X, Y and Z bases. To make a measurement only in the Z basis and display
the measured basis state, right-click the Bloch sphere block.

Whenever a Bloch sphere block is on a circuit, the QASM simulator will
automatically be run whenever any changes to the circuit occur.

To remove a Bloch sphere block, or any other block from a circuit,
left-click it while wielding a block (or empty-handed if you are close
enough).
]]
q_command.areas.bloch_sphere_block_desc.help_btn_text.es = q_command.areas.bloch_sphere_block_desc.help_btn_text.en
q_command.areas.bloch_sphere_block_desc.help_btn_text.ja =
[[
この壁にあるようなブロッホ球は、量子ビットの量子状態を表します。球の表面のすべ
てが量子状態となりえます。たとえば、左上のブロッホ球は状態|0>を表し、左下のブ
ロッホ球は状態|1>を表します。これらのブロッホ球はわずかに時計回りに回転し、手
前に傾いていることに注意してください。緑のマーカーはブロッホ球の見える側の状態
を表し、紫のマーカーは隠れた側の状態を表します。

ブロッホ球のブロックを量子回路に配置するには、ブロックを保持しながら、右クリッ
クします。ブロッホ球のブロックは、状態トモグラフィーを使用して、X、Y、およびZ
基底での測定を行います。 Z基底のみで測定を行い、測定された基底状態を表示するに
は、ブロッホ球のブロックを右クリックします。

ブロッホ球のブロックが回路上にあるときは、回路に何らかの変更が発生するたびに
QASMシミュレーターが自動的に実行されます。

ブロッホ球のブロック、または他のブロックを回路から削除するには、そのブロックを
保持しながら（または十分に近い場合は手ぶらで）、左クリックします。
]]
q_command.areas.bloch_sphere_block_desc.help_btn_caption = {}
q_command.areas.bloch_sphere_block_desc.help_btn_caption.en = "The Bloch sphere"
q_command.areas.bloch_sphere_block_desc.help_btn_caption.es = q_command.areas.bloch_sphere_block_desc.help_btn_caption.en
q_command.areas.bloch_sphere_block_desc.help_btn_caption.ja = "ブロッホ球"

----------------------------
q_command.areas.hsv_color_qubit_block_desc = {}
q_command.areas.hsv_color_qubit_block_desc.help_btn_text = {}
q_command.areas.hsv_color_qubit_block_desc.help_btn_text.en =
[[
An HSV color block, like these on the wall, represent the quantum state
of a qubit. For example, the top-left HSV color block represents state
|0> and the bottom-left HSV color block represents state |1>. This
method of representing qubit states with HSV color was invented by
Maddy Tod and Andy Stanford-Clark. The color a block is corresponds to a
specific quantum state, with states that are close to each other having
similar colors, and states that are far apart will have opposite colors.

To make a measurement in the Z basis and display the measured basis
state, right-click the HSV color block.

The HSV color blocks use state tomography, making measurements in the
X, Y and Z bases. To make a measurement only in the Z basis and display
the measured basis state, right-click the HSV color block.

Whenever an HSV color block is on a circuit, the QASM simulator will
automatically be run whenever the any changes to the circuit occur.

To remove an HSV color block, or any other block from a circuit,
left-click it while wielding a block (or empty-handed if you are close
enough).
]]
q_command.areas.hsv_color_qubit_block_desc.help_btn_text.es = q_command.areas.hsv_color_qubit_block_desc.help_btn_text.en
q_command.areas.hsv_color_qubit_block_desc.help_btn_text.ja =
[[
この壁にあるHSVのカラーブロックは、量子ビットの量子状態を表します。たとえ
ば、左上のHSVカラーブロックは状態| 0>を表し、左下のHSVカラーブロックは状態|
1>を表します。 HSVカラーで量子ビットの状態を表すこの方法は、Maddy TodとAndy
Stanford-Clarkによって考案されました。ブロックの色は特定の量子状態に対応し、互
いに近い状態は類似した色を持ち、遠く離れた状態は反対の色を持ちます。

Z基底で測定を行い、測定された基底状態を表示するには、HSVカラーブロックを右ク
リックします。

HSVのカラーブロックは状態トモグラフィーを使用して、X、Y、Z基底で測定を行い
ます。 Z基底のみで測定を行い、測定された基底状態を表示するには、HSVカラーブ
ロックを右クリックします。

HSVカラーブロックが回路上にあるときは、回路に何らかの変更が発生するたびに
QASMシミュレーターが自動的に実行されます。

回路からHSVカラーブロックまたは他のブロックを削除するには、そのブロックを保
持しながら（または十分に近い場合は手ぶらで）左クリックします。
]]
q_command.areas.hsv_color_qubit_block_desc.help_btn_caption = {}
q_command.areas.hsv_color_qubit_block_desc.help_btn_caption.en = "The HSV color block"
q_command.areas.hsv_color_qubit_block_desc.help_btn_caption.es = q_command.areas.hsv_color_qubit_block_desc.help_btn_caption.en
q_command.areas.hsv_color_qubit_block_desc.help_btn_caption.ja = "HSVのカラーブロック"

----------------------------
q_command.areas.reset_op_desc = {}
q_command.areas.reset_op_desc.help_btn_text = {}
q_command.areas.reset_op_desc.help_btn_text.en =
[[
The Reset operation returns a qubit to state |0> (represented by the top
left Bloch sphere on the wall), irrespective of its state before the
operation was applied. It is not a reversible operation.

While wielding a Reset block, right-click to place it on a quantum
circuit.

To remove a Reset block, or any other block from a circuit, left-click
it while wielding a block (or empty-handed if you are close enough).
]]
q_command.areas.reset_op_desc.help_btn_text.es = q_command.areas.reset_op_desc.help_btn_text.en
q_command.areas.reset_op_desc.help_btn_text.ja =
[[
リセット操作は、それまでの状態に関係なく、量子ビットを|0>状態（壁にあるブロッ
ホ球では左上の状態）に戻します。 可逆な操作ではありません。

リセットブロックを量子回路に配置するには、ブロックを保持しながら、右クリックし
ます。

リセットブロック、または他のブロックを回路から削除するには、そのブロックを保持
しながら（または十分に近い場合は手ぶらで）、左クリックします。
]]
q_command.areas.reset_op_desc.help_btn_caption = {}
q_command.areas.reset_op_desc.help_btn_caption.en = "Reset or |0> operation"
q_command.areas.reset_op_desc.help_btn_caption.es = q_command.areas.reset_op_desc.help_btn_caption.en
q_command.areas.reset_op_desc.help_btn_caption.ja = "リセットまたは |0> 操作"

----------------------------
q_command.areas.barrier_op_desc = {}
q_command.areas.barrier_op_desc.help_btn_text = {}
q_command.areas.barrier_op_desc.help_btn_text.en =
[[
To make your quantum program more efficient, the compiler will try to
combine gates. The Barrier is an instruction to the compiler to prevent
these combinations being made.

While wielding a Barrier block, right-click to place it on a quantum
circuit.

To remove a Barrier block, or any other block from a circuit, left-click
it while wielding a block (or empty-handed if you are close enough).
]]
q_command.areas.barrier_op_desc.help_btn_text.es = q_command.areas.barrier_op_desc.help_btn_text.en
q_command.areas.barrier_op_desc.help_btn_text.ja =
[[
量子プログラムをより効果的に実行するために、コンパイラーはゲートを結合しようと
します。 バリアーは、この結合が行われないようにコンパイラーへ命令します。

バリアブロックを量子回路に配置するには、ブロックを保持しながら、右クリックしま
す。

バリアブロック、または他のブロックを回路から削除するには、そのブロックを保持し
ながら（または十分に近い場合は手ぶらで）左クリックします。
]]
q_command.areas.barrier_op_desc.help_btn_caption = {}
q_command.areas.barrier_op_desc.help_btn_caption.en = "Barrier operation"
q_command.areas.barrier_op_desc.help_btn_caption.es = q_command.areas.barrier_op_desc.help_btn_caption.en
q_command.areas.barrier_op_desc.help_btn_caption.ja = "バリアー操作"

----------------------------
q_command.areas.if_op_block_desc = {}
q_command.areas.if_op_block_desc.help_btn_text = {}
q_command.areas.if_op_block_desc.help_btn_text.en =
[[
The If operation allows quantum gates to be conditionally applied,
depending on the state of a classical register. While wielding an If
operation block, right-click while pointing immediately to the left of
the desired gate to be conditionally applied. Then right-click the If
block until the wire containing the desired measurement block, and
classical conditional value (0 or 1), are displayed on the block.

Note that OpenQASM and Qiskit support multiple-bit classical registers,
but this application currently supports only single-bit classical
registers. These classical register are created implicitly, one per
quantum register (which are implicitly created as single-qubit) in the
circuit.

To remove an If operation block, or any other block from a circuit,
left-click it while wielding a block (or empty-handed if you are close
enough).
]]
q_command.areas.if_op_block_desc.help_btn_text.es = q_command.areas.if_op_block_desc.help_btn_text.en
q_command.areas.if_op_block_desc.help_btn_text.ja =
[[
If操作は、古典的なレジスターの状態に応じて、量子ゲートを条件付きで適用します。
If操作ブロックを保持しながら、If条件付きで使うゲートのすぐ左をポイントしながら
右クリックします。 次に、目的の測定ブロックと古典的な条件値（0または1）を含む
線がブロックに表示されるまで、Ifブロックを右クリックします。

OpenQASMとQiskitは複数ビットの古典レジスターをサポートしていますが、このアプ
リケーションは現在、シングルビットの古典レジスターのみをサポートしていることに
注意してください。 これらの古典レジスターは、回路内の各量子レジスター（暗黙的
に単一量子ビットとして作成される）に1つずつ作成されます。

If操作ブロック、または他のブロックを回路から削除するには、そのブロックを保持し
ながら（または十分に近い場合は手ぶらで）、左クリックします。
]]
q_command.areas.if_op_block_desc.help_btn_caption = {}
q_command.areas.if_op_block_desc.help_btn_caption.en = "If operation"
q_command.areas.if_op_block_desc.help_btn_caption.es = q_command.areas.if_op_block_desc.help_btn_caption.en
q_command.areas.if_op_block_desc.help_btn_caption.ja = "If 操作"

----------------------------
q_command.areas.wire_extender_block_desc = {}
q_command.areas.wire_extender_block_desc.help_btn_text = {}
q_command.areas.wire_extender_block_desc.help_btn_text.en =
[[
Although not representative of a Qiskit operation, the Wire Extender
block enables a circuit wire to be extended to another location. Here is
the procedure for doing that:

1) While wielding a Wire Extension block and pointing at the rightmost
block on the desired wire, right-click to place it.

2) Left-click the Wire Extension block, which will cause a Wire
Continuation block to drop (the cube-shaped item spinning on the floor).
Note: The direction in which it drops is influenced by the where you are
when you left-click.

3) Left-click the Wire Continuation block to put it in your inventory.
Move this block to your hotbar if it is not already there.

4) While wielding this Wire Continuation block, right-click to place it
in the position and orientation that you would like the wire
continuation to be.

5) Right-click the Wire Continuation block, specifying how many blocks
wide the wire continuation should be.

To remove a wire continuation and its associated Wire Extension block
from a circuit, while pressing the Special key, left-click the Wire
Continuation block. The Special key may be known, and set, by pausing
the game and choosing the Change Keys button.
]]
q_command.areas.wire_extender_block_desc.help_btn_text.es = q_command.areas.wire_extender_block_desc.help_btn_text.en
q_command.areas.wire_extender_block_desc.help_btn_text.ja =
[[
Qiskitの操作を表すものではありませんが、配線延長ブロックにより、回路の線を別の
場所に延長できます。手順は次のとおりです。

1）配線延長ブロックを保持し、目的の線の右端のブロックをポイントしながら、右ク
リックして配置します。

2）配線延長ブロックを左クリックすると、配線継続ブロック（床の上で回転する立方
体のアイテム）がドロップされます。注：ドロップされる方向は、左クリックした場所
に依存します。

3）配線継続ブロックを左クリックして、インベントリーに入れます。このブロックが
まだホットバーに存在しない場合は、ホットバーに移動させます。

4）この配線継続ブロックを保持しながら、右クリックして、ワイアーを伸ばしたい位
置と方向に配置します。

5）配線継続ブロックを右クリックし、線の継続幅をいくつにするかを指定します。

配線継続とそれに関連する配線延長ブロックを回路から削除するには、スペシャルキー
を押しながら配線継続ブロックを左クリックします。スペシャルキーは、ゲームを一時
停止し、[キー変更]メニューを選択することで知ることができ、また設定可能です。
]]
q_command.areas.wire_extender_block_desc.help_btn_caption = {}
q_command.areas.wire_extender_block_desc.help_btn_caption.en = "Wire Extender block"
q_command.areas.wire_extender_block_desc.help_btn_caption.es = q_command.areas.wire_extender_block_desc.help_btn_caption.en
q_command.areas.wire_extender_block_desc.help_btn_caption.ja = "ワイアー延長ブロック"

----------------------------
q_command.areas.q_block_desc = {}
q_command.areas.q_block_desc.help_btn_text = {}
q_command.areas.q_block_desc.help_btn_text.en =
[[
The Q block enables you to create a quantum circuit that may be executed
by Qiskit simulators. Here is the procedure for creating a quantum circuit:

1) While wielding a Q block, point at the position in the world that you
would like the circuit to be placed and right-click.

2) Right-click the Q block, specifying in the dialog the number of wires
and columns that you would like the circuit to have, and click the Create
button.

3) Place blocks on the circuit and interact with it, referring to the
instructions near each of the blocks in this room.

When a quantum circuit is created, a foundation made of blocks is also
created. This foundation includes some liquid blocks that help you
visualize the probabilities and phases for each basis state in the state
vector.

Left-clicking a Q block causes the Qiskit statevector simulator to be
run, which is not normally necessary as it is run whenever the circuit
is modified. The most common reason for left-clicking a Q block is to
restore the Measurement blocks to their original appearance, rather than
showing the state of their last measurement.

Right-clicking on a Q block when a circuit has already been created
stops and starts the music. It also displays the OpenQASM code for the
circuit, which you may run on one of the real quantum computers at IBM.
To do that, copy and paste the OpenQASM code into the Circuit Editor
pane of the Circuit Composer at https://quantum-computing.ibm.com

Note that you may also right-click this non-functional Q block to stop
or start the music.

To remove a Q block and its circuit, while pressing the Special key
left-click the Q block. The Special key may be known, and set, by
pausing the game and choosing the Change Keys button.
]]
q_command.areas.q_block_desc.help_btn_text.es = q_command.areas.q_block_desc.help_btn_text.en
q_command.areas.q_block_desc.help_btn_text.ja =
[[
Qブロックを使用すると、Qiskitシミュレーターで実行できる量子回路を作成できま
す。量子回路を作成する手順は次のとおりです。

1）Qブロックを保持しながら、回路を配置したいワールド内の位置をポイントし、右
クリックします。

2）Qブロックを右クリックし、ダイアログで回路に必要な配線数と列の数を指定し
て、[作成]ボタンをクリックします。

3）回路上にブロックを配置し、この部屋の各ブロックの近くにある説明を参照して、
回路を作成します。

量子回路が作成されると、ブロックで構成される基盤も作成されます。この基盤には、
状態ベクトルの各基底状態の確率と位相を視覚化する液体ブロックが含まれています。

Qブロックを左クリックすると、Qiskitの状態ベクトルシミュレーターが実行されま
す。これは、回路が変更されるたびに実行されるため、通常は必要ありません。Q ブ
ロックを左クリックする一般的な理由は、測定ブロックを最後の測定状態で表示するの
ではなく、元の見た目に戻すためです。

回路がすでに作成されているときにQブロックを右クリックすると、音楽が停止および
開始されます。また、同時に、回路のOpenQASMコードも表示します。この
OpenQASMコードは、IBMの実際の量子コンピューターで実行することができます。

そのためには、OpenQASMコードをコピーして、Circuits Composer（
https://quantum-computing.ibm.com）のCircuit Editor パネルに貼り付けます。

この機能のないQブロックを右クリックすることで、音楽を停止または開始することも
できます。

Qブロックとその回路を削除するには、スペシャルキーを押しながらQブロックを左ク
リックします。スペシャルキーは、ゲームを一時停止し、[キー変更]メニューを選択す
ることで知ることができ、また設定可能です。
]]
q_command.areas.q_block_desc.help_btn_caption = {}
q_command.areas.q_block_desc.help_btn_caption.en = "Q block"
q_command.areas.q_block_desc.help_btn_caption.es = q_command.areas.q_block_desc.help_btn_caption.en
q_command.areas.q_block_desc.help_btn_caption.ja = "Qブロック"

----------------------------
q_command.areas.quantum_island = {}
q_command.areas.quantum_island.help_btn_text = {}
q_command.areas.quantum_island.help_btn_text.en =
[[
Though this island may look tropical, it comes from one of the coldest
places in the universe: a real 53 qubit quantum computer.

The basic shape of the island was made using the properties of single
qubit rotations. Circuits run on a 53 qubit device were then used to
design the texture, and to place ferns and trees. The bridge and walls
are decorated with quantum interference patterns generated by 6 qubit circuits.
If you don't like this island, why not try using quantum computing to make
one of your own?
]]
q_command.areas.quantum_island.help_btn_text.es = q_command.areas.quantum_island.help_btn_text.en
q_command.areas.quantum_island.help_btn_text.ja =q_command.areas.quantum_island.help_btn_text.en
q_command.areas.quantum_island.help_btn_caption = {}
q_command.areas.quantum_island.help_btn_caption.en = "Quantum Island"
q_command.areas.quantum_island.help_btn_caption.es = q_command.areas.quantum_island.help_btn_caption.en
q_command.areas.quantum_island.help_btn_caption.ja = q_command.areas.q_block_desc.help_btn_caption.en

-- END Starting room help buttons --------------------------------------------



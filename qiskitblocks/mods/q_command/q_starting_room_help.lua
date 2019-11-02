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
TODO: REPLACE THIS MACHINE TRANSLATED TEXT
量子計算回路の世界へようこそ！現在のブロックワールド環境は、Minetest.netオープンソースライブラリ
を使用して作成されます。 Minetestでの移動や操作のためのコントロールのリストは、ゲームを一時停止することで
利用できます（たとえば、一部のプラットフォームではEscキーで）。相互作用する量子ゲートと回路は、
<https://qiskit.org/>量子シミュレーターを使用しています。

この環境で探索できる領域は増え続けています。まず、この部屋の標識を右クリックして読むと便利です。
これらの標識は、発生するさまざまな量子コンピューティング関連ブロックの動作を説明しているためです。
ちなみに、この部屋からブロックやツールを取り出す必要はありません。それらは道に沿ってチェストで利用できるからです。
この部屋にそれらを残し、彼らが何をするか、またはそれらをどのように使用するかについて質問があるときはいつでも戻って来てください。

脱出室のような体験が必要な場合は、この建物にあるはしごの下部にあるパズルルームをチェックしてください。
教授Qは、ウィンドウの左上隅にチャットメッセージを送信して、サーキットパズルをガイドします。

この部屋の外にある別の場所は、量子猫の砂場です。その分野では、いくつかの基本的な量子計算回路とゲートが、
通常のキュービットの代わりに不機嫌で幸せな猫で示されています。そこに着くには、
正面玄関のすぐ外にあるライトブロックをたどって森に入ります。

訪問する他の場所には、正面玄関の外側の大きな壁の反対側の量子回路庭園、および木製の門に囲まれた「OpenQASM Chasm」が含まれます。

開始する場所を選択すると、ヘルプボタン（疑問符のラベルが付いている）を右クリックすると、ヘルプが表示されます。幸運を！
]]
q_command.areas.quantum_circuit_world.help_btn_caption = "Read me first!"

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
q_command.areas.x_rx_gates.help_btn_text.ja = q_command.areas.x_rx_gates.help_btn_text.en
q_command.areas.x_rx_gates.help_btn_caption = "X and Rx gates"

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
q_command.areas.y_ry_gates.help_btn_text.ja = q_command.areas.y_ry_gates.help_btn_text.en
q_command.areas.y_ry_gates.help_btn_caption = "Y and Ry gates"

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
q_command.areas.z_rz_gates.help_btn_text.ja = q_command.areas.z_rz_gates.help_btn_text.en
q_command.areas.z_rz_gates.help_btn_caption = "Z and Rz gates"

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
q_command.areas.h_gate_desc.help_btn_text.ja = q_command.areas.h_gate_desc.help_btn_text.en
q_command.areas.h_gate_desc.help_btn_caption = "Hadamard gate"

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
q_command.areas.swap_gate_desc.help_btn_text.ja = q_command.areas.swap_gate_desc.help_btn_text.en
q_command.areas.swap_gate_desc.help_btn_caption = "Swap gate"

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
q_command.areas.s_sdg_gates_desc.help_btn_text.ja = q_command.areas.s_sdg_gates_desc.help_btn_text.en
q_command.areas.s_sdg_gates_desc.help_btn_caption = "S and Sdg gates"

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
q_command.areas.t_tdg_gates_desc.help_btn_text.ja = q_command.areas.t_tdg_gates_desc.help_btn_text.en
q_command.areas.t_tdg_gates_desc.help_btn_caption = "T and Tdg gates"

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
q_command.areas.measurement_z_desc.help_btn_text.ja = q_command.areas.measurement_z_desc.help_btn_text.en
q_command.areas.measurement_z_desc.help_btn_caption = "Measurement in Z basis"

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
q_command.areas.bloch_sphere_block_desc.help_btn_text.ja = q_command.areas.bloch_sphere_block_desc.help_btn_text.en
q_command.areas.bloch_sphere_block_desc.help_btn_caption = "The Bloch sphere"

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
q_command.areas.hsv_color_qubit_block_desc.help_btn_text.ja = q_command.areas.hsv_color_qubit_block_desc.help_btn_text.en
q_command.areas.hsv_color_qubit_block_desc.help_btn_caption = "The HSV color block"

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
q_command.areas.reset_op_desc.help_btn_text.ja = q_command.areas.reset_op_desc.help_btn_text.en
q_command.areas.reset_op_desc.help_btn_caption = "Reset or |0> operation"

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
q_command.areas.barrier_op_desc.help_btn_text.ja = q_command.areas.barrier_op_desc.help_btn_text.en
q_command.areas.barrier_op_desc.help_btn_caption = "Barrier operation"

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
q_command.areas.if_op_block_desc.help_btn_text.ja = q_command.areas.if_op_block_desc.help_btn_text.en
q_command.areas.if_op_block_desc.help_btn_caption = "If operation"

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
q_command.areas.wire_extender_block_desc.help_btn_text.ja = q_command.areas.wire_extender_block_desc.help_btn_text.en
q_command.areas.wire_extender_block_desc.help_btn_caption = "Wire Extender block"

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
q_command.areas.q_block_desc.help_btn_text.ja = q_command.areas.q_block_desc.help_btn_text.en
q_command.areas.q_block_desc.help_btn_caption = "Q block"

-- END Starting room help buttons --------------------------------------------



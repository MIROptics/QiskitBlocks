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

-- Quantum circuit garden main help --------------------------------------------
q_command.areas.quantum_circuit_garden = {}
q_command.areas.quantum_circuit_garden.help_btn_text = {}
q_command.areas.quantum_circuit_garden.help_btn_text.en =
[[
Welcome to the quantum circuit garden, which contains various
circuit-based puzzles to solve. For more information on the challenge
for a given circuit, right-click its Help button. To solve a puzzle, add
the appropriate gates to its circuit. You can find the necessary gates
in the chest below this sign, which you may open and close by
right-clicking. To move an item from the chest into your inventory, drag
it from the upper to the lower section of the chest dialog box. The
items that appear in the top row of the inventory will appear in the
hotbar ready to be wielded. To add a gate to a circuit, choose the gate
block from the hotbar, position the cursor on the circuit, and
right-click. Left-clicking a gate while wielding a block (or empty
handed if you are close enough) removes it from the circuit. When you
solve a given circuit puzzle, the black Q block will turn gold.

There are a couple of tools in the chest with which you may add control
qubits to a gate, as well as to rotate a gate. To use these tools,
position the cursor on an appropriate gate and left-click or right-click.

Notice that each circuit has a set of glass blocks with liquid levels
that express the measurement probability of each basis state. The
rightmost digit of each basis state represents the topmost wire. To
measure a circuit, right-click on a block that has the appearance of a
measuring device.
]]
q_command.areas.quantum_circuit_garden.help_btn_text.es = q_command.areas.quantum_circuit_garden.help_btn_text.en
q_command.areas.quantum_circuit_garden.help_btn_text.ja =
[[
量子回路ガーデンへようこそ。ここには、さまざまな回路のパズルがあります。それぞ
れの回路に挑戦するために、?のヘルプボタンを右クリックして詳細情報をご覧くださ
い。パズルを解くには、適切なゲートを回路に追加します。この文章の下のチェストの
中に必要なゲートが入っていて、チェストは右クリックで開閉できます。アイテムを
チェストからインベントリーに移動するには、チェストのダイアログボックスの上部か
ら下部にアイテムをドラッグします。インベントリーの一番上の行に表示されるアイテ
ムは、ホットバーに表示され、使用可能になります。ゲートを回路に追加するには、
ホットバーからゲートブロックを選択し、回路にカーソルを置いて右クリックします。
ブロックを保持しながら（または十分に近い場合は手ぶらで）ゲートを左クリックする
と、回路からゲートが削除されます。回路パズルを解くと、黒いQブロックが金色に変
わります。

チェストにはいくつかのツールがあり、これらを使用してゲートに制御量子ビットを追
加したり、ゲートを回転させたりすることができます。これらのツールを使用するに
は、適切なゲートにカーソルを置き、左クリックまたは右クリックします。

各回路には、各基底状態の測定確率を表す液体レベルのガラスブロックのセットがあり
ます。各基底状態の右端の数字は、最上位の線を表します。回路を測定するには、測定
デバイスのついたブロックを右クリックします。
]]
q_command.areas.quantum_circuit_garden.help_btn_caption = {}
q_command.areas.quantum_circuit_garden.help_btn_caption.en = "Quantum circuit garden"
q_command.areas.quantum_circuit_garden.help_btn_caption.es = q_command.areas.quantum_circuit_garden.help_btn_caption.en
q_command.areas.quantum_circuit_garden.help_btn_caption.ja = "量子回路ガーデン"

-- Quantum circuit garden puzzles ------------------------------------------------
q_command.areas.x_gate = {}
q_command.areas.x_gate.solution_statevector =
{{r=0,i=0},{r=1,i=0}}
q_command.areas.x_gate.help_btn_text = {}
q_command.areas.x_gate.help_btn_text.en =
[[
TLDR: Get an X block from chest and place on the circuit, making the
blue liquid levels correspond to a quantum state of |1>. Measure circuit
several times for good measure :-)
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
q_command.areas.x_gate.help_btn_text.es = q_command.areas.x_gate.help_btn_text.en
q_command.areas.x_gate.help_btn_text.ja =
[[
TLDR：チェストの中からXブロックを取り、回路上に配置して、青い液体レベルの量
子状態を|1>に対応させます。良い測定をするために回路を数回測定します:-)
----
1本の線のみで構成されるこの回路は、Xゲート（パウリX、NOT、またはビットフ
リップゲートともよばれる）を活用します。 このゲートは、|0>状態を|1>にし、その
逆も同様です。このパズルを解くには、次の手順を実行します。

1）青い液体は、回路を測定したときに結果が|0>になる確率が100％であることを示し
ていることに注意してください。先に進み、測定ブロックを数回右クリックして、常に
結果が|0>であることを確認します。

2）チェストからXブロックを取り出します。

3）Xブロックを保持しながら、回路の線上の空いている場所にカーソルを置き、右ク
リックします。

4）青い液体が、今度は、回路を測定したときに結果が|1>になる確率が100％になって
いることに注意してください。測定ブロックを数回右クリックして、常に結果が|1>で
あることを確認します。

Qブロックがゴールドになったら、パズルが解けたという意味です。おめでとうござい
ます！
]]
q_command.areas.x_gate.help_btn_caption = {}
q_command.areas.x_gate.help_btn_caption.en = "Quantum NOT gate"
q_command.areas.x_gate.help_btn_caption.es = q_command.areas.x_gate.help_btn_caption.en
q_command.areas.x_gate.help_btn_caption.ja = "量子NOTゲート"

------------------------------
q_command.areas.h_gate = {}
q_command.areas.h_gate.solution_statevector =
{{r=0.707,i=0},{r=0.707,i=0}}
q_command.areas.h_gate.help_btn_text = {}
q_command.areas.h_gate.help_btn_text.en =
[[
TLDR: Using only an H gate, make the blue liquid levels correspond to a
quantum state of sqrt(1/2) |0> + sqrt(1/2) |1>. Measure the circuit
several times as extra validation of the correct solution.
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
q_command.areas.h_gate.help_btn_text.es = q_command.areas.h_gate.help_btn_text.en
q_command.areas.h_gate.help_btn_text.ja =
[[
TLDR：Hゲートのみを使用して、青い液体レベルをsqrt（1/2）|0> + sqrt（1/2）|1>の
量子状態に対応させます。ソリューションが正しいことを追検証するために、回路を数
回測定します。
----

1本の線のみで構成されるこの回路は、アダマールゲートとも呼ばれるHゲートを活用
します。 Hゲートは、|0>状態を|0>と|1>の均等な重ね合わせ状態にします。したがっ
て、量子ビットを測定すると、50%の確率でその結果が|0>になり、50%の確率でその
結果が|1>になります。このパズルを解くには、次の手順に従います。

1）青い液体は、回路を測定したとき|0>になる確率が100％であることを示しているこ
とに注意してください。測定ブロックを数回右クリックして、常に結果が|0>であるこ
とを確認します。

2）チェストからHブロックを取り出します。

3）Hブロックを保持しながら、回路の線の空いている場所にカーソルを置き、右ク
リックします。

4）青色の液体が、回路を測定したときに、|0>になる確率が50％、|1>になる確率が50
％になったことに注目してください。測定ブロックを数回右クリックして、結果が|0>
と|1>の間でほぼ均等に分布していることを確認します。

Qブロックがゴールドになったら、パズルが解けたという意味です。おめでとうござい
ます！
]]
q_command.areas.h_gate.help_btn_caption = {}
q_command.areas.h_gate.help_btn_caption.en = "Hadamard gate"
q_command.areas.h_gate.help_btn_caption.es = q_command.areas.h_gate.help_btn_caption.en
q_command.areas.h_gate.help_btn_caption.ja = "アダマールゲート"

------------------------------
q_command.areas.cnot_gate_puzzle = {}
q_command.areas.cnot_gate_puzzle.solution_statevector =
{{r=0,i=0},{r=1,i=0},{r=0,i=0},{r=0,i=0}}
q_command.areas.cnot_gate_puzzle.help_btn_text = {}
q_command.areas.cnot_gate_puzzle.help_btn_text.en =
[[
The CNOT gate, also referred to as the controlled-NOT or controlled-X
gate, is one of the two-qubit gates in quantum computing. To create a
CNOT gate, first place an X gate on the circuit. Then, to convert an X
gate into a CNOT gate (and vice-versa), left-click or right-click the
block while wielding the Control Tool (the wand-shaped tool).
Left-clicking moves the control qubit up one wire, and right-clicking
moves the control qubit down one wire. The CNOT gate acts on a pair of
qubits, with one acting as control and the other as target. It performs
an X operation on the target whenever the control is in state |1>.

To work through this puzzle, take the following steps:

1) Place a CNOT gate in the second column, with the target qubit on the
bottom and the control qubit on the top.

2) Notice that the blue liquid indicates there is a 100% probability
that the result will be |00> when the circuit is measured. The leftmost
0 corresponds to the bottom wire, and the rightmost 0 corresponds to the
top wire. Go ahead and right-click one of the measurement blocks a few
times to verify that |00> is always the result.

3) Place an X gate on the top wire of the first column, noticing that
there is now a 100% probability that the result will be |11> when
measured. Note that the bottom qubit flips to |1> because of the CNOT
gate. Go ahead and right-click one of the measurement blocks a few times
to verify that |11> is always the result.

4) Add an X gate to the circuit on the bottom wire of the first column,
noticing that there is now a 100% probability that the result will be
|01> when measured. Go ahead and right-click one of the measurement
blocks to verify that |01> is always the result.

If the Q block turned gold, congratulations on solving the puzzle!
]]
q_command.areas.cnot_gate_puzzle.help_btn_text.es = q_command.areas.cnot_gate_puzzle.help_btn_text.en
q_command.areas.cnot_gate_puzzle.help_btn_text.ja =
[[
CNOTゲートは、制御NOTゲートまたは制御Xゲートとも呼ばれ、量子コンピューティ
ングにおける2量子ビットゲートの1つです。 CNOTゲートを作成するには、最初に回
路にXゲートを配置します。次に、XゲートをCNOTゲートに変換（またはその逆）す
るには、コントロールツール（杖型ツール）を保持しながら、ブロックを左クリックま
たは右クリックします。左クリックすると制御量子ビットが1つ上の線に移動し、右ク
リックすると制御量子ビットが1つ下の線に移動します。 CNOTゲートは一対の量子
ビットのペアに作用し、一方が制御ビット、もう一方がターゲットビットとして機能し
ます。制御ビットが|1>の状態になると、ターゲット側でX操作が実行されます。

このパズルを解くには、次の手順に従います。

1）2列目にCNOTゲートを配置します。ターゲット量子ビットを下側に、制御量子ビッ
トを上側に配置します。

2）青い液体は、回路の測定結果が|00>になる可能性が100％であることを示している
ことに注目してください。左の0は下の線に対応し、右の0は上の線に対応します。測
定ブロックの1つを数回右クリックして、常に結果が|00>であることを確認します。

3）最初の列の一番上の線にXゲートを配置します。これで、測定結果が|11>になる確
率が100％になったことに注意してください。 CNOTゲートがあるため、下側の量子
ビットが|1>に反転することに注目してください。測定ブロックの1つを右クリックし
て、常に結果が|11>がであることを確認します。

4）Xゲートを最初の列の下の線に追加します。これで、測定結果が|01>になる確率が
100％になったことに注意してください。測定ブロックの1つを右クリックして、常に
結果が|01>であることを確認します。

Qブロックがゴールドになったら、パズルが解けたという意味です。おめでとうござい
ます！
]]
q_command.areas.cnot_gate_puzzle.help_btn_caption = {}
q_command.areas.cnot_gate_puzzle.help_btn_caption.en = "CNOT gate puzzle"
q_command.areas.cnot_gate_puzzle.help_btn_caption.es = q_command.areas.cnot_gate_puzzle.help_btn_caption.en
q_command.areas.cnot_gate_puzzle.help_btn_caption.ja = "CNOTゲートパズル"

------------------------------
q_command.areas.hxx_gates = {}
q_command.areas.hxx_gates.solution_statevector =
{{r=0,i=0},{r=0.707,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0.707,i=0},{r=0,i=0},{r=0,i=0}}
q_command.areas.hxx_gates.help_btn_text = {}
q_command.areas.hxx_gates.help_btn_text.en =
[[
TLDR: Using only H and X gates, make the blue liquid levels correspond
to a quantum state of sqrt(1/2) |001> + sqrt(1/2) |101>.
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
q_command.areas.hxx_gates.help_btn_text.es = q_command.areas.hxx_gates.help_btn_text.en
q_command.areas.hxx_gates.help_btn_text.ja =
[[
TLDR：HおよびXゲートのみを使用して、青い液体レベルを
sqrt（1/2）|001> + sqrt（1/2）|101>の量子状態に対応させます。
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
q_command.areas.hxx_gates.help_btn_caption = {}
q_command.areas.hxx_gates.help_btn_caption.en = "Hadamard and X gates 3 wires"
q_command.areas.hxx_gates.help_btn_caption.es = q_command.areas.hxx_gates.help_btn_caption.en
q_command.areas.hxx_gates.help_btn_caption.ja = "アダマールとXゲート・３線"

------------------------------
q_command.areas.bell_phi_plus = {}
q_command.areas.bell_phi_plus.solution_statevector =
{{r=0.707,i=0},{r=0,i=0},{r=0,i=0},{r=0.707,i=0}}
q_command.areas.bell_phi_plus.help_btn_text = {}
q_command.areas.bell_phi_plus.help_btn_text.en =
[[
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
q_command.areas.bell_phi_plus.help_btn_text.es = q_command.areas.bell_phi_plus.help_btn_text.en
q_command.areas.bell_phi_plus.help_btn_text.ja =
[[
量子エンタングルメントの最もシンプルな4つの例は、ベル状態です。

Φ+ (phi+) に象徴される最も有名なベル状態は、アダマールゲートとCNOTゲートで実
現できます。 CNOTゲートは、十字線と点のある垂直線を持つ2線式のゲートです。十
字記号にはXゲートの機能がありますが、違いは他のワイヤの状態を条件とし、そのワ
イヤが|1>である場合はNOT演算を実行することです。

量子ビットの1つを測定すると、他の量子ビットの状態が決定されます。正しいΦ+
(phi+) のBell状態のソリューションには、測定結果|00>と|11>が同じ確率で発生する可
能性を持ち、同じ位相を持ちます。ここのブロックワールドの回路上の位相の表記は、
右向きを0ラジアンとし、そこから反時計回りの回転です。

この状態を実現する1つの方法は、上部の線にアダマールゲートを配置し、アダマール
ゲートの右側の列の2番目の線にXゲートを配置することです。次に、コントロール
ツールを（チェストの中から取得した後）ホットバーから選択します。回路内のXゲー
トにカーソルを置きながら、制御量子ビットがアダマールゲートと同じ線上になるよう
に左クリックします。

Qブロックがゴールドになったら、パズルが解けたという意味です。おめでとうござい
ます！
]]
q_command.areas.bell_phi_plus.help_btn_caption = {}
q_command.areas.bell_phi_plus.help_btn_caption.en = "Bell State: phi+"
q_command.areas.bell_phi_plus.help_btn_caption.es = q_command.areas.bell_phi_plus.help_btn_caption.en
q_command.areas.bell_phi_plus.help_btn_caption.ja = "ベル状態：Φ+"

------------------------------
q_command.areas.bell_phi_minus = {}
q_command.areas.bell_phi_minus.solution_statevector =
{{r=0.707,i=0},{r=0,i=0},{r=0,i=0},{r=-0.707,i=0}}
q_command.areas.bell_phi_minus.help_btn_text = {}
q_command.areas.bell_phi_minus.help_btn_text.en =
[[
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
q_command.areas.bell_phi_minus.help_btn_text.es = q_command.areas.bell_phi_minus.help_btn_text.en
q_command.areas.bell_phi_minus.help_btn_text.ja =
[[
量子エンタングルメントの最もシンプルな4つの例は、ベル状態です。

これらのベル状態の1つは、Φ- (phi-) と呼ばれ、Xゲートを最上部のワイヤに配置し、Xゲート
の右側にΦ+ ベル状態回路（別のパズルで指示されています）を追加することで実現できま
す。

量子ビットの1つを測定すると、他の量子ビットの状態が決定されます。  正しいΦ- の
ベル状態のソリューションには、測定結果|00>と|11>が同じ確率で発生する可能性を持
ち、逆の位相を持ちます。ここのブロックワールドの回路上の位相の表記は、右向き矢印を
0ラジアンとし、そこから反時計回りの回転です。例として、左向きの矢印は、πラジアン
の位相を示します。

Qブロックがゴールドになったら、パズルが解けたという意味です。おめでとうござい
ます！
]]
q_command.areas.bell_phi_minus.help_btn_caption = {}
q_command.areas.bell_phi_minus.help_btn_caption.en = "Bell State: phi-"
q_command.areas.bell_phi_minus.help_btn_caption.es = q_command.areas.bell_phi_minus.help_btn_caption.en
q_command.areas.bell_phi_minus.help_btn_caption.ja = "ベル状態：Φ-"

------------------------------
q_command.areas.bell_psi_plus = {}
q_command.areas.bell_psi_plus.solution_statevector =
{{r=0,i=0},{r=0.707,i=0},{r=0.707,i=0},{r=0,i=0}}
q_command.areas.bell_psi_plus.help_btn_text = {}
q_command.areas.bell_psi_plus.help_btn_text.en =
[[
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
q_command.areas.bell_psi_plus.help_btn_text.es = q_command.areas.bell_psi_plus.help_btn_text.en
q_command.areas.bell_psi_plus.help_btn_text.ja =
[[
量子エンタングルメントの最も単純な4つの例は、ベル状態です。

これらのベル状態の1つは、Ψ+（psi+）と呼ばれ、2番目のワイヤにXゲートを配置
し、Xゲートの右側にΦ+ ベル状態回路（別のパズルで指示されています）を追加する
ことで実現できます。

量子ビットの1つを測定すると、他の量子ビットの状態が決定されます。 正しいΨ+ベ
ル状態の解には、測定結果|01>と|10>が同じ確率で発生する可能性を持ち、同じ位相を
持ちます。 ここのブロックワールドの回路上の位相の表記は、右向き矢印を 0ラジアンとし、そ
こから反時計回りの回転です。 Ψ+ベル状態は一重項状態の1つとして知られており、
量子ビットの1つを測定すると、他の量子ビットが反対の状態として測定されることが
決まります。

Qブロックがゴールドになったら、パズルが解けたという意味です。おめでとうござい
ます！
]]
q_command.areas.bell_psi_plus.help_btn_caption = {}
q_command.areas.bell_psi_plus.help_btn_caption.en = "Bell State: psi+"
q_command.areas.bell_psi_plus.help_btn_caption.es = q_command.areas.bell_psi_plus.help_btn_caption.en
q_command.areas.bell_psi_plus.help_btn_caption.ja = "ベル状態：Ψ+"

------------------------------
q_command.areas.bell_psi_minus = {}
q_command.areas.bell_psi_minus.solution_statevector =
{{r=0,i=0},{r=0.707,i=0},{r=-0.707,i=0},{r=0,i=0}}
q_command.areas.bell_psi_minus.help_btn_text = {}
q_command.areas.bell_psi_minus.help_btn_text.en =
[[
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
q_command.areas.bell_psi_minus.help_btn_text.es = q_command.areas.bell_psi_minus.help_btn_text.en
q_command.areas.bell_psi_minus.help_btn_text.ja =
[[
量子エンタングルメントの最も単純な4つの例は、ベル状態です。

これらのベル状態の1つは、Ψ-（psi-）と呼ばれ、Xゲートを2番目のワイヤに配置し、
Xゲートの右側にΦ+ ベル状態回路（別のパズルで指示されています）を追加し、その
後に 2番目のワイヤにZゲートを追加することで実現します。

量子ビットの1つを測定すると、他の量子ビットの状態が決定されます。正確なΨ- ベ
ル状態の解には、測定結果|01>と|10>が同じ確率で発生する可能性を持ち、逆の位相を
持ちます。このブロックワールドの回路上の位相の表記は、右向き矢印を 0ラジアンと
し、そこから反時計回りの回転です。例として、左向きの矢印は、πラジアンの位相を
示します。 Ψ- ベル状態は一重項状態の1つとして知られており、量子ビットの1つを測
定すると、他の量子ビットが反対の状態として測定されることが決まります。

Qブロックがゴールドになったら、パズルが解けたという意味です。おめでとうござい
ます！
]]
q_command.areas.bell_psi_minus.help_btn_caption = {}
q_command.areas.bell_psi_minus.help_btn_caption.en = "Bell State: psi-"
q_command.areas.bell_psi_minus.help_btn_caption.es = q_command.areas.bell_psi_minus.help_btn_caption.en
q_command.areas.bell_psi_minus.help_btn_caption.ja = "ベル状態：Ψ-"

------------------------------
q_command.areas.ghz_state = {}
q_command.areas.ghz_state.solution_statevector =
{{r=0.707,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0.707,i=0}}
q_command.areas.ghz_state.help_btn_text = {}
q_command.areas.ghz_state.help_btn_text.en =
[[
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
q_command.areas.ghz_state.help_btn_text.es = q_command.areas.ghz_state.help_btn_text.en
q_command.areas.ghz_state.help_btn_text.ja =
[[
GHZ（グリーンバーガー＝ホーン＝ツァイリンガー）状態は、3つ以上の量子ビットが
関与するもつれ状態であり、基底状態はすべて0またはすべて1です。例えば、この3線
式回路のパズルのもつれ状態は、|000>と|111>が測定される確率が等しい状態です。エ
ンタングルメントの詳細については、ベル状態の回路パズルを参照してください。

この状態を実現する1つの方法は、上部の線にアダマールゲートを配置し、アダマール
ゲートの右側の列の2番目の線にXゲートを配置し、次に、ホットバーからコントロー
ルツールを選択（チェストから取得した後）し、回路内のXゲートにカーソルを置きな
がら、制御量子ビットがアダマールゲートと同じ線上に来るまで、左クリックして、
カーソルをCNOTゲートに変換します。同じようにして、Xゲートが3番目の線にあ
り、制御量子ビットが最上部の線にある別のCNOTゲートを配置します。

（測定ブロックを右クリックして）回路を測定すると、毎回|000>または|111>になりま
す。

Qブロックがゴールドになったら、パズルが解けたという意味です。おめでとうござい
ます！
]]
q_command.areas.ghz_state.help_btn_caption = {}
q_command.areas.ghz_state.help_btn_caption.en = "GHZ state"
q_command.areas.ghz_state.help_btn_caption.es = q_command.areas.ghz_state.help_btn_caption.en
q_command.areas.ghz_state.help_btn_caption.ja = "GHZ状態"

------------------------------
q_command.areas.equal_super_2wire = {}
q_command.areas.equal_super_2wire.solution_statevector =
{{r=0.5,i=0},{r=0.5,i=0},{r=0.5,i=0},{r=0.5,i=0}}
q_command.areas.equal_super_2wire.help_btn_text = {}
q_command.areas.equal_super_2wire.help_btn_text.en =
[[
TLDR: Using only H gates, make the blue liquid levels correspond to the
following quantum state, commonly referred to as an equal superposition:
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
q_command.areas.equal_super_2wire.help_btn_text.es = q_command.areas.equal_super_2wire.help_btn_text.en
q_command.areas.equal_super_2wire.help_btn_text.ja =
[[
TLDR：Hゲートのみを使用して、青色の液体レベルを一般に均等な重ね合わせと呼ば
れる、次の量子状態に対応させます：
sqrt（1/4）|00> + sqrt（1/4）|01> + sqrt（1 / 4）|10> + sqrt（1/4）|11>
----

この回路は、2つのアダマールゲートを活用して、|00>、|01>、|10>、および|11>の等
しい重ね合わせを作成します。 この回路パズルを解決するには、各線にHブロックを
配置します。 これらのゲートを削除して追加したとき、結果の確率と測定結果がどの
ように変化するかに注目してください。 回路の各線にHゲートを配置するこのパター
ンは、2 ^ （量子ビットの数）個の状態で構成される重ね合わせを作成するために一般
的に使用されます。

Qブロックがゴールドになったら、パズルが解けたという意味です。おめでとうござい
ます！
]]
q_command.areas.equal_super_2wire.help_btn_caption = {}
q_command.areas.equal_super_2wire.help_btn_caption.en = "Equal superposition with two qubits"
q_command.areas.equal_super_2wire.help_btn_caption.es = q_command.areas.equal_super_2wire.help_btn_caption.en
q_command.areas.equal_super_2wire.help_btn_caption.ja = "２量子ビットの均等な重ね合わせ"

------------------------------
q_command.areas.rotate_yz_gates_puzzle = {}
q_command.areas.rotate_yz_gates_puzzle.solution_statevector =
{{r=0.5,i=0},{r=-0.5,i=0},{r=-0.5,i=0},{r=0.5,i=0}}
q_command.areas.rotate_yz_gates_puzzle.help_btn_text = {}
q_command.areas.rotate_yz_gates_puzzle.help_btn_text.en =
[[
The Rx and X gates rotate a qubit state around the X axis of a Bloch
sphere. The Ry and Y gates rotate a qubit state around the Y axis. The
Rz and Z gates rotate a qubit state around the Z axis. To work through
this puzzle, take the following steps:

1) Place an Ry gate on first column of the top wire.

2) The Bloch sphere on the top wire should have a green square at its
top, reflecting that the state of the qubit is |0>. While wielding the
Rotate Tool (the rounded tool), left-click the Ry gate 8 times, pausing
a couple of seconds each time. Each click performs a rotation of π/16
radians (11.25 degrees). Notice that the state represented on the Bloch
sphere changes, moving along a curved vertical line and ending up on its
equator. The state that should be reflected on the Bloch sphere is
commonly referred to as the plus, or |+> state.

3) Place a Z gate on the second column of the top wire. Notice that the
state represented on the Bloch sphere changes again, rotating π radians
(180 degrees) around the Z axis. Its color changes to blue, indicating
that it is located on the back side of the sphere. This state is
commonly referred to as the minus, or |-> state.

4) Place an X gate on the first column of the bottom wire. Note that
the state of that qubit rotates π radians (180 degrees) around the X
axis from the top to the bottom of the Bloch sphere.

5) Place a Hadamard gate on the second column of the bottom wire. Note
that the state reflected on the Bloch sphere is the same as the qubit on
the top wire. This demonstrates that there are many combinations
(actually an infinite number) of gate operations that can arrive at the
same state.
]]
q_command.areas.rotate_yz_gates_puzzle.help_btn_text.es = q_command.areas.rotate_yz_gates_puzzle.help_btn_text.en
q_command.areas.rotate_yz_gates_puzzle.help_btn_text.ja =
[[
RxおよびXゲートは、ブロッホ球のX軸を中心に量子ビットの状態を回転させます。
RyおよびYゲートは、Y軸を中心に量子ビットの状態を回転させます。 RzおよびZゲー
トは、Z軸を中心に量子ビットの状態を回転させます。このパズルを解くには、次の手
順を実行します。

1）上の線の最初の列にRyゲートを配置します。

2）上の線のブロッホ球の上部に緑色の正方形があり、量子ビットの状態が|0>であるこ
とを反映している必要があります。回転ツール（丸いツール）を使用しながら、Ry
ゲートを8回左クリックします（クリックの度に数秒間停止します）。クリックするた
びに、π/ 16ラジアン（11.25度）の回転が実行されます。ブロッホ球で表される状態
が、垂直の曲線に沿って移動し、最終的に赤道に到達することに注目してください。ブ
ロッホ球に反映されるべき状態は、一般にプラス、または|+>状態と呼ばれます。

3）上の線の2列目にZゲートを配置します。ブロッホ球で表される状態が再び変化し、
Z軸を中心にπラジアン（180度）回転することに注目してください。色が青に変わり、
球体の裏側にあることを示しています。この状態は一般にマイナス、または|->状態と
呼ばれます。

4）下の線の最初の列にXゲートを配置します。量子ビットの状態が、ブロッホ球の上
部から下部までX軸を中心にπラジアン（180度）回転することに注意してください。

5）下の線の2列目にアダマールゲートを配置します。ブロッホ球に反映される状態
が、上の線の量子ビットと同じになることに注目してください。これは、同じ状態に到
達できるゲート操作に多くの組み合わせ（実際には無限の数）があることを示していま
す。
]]
q_command.areas.rotate_yz_gates_puzzle.help_btn_caption = {}
q_command.areas.rotate_yz_gates_puzzle.help_btn_caption.en = "Rotate X/Y/Z gates puzzle"
q_command.areas.rotate_yz_gates_puzzle.help_btn_caption.es = q_command.areas.rotate_yz_gates_puzzle.help_btn_caption.en
q_command.areas.rotate_yz_gates_puzzle.help_btn_caption.ja = "X/Y/Z 回転ゲートのパズル"

------------------------------
q_command.areas.swap_gate_puzzle = {}
q_command.areas.swap_gate_puzzle.solution_statevector =
{{r=0,i=0},{r=0,i=0},{r=1,i=0},{r=0,i=0}}
q_command.areas.swap_gate_puzzle.help_btn_text = {}
q_command.areas.swap_gate_puzzle.help_btn_text.en =
[[
The Swap gate swaps the states of the qubits on two wires with each
other. To work through this puzzle, take the following steps:

1) Place an X gate on the top wire of the first column.

2) Notice that the blue liquid indicates there is a 100% probability
that the result will be |01> when the circuit is measured. The leftmost
digit corresponds to the bottom wire, and the rightmost digit
corresponds to the top wire. Go ahead and right-click one of the
measurement blocks to verify that |01> is always the result.

3) While wielding a Swap gate block, right-click to place it in the
second column of either wire. Then while wielding the Swap Tool (the
saw-like tool), left-click or right-click the block to navigate to the
other wire. Left-clicking moves the other swap qubit up one wire, and
right-clicking moves it down one wire. Note that this other swap qubit
has a slightly different appearance (less pixels) so that it may be
distinguished from the originally placed Swap gate block.

4) Notice that the blue liquid indicates there is now a 100% probability
that the result will be |10> when the circuit is measured. This
demonstrates that the qubits have switched wires with each other because
of the Swap gate. Go ahead and right-click one of the measurement blocks
to verify that |10> is always the result.
]]
q_command.areas.swap_gate_puzzle.help_btn_text.es = q_command.areas.swap_gate_puzzle.help_btn_text.en
q_command.areas.swap_gate_puzzle.help_btn_text.ja =
[[
スワップゲートは、2本の線上の量子ビットの状態を互いに交換します。このパズルを解くに
は、次の手順を実行します。

1）最初の列の一番上の線にXゲートを配置します。

2）青い液体が、回路の測定時に結果が|01>になる確率が100％を示していることに注目してく
ださい。左端の数字は下の線に対応し、右端の数字は上の線に対応しています。測定ブロック
の1つを右クリックして、|01>が常に結果であることを確認します。

3）スワップゲートブロックを使用しながら、右クリックして、いずれかの線の2番目の列に配
置します。次に、スワップツール（鋸のようなツール）を保持しながら、ブロックを左クリッ
クまたは右クリックして、他の線に移動します。左クリックすると、もう一方のスワップ量子
ビットが1つ上の線に移動し、右クリックすると1つ下の線に移動します。このもう一方のス
ワップ量子ビットの外観はわずかに異なる（ピクセルが少ない）ため、元のスワップゲートブ
ロックと区別できることに注意してください。

4）青い液体は、回路が測定されたときに結果が|10>になる確率が100％になったことを示して
いることに注目してください。これは、スワップゲートのために、量子ビットが相互にワイヤ
を切り替えたことを示しています。測定ブロックの1つを右クリックして、|10>が常に結果であ
ることを確認します。
]]
q_command.areas.swap_gate_puzzle.help_btn_caption = {}
q_command.areas.swap_gate_puzzle.help_btn_caption.en = "Swap gate puzzle"
q_command.areas.swap_gate_puzzle.help_btn_caption.es = q_command.areas.swap_gate_puzzle.help_btn_caption.en
q_command.areas.swap_gate_puzzle.help_btn_caption.ja = "スワップゲートパズル"

-- END Quantum circuit garden puzzles --------------------------------------------

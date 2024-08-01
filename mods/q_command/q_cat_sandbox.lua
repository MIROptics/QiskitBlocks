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

-- Cat sandbox help buttons ------------------------------------------------
q_command.areas.quantum_cats_sandbox = {}
q_command.areas.quantum_cats_sandbox.help_btn_text = {}
q_command.areas.quantum_cats_sandbox.help_btn_text.en =
[[
There are so many ones and zeros in quantum computing that some folks
find it easier to initially relate to states with real world concepts
(e.g. cats) rather than jumping straight to qubits. In the Quantum Cats
Sandbox, each of the circuits start out with cats (Alice Cat and Bob
Cat) in their grumpy state. The gates in the circuits evolve their
quantum states, resulting in various probabilities of the cats being
being grumpy or happy when observed (measured). These probabilities are
expressed by the liquid levels in the glass blocks below each circuit.
The binary digits 0 and 1 in front of the liquid blocks represent grumpy
and happy states, respectively, with the rightmost digit representing
the topmost cat.

Take a look at the circuits, beginning with the one-wire circuits on the
opposite wall, and right-click their Help buttons to learn more about
them. Feel free to remove (by left-clicking) and add (by right-clicking)
gates on a circuit to see the effects on the probabilities as well as
measurements. To measure a circuit, right-click on a block that has the
appearance of a measuring device. You will find a couple of gates and
some other items in the chest, which you may open and close by
right-clicking. To move an item from the chest into your inventory, drag
it from the upper to the lower section of the chest dialog box. The
items that appear in the top row of the inventory will appear in the
hotbar ready to be wielded.

There are some tools in the chest with which you may add control
qubits to a gate, as well as to rotate a gate. To use these tools,
position the cursor on an appropriate gate and left-click or right-click.
]]
q_command.areas.quantum_cats_sandbox.help_btn_text.es = q_command.areas.quantum_cats_sandbox.help_btn_text.en
q_command.areas.quantum_cats_sandbox.help_btn_text.ja =
[[
量子コンピューティングには非常に多くの1と0が存在するため、一部の人々は、最初
は、量子ビットの世界に直接飛び込むよりも、現実世界の概念（猫など）の状態に関連
付ける方が簡単だと感じています。 量子猫のサンドボックスでは、各回路は不機嫌な
状態の猫（Alice CatとBob Cat）で始まります。回路内のゲートは量子状態を進化さ
せ、その結果、観測された（測定された）ときに猫が不機嫌になったり幸せになったり
するさまざまな確率が生じます。これらの確率は、各回路の下のガラスブロック内の液
体レベルで表されます。液体ブロックの前の2進数0と1は、それぞれ不機嫌な状態と幸
せな状態を表し、右端の数字は最上位の猫を表します。

反対側の壁にある一つの線の回路から見始めてください。？のヘルプボタンを右クリッ
クして、回路の詳細をご覧ください。回路上のゲートを左クリックして削除し、右ク
リックして追加して、確率と測定値への影響を確認してください。回路を測定するに
は、測定デバイスがついているブロックを右クリックします。チェストの中には、いく
つかのゲートと他のアイテムがあり、右クリックで開閉できます。アイテムをチェスト
からあなたのインベントリーに移動するには、チェストのダイアログボックスの上部か
ら下部にアイテムをドラッグします。インベントリーの一番上の行に表示されるアイテ
ムは、使用可能なアイテムとしてホットバーに表示されます。

チェストには、ゲートに制御量子ビットを追加したり、ゲートを回転させたりするため
のツールがいくつかあります。これらのツールを使用するには、適切なゲートにカーソ
ルを置き、左クリックまたは右クリックします。
]]
q_command.areas.quantum_cats_sandbox.help_btn_caption = {}
q_command.areas.quantum_cats_sandbox.help_btn_caption.en = "Quantum cats sandbox"
q_command.areas.quantum_cats_sandbox.help_btn_caption.es = q_command.areas.quantum_cats_sandbox.help_btn_caption.en
q_command.areas.quantum_cats_sandbox.help_btn_caption.ja = "量子猫のサンドボックス"

------------------------------
q_command.areas.making_cats_happy = {}
q_command.areas.making_cats_happy.help_btn_text = {}
q_command.areas.making_cats_happy.help_btn_text.en =
[[
This circuit, consisting of only one wire (cat), leverages the Pauli-X
gate, also known as the NOT, or bit-flip, gate. Its effect on a grumpy
cat is to make it happy, and vice-versa. Notice how the outcome
probabilities and measurement results change as this gate is removed and
added.
]]
q_command.areas.making_cats_happy.help_btn_text.es = q_command.areas.making_cats_happy.help_btn_text.en
q_command.areas.making_cats_happy.help_btn_text.ja =
[[
この回路は、1本の線（猫）のみで構成されており、NOT（ビットフリップ）ゲートと
もよばれるパウリのXゲートを使用しています。 不機嫌な猫に対するその効果は、猫を
幸せにすることであり、逆もまた同様です。 このゲートを削除して追加したとき、そ
の結果の確率と測定結果がどのように変化するか注目してください。
]]
q_command.areas.making_cats_happy.help_btn_caption = {}
q_command.areas.making_cats_happy.help_btn_caption.en = "Making a cat happy"
q_command.areas.making_cats_happy.help_btn_caption.es = q_command.areas.making_cats_happy.help_btn_caption.en
q_command.areas.making_cats_happy.help_btn_caption.ja = "猫を幸せにする"

------------------------------
q_command.areas.superpositional_cat = {}
q_command.areas.superpositional_cat.help_btn_text = {}
q_command.areas.superpositional_cat.help_btn_text.en =
[[
This circuit leverages the Hadamard gate to put a cat into an equal
superposition of grumpy and happy. Notice how the outcome probabilities
and measurement results change as this gate is removed and added.
]]
q_command.areas.superpositional_cat.help_btn_text.es = q_command.areas.superpositional_cat.help_btn_text.en
q_command.areas.superpositional_cat.help_btn_text.ja =
[[
この回路はアダマールゲートを使用して、猫を不機嫌な状態と幸せな状態の均等な重ね
合わせ状態にします。 このゲートを削除して追加すると、結果の確率と測定結果がど
のように変化するか注目してください。
]]
q_command.areas.superpositional_cat.help_btn_caption = {}
q_command.areas.superpositional_cat.help_btn_caption.en = "Superposition of grumpy and happy cat"
q_command.areas.superpositional_cat.help_btn_caption.es = q_command.areas.superpositional_cat.help_btn_caption.en
q_command.areas.superpositional_cat.help_btn_caption.ja = "不機嫌な猫と幸せな猫の重ね合わせ"

------------------------------
q_command.areas.entangling_cats = {}
q_command.areas.entangling_cats.help_btn_text = {}
q_command.areas.entangling_cats.help_btn_text.en =
[[
This two-wire circuit demonstrates the property known as quantum
entanglement. Notice that each of the wires in the circuit are continued
by blocks separated from the main circuit. This illustrates the idea
that two entangled quantum particles may be separated by a great
distance and continue to be entangled. Measuring one of the particles
(cats) results in the measured state of the other particle to be
determined. Try it out by right-clicking one of the measurement blocks.
Also notice that the probabilities indicate that states 00 (grumpy-grumpy)
and 11 (happy-happy) are equally likely.

The CNOT gate (the two-wire gate that has the appearance of cross-hairs
and a vertical line with a dot), is partially responsible for the
entanglement. The cross-hairs symbol has the functionality of a NOT gate
used in another circuit in this cat sandbox. The difference is that it
is conditional on the state of the other wire, performing the NOT
operation whenever the other wire is in the happy cat state.
]]
q_command.areas.entangling_cats.help_btn_text.es = q_command.areas.entangling_cats.help_btn_text.en
q_command.areas.entangling_cats.help_btn_text.ja =
[[
この2つの線の回路は、量子エンタングルメントとして知られる特性を示しています。
回路内の各線は、主回路から分離されたブロックでつながっていることに注意してくだ
さい。これは、2つのエンタングル状態の量子の粒子が遠く離れた距離に分離されて
も、エンタングルしつづける可能性があるという考えを示しています。粒子（猫）の1
つを測定すると、他の粒子の測定状態が決定されます。測定ブロックの1つを右クリッ
クして試してください。また、確率は、状態00（不機嫌-不機嫌）と11（幸せ-幸せ）が
等しく発生する可能性があることを示していることに注意してください。

CNOTゲート（十字線と点のある垂直線を持つ2線のゲート）は、エンタングルメント
の原因の一部です。十字記号には、この猫のサンドボックス内の別の回路で使用される
NOTゲートの機能があります。違いは、一方の線の状態を条件とし、その線が幸せな
猫状態にあるときにNOT操作を実行することです。
]]
q_command.areas.entangling_cats.help_btn_caption = {}
q_command.areas.entangling_cats.help_btn_caption.en = "Entangling cats"
q_command.areas.entangling_cats.help_btn_caption.es = q_command.areas.entangling_cats.help_btn_caption.en
q_command.areas.entangling_cats.help_btn_caption.ja = "猫をエンタングルする"



-- END Cat sandbox help buttons --------------------------------------------



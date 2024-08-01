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

-- QASM Chasm puzzles ------------------------------------------------
q_command.areas.quantum_teleportation = {}
q_command.areas.quantum_teleportation.solution_statevector =
{{r=0.5,i=0},{r=0.5,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0,i=0},{r=0.5,i=0},{r=0.5,i=0}}
q_command.areas.quantum_teleportation.help_btn_text = {}
q_command.areas.quantum_teleportation.help_btn_text.en =
[[
This circuit demonstrates quantum teleportation, and is an example from
the paper entitled Open Quantum Assembly Language by Andrew W. Cross,
Lev S. Bishop, John A. Smolin, and Jay M. Gambetta. It also demonstrates
the ability of OpenQASM to conditionally apply gates based on prior
measurement outcomes.

To complete the quantum teleportation circuit, grab a classically
controlled "if" block out of the chest. Place it to the left of the Z
gate on the bottom wire by right-clicking on the space marked with a
dashed line. Continue right-clicking until the block displays "if = 1"
and the horizontal mark on the block corresponds with the measurement
block on the top wire (in this case you will only need to click once
more).

The Q block will turn gold when the circuit is correct. Then you may
experiment with quantum teleportation by left and right clicking the Ry
and Rz gates while wielding the Rotate Tool. The Bloch sphere at the top
of the chasm should reflect the state that you set with rotations. Note
that it is expected for the Q block to turn black again.
]]
q_command.areas.quantum_teleportation.help_btn_text.es = q_command.areas.quantum_teleportation.help_btn_text.en
q_command.areas.quantum_teleportation.help_btn_text.ja =
[[
この回路は、量子テレポーテーションを示しており、Andrew W. Cross、Lev S. Bishop、John
A. Smolin、およびJay M. Gambettaによる「Open Quantum Assembly Language」という題名
の論文の例です。また、以前の測定結果に基づいて条件付きでゲートを適用するOpenQASMの
機能も示しています。

量子テレポーテーション回路を完成させるには、古典的に制御された「if」ブロックをチェスト
から取り出します。破線でマークされたスペースを右クリックして、一番下の線のZゲートの
左側に配置します。ブロックに「if = 1」が表示され、ブロックの水平マークが上部の線の測定
ブロックに対応するまで右クリックを続けます（この場合、一度クリックするだけです）。

回路が正しい場合、Qブロックは金色に変わります。次に、回転ツールを使用しながらRyおよ
びRzゲートを左右にクリックして、量子テレポーテーションを試すことができます。キャズム
の上部にあるブロッホ球は、回転で設定した状態が反映されています。 Qブロックが再び黒く
なることに注意してください。
]]
q_command.areas.quantum_teleportation.help_btn_caption = {}
q_command.areas.quantum_teleportation.help_btn_caption.en = "Quantum teleportation"
q_command.areas.quantum_teleportation.help_btn_caption.es = q_command.areas.quantum_teleportation.help_btn_caption.en
q_command.areas.quantum_teleportation.help_btn_caption.ja = "量子テレポーテーション"

-- END QASM Chasm puzzles --------------------------------------------



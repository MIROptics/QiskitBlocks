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
q_command.areas.quantum_cats_sandbox.help_btn_text.ja = q_command.areas.quantum_cats_sandbox.help_btn_text.en
q_command.areas.quantum_cats_sandbox.help_btn_caption = "Quantum cats sandbox :-)"
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
q_command.areas.making_cats_happy.help_btn_text.ja = q_command.areas.making_cats_happy.help_btn_text.en
q_command.areas.making_cats_happy.help_btn_caption = "Making a cat happy :-)"

-- END Cat sandbox help buttons --------------------------------------------



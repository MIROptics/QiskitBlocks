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
q_command.areas.quantum_teleportation.help_btn_text.ja = q_command.areas.quantum_teleportation.help_btn_text.en
q_command.areas.quantum_teleportation.help_btn_caption = "Quantum teleportation"

-- END QASM Chasm puzzles --------------------------------------------



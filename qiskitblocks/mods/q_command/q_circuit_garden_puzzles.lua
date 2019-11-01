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
q_command.areas.x_gate.help_btn_text.ja = q_command.areas.x_gate.help_btn_text.en
q_command.areas.x_gate.help_btn_caption = "Quantum NOT gate"

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
q_command.areas.h_gate.help_btn_text.ja = q_command.areas.h_gate.help_btn_text.en
q_command.areas.h_gate.help_btn_caption = "Hadamard gate"

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
q_command.areas.cnot_gate_puzzle.help_btn_text.ja = q_command.areas.cnot_gate_puzzle.help_btn_text.en
q_command.areas.cnot_gate_puzzle.help_btn_caption = "CNOT gate puzzle"

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
q_command.areas.hxx_gates.help_btn_text.ja = q_command.areas.hxx_gates.help_btn_text.en
q_command.areas.hxx_gates.help_btn_caption = "Hadamard and X gates 3 wires"

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
q_command.areas.bell_phi_plus.help_btn_text.ja = q_command.areas.bell_phi_plus.help_btn_text.en
q_command.areas.bell_phi_plus.help_btn_caption = "Bell State: phi+"

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
q_command.areas.bell_phi_minus.help_btn_text.ja = q_command.areas.bell_phi_minus.help_btn_text.en
q_command.areas.bell_phi_minus.help_btn_caption = "Bell State: phi-"

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
q_command.areas.bell_psi_plus.help_btn_text.ja = q_command.areas.bell_psi_plus.help_btn_text.en
q_command.areas.bell_psi_plus.help_btn_caption = "Bell State: psi+"

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
q_command.areas.bell_psi_minus.help_btn_text.ja = q_command.areas.bell_psi_minus.help_btn_text.en
q_command.areas.bell_psi_minus.help_btn_caption = "Bell State: psi-"

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
q_command.areas.ghz_state.help_btn_text.ja = q_command.areas.ghz_state.help_btn_text.en
q_command.areas.ghz_state.help_btn_caption = "GHZ state"

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
q_command.areas.equal_super_2wire.help_btn_text.ja = q_command.areas.equal_super_2wire.help_btn_text.en
q_command.areas.equal_super_2wire.help_btn_caption = "Equal superposition with two qubits"

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
q_command.areas.rotate_yz_gates_puzzle.help_btn_text.ja = q_command.areas.rotate_yz_gates_puzzle.help_btn_text.en
q_command.areas.rotate_yz_gates_puzzle.help_btn_caption = "Rotate X/Y/Z gates puzzle"

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
q_command.areas.swap_gate_puzzle.help_btn_text.ja = q_command.areas.swap_gate_puzzle.help_btn_text.en
q_command.areas.swap_gate_puzzle.help_btn_caption = "Swap gate puzzle"

-- END Quantum circuit garden puzzles --------------------------------------------

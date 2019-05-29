#### Circuit builder mod design

Provide ability for the player to create a quantum circuit with blocks, execute the circuit on an IBM quantum simulator, and visualize the results. 

##### First iteration: One-wire circuit

This iteration will provide for the following player use cases.

* User places blocks on a horizontal line in a designated area that has the appearance of an IBM quantum computer. Each block represents a gate. In this first iteration, supported gates will be "X", "H", and identity.
* As the player builds or modifies the circuit, two quantum state blocks labeled $\vert0\rangle$ and $\vert1\rangle$ will represent the resultant quantum state, with their opacity corresponding to their measurement probability. This computation will take place on a Qiskit statevector_simulator.
* Whenever the player moves in such a way that these quantum state blocks go out of view and back into view, only one block, labeled either $\vert0\rangle$ or $\vert1\rangle$, will appear. This computation will take place on a Qiskit qasm_simulator.

Technical challenges include:

* Creating a Minetest mod
* Invoking an IBM quantum simulator from a Minetest mod, presumably from Lua scripts.


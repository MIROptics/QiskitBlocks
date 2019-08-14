# QiskitBlocks
Teaches quantum computing and Qiskit in a Minetest block world

## Installation
1. Download and install [Minetest](https://www.minetest.net/). Note: This site has an alternative for MacOS Homebrew installation: https://www.techspot.com/downloads/5585-minetest.html
1. Clone this QiskitBlocks project, and copy the `q_command`, `circuit_blocks` and `mpd` mods from 
the `mods` folder of this QiskitBlocks project into the `games/minetest_game/mods` folder of your 
Minetest installation.
1. Add the following line to the `minetest.conf` file located the `games/minetest_game` folder of 
your Minetest installation: `secure.http_mods = q_command`
1. Add a `worlds` folder (if it doesn't already exist) to your Minetest installation at the same 
level as the `games` folder. 
1. Copy the `puzzle_map_demo` folder from from the `worlds` folder of this distribution into 
the `worlds` folder of your Minetest installation.
1. Checkout and run the [QiskitBlocksSevice](https://github.com/JavaFXpert/QiskitBlocksService) 
project, as that service accesses the Qiskit quantum simulators that power the QiskitBlocks quantum 
circuits.
1. Open the Minetest application, uncheck the `Creative Mode`, `Enable Damage`, and `Host Server` checkboxes. Then select the world `puzzle_map_demo` from the menu, and click `start game`.

Please reach out to James Weaver on Qiskit Slack (located at [qiskit.org](http://qiskit.org)) with questions or feedback.

![Quantum Circuits Garden in QiskitBlocks](https://github.com/JavaFXpert/QiskitBlocks/raw/master/quantum_circuits_garden.png)

![Quantum Cats Sandbox in QiskitBlocks](https://github.com/JavaFXpert/QiskitBlocks/raw/master/quantum_cats_sandbox.png)

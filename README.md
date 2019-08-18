# QiskitBlocks
Teaches quantum computing and Qiskit in a Minetest block world.

## Installation
1. Download and install [Minetest 5.0.1](https://www.minetest.net/). Note: This site has a preferred alternative to MacOS Homebrew installation: https://www.techspot.com/downloads/5585-minetest.html

1. Clone this QiskitBlocks project, and copy the `qiskitblocks_games` folder of this QiskitBlocks project into the `games` folder of your 
  Minetest installation.

1. Add a `worlds` folder (if it doesn't already exist) to your Minetest installation at the same 
  level as the `games` folder. 

1. Copy the `quantum_circuits_world` folder from from the `worlds` folder of this distribution into 
  the `worlds` folder of your Minetest installation.

1. QiskitBlocks makes requests to a service named QiskitBlocksService which accesses Qiskit quantum simulators that power the QiskitBlocks quantum circuits. By default, QiskitBlocks uses a cloud-based QiskitBlocksService, so public internet access is required at runtime. Optionally, you can checkout and run the [QiskitBlocksService](https://github.com/JavaFXpert/QiskitBlocksService) locally. If you choose to do that, then uncomment (remove the leading `#` character) the following lines in `qiskitblocks_game/minetest.conf` :

  ```
  #qiskit_service_host = http://localhost:5000
  ```

  ```
  #qiskit_service_timeout = 5 
  ```

1. Open the Minetest application, uncheck the `Creative Mode`, `Enable Damage`, and `Host Server` checkboxes, and select the round `QiskitBlocks` game from the lower left. Then select the world `quantum_circuits_world [qiskitblocks]` from the menu, and click `Play Game`.

Please reach out to James Weaver on Qiskit Slack (located at [qiskit.org](http://qiskit.org)) with questions or feedback.

![Quantum Circuits Garden in QiskitBlocks](https://github.com/JavaFXpert/QiskitBlocks/raw/master/quantum_circuits_garden.png)

![Quantum Cats Sandbox in QiskitBlocks](https://github.com/JavaFXpert/QiskitBlocks/raw/master/quantum_cats_sandbox.png)

![Quantum Blocks Academy in QiskitBlocks](https://github.com/JavaFXpert/QiskitBlocks/raw/master/quantum_blocks_academy.png)

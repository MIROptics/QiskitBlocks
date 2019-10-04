# QiskitBlocks
Teaches quantum computing and Qiskit in a Minetest block world. 
- Here are the [Quantum Computing Workshop with QiskitBlocks web-based slides](https://slides.com/javafxpert/qiskitblocks).
- See a QiskitBlocks tour in the [Learn how to play and build a Minetest-based game using Qiskit](https://youtu.be/kmCSxfrK_Mg) from IBM Q. 
- Here's a [brief video demo of QiskitBlocks](https://vimeo.com/356185384). 

Please choose one of the *Installing and running* options below and follow the instructions.

## Installing and running (the quick and easy way using the Minetest Content Database)
- Download, install and run [Minetest 5.0.1](https://www.minetest.net/). Note: This site has a preferred alternative to MacOS Homebrew installation: https://www.techspot.com/downloads/5585-minetest.html

- Click the `Content` tab shown here, then click the `Browse online content` button. 
![Minetest Content Tab](https://github.com/JavaFXpert/QiskitBlocks/raw/master/minetest_content_tab.png)

- When on the page shown shown here, type `QiskitBlocks`, click the `Search` button, and click the `Install` button beside the `QiskitBlocks` row. Click the `Back to Main Menu` button when installation has completed.
![Minetest Search QiskitBlocks](https://github.com/JavaFXpert/QiskitBlocks/raw/master/minetest_search_qiskitblocks.png)

- Click the `Start Game` tab shown here, select the round `QiskitBlocks` game from the lower left, deselect the three checkboxes, and click the `New` button.
![Minetest Start Game QiskitBlocks](https://github.com/JavaFXpert/QiskitBlocks/raw/master/minetest_startgame_qiskitblocks.png)

- From the *new world* dialog shown here, make up a world name with characters and underscores, enter `0` in the `Seed` field, select `singlenode` or `flat` in the `Mapgen` field, and click the `Create` button.
![Minetest New World Dialog](https://github.com/JavaFXpert/QiskitBlocks/raw/master/minetest_newworld_qiskitblocks.png)

- Click the `Play Game` button, waiting a few seconds while the new world is generated and lighted.

- Jump to the `Explore and learn` section below.

## Installing and running (by cloning this repo instead instead of using the Minetest Content Database)
- Download and install [Minetest 5.0.1](https://www.minetest.net/). Note: This site has a preferred alternative to MacOS Homebrew installation: https://www.techspot.com/downloads/5585-minetest.html

- Clone this QiskitBlocks project, and copy the `qiskitblocks_games` folder of this QiskitBlocks project into the `games` folder of your 
  Minetest installation.

- Add a `worlds` folder (if it doesn't already exist) to your Minetest installation at the same 
  level as the `games` folder. 

- Copy the `quantum_circuits_world` folder from from the `worlds` folder of this distribution into 
  the `worlds` folder of your Minetest installation.

- QiskitBlocks makes requests to a service named QiskitBlocksService which accesses Qiskit quantum simulators that power the QiskitBlocks quantum circuits. By default, QiskitBlocks uses a cloud-based QiskitBlocksService, so public internet access is required at runtime. Optionally, you can checkout and run the [QiskitBlocksService](https://github.com/JavaFXpert/QiskitBlocksService) locally. If you choose to do that, then uncomment (remove the leading `#` character) the following lines in `qiskitblocks_game/minetest.conf` :

  ```
  #qiskit_service_host = http://localhost:5000
  ```

  ```
  #qiskit_service_timeout = 5 
  ```

- Open the Minetest application, select the round `QiskitBlocks` game from the lower left, and uncheck the `Creative Mode`, `Enable Damage`, and `Host Server` checkboxes. Then select the world `quantum_circuits_world [qiskitblocks]` from the menu, and click `Play Game`.
![QiskitBlocks in Minetest menu](https://github.com/JavaFXpert/QiskitBlocks/raw/master/qiskitblocks_minetest_screen.png)

## Explore and learn!
- When you're in the starting room with all of the quantum operation blocks on the wall, use the W, A, S, D keys to walk up to the sign on the right side of the door. Right-click the sign and follow the instructions. Have fun exploring and solving quantum circuit puzzles! 

Please reach out to James Weaver on Qiskit Slack (located at [qiskit.org](http://qiskit.org)) with questions or feedback.

![Quantum Blocks Academy in QiskitBlocks](https://github.com/JavaFXpert/QiskitBlocks/raw/master/quantum_blocks_academy.png)

![Quantum Circuits Garden in QiskitBlocks](https://github.com/JavaFXpert/QiskitBlocks/raw/master/quantum_circuits_garden.png)

![Quantum Cats Sandbox in QiskitBlocks](https://github.com/JavaFXpert/QiskitBlocks/raw/master/quantum_cats_sandbox.png)

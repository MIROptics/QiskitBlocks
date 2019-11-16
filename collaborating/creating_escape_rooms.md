# Creating escape rooms in QiskitBlocks

One of the ways that QiskitBlocks may be leveraged to teach quantum computing is with the use of *escape rooms*, arranged in a pedagogical sequence in a *level*. For example, Level I teaches some fundamental concepts of quantum circuits and gates, and Level II teaches how to create quantum logic gates and oracles. Other levels are currently being developed to teach additional quantum computing related concepts, so this document is intended to serve as a guide for those who would like to contribute a level of escape rooms.

## Setting up to create escape rooms

First, you'll need to [install and run QiskitBlocks](https://github.com/JavaFXpert/QiskitBlocks/blob/master/README.md). It will also be helpful to solve all of the circuit puzzles in the Level I & II escape rooms to get a feel for the style and incremental approach taken to teach quantum computing concepts. You can enter Level I using instructions in the game, and enter Level II by following the  sign after completing Level I. You may also teleport to the Portal Room, shown below, by jumping through an orange portal in any of the escape rooms. From the Portal Room you may enter various levels of escape rooms, noting that several are under construction or unavailable, as indicated by icons on the wall.

![Portal Room in QiskitBlocks](https://github.com/JavaFXpert/QiskitBlocks/raw/master/qiskitblocks_portal_room.png)

After successfully installing QiskitBlocks, there will be a directory with the following relative path that contains the code for QiskitBlocks:

`minetest/games/qiskitblocks`

Subordinate to that directory, there will be a path with the following name that contains code relevant to escape rooms and other areas in the world:

`mods/q_command`

Specifically, there are files with the following naming convention whose contents will need to be modified as the escape rooms themselves are modified:

`q_*.lua`

There is also a directory named `textures` that contains the 16x16 pixel `PNG` image files for many of the blocks in the world.

## Defining and building new escape rooms

Some levels in the world contain placeholder escape rooms and circuits, and are ready for construction. To define and build a series of escape rooms on a given level, after given the go-ahead do the following:

1. In Creative Mode, navigate to that level in the world and note that there are placeholder circuits, chests, exit doors, orange portals, signs and Professor Q chat text in all 16 of its rooms.
2. Open the Lua file corresponding to the Level. For example, the file for Level VII has the following name:
   `q_esc_rooms_level_7.lua`
3. Follow the instructions in the "Note to devs:" comments in the code, modifying the escape rooms and code as required. For example, you'll do the following activities for each room:
   - Delete the placeholder circuit by pressing the shift key and left-clicking its Q-block.
   - Add your desired circuit with the following steps:
     - Obtain the appropriate Q-block from inventory.
     -  Place the Q-block in the room with a right-click. If you place it in a different position than the original, you'll need to modify the coordinates in the Lua file. 
     - Right-click the Q-block and supply the desired number of wires and columns in the circuit. Be careful to avoid knocking out walls and ceilings with circuits that are too large to fit.
     - Obtain blocks from the chest to build the circuit that solves your puzzle. The solution may be defined in terms of the desired result from the statevector_simultor, or unitary_simulator.
     - Remove the blocks not required by the solution from the appropriate place in the Lua file.
     - Uncomment the appropriate debug line so that the state vector, or unitary matrix, will print.
     - Left-click the Q-block to invoke the simulator, copying and pasting the output from the `debug.txt` file into a scratch file. In the scratch file, remove all of the spaces, tabs, and newline characters before pasting it into the appropriate place in the Lua file.
   - If you change the location of the chest, exit door, or portal, then edit the corresponding positions in the Lua file.
   - If you want to define additional wall blocks, create the corresponding `PNG` image files and lines in the `q_make_wall_blocks.lua` file. The PNG files should contain minimal metadata so that their size is close to around 200 bytes.
4. A detailed process for managing the escape levels content, and updating the live QiskitBlocks codebase/world hasn't been defined yet. Until it has, fork the QiskitBlocks repo and submit pull requests for your code and world updates. The latter would consist of naming the directory structure for your updated world  (in the `worlds` directory) something unique, and submitting it in the pull request.
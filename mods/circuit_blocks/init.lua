-- TODO:

--[[
[] Make empty wire blocks appear in correct orientation after removing a gate, as well as the gates themselves
[] Add all other direction code, including:
	[] Deleting wire_extension blocks correctly
[] Fix problem of histogram blocks appearing in wrong orientation after creating a circuit
	in what seems like the same wrong orientation
[] Place q_command block and wire_extension_block in correct direction
[] Rotate nodes in wire extensions that are in non +Z directions
[] Try non-creative mode, using a chest for objects
[] Check for pos x and z being nil instead of ~= 0 so that things don't break on pos x==0 or z==0
[] Make circuit extension M block item fall where it can easily be picked up
[] Fix issue when right-clicking empty block with a control tool or rotate tool
[] Prevent right-clicking on wire_extension_block after wire_extension exists
[] Create teleportation demo using JWootton terrain generation image to state vector ideas
[] Don't allow creating circuit if already exists
[] Create marble floor
[] Clicking basis state ellipse block shows a state vector display?
[] Create game environment with rooms that are significant in quantum computing history
[] Make arrow blocks (connector, extenders, etc.) point correct direction on all sides
[] Don't allow extenders to be placed on extensions.
[] Check into warning message:
2019-06-29 07:53:26: WARNING[Server]: Map::getNodeMetadata(): Block not found
2019-06-29 07:53:26: WARNING[Server]: Map::removeNodeMetadata(): Block not found
[] Can liquid blocks have tooltip that shows probability and other info (e.g. amp & phase)?
[] Fast way to create walls and floors
[] Protect against orphaning wire extensions
[] don't allow placing continuation on a wire extension
[] Don't allow deletion of individual blocks.
[] Filter inventory panel (e.g. hide rotation blocks)
[] Walk up to a dropped item to pick it up
[] Ability for measurement block to actuate (e.g. turn on a light or open a door)
[] Set wire_extension itemstack count to 0 when deleting wire extension related elements
[] Label M & F connectors
[] Make shift-right-click place a gate on all wires?
[] Use JWootton terrain generation mod
[] Make |0> |1> labels on measure block on left & right
[] Remove circuit_gate group code
[] Understand and standardize on when to use colon, or dot, as function separator
[] Find alternative to hardcoding node name strings everywhere
[] Remove hearts from creative mode
[] Update music and sounds
[] Should this warning be addressed?
	2019-06-29 08:11:11: WARNING[Main]: Irrlicht: PNG warning: iCCP: CRC error
--]]

dofile(minetest.get_modpath("circuit_blocks").."/circuit_blocks.lua");
dofile(minetest.get_modpath("circuit_blocks").."/circuit_node_types.lua");

minetest.register_node("circuit_blocks:qubit_0", {
    description = "Qubit 0 block",
    tiles = {"circuit_blocks_qubit_0.png"},
    groups = {oddly_breakable_by_hand=2},
	paramtype2 = "facedir"
})

minetest.register_node("circuit_blocks:qubit_1", {
    description = "Qubit 1 block",
    tiles = {"circuit_blocks_qubit_1.png"},
    groups = {oddly_breakable_by_hand=2},
	paramtype2 = "facedir"
})


minetest.register_tool("circuit_blocks:control_tool", {
	description = "Control tool",
	inventory_image = "circuit_blocks_control_tool.png",
	wield_image = "circuit_blocks_control_tool.png",
	wield_scale = { x = 1, y = 1, z = 1 },
	range = 10,
	tool_capabilities = {},
})

minetest.register_tool("circuit_blocks:rotate_tool", {
	description = "Rotate tool",
	inventory_image = "circuit_blocks_rotate_tool.png",
	wield_image = "circuit_blocks_rotate_tool.png",
	wield_scale = { x = 1, y = 1, z = 1 },
	range = 10,
	tool_capabilities = {},
})

circuit_blocks:register_circuit_block(CircuitNodeTypes.EMPTY, false, false, 0, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.X, false, false, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.X, true, true, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.X, true, false, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.X, false, true, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.H, false, false, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.H, true, false, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.H, false, true, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.Y, false, false, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.Y, true, false, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.Y, false, true, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.Z, false, false, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.Z, true, false, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.Z, false, true, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.S, false, false, 0, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.SDG, false, false, 0, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.T, false, false, 0, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.TDG, false, false, 0, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.CTRL, true, true, 0, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.CTRL, true, false, 0, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.CTRL, false, true, 0, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.TRACE, false, false, 0, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.MEASURE_Z, false, false, 0, false,"", "z")
circuit_blocks:register_circuit_block(CircuitNodeTypes.MEASURE_Z, false, false, 0, false,"","0")
circuit_blocks:register_circuit_block(CircuitNodeTypes.MEASURE_Z, false, false, 0, false, "","1")
circuit_blocks:register_circuit_block(CircuitNodeTypes.CONNECTOR_M, false, false, 0, false, "q_command:wire_extension_block")
-- circuit_blocks:register_circuit_block(CircuitNodeTypes.CONNECTOR_F, false, false, 0, false)

local ROTATION_RESOLUTION = 32
for idx = 0, ROTATION_RESOLUTION do
    circuit_blocks:register_circuit_block(CircuitNodeTypes.X, false, false, idx, true)
    circuit_blocks:register_circuit_block(CircuitNodeTypes.Y, false, false, idx, true)
    circuit_blocks:register_circuit_block(CircuitNodeTypes.Z, false, false, idx, true)
end



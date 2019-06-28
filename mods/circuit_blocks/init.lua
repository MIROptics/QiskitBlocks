-- TODO:

--[[
[] Delete entire circuit including wire extensions. Don't allow deletion of individual blocks.
[] Don't allow creating circuit if already exists
[] Ability to place circuits and wire extensions in four orientations, perpendicular to
   direction that player is facing
[] Protect against orphaning wire extensions
[] Ability for measurement block to actuate (e.g. turn on a light or open a door)
[] Set wire_extension itemstack count to 0 when deleting wire extension related elements
[] Label M & F connectors
[] Remove circuit_gate group code
[] Understand and standardize on when to use colon, or dot, as function separator
[] Find alternative to hardcoding node name strings everywhere
[] Remove hearts from creative mode
--]]

dofile(minetest.get_modpath("circuit_blocks").."/circuit_blocks.lua");
dofile(minetest.get_modpath("circuit_blocks").."/circuit_node_types.lua");

minetest.register_node("circuit_blocks:qubit_0", {
    description = "Qubit 0 block",
    tiles = {"circuit_blocks_qubit_0.png"},
    groups = {oddly_breakable_by_hand=2}
})

minetest.register_node("circuit_blocks:qubit_1", {
    description = "Qubit 1 block",
    tiles = {"circuit_blocks_qubit_1.png"},
    groups = {oddly_breakable_by_hand=2}
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



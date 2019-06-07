dofile(minetest.get_modpath("circuit_blocks").."/circuit_node_types.lua");

minetest.register_node("circuit_blocks:qubit_0", {
    description = "Qubit 0 block",
    tiles = {"qubit_0.png"},
    groups = {oddly_breakable_by_hand=2}
})

minetest.register_node("circuit_blocks:qubit_1", {
    description = "Qubit 1 block",
    tiles = {"qubit_1.png"},
    groups = {oddly_breakable_by_hand=2}
})

minetest.register_node("circuit_blocks:x_gate", {
    description = "Pauli X gate block",
    tiles = {"x_gate.png"},
    groups = {oddly_breakable_by_hand=2},
    on_construct = function(pos)
		local meta = minetest.get_meta(pos)
        meta:set_int("node_type", CircuitNodeTypes.X)
		meta:set_float("radians", 0.0)
		meta:set_int("ctrl_a", -1)
		meta:set_int("ctrl_b", -1)
        minetest.debug("Set meta for X gate")
	end,
    on_punch = function(pos, node, player)
		local meta = minetest.get_meta(pos)
		local node_type = meta:get_int("node_type")
		local radians = meta:get_float("radians")
		local ctrl_a = meta:get_int("ctrl_a")
		local ctrl_b = meta:get_int("ctrl_b")
        minetest.debug("node_type: " .. tostring(ctrl_a) ..
                ", radians: " .. tostring(radians) ..
                ", ctrl_a: " .. tostring(ctrl_a) ..
                ", ctrl_b: " .. tostring(ctrl_b))
        return
    end
})

minetest.register_node("circuit_blocks:h_gate", {
    description = "Hadamard gate block",
    tiles = {"h_gate.png"},
    groups = {oddly_breakable_by_hand=2}
})

minetest.register_node("circuit_blocks:no_gate", {
    description = "Empty wire block",
    tiles = {"no_gate.png"},
    groups = {oddly_breakable_by_hand=2}
})
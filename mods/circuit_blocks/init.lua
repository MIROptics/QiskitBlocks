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
    groups = {oddly_breakable_by_hand=2}
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
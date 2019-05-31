minetest.register_node("quantum_gates:x_gate", {
    description = "Pauli X gate block",
    tiles = {"x_gate.png"},
    groups = {oddly_breakable_by_hand=2}
})

minetest.register_node("quantum_gates:h_gate", {
    description = "Hadamard gate block",
    tiles = {"h_gate.png"},
    groups = {oddly_breakable_by_hand=2}
})

minetest.register_node("quantum_gates:no_gate", {
    description = "Empty wire block",
    tiles = {"no_gate.png"},
    groups = {oddly_breakable_by_hand=2}
})
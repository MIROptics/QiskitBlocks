-- TODO:
--  Define Quantum control block that creates circuit, etc.

-- our API object
q_command = {}

minetest.debug("In q_command/init.lua")

minetest.register_node("q_command:q_block", {
    description = "Q command block",
    tiles = {"q_command_block.png"},
    groups = {oddly_breakable_by_hand=2}
})




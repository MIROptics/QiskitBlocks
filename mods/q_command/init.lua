-- TODO:
--  Define Quantum control block that creates circuit, etc.

-- our API object
q_command = {}

minetest.debug("In q_command/init.lua")

minetest.register_node("q_command:q_block", {
    description = "Q command block",
    tiles = {"q_command_block.png"},
    groups = {oddly_breakable_by_hand=2},
    on_construct = function(pos)
        local meta = minetest.get_meta(pos)
        meta:set_string("infotext", "Quantum circuit command block");
        meta:set_string("formspec",
                "size[8,9]"..
                "field[0.3,3.5;2.2,1;;label:;'foo']"..
                "field[0.3,4.5;2.2,1;;label2:;'bar']")
    end
})




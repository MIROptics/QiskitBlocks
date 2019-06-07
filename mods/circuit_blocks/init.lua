-- TODO: Ascertain how to tell whether a node is in a group

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
    groups = {oddly_breakable_by_hand=2, circuit_gate=7},
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
    end,
	on_rightclick = function(pos, node, clicker, itemstack)
		local meta = minetest.get_meta(pos)
		local node_type = meta:get_int("node_type")
		local radians = meta:get_float("radians")
		local ctrl_a = meta:get_int("ctrl_a")
		local ctrl_b = meta:get_int("ctrl_b")

        if itemstack:get_name() == "circuit_blocks:control_tool" then
            ctrl_a = ctrl_a * -1
            meta:set_int("ctrl_a", ctrl_a)
            local player_name = clicker:get_player_name()
            minetest.chat_send_player(player_name, "ctrl_a is now: " .. tostring(ctrl_a))
            -- TODO: Make something like this work
            minetest.chat_send_player(player_name, "circuit_gate rating: " .. minetest.get_item_group(node, "oddly_breakable_by_hand"))
        end
	end
})

minetest.register_node("circuit_blocks:h_gate", {
    description = "Hadamard gate block",
    tiles = {"h_gate.png"},
    groups = {oddly_breakable_by_hand=2, circuit_gate=1}
})

minetest.register_node("circuit_blocks:no_gate", {
    description = "Empty wire block",
    tiles = {"no_gate.png"},
    groups = {oddly_breakable_by_hand=2}
})

minetest.register_tool("circuit_blocks:control_tool", {
	description = "Control tool",
	inventory_image = "control_tool.png",
	wield_image = "control_tool.png",
	wield_scale = { x = 1, y = 1, z = 1 },
	range = 10,
	tool_capabilities = {},
})

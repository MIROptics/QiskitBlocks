-- TODO:
--  Define Quantum control block that creates circuit, etc.
--  Right click places circuit_gate
--  Make left click drop gate entity
--  Utilize is_gate boolean parameter of register_circuit_block function to
--      identify circuit blocks that are circuit gates
--  Remove circuit_gate group code

dofile(minetest.get_modpath("circuit_blocks").."/circuit_node_types.lua");

-- our API object
circuit_blocks = {}

-- returns circuit_blocks object or nil
-- TODO: Use : instead of . for consistency?
--function circuit_blocks.get(pos)
--	local node_name = minetest.get_node(pos).name
--	if minetest.registered_nodes[node_name] then
--		return {
--			pos = pos,
--		}
--	else
--		return nil
--	end
--end


function circuit_blocks:register_circuit_block(circuit_node_type,
                                               connector_up,
                                               connector_down,
                                               rotational,
                                               is_gate)
    local texture_name = ""
    if circuit_node_type == CircuitNodeTypes.EMPTY then
        texture_name = "circuit_blocks_no_gate"
    elseif circuit_node_type == CircuitNodeTypes.X then
        texture_name = "circuit_blocks_x_gate"
        if connector_up and not connector_down then
            texture_name = "circuit_blocks_not_gate_up"
        elseif connector_down and not connector_up then
            texture_name = "circuit_blocks_not_gate_down"
        end
    elseif circuit_node_type == CircuitNodeTypes.H then
        texture_name = "circuit_blocks_h_gate"
    end
    minetest.register_node("circuit_blocks:"..texture_name, {
        description = texture_name,
        tiles = {texture_name..".png"},
        groups = {circuit_gate=1, oddly_breakable_by_hand=2},
        on_construct = function(pos)
            local meta = minetest.get_meta(pos)
            meta:set_int("node_type", circuit_node_type)
            meta:set_float("radians", 0.0)
            meta:set_int("ctrl_a", -1)
            meta:set_int("ctrl_b", -1)
            meta:get_int("is_gate", is_gate)
            minetest.debug("In on_construct: meta:to_table():\n" .. dump(meta:to_table()))
        end,
        on_punch = function(pos, node, player)
            local meta = minetest.get_meta(pos)
            local node_type = meta:get_int("node_type")
            local radians = meta:get_float("radians")
            local ctrl_a = meta:get_int("ctrl_a")
            local ctrl_b = meta:get_int("ctrl_b")
            local is_gate = meta:get_int("is_gate")
            local is_on_grid = meta:get_int("circuit_specs_is_on_grid")
            minetest.debug("In on_punch: meta:to_table():\n" .. dump(meta:to_table()))
            if is_on_grid and is_on_grid == 1 then
                -- TODO: Factor this into a function
                -- Retrieve circuit_specs metadata
                meta = minetest.get_meta(pos)
                local circuit_num_wires = meta:get_int("circuit_specs_num_wires")
                local circuit_num_columns = meta:get_int("circuit_specs_num_columns")
                local circuit_is_on_grid = meta:get_int("circuit_specs_is_on_grid")
                local circuit_pos_x = meta:get_int("circuit_specs_pos_x")
                local circuit_pos_y = meta:get_int("circuit_specs_pos_y")
                local circuit_pos_z = meta:get_int("circuit_specs_pos_z")

                minetest.set_node(pos, {name = "circuit_blocks:circuit_blocks_no_gate"})

                -- Put circuit_specs metadata on placed node
                meta = minetest.get_meta(pos)
                meta:set_int("circuit_specs_num_wires", circuit_num_wires)
                meta:set_int("circuit_specs_num_columns", circuit_num_columns)
                meta:set_int("circuit_specs_is_on_grid", circuit_is_on_grid)
                meta:set_int("circuit_specs_pos_x", circuit_pos_x)
                meta:set_int("circuit_specs_pos_y", circuit_pos_y)
                meta:set_int("circuit_specs_pos_z", circuit_pos_z)
            end
            return
        end,
        can_dig = function(pos)
            local meta = minetest.get_meta(pos)
            local node_type = meta:get_int("node_type")
            local radians = meta:get_float("radians")
            local ctrl_a = meta:get_int("ctrl_a")
            local ctrl_b = meta:get_int("ctrl_b")
            local is_gate = meta:get_int("is_gate")
            local is_on_grid = meta:get_int("circuit_specs_is_on_grid")
            minetest.debug("In can_dig: meta:to_table():\n" .. dump(meta:to_table()))
            minetest.debug("is_on_grid: " .. is_on_grid)
            return is_on_grid == 0
            --if is_on_grid == 0 then
            --    return true
            --else
            --    return false
            --end
        end,
        on_rightclick = function(pos, node, clicker, itemstack)
            local meta = minetest.get_meta(pos)
            local node_type = meta:get_int("node_type")
            local radians = meta:get_float("radians")
            local ctrl_a = meta:get_int("ctrl_a")
            local ctrl_b = meta:get_int("ctrl_b")
            local is_gate = meta:get_int("is_gate")
            local is_on_grid = meta:get_int("circuit_specs_is_on_grid")
            local player_name = clicker:get_player_name()

            minetest.chat_send_player(player_name,
                    "itemstack:get_name(): " .. itemstack:get_name() ..
                            ", is_on_grid: " .. is_on_grid)

            minetest.debug("In on_rightclick: meta:to_table():\n" .. dump(meta:to_table()))

            if is_on_grid then
                if node_type == CircuitNodeTypes.EMPTY then
                    local itemstack_meta = itemstack:get_meta()
                    if itemstack_meta and itemstack_meta:get_int(is_gate) then
                        -- TODO: Factor this into a function
                        -- Retrieve circuit_specs metadata
                        meta = minetest.get_meta(pos)
                        local circuit_num_wires = meta:get_int("circuit_specs_num_wires")
                        local circuit_num_columns = meta:get_int("circuit_specs_num_columns")
                        local circuit_is_on_grid = meta:get_int("circuit_specs_is_on_grid")
                        local circuit_pos_x = meta:get_int("circuit_specs_pos_x")
                        local circuit_pos_y = meta:get_int("circuit_specs_pos_y")
                        local circuit_pos_z = meta:get_int("circuit_specs_pos_z")

                        minetest.set_node(pos, {name = itemstack:get_name()})

                        -- Put circuit_specs metadata on placed node
                        meta = minetest.get_meta(pos)
                        meta:set_int("circuit_specs_num_wires", circuit_num_wires)
                        meta:set_int("circuit_specs_num_columns", circuit_num_columns)
                        meta:set_int("circuit_specs_is_on_grid", circuit_is_on_grid)
                        meta:set_int("circuit_specs_pos_x", circuit_pos_x)
                        meta:set_int("circuit_specs_pos_y", circuit_pos_y)
                        meta:set_int("circuit_specs_pos_z", circuit_pos_z)
                    end
                elseif itemstack:get_name() == "circuit_blocks:control_tool" then
                    ctrl_a = ctrl_a * -1
                    meta:set_int("ctrl_a", ctrl_a)
                    minetest.chat_send_player(player_name, "ctrl_a is now: " .. tostring(ctrl_a))
                end
            end
        end
    })
end

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

circuit_blocks:register_circuit_block(CircuitNodeTypes.EMPTY, false, false, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.X, true, true, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.X, true, false, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.X, false, true, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.H, false, false, false)

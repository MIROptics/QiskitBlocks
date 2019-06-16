-- TODO:
--  When punching NOT gate block when it has a control qubit, delete entire gate
--  Define Quantum control block that creates circuit, etc.
--  Right click places circuit_gate
--  Make left click drop gate entity
--  Utilize is_gate boolean parameter of register_circuit_block function to
--      identify circuit blocks that are circuit gates
--  Remove circuit_gate group code
--  Understand and standardize on when to use colon, or dot, as function separator
--  Find alternative to hardcoding node name strings everywhere
--  Remove hearts from creative mode

dofile(minetest.get_modpath("circuit_blocks").."/circuit_node_types.lua");

-- our API object
circuit_blocks = {}

-- returns circuit_block object or nil
function circuit_blocks:get_circuit_block(pos)
	local node_name = minetest.get_node(pos).name
	if minetest.registered_nodes[node_name] then

        -- Retrieve metadata
        local meta = minetest.get_meta(pos)
        local node_type = meta:get_int("node_type")
        local radians = meta:get_float("radians")
        local ctrl_a = meta:get_int("ctrl_a")
        local ctrl_b = meta:get_int("ctrl_b")

        -- 1 if node is a gate, 0 of node is not a gate
        local node_is_gate = meta:get_int("is_gate")

        -- Retrieve circuit_specs metadata
        local circuit_num_wires = meta:get_int("circuit_specs_num_wires")
        local circuit_num_columns = meta:get_int("circuit_specs_num_columns")
        local circuit_is_on_grid = meta:get_int("circuit_specs_is_on_grid")
        local circuit_pos_x = meta:get_int("circuit_specs_pos_x")
        local circuit_pos_y = meta:get_int("circuit_specs_pos_y")
        local circuit_pos_z = meta:get_int("circuit_specs_pos_z")

        local node_wire_num = -1
        if circuit_is_on_grid == 1 then
            node_wire_num = circuit_num_wires - (pos.y - circuit_pos_y)
        end

        local node_column_num = -1
        if circuit_is_on_grid == 1 then
            node_column_num = pos.x - circuit_pos_x + 1
        end

		return {
			pos = pos,

            -- Node position, table
            get_node_pos = function()
				return pos
			end,

            -- Node name, string
            get_node_name = function()
				return node_name
			end,

            -- Circuit node type, integer
            --set_node_type = function(node_type_arg)
			--	node_type = node_type_arg
            --    local new_node_name = "circuit_blocks:circuit_blocks_not_gate_up"
            --    circuit_blocks:set_node_with_circuit_specs_meta(pos, new_node_name)
			--end,

            get_node_type = function()
				return node_type
			end,

            -- Rotation in radians, float
            get_radians = function()
				return radians
			end,

            -- Set control wire A, integer
            set_ctrl_a = function(ctrl_a_arg)
                ctrl_a = ctrl_a_arg
                meta:set_int("ctrl_a", ctrl_a_arg)

                return
                --local ret_wire_placed = -1
                --if circuit_is_on_grid == 1 and
                --        ctrl_a_arg >= 1 and ctrl_a_arg <= circuit_num_wires then
                --    local pos_y = circuit_num_wires - ctrl_a_arg + circuit_pos_y
                --    local candidate_ctrl_pos = {x = pos.x, y = pos_y, z = pos.z}
                --    --local candidate_ctrl_pos = {x = pos.x, y = pos.y + 1, z = pos.z}
                --
                --    local candidate_block = circuit_blocks:get_circuit_block(candidate_ctrl_pos)
                --
                --    -- TODO: Validate whether argument is placeable
                --    circuit_blocks:debug_node_info(candidate_ctrl_pos,
                --            "BEFORE In set_ctrl_a")
                --
                --    local new_node_name = "circuit_blocks:circuit_blocks_control_down"
                --    circuit_blocks:set_node_with_circuit_specs_meta(candidate_ctrl_pos,
                --            new_node_name)
                --
                --    circuit_blocks:debug_node_info(candidate_ctrl_pos,
                --            "AFTER In set_ctrl_a")
                --
                --    ret_wire_placed = ctrl_a_arg
                --end
                --return ret_wire_placed
			end,

            -- Get control wire A, integer
            get_ctrl_a = function()
				return ctrl_a
			end,

            -- Control wire B, integer
            get_ctrl_b = function()
				return ctrl_b
			end,

            -- Indicates whether node is a gate, boolean
            is_gate = function()
				return node_is_gate == 1
			end,

            --
            -- Number of circuit wires, integer
            get_circuit_num_wires = function()
				return circuit_num_wires
			end,

            -- Number of circuit columns, integer
            get_circuit_num_columns = function()
				return circuit_num_columns
			end,

            -- Indicates whether node is on the circuit grid, boolean
            is_on_circuit_grid = function()
				return circuit_is_on_grid == 1
			end,

            -- Determine if a node is in the bounds of the circuit grid
            -- TODO: Perhaps deprecate is_on_circuit_grid()
            is_within_circuit_grid = function()
                ret_within = false
                if pos.x >= circuit_pos_x and
                        pos.x < (circuit_pos_x + circuit_num_columns) and
                        pos.y >= circuit_pos_y and
                        pos.y < (circuit_pos_y + circuit_num_wires) and
                        pos.z == circuit_pos_z then
                    ret_within = true
                end
				return ret_within
			end,

            -- Circuit wire num that node is on, integer (1..num wires, -1 if not)
            get_node_wire_num = function()
				return node_wire_num
			end,

            -- Circuit column that node is on, integer (1..num columns, -1 if not)
            get_node_column_num = function()
				return node_column_num
			end,

            -- Position of lower-left node of the circuit grid
            get_circuit_pos = function()
                local ret_pos = {}
                ret_pos.x = circuit_pos_x
                ret_pos.y = circuit_pos_y
                ret_pos.z = circuit_pos_z
				return ret_pos
			end,

            -- Create string representation
            -- TODO: What is Lua way to implement a "to string" function?
            to_string = function()
                local ret_str = "pos: " .. dump(pos) .. "\n" ..
                        "node_name: " .. node_name .. "\n" ..
                        "node_type: " .. tostring(node_type) .. "\n" ..
                        "radians: " .. tostring(radians) .. "\n" ..
                        "ctrl_a: " .. tostring(ctrl_a) .. "\n" ..
                        "ctrl_b: " .. tostring(ctrl_b) .. "\n" ..
                        "node_is_gate: " .. tostring(node_is_gate) .. "\n" ..
                        "circuit_num_wires: " .. tostring(circuit_num_wires) .. "\n" ..
                        "circuit_num_columns: " .. tostring(circuit_num_columns) .. "\n" ..
                        "circuit_is_on_grid: " .. tostring(circuit_is_on_grid) .. "\n" ..
                        "circuit_pos_x: " .. tostring(circuit_pos_x) .. "\n" ..
                        "circuit_pos_y: " .. tostring(circuit_pos_y) .. "\n" ..
                        "circuit_pos_z: " .. tostring(circuit_pos_z) .. "\n"
                return ret_str
            end
		}
	else
		return nil
	end
end


function circuit_blocks:debug_node_info(pos, message)
    local block = circuit_blocks:get_circuit_block(pos)
    -- minetest.debug("to_string:\n" .. dump(block.to_string()))
    minetest.debug((message or "") .. "\ncircuit_block:\n" ..
        "get_node_pos() " .. dump(block.get_node_pos()) .. "\n" ..
        "get_node_name() " .. dump(block.get_node_name()) .. "\n" ..
        "get_node_type() " .. tostring(block.get_node_type()) .. "\n" ..
        "get_radians() " .. tostring(block.get_radians()) .. "\n" ..
        "get_ctrl_a() " .. tostring(block.get_ctrl_a()) .. "\n" ..
        "get_ctrl_b() " .. tostring(block.get_ctrl_b()) .. "\n" ..
        "is_gate() " .. tostring(block.is_gate()) .. "\n" ..
        "get_circuit_num_wires() " .. tostring(block.get_circuit_num_wires()) .. "\n" ..
        "get_circuit_num_columns() " .. tostring(block.get_circuit_num_columns()) .. "\n" ..
        "is_on_circuit_grid() " .. tostring(block.is_on_circuit_grid()) .. "\n" ..
        "is_within_circuit_grid() " .. tostring(block.is_within_circuit_grid()) .. "\n" ..
        "get_node_wire_num() " .. tostring(block.get_node_wire_num()) .. "\n" ..
        "get_node_column_num() " .. tostring(block.get_node_column_num()) .. "\n" ..
        "get_circuit_pos() " .. dump(block.get_circuit_pos()) .. "\n")

end


function circuit_blocks:place_nodes_between(block_a, block_b, new_node_type)
    --[[
    Place nodes vertically between given nodes
    TODO: Support all node types, but for now, only EMPTY and TRACE are supported
    --]]
    local low_wire_num = math.min(block_a.get_node_wire_num(),
            block_b.get_node_wire_num())
    local high_wire_num = math.max(block_a.get_node_wire_num(),
            block_b.get_node_wire_num())
    local new_node_name = "circuit_blocks:circuit_blocks_empty_wire"
    if new_node_type == CircuitNodeTypes.EMPTY then
        new_node_name = "circuit_blocks:circuit_blocks_empty_wire"
    elseif new_node_type == CircuitNodeTypes.TRACE then
        new_node_name = "circuit_blocks:circuit_blocks_trace"
    end

    local low_wire_num_pos = {x = block_a.get_node_pos().x,
                              y = block_a.get_circuit_pos().y +
                                      block_a.get_circuit_num_wires() -
                                      low_wire_num,
                              z = block_a.get_node_pos().z}

    if high_wire_num - low_wire_num >= 2 then
        -- TODO: Perhaps do deep copy instead?
        local cur_pos = {x = low_wire_num_pos.x, y = low_wire_num_pos.y, z = low_wire_num_pos.z}

        for i = 1, high_wire_num - low_wire_num - 1 do
            cur_pos.y = low_wire_num_pos.y - i
            minetest.debug("cur_pos: " .. dump(cur_pos) ..
                    "low_wire_num_pos: " .. dump(low_wire_num_pos) ..
                    ", i: " .. tostring(i))
            minetest.swap_node(cur_pos, {name = new_node_name})
            minetest.get_meta(cur_pos):set_int("node_type", CircuitNodeTypes.TRACE)
        end
    end
    return
end


function circuit_blocks:set_node_with_circuit_specs_meta(pos, node_name)
    -- Retrieve circuit_specs metadata
    local meta = minetest.get_meta(pos)

    local circuit_num_wires = meta:get_int("circuit_specs_num_wires")
    local circuit_num_columns = meta:get_int("circuit_specs_num_columns")
    local circuit_is_on_grid = meta:get_int("circuit_specs_is_on_grid")
    local circuit_pos_x = meta:get_int("circuit_specs_pos_x")
    local circuit_pos_y = meta:get_int("circuit_specs_pos_y")
    local circuit_pos_z = meta:get_int("circuit_specs_pos_z")

    circuit_blocks:debug_node_info(pos,
            "In set_node_with_circuit_specs_meta BEFORE set_node")

    minetest.set_node(pos, {name = node_name})

    -- Put circuit_specs metadata on placed node
    meta = minetest.get_meta(pos)

    meta:set_int("circuit_specs_num_wires", circuit_num_wires)
    meta:set_int("circuit_specs_num_columns", circuit_num_columns)
    meta:set_int("circuit_specs_is_on_grid", circuit_is_on_grid)
    meta:set_int("circuit_specs_pos_x", circuit_pos_x)
    meta:set_int("circuit_specs_pos_y", circuit_pos_y)
    meta:set_int("circuit_specs_pos_z", circuit_pos_z)

    circuit_blocks:debug_node_info(pos,
            "In set_node_with_circuit_specs_meta AFTER set_node")
end


function circuit_blocks:place_ctrl_qubit(gate_block, candidate_ctrl_wire_num)
    --[[
    Attempt to place a control qubit on a wire.
    If successful, return the wire number. If not, return -1
    --]]
    local ret_placed_wire = -1
    local gate_wire_num = gate_block:get_node_wire_num()
    local circuit_num_wires = gate_block.get_circuit_num_wires()
    local gate_pos = gate_block:get_node_pos()

    if gate_wire_num >= 1 and
            gate_wire_num <= gate_block:get_circuit_num_wires() then
        local pos_y = circuit_num_wires - candidate_ctrl_wire_num + gate_block:get_circuit_pos().y
        local candidate_ctrl_pos = {x = gate_pos.x, y = pos_y, z = gate_pos.z}
        local candidate_block = circuit_blocks:get_circuit_block(candidate_ctrl_pos)
        circuit_blocks:debug_node_info(candidate_ctrl_pos, "candidate_ctrl_pos")

        -- Validate whether control qubit may be placed
        minetest.debug()
        if candidate_block:is_within_circuit_grid() and
                (candidate_block.get_node_type() == CircuitNodeTypes.EMPTY or
                        candidate_block.get_node_type() == CircuitNodeTypes.TRACE) then
            circuit_blocks:debug_node_info(candidate_ctrl_pos,
                    "BEFORE In place_ctrl_qubit")

            local new_ctrl_node_name = "circuit_blocks:circuit_blocks_control_down"
            if candidate_ctrl_wire_num > gate_block:get_node_wire_num() then
                new_ctrl_node_name = "circuit_blocks:circuit_blocks_control_up"
            end

            gate_block.set_ctrl_a(candidate_ctrl_wire_num)
            circuit_blocks:set_node_with_circuit_specs_meta(candidate_ctrl_pos,
                    new_ctrl_node_name)

            circuit_blocks:debug_node_info(candidate_ctrl_pos,
                    "AFTER In place_ctrl_qubit")
            ret_placed_wire = candidate_ctrl_wire_num

            if gate_block.get_node_type() == CircuitNodeTypes.X then
                local new_gate_node_name = "circuit_blocks:circuit_blocks_not_gate_up"
                if candidate_ctrl_wire_num > gate_block:get_node_wire_num() then
                    new_gate_node_name = "circuit_blocks:circuit_blocks_not_gate_down"
                end

                -- Change the node name but leave metadata the same
                minetest.swap_node(gate_block.get_node_pos(), {name = new_gate_node_name})
            end

            -- Place TRACE nodes between gate and ctrl nodes
            circuit_blocks:place_nodes_between(gate_block, candidate_block,
                    CircuitNodeTypes.TRACE)

        end
    end
    return ret_placed_wire
end


function circuit_blocks:remove_ctrl_qubit(gate_block, ctrl_wire_num)
    --[[
    Remove a control qubit from a wire.
    --]]
    local gate_wire_num = gate_block:get_node_wire_num()
    local circuit_num_wires = gate_block.get_circuit_num_wires()
    local gate_pos = gate_block:get_node_pos()

    if gate_wire_num >= 1 and
            gate_wire_num <= gate_block:get_circuit_num_wires() then
        local pos_y = circuit_num_wires - ctrl_wire_num + gate_block:get_circuit_pos().y
        local ctrl_pos = {x = gate_pos.x, y = pos_y, z = gate_pos.z}
        local ctrl_block = circuit_blocks:get_circuit_block(ctrl_pos)
        circuit_blocks:debug_node_info(ctrl_pos, "ctrl_pos")

        -- Validate whether control qubit may be removed
        minetest.debug()
        if ctrl_block:is_within_circuit_grid() then
            circuit_blocks:debug_node_info(ctrl_pos,
                    "BEFORE In remove_ctrl_qubit")

            local new_ctrl_node_name = "circuit_blocks:circuit_blocks_empty_wire"
            if math.abs(ctrl_wire_num - gate_block:get_node_wire_num()) > 0 then
                -- Remove nodes in-between gate and ctrl nodes
                circuit_blocks:place_nodes_between(gate_block, ctrl_block,
                        CircuitNodeTypes.EMPTY)

            end
            circuit_blocks:set_node_with_circuit_specs_meta(ctrl_pos,
                    new_ctrl_node_name)

            circuit_blocks:debug_node_info(ctrl_pos,
                    "AFTER In remove_ctrl_qubit")
            gate_block.set_ctrl_a(-1)

            if gate_block.get_node_type() == CircuitNodeTypes.X then
                local new_gate_node_name = "circuit_blocks:circuit_blocks_x_gate"
                circuit_blocks:set_node_with_circuit_specs_meta(gate_block.get_node_pos(),
                        new_gate_node_name)
            end
        end
    end
    return ret_placed_wire
end


function circuit_blocks:register_circuit_block(circuit_node_type,
                                               connector_up,
                                               connector_down,
                                               rotational,
                                               is_gate)
    local texture_name = ""
    if circuit_node_type == CircuitNodeTypes.EMPTY then
        texture_name = "circuit_blocks_empty_wire"
    elseif circuit_node_type == CircuitNodeTypes.X then
        texture_name = "circuit_blocks_x_gate"
        if connector_up and not connector_down then
            texture_name = "circuit_blocks_not_gate_up"
        elseif connector_down and not connector_up then
            texture_name = "circuit_blocks_not_gate_down"
        elseif connector_up and connector_up then
            texture_name = "circuit_blocks_not_gate"
        end
    elseif circuit_node_type == CircuitNodeTypes.H then
        texture_name = "circuit_blocks_h_gate"
    elseif circuit_node_type == CircuitNodeTypes.CTRL then
        texture_name = "circuit_blocks_control"
        if connector_up and not connector_down then
            texture_name = "circuit_blocks_control_up"
        elseif connector_down and not connector_up then
            texture_name = "circuit_blocks_control_down"
        end
    elseif circuit_node_type == CircuitNodeTypes.TRACE then
        texture_name = "circuit_blocks_trace"
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
            meta:set_int("is_gate", (is_gate and 1 or 0))
        end,
        on_punch = function(pos, node, player)
            local block = circuit_blocks:get_circuit_block(pos)
            circuit_blocks:debug_node_info(pos, "In on_punch()")

            local node_type = block:get_node_type()
            if block.is_within_circuit_grid() and
                    (node_type == CircuitNodeTypes.X or
                            node_type == CircuitNodeTypes.Y or
                            node_type == CircuitNodeTypes.Z or
                            node_type == CircuitNodeTypes.H) then

                local placed_wire = -1
                local wielded_item = player:get_wielded_item()
                if wielded_item:get_name() == "circuit_blocks:control_tool" then
                    if block.get_ctrl_a() == -1 then
                        placed_wire = circuit_blocks:place_ctrl_qubit(block,
                                block:get_node_wire_num() - 1)
                        minetest.debug("control placed_wire: " .. tostring(placed_wire))
                        minetest.chat_send_player(player:get_player_name(),
                                "control placed_wire: " .. tostring(placed_wire))
                        --block.set_ctrl_a(placed_wire)
                    elseif block.get_ctrl_a() == block:get_node_wire_num() + 1 then
                        circuit_blocks:remove_ctrl_qubit(block,
                                block.get_ctrl_a())
                    else
                        local pos_y = block.get_circuit_num_wires() - block.get_ctrl_a() + block:get_circuit_pos().y
                        local ctrl_pos = {x = pos.x, y = pos_y, z = pos.z}
                        if block.get_ctrl_a() - 1 >= 1 then
                            circuit_blocks:set_node_with_circuit_specs_meta(ctrl_pos,
                                    "circuit_blocks:circuit_blocks_empty_wire")
                            placed_wire = circuit_blocks:place_ctrl_qubit(block,
                                    block.get_ctrl_a() - 1)
                        else
                            minetest.debug("Tried to place ctrl on nonexistent wire: " ..
                                    block.get_ctrl_a() - 1)
                        end
                        minetest.debug("control placed_wire: " .. tostring(placed_wire))
                        minetest.chat_send_player(player:get_player_name(),
                                "control placed_wire: " .. tostring(placed_wire))
                    end
                else
                    if block.get_ctrl_a() ~= -1 then
                        circuit_blocks:remove_ctrl_qubit(block, block.get_ctrl_a())
                    end

                    -- Necessary to replace punched node
                    circuit_blocks:set_node_with_circuit_specs_meta(pos,
                            "circuit_blocks:circuit_blocks_empty_wire")
                end
            elseif node_type == CircuitNodeTypes.EMPTY then
                -- Necessary to replace punched node
                circuit_blocks:set_node_with_circuit_specs_meta(pos,
                        "circuit_blocks:circuit_blocks_empty_wire")
            end
            return
        end,
        can_dig = function(pos, player)
            local meta = minetest.get_meta(pos)
            local node_type = meta:get_int("node_type")
            local radians = meta:get_float("radians")
            local ctrl_a = meta:get_int("ctrl_a")
            local ctrl_b = meta:get_int("ctrl_b")
            local is_gate = meta:get_int("is_gate")
            local is_on_grid = meta:get_int("circuit_specs_is_on_grid")

            circuit_blocks:debug_node_info(pos, "In can_dig")
            return is_on_grid == 0
        end,
        on_rightclick = function(pos, node, player, itemstack)
            local block = circuit_blocks:get_circuit_block(pos)
            circuit_blocks:debug_node_info(pos, "In on_rightclick()")

            local placed_wire = -1
            local wielded_item = player:get_wielded_item()
            local node_type = block:get_node_type()
            if block.is_within_circuit_grid() and
                    (node_type == CircuitNodeTypes.X or
                            node_type == CircuitNodeTypes.Y or
                            node_type == CircuitNodeTypes.Z or
                            node_type == CircuitNodeTypes.H) then

                if wielded_item:get_name() == "circuit_blocks:control_tool" then
                    if block.get_ctrl_a() == -1 then
                        placed_wire = circuit_blocks:place_ctrl_qubit(block,
                                block:get_node_wire_num() + 1)
                        minetest.debug("control placed_wire: " .. tostring(placed_wire))
                        minetest.chat_send_player(player:get_player_name(),
                                "control placed_wire: " .. tostring(placed_wire))
                        --block.set_ctrl_a(placed_wire)
                    elseif block.get_ctrl_a() == block:get_node_wire_num() - 1 then
                        circuit_blocks:remove_ctrl_qubit(block,
                                block.get_ctrl_a())
                    else
                        local pos_y = block.get_circuit_num_wires() - block.get_ctrl_a() + block:get_circuit_pos().y
                        local ctrl_pos = {x = pos.x, y = pos_y, z = pos.z}
                        if block.get_ctrl_a() + 1 <= block.get_circuit_num_wires() then
                            circuit_blocks:set_node_with_circuit_specs_meta(ctrl_pos,
                                    "circuit_blocks:circuit_blocks_empty_wire")
                            placed_wire = circuit_blocks:place_ctrl_qubit(block,
                                    block.get_ctrl_a() + 1)
                        else
                            minetest.debug("Tried to place ctrl on nonexistent wire: " ..
                                    block.get_ctrl_a() + 1)
                        end
                        minetest.debug("control placed_wire: " .. tostring(placed_wire))
                        minetest.chat_send_player(player:get_player_name(),
                                "control placed_wire: " .. tostring(placed_wire))
                    end
                end
            elseif node_type == CircuitNodeTypes.EMPTY then
                -- TODO: Perhaps use naming convention that indicates this is a gate
                -- TODO: Make referencing wielded item consistent in this function
                if wielded_item:get_name():sub(1, 14) == "circuit_blocks" then
                    circuit_blocks:set_node_with_circuit_specs_meta(pos,
                            wielded_item:get_name())
                end
            end
            return

            --[[
            local meta = minetest.get_meta(pos)
            local node_type = meta:get_int("node_type")
            local radians = meta:get_float("radians")
            local ctrl_a = meta:get_int("ctrl_a")
            local ctrl_b = meta:get_int("ctrl_b")
            local is_gate = meta:get_int("is_gate")
            local is_on_grid = meta:get_int("circuit_specs_is_on_grid")
            local player_name = clicker:get_player_name()

            circuit_blocks:debug_node_info(pos, "In on_rightclick")

            if is_on_grid == 1 then
                if node_type == CircuitNodeTypes.EMPTY then
                    local itemstack_name = itemstack:get_name()
                    local itemstack_meta = itemstack:get_meta()
                    -- minetest.debug("itemstack_meta:to_table():\n" .. dump(itemstack_meta:to_table()))

                    -- TODO: How best to get metadata for this item?
                    -- if itemstack_meta and itemstack_meta:get_int(is_gate) then

                    -- TODO: Perhaps use naming convention that indicates this is a gate
                    if itemstack_name:sub(1, 14) == "circuit_blocks" then
                        circuit_blocks:set_node_with_circuit_specs_meta(pos,
                                itemstack:get_name())
                    end
                elseif itemstack:get_name() == "circuit_blocks:control_tool" then
                    --ctrl_a = ctrl_a * -1
                    --meta:set_int("ctrl_a", ctrl_a)
                    --minetest.chat_send_player(player_name, "ctrl_a is now: " .. tostring(ctrl_a))

                end
            end
            --]]
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

circuit_blocks:register_circuit_block(CircuitNodeTypes.EMPTY, false, false, false, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.X, false, false, false, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.X, true, true, false, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.X, true, false, false, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.X, false, true, false, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.H, false, false, false, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.CTRL, true, true, false, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.CTRL, true, false, false, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.CTRL, false, true, false, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.TRACE, false, false, false, false)



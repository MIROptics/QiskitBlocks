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
        local q_command_pos_x = meta:get_int("q_command_block_pos_x")
        local q_command_pos_y = meta:get_int("q_command_block_pos_y")
        local q_command_pos_z = meta:get_int("q_command_block_pos_z")

        -- Retrieve wire extension related metadata (specific to circuit extension blocks)
        local wire_extension_block_pos_x = meta:get_int("wire_extension_block_pos_x")
        local wire_extension_block_pos_y = meta:get_int("wire_extension_block_pos_y")
        local wire_extension_block_pos_z = meta:get_int("wire_extension_block_pos_z")

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

            set_radians = function(radians_arg)
                radians = radians_arg
                meta:set_float("radians", radians_arg)
            end,

            -- Set control wire A, integer
            set_ctrl_a = function(ctrl_a_arg)
                ctrl_a = ctrl_a_arg
                meta:set_int("ctrl_a", ctrl_a_arg)

                return
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
                local ret_within = false
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

            -- Position of q_command block
            get_q_command_pos = function()
                local ret_pos = {}
                ret_pos.x = q_command_pos_x
                ret_pos.y = q_command_pos_y
                ret_pos.z = q_command_pos_z
				return ret_pos
			end,

            -- Position of wire extension block (specific to circuit extension blocks)
            get_wire_extension_block_pos = function()
                local ret_pos = {}
                ret_pos.x = wire_extension_block_pos_x
                ret_pos.y = wire_extension_block_pos_y
                ret_pos.z = wire_extension_block_pos_z
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
                        "circuit_pos_z: " .. tostring(circuit_pos_z) .. "\n" ..
                        "q_command_pos_x: " .. tostring(q_command_pos_x) .. "\n" ..
                        "q_command_pos_y: " .. tostring(q_command_pos_y) .. "\n" ..
                        "q_command_pos_z: " .. tostring(q_command_pos_z) .. "\n" ..
                        "wire_extension_block_pos_x: " .. tostring(wire_extension_block_pos_x) .. "\n" ..
                        "wire_extension_block_pos_x: " .. tostring(wire_extension_block_pos_x) .. "\n" ..
                        "wire_extension_block_pos_x: " .. tostring(wire_extension_block_pos_x) .. "\n"
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
        "get_circuit_pos() " .. dump(block.get_circuit_pos()) .. "\n" ..
        "get_q_command_pos() " .. dump(block.get_q_command_pos()) .. "\n" ..
        "get_wire_extension_block_pos() " .. dump(block.get_wire_extension_block_pos()) .. "\n"
    )

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
    local q_command_pos_x = meta:get_int("q_command_block_pos_x")
    local q_command_pos_y = meta:get_int("q_command_block_pos_y")
    local q_command_pos_z = meta:get_int("q_command_block_pos_z")

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
    meta:set_int("q_command_block_pos_x", q_command_pos_x)
    meta:set_int("q_command_block_pos_y", q_command_pos_y)
    meta:set_int("q_command_block_pos_z", q_command_pos_z)

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
                minetest.swap_node(gate_block.get_node_pos(), {name = new_gate_node_name})
            elseif gate_block.get_node_type() == CircuitNodeTypes.H then
                local new_gate_node_name = "circuit_blocks:circuit_blocks_h_gate_up"
                if candidate_ctrl_wire_num > gate_block:get_node_wire_num() then
                    new_gate_node_name = "circuit_blocks:circuit_blocks_h_gate_down"
                end
                minetest.swap_node(gate_block.get_node_pos(), {name = new_gate_node_name})
            elseif gate_block.get_node_type() == CircuitNodeTypes.Y then
                local new_gate_node_name = "circuit_blocks:circuit_blocks_y_gate_up"
                if candidate_ctrl_wire_num > gate_block:get_node_wire_num() then
                    new_gate_node_name = "circuit_blocks:circuit_blocks_y_gate_down"
                end
                minetest.swap_node(gate_block.get_node_pos(), {name = new_gate_node_name})
            elseif gate_block.get_node_type() == CircuitNodeTypes.Z then
                local new_gate_node_name = "circuit_blocks:circuit_blocks_z_gate_up"
                if candidate_ctrl_wire_num > gate_block:get_node_wire_num() then
                    new_gate_node_name = "circuit_blocks:circuit_blocks_z_gate_down"
                end
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
            elseif gate_block.get_node_type() == CircuitNodeTypes.Y then
                local new_gate_node_name = "circuit_blocks:circuit_blocks_y_gate"
                circuit_blocks:set_node_with_circuit_specs_meta(gate_block.get_node_pos(),
                        new_gate_node_name)
            elseif gate_block.get_node_type() == CircuitNodeTypes.Z then
                local new_gate_node_name = "circuit_blocks:circuit_blocks_z_gate"
                circuit_blocks:set_node_with_circuit_specs_meta(gate_block.get_node_pos(),
                        new_gate_node_name)
            elseif gate_block.get_node_type() == CircuitNodeTypes.H then
                local new_gate_node_name = "circuit_blocks:circuit_blocks_h_gate"
                circuit_blocks:set_node_with_circuit_specs_meta(gate_block.get_node_pos(),
                        new_gate_node_name)
            end
        end
    end
    return ret_placed_wire
end


function circuit_blocks:rotate_gate(gate_block, by_radians)
    --[[
    Rotate a gate by a given number of radians
    --]]

    local node_name_beginning = nil
    local non_rotate_gate_name = nil
    if gate_block.get_ctrl_a() ~= -1 then
        -- TODO: Support crz gates
        return
    end
    if gate_block.get_node_type() == CircuitNodeTypes.X then
        node_name_beginning = "circuit_blocks:circuit_blocks_rx_gate_"
        non_rotate_gate_name = "circuit_blocks:circuit_blocks_x_gate"
    elseif gate_block.get_node_type() == CircuitNodeTypes.Y then
        node_name_beginning = "circuit_blocks:circuit_blocks_ry_gate_"
        non_rotate_gate_name = "circuit_blocks:circuit_blocks_y_gate"
    elseif gate_block.get_node_type() == CircuitNodeTypes.Z then
        node_name_beginning = "circuit_blocks:circuit_blocks_rz_gate_"
        non_rotate_gate_name = "circuit_blocks:circuit_blocks_z_gate"
    else
        -- Rotation is only supported on X, Y and Z gates
        return
    end


    local prev_radians = gate_block.get_radians()
    minetest.debug("prev_radians: " .. tostring(prev_radians))

    local new_radians = (gate_block.get_radians() + (math.pi * 2) + by_radians) % (math.pi * 2)
    minetest.debug("new_radians: " .. tostring(new_radians))

    gate_block.set_radians(new_radians)

    local new_node_name = non_rotate_gate_name

    local threshold = 0.0001
    if math.abs(new_radians - 0) > threshold and
            math.abs(new_radians - math.pi * 2) > threshold then
        local num_pi_16_radians = math.floor(new_radians * 16 / math.pi + 0.5)
        minetest.debug("num_pi_16_radians: " .. tostring(num_pi_16_radians))

        if num_pi_16_radians < 1 then
            num_pi_16_radians = 1
        elseif num_pi_16_radians > 32 then
            num_pi_16_radians = 32
        end

        new_node_name = node_name_beginning .. tostring(num_pi_16_radians) .. "p16"
        minetest.debug("new_node_name: " .. new_node_name)
    end

    circuit_blocks:debug_node_info(gate_block.get_node_pos(), "In rotate_gate *before* swap")
    minetest.swap_node(gate_block.get_node_pos(), {name = new_node_name})
    circuit_blocks:debug_node_info(gate_block.get_node_pos(), "In rotate_gate *after* swap")

    --circuit_blocks:set_node_with_circuit_specs_meta(gate_block.get_node_pos(),
    --        new_node_name)
end


function circuit_blocks:register_circuit_block(circuit_node_type,
                                               connector_up,
                                               connector_down,
                                               pi16rotation,
                                               is_gate,
                                               drop_name,
                                               suffix)
    local texture_name = ""
    if circuit_node_type == CircuitNodeTypes.EMPTY then
        texture_name = "circuit_blocks_empty_wire"
    elseif circuit_node_type == CircuitNodeTypes.X then
        texture_name = "circuit_blocks_x_gate"
        if pi16rotation ~= 0 then
            texture_name = "circuit_blocks_rx_gate_" .. pi16rotation .. "p16"
        elseif connector_up and not connector_down then
            texture_name = "circuit_blocks_not_gate_up"
        elseif connector_down and not connector_up then
            texture_name = "circuit_blocks_not_gate_down"
        elseif connector_up and connector_up then
            texture_name = "circuit_blocks_not_gate"
        end
    elseif circuit_node_type == CircuitNodeTypes.Y then
        texture_name = "circuit_blocks_y_gate"
        if pi16rotation ~= 0 then
            texture_name = "circuit_blocks_ry_gate_" .. pi16rotation .. "p16"
        elseif connector_up and not connector_down then
            texture_name = "circuit_blocks_y_gate_up"
        elseif connector_down and not connector_up then
            texture_name = "circuit_blocks_y_gate_down"
        end
    elseif circuit_node_type == CircuitNodeTypes.Z then
        texture_name = "circuit_blocks_z_gate"
        if pi16rotation ~= 0 then
            texture_name = "circuit_blocks_rz_gate_" .. pi16rotation .. "p16"
        elseif connector_up and not connector_down then
            texture_name = "circuit_blocks_z_gate_up"
        elseif connector_down and not connector_up then
            texture_name = "circuit_blocks_z_gate_down"
        end
    elseif circuit_node_type == CircuitNodeTypes.H then
        texture_name = "circuit_blocks_h_gate"
        if connector_up and not connector_down then
            texture_name = "circuit_blocks_h_gate_up"
        elseif connector_down and not connector_up then
            texture_name = "circuit_blocks_h_gate_down"
        end
    elseif circuit_node_type == CircuitNodeTypes.CTRL then
        texture_name = "circuit_blocks_control"
        if connector_up and not connector_down then
            texture_name = "circuit_blocks_control_up"
        elseif connector_down and not connector_up then
            texture_name = "circuit_blocks_control_down"
        end
    elseif circuit_node_type == CircuitNodeTypes.S then
        texture_name = "circuit_blocks_s_gate"
    elseif circuit_node_type == CircuitNodeTypes.SDG then
        texture_name = "circuit_blocks_sdg_gate"
    elseif circuit_node_type == CircuitNodeTypes.T then
        texture_name = "circuit_blocks_t_gate"
    elseif circuit_node_type == CircuitNodeTypes.TDG then
        texture_name = "circuit_blocks_tdg_gate"
    elseif circuit_node_type == CircuitNodeTypes.TRACE then
        texture_name = "circuit_blocks_trace"
    elseif circuit_node_type == CircuitNodeTypes.MEASURE_Z then
        texture_name = "circuit_blocks_measure_" .. suffix
    elseif circuit_node_type == CircuitNodeTypes.CONNECTOR_M then
        texture_name = "circuit_blocks_wire_connector_m"
    elseif circuit_node_type == CircuitNodeTypes.CONNECTOR_F then
        texture_name = "circuit_blocks_wire_connector_f"
    end

    -- minetest.debug("circuit_blocks:"..texture_name)
    -- TODO: Work out way to pass in a meaningful description
    minetest.register_node("circuit_blocks:"..texture_name, {
        description = texture_name,
        tiles = {texture_name..".png"},
        groups = {circuit_gate=1, oddly_breakable_by_hand=2},

        -- TODO: Find best way to implement dropping an item
        -- drop = drop_name,

        on_drop = function(itemstack, dropper, pos)
            minetest.debug("in on_drop, itemstack: " .. dump(itemstack))
        end,

        on_construct = function(pos)
            local meta = minetest.get_meta(pos)
            meta:set_int("node_type", circuit_node_type)
            meta:set_float("radians", 0.0)
            meta:set_int("ctrl_a", -1)
            meta:set_int("ctrl_b", -1)
            meta:set_int("is_gate", (is_gate and 1 or 0))
        end,
        on_punch = function(pos, node, player)
            -- TODO: Enable digging other types of blocks (e.g. measure_z)
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
                    local threshold = 0.0001
                    if block.get_ctrl_a() == -1 and
                            math.abs(block.get_radians() - 0) < threshold and
                            math.abs(block.get_radians() - math.pi * 2) > threshold then
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
                elseif wielded_item:get_name() == "circuit_blocks:rotate_tool" then
                    minetest.debug("rotate right requested")
                    circuit_blocks:rotate_gate(block, math.pi / 16.0)
                else
                    if block.get_ctrl_a() ~= -1 then
                        circuit_blocks:remove_ctrl_qubit(block, block.get_ctrl_a())
                    end

                    -- Necessary to replace punched node
                    circuit_blocks:set_node_with_circuit_specs_meta(pos,
                            "circuit_blocks:circuit_blocks_empty_wire")
                end

            elseif block.is_within_circuit_grid() and
                    node_type == CircuitNodeTypes.CONNECTOR_M then

                -- TODO: continue filling in
                local wire_extension_itemstack = ItemStack("q_command:wire_extension_block")
                local meta = wire_extension_itemstack:get_meta()
                meta:set_int("circuit_extension_pos_x", pos.x)
                meta:set_int("circuit_extension_pos_y", pos.y)
                meta:set_int("circuit_extension_pos_z", pos.z)

                minetest.debug("wire_extension_itemstack: " .. dump(wire_extension_itemstack) ..
                ", circuit_extension_pos_x: " .. tostring(meta:get_int("circuit_extension_pos_x")) ..
                ", circuit_extension_pos_y: " .. tostring(meta:get_int("circuit_extension_pos_y")) ..
                ", circuit_extension_pos_z: " .. tostring(meta:get_int("circuit_extension_pos_z")))
                local drop_pos = {x = pos.x, y = pos.y, z = pos.z - 1}
                minetest.item_drop(wire_extension_itemstack, player, drop_pos)

            elseif node_type == CircuitNodeTypes.EMPTY then
                -- Necessary to replace punched node
                circuit_blocks:set_node_with_circuit_specs_meta(pos,
                        "circuit_blocks:circuit_blocks_empty_wire")
            end

            if block.is_within_circuit_grid() then
                -- Punch the q_command block to run simulator and update resultant displays
                local q_command_pos = block.get_q_command_pos()
                minetest.punch_node(q_command_pos)
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
                    local threshold = 0.0001
                    if block.get_ctrl_a() == -1 and
                            math.abs(block.get_radians() - 0) < threshold and
                            math.abs(block.get_radians() - math.pi * 2) > threshold then
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
                elseif wielded_item:get_name() == "circuit_blocks:rotate_tool" then
                    minetest.debug("rotate right requested")
                    circuit_blocks:rotate_gate(block, -math.pi / 16.0)
                end

            elseif node_type == CircuitNodeTypes.EMPTY then
                -- TODO: Perhaps use naming convention that indicates this is a gate
                -- TODO: Make referencing wielded item consistent in this function
                if wielded_item:get_name():sub(1, 14) == "circuit_blocks" then
                    circuit_blocks:set_node_with_circuit_specs_meta(pos,
                            wielded_item:get_name())
                end
            end

            if block.is_within_circuit_grid() then
                -- Punch the q_command block to run simulator and update resultant displays
                local q_command_pos = block.get_q_command_pos()
                minetest.punch_node(q_command_pos)
            end

            return
        end
    })
end


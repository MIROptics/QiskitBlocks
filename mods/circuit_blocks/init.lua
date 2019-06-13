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

            -- Node position, integer
            get_node_pos = function()
				return pos
			end,

            -- Circuit node type, integer
            set_node_type = function(node_type_arg)
				node_type = node_type_arg
                local new_node_name = "circuit_blocks:circuit_blocks_not_gate_up"
                circuit_blocks:set_node_with_circuit_specs_meta(pos, new_node_name)
			end,

            get_node_type = function()
				return node_type
			end,

            -- Rotation in radians, float
            get_radians = function()
				return radians
			end,

            -- Set control wire A, integer
            -- returns wire on which control was placed, -1 if not placed
            set_ctrl_a = function(ctrl_a_arg)
                local ret_wire_placed = -1
                if circuit_is_on_grid == 1 and
                        ctrl_a_arg >= 1 and ctrl_a_arg <= circuit_num_wires then
                    local pos_y = circuit_num_wires - ctrl_a_arg + circuit_pos_y
                    local candidate_ctrl_pos = {pos.x, pos_y , pos.z}

                    -- TODO: Validate whether argument is placeable
                    --local new_node_name = "circuit_blocks:circuit_blocks_control_down"
                    --circuit_blocks:set_node_with_circuit_specs_meta(candidate_ctrl_pos,
                    --        new_node_name)

                    local block = circuit_blocks:get_circuit_block(candidate_ctrl_pos)
                    block.set_node_type(CircuitNodeTypes.X)

                    minetest.debug("candidate_ctrl_pos: " .. dump(candidate_ctrl_pos))
                    minetest.debug(" in_on_punch, block:\n" ..
                        "get_node_pos() " .. dump(block.get_node_pos()) .. "\n" ..
                        "get_node_type() " .. tostring(block.get_node_type()) .. "\n" ..
                        "get_radians() " .. tostring(block.get_radians()) .. "\n" ..
                        "get_ctrl_a() " .. tostring(block.get_ctrl_a()) .. "\n" ..
                        "get_ctrl_b() " .. tostring(block.get_ctrl_b()) .. "\n" ..
                        "is_gate() " .. tostring(block.is_gate()) .. "\n" ..
                        "get_circuit_num_wires() " .. tostring(block.get_circuit_num_wires()) .. "\n" ..
                        "get_circuit_num_columns() " .. tostring(block.get_circuit_num_columns()) .. "\n" ..
                        "is_on_circuit_grid() " .. tostring(block.is_on_circuit_grid()) .. "\n" ..
                        "get_node_wire_num() " .. tostring(block.get_node_wire_num()) .. "\n" ..
                        "get_node_column_num() " .. tostring(block.get_node_column_num()) .. "\n" ..
                        "get_circuit_pos() " .. dump(block.get_circuit_pos()) .. "\n")

                    ret_wire_placed = ctrl_a_arg
                end
                return ret_wire_placed
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


function circuit_blocks:set_node_with_circuit_specs_meta(pos, node_name)
    -- Retrieve circuit_specs metadata
    local meta = minetest.get_meta(pos)
    local circuit_num_wires = meta:get_int("circuit_specs_num_wires")
    local circuit_num_columns = meta:get_int("circuit_specs_num_columns")
    local circuit_is_on_grid = meta:get_int("circuit_specs_is_on_grid")
    local circuit_pos_x = meta:get_int("circuit_specs_pos_x")
    local circuit_pos_y = meta:get_int("circuit_specs_pos_y")
    local circuit_pos_z = meta:get_int("circuit_specs_pos_z")

    minetest.set_node(pos, {name = node_name})

    -- Put circuit_specs metadata on placed node
    meta = minetest.get_meta(pos)
    meta:set_int("circuit_specs_num_wires", circuit_num_wires)
    meta:set_int("circuit_specs_num_columns", circuit_num_columns)
    meta:set_int("circuit_specs_is_on_grid", circuit_is_on_grid)
    meta:set_int("circuit_specs_pos_x", circuit_pos_x)
    meta:set_int("circuit_specs_pos_y", circuit_pos_y)
    meta:set_int("circuit_specs_pos_z", circuit_pos_z)
end


--function circuit_blocks:toggle_control_qubit(pos)
--    local meta = minetest.get_meta(pos)
--    local circuit_num_wires = meta:get_int("circuit_specs_num_wires")
--    local circuit_num_columns = meta:get_int("circuit_specs_num_columns")
--    local circuit_is_on_grid = meta:get_int("circuit_specs_is_on_grid")
--    local circuit_pos_x = meta:get_int("circuit_specs_pos_x")
--    local circuit_pos_y = meta:get_int("circuit_specs_pos_y")
--    local circuit_pos_z = meta:get_int("circuit_specs_pos_z")
--
--    minetest.set_node(pos, {name = node_name})
--
--    -- Put circuit_specs metadata on placed node
--    meta = minetest.get_meta(pos)
--    meta:set_int("circuit_specs_num_wires", circuit_num_wires)
--    meta:set_int("circuit_specs_num_columns", circuit_num_columns)
--    meta:set_int("circuit_specs_is_on_grid", circuit_is_on_grid)
--    meta:set_int("circuit_specs_pos_x", circuit_pos_x)
--    meta:set_int("circuit_specs_pos_y", circuit_pos_y)
--    meta:set_int("circuit_specs_pos_z", circuit_pos_z)
--end


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
            --minetest.debug("In on_construct: meta:to_table():\n" .. dump(meta:to_table()))
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

            local wielded_item = player:get_wielded_item()

            if is_on_grid and is_on_grid == 1 then
                if wielded_item:get_name() == "circuit_blocks:control_tool" then
                    local block = circuit_blocks:get_circuit_block(pos)
                    block.set_node_type(CircuitNodeTypes.X)
                    minetest.debug(" in_on_punch, block:\n" ..
                        "get_node_pos() " .. dump(block.get_node_pos()) .. "\n" ..
                        "get_node_type() " .. tostring(block.get_node_type()) .. "\n" ..
                        "get_radians() " .. tostring(block.get_radians()) .. "\n" ..
                        "get_ctrl_a() " .. tostring(block.get_ctrl_a()) .. "\n" ..
                        "get_ctrl_b() " .. tostring(block.get_ctrl_b()) .. "\n" ..
                        "is_gate() " .. tostring(block.is_gate()) .. "\n" ..
                        "get_circuit_num_wires() " .. tostring(block.get_circuit_num_wires()) .. "\n" ..
                        "get_circuit_num_columns() " .. tostring(block.get_circuit_num_columns()) .. "\n" ..
                        "is_on_circuit_grid() " .. tostring(block.is_on_circuit_grid()) .. "\n" ..
                        "get_node_wire_num() " .. tostring(block.get_node_wire_num()) .. "\n" ..
                        "get_node_column_num() " .. tostring(block.get_node_column_num()) .. "\n" ..
                        "get_circuit_pos() " .. dump(block.get_circuit_pos()) .. "\n")

                    -- TODO: Replace with real logic
                    local wire_placed = block.set_ctrl_a(block.get_node_wire_num() - 1)
                    minetest.debug("control wire_placed: " .. tostring(wire_placed))
                else
                    circuit_blocks:set_node_with_circuit_specs_meta(pos,
                        "circuit_blocks:circuit_blocks_empty_wire")
                end
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
            --minetest.debug("In can_dig: meta:to_table():\n" .. dump(meta:to_table()))
            return is_on_grid == 0
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

            -- minetest.debug("In on_rightclick: meta:to_table():\n" .. dump(meta:to_table()))

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



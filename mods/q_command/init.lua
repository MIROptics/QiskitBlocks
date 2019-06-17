-- TODO:
--  Define Quantum control block that creates circuit, etc.

-- our API object
q_command = {}

q_command.block_pos = {}
q_command.circuit_specs = {} -- pos, num_wires, num_columns, is_on_grid
q_command.circuit_specs.pos = {} -- x, y, z

-- returns q_command object or nil
function q_command:get_q_command_block(pos)
	local node_name = minetest.get_node(pos).name
	if minetest.registered_nodes[node_name] then

        -- Retrieve metadata
        local meta = minetest.get_meta(pos)
        -- local node_type = meta:get_int("node_type")
        local circuit_pos_x = meta:get_int("circuit_specs_pos_x")
        local circuit_pos_y = meta:get_int("circuit_specs_pos_y")
        local circuit_pos_z = meta:get_int("circuit_specs_pos_z")

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

            -- Set control wire A, integer
            --set_ctrl_a = function(ctrl_a_arg)
            --    ctrl_a = ctrl_a_arg
            --    meta:set_int("ctrl_a", ctrl_a_arg)
            --
            --    return
			--end,

            -- Get control wire A, integer
            --get_ctrl_a = function()
			--	return ctrl_a
			--end,


            -- Position of lower-left node of the circuit grid
            get_circuit_pos = function()
                local ret_pos = {}
                ret_pos.x = circuit_pos_x
                ret_pos.y = circuit_pos_y
                ret_pos.z = circuit_pos_z
				return ret_pos
			end,

            -- Determine if circuit grid exists
            circuit_grid_exists = function()
                local ret_exists = false
                if circuit_pos_x > 0 and circuit_pos_z > 0 then
                    ret_exists = true
                end
				return ret_exists
			end,

            -- Create string representation
            -- TODO: What is Lua way to implement a "to string" function?
            to_string = function()
                local ret_str = "pos: " .. dump(pos) .. "\n" ..
                        "node_name: " .. node_name .. "\n" ..
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


function q_command:debug_node_info(pos, message)
    local block = q_command:get_q_command_block(pos)
    minetest.debug("to_string:\n" .. dump(block.to_string()))
    minetest.debug((message or "") .. "\ncircuit_block:\n" ..
        "get_node_pos() " .. dump(block.get_node_pos()) .. "\n" ..
        "get_node_name() " .. dump(block.get_node_name()) .. "\n" ..
        "circuit_grid_exists() " .. dump(block.circuit_grid_exists()) .. "\n" ..
        "get_circuit_pos() " .. dump(block.get_circuit_pos()) .. "\n")

end


function q_command:create_blank_circuit_grid()
    local circuit_num_wires = q_command.circuit_specs.num_wires
    local circuit_num_columns = q_command.circuit_specs.num_columns
    for wire = 1, circuit_num_wires do
        for column = 1, circuit_num_columns do
            local node_pos = {}
            node_pos.x = q_command.circuit_specs.pos.x + column - 1
            node_pos.y = circuit_num_wires - (q_command.circuit_specs.pos.y + wire - 2)
            node_pos.z = q_command.circuit_specs.pos.z
            -- TODO: Change to add_node() for clarity?
            minetest.set_node(node_pos,
                    {name="circuit_blocks:circuit_blocks_empty_wire"})

            -- Update the metadata in these newly created nodes
            local meta = minetest.get_meta(node_pos)
            meta:set_int("circuit_specs_num_wires", circuit_num_wires)
            meta:set_int("circuit_specs_num_columns", circuit_num_columns)
            meta:set_int("circuit_specs_is_on_grid", 1)
            meta:set_int("circuit_specs_pos_x", q_command.circuit_specs.pos.x)
            meta:set_int("circuit_specs_pos_y", q_command.circuit_specs.pos.y)
            meta:set_int("circuit_specs_pos_z", q_command.circuit_specs.pos.z)
            --minetest.debug("dump(node_pos):\n" .. dump(node_pos))
            --minetest.debug("meta:to_table():\n" .. dump(meta:to_table()))
        end
    end
end


function q_command:compute_circuit(circuit_block)
    local num_wires = circuit_block.get_circuit_num_wires()
    local num_columns = circuit_block.get_circuit_num_columns()
    local circuit_pos_x = circuit_block.get_circuit_pos().x
    local circuit_pos_y = circuit_block.get_circuit_pos().y
    local circuit_pos_z = circuit_block.get_circuit_pos().z


    local qasm_str = 'OPENQASM 2.0;\ninclude "qelib1.inc";\n'

    qasm_str = qasm_str .. 'qreg q[' .. tostring(num_wires) .. '];\n'
    qasm_str = qasm_str .. 'creg q[' .. tostring(num_wires) .. '];\n'

    -- Add a column of identity gates to protect simulators from an empty circuit
    qasm_str = qasm_str .. 'id q;\n'

    for column_num = 1, num_columns do
        for wire_num = 1, num_wires do
            local circuit_node_pos = {x = circuit_pos_x + column_num - 1,
                                      y = circuit_pos_y + num_wires - wire_num,
                                      z = circuit_pos_z}
            local circuit_node_block = circuit_blocks:get_circuit_block(circuit_node_pos)
            --minetest.debug("c: " .. tostring(column_num) .. ", w: " ..
            --        tostring(wire_num) .. ", node_type: " .. circuit_node_block.get_node_type())

            if circuit_node_block then
                local node_type = circuit_node_block.get_node_type()
                local ctrl_a = circuit_node_block.get_ctrl_a()
                local ctrl_b = circuit_node_block.get_ctrl_b()

                -- TODO: Implement swap gate
                -- local swap = circuit_node_block.get_swap()

                local radians = circuit_node_block.get_radians()

                if node_type == CircuitNodeTypes.IDEN then
                    -- Identity gate
                    qasm_str = qasm_str .. 'id q[' .. tostring(wire_num) .. '];\n'

                elseif node_type == CircuitNodeTypes.X then
                    if radians == 0 then
                        if ctrl_a ~= -1 then
                            if ctrl_b ~= -1 then
                                -- Toffoli gate
                                qasm_str = qasm_str .. 'ccx q[' .. tostring(ctrl_a) .. '],'
                                qasm_str = qasm_str .. 'q[' .. tostring(ctrl_b) .. '],'
                                qasm_str = qasm_str .. 'q[' .. tostring(wire_num) .. '];\n'
                            else
                                -- Controlled X gate
                                qasm_str = qasm_str .. 'cx q[' .. tostring(ctrl_a) .. '],'
                                qasm_str = qasm_str .. 'q[' .. tostring(wire_num) .. '];\n'
                            end
                        else
                            -- Pauli-X gate
                            qasm_str = qasm_str .. 'x q[' .. tostring(wire_num) .. '];\n'
                        end
                    else
                        -- Rotation around X axis
                        qasm_str = qasm_str .. 'rx(' .. tostring(radians) .. ') '
                        qasm_str = qasm_str .. 'q[' .. tostring(wire_num) .. '];\n'
                    end

                elseif node_type == CircuitNodeTypes.Y then
                    if radians == 0 then
                        if ctrl_a ~= -1 then
                            -- Controlled Y gate
                            qasm_str = qasm_str .. 'cy q[' .. tostring(ctrl_a) .. '],'
                            qasm_str = qasm_str .. 'q[' .. tostring(wire_num) .. '];\n'
                        else
                            -- Pauli-Y gate
                            qasm_str = qasm_str .. 'y q[' .. tostring(wire_num) .. '];\n'
                        end
                    else
                        -- Rotation around Y axis
                        qasm_str = qasm_str .. 'ry(' .. tostring(radians) .. ') '
                        qasm_str = qasm_str .. 'q[' .. tostring(wire_num) .. '];\n'
                    end
                elseif node_type == CircuitNodeTypes.Z then
                    if radians == 0 then
                        if ctrl_a ~= -1 then
                            -- Controlled Z gate
                            qasm_str = qasm_str .. 'cz q[' .. tostring(ctrl_a) .. '],'
                            qasm_str = qasm_str .. 'q[' .. tostring(wire_num) .. '];\n'
                        else
                            -- Pauli-Z gate
                            qasm_str = qasm_str .. 'z q[' .. tostring(wire_num) .. '];\n'
                        end
                    else
                        if circuit_node_block.get_ctrl_a() ~= -1 then
                            -- Controlled rotation around the Z axis
                            qasm_str = qasm_str .. 'crz(' .. tostring(radians) .. ') '
                            qasm_str = qasm_str .. 'q[' .. tostring(ctrl_a) .. '],'
                            qasm_str = qasm_str .. 'q[' .. tostring(wire_num) .. '];\n'
                        else
                            -- Rotation around Z axis
                            qasm_str = qasm_str .. 'rz(' .. tostring(radians) .. ') '
                            qasm_str = qasm_str .. 'q[' .. tostring(wire_num) .. '];\n'
                        end
                    end

                elseif node_type == CircuitNodeTypes.S then
                    -- S gate
                    qasm_str = qasm_str .. 's q[' .. tostring(wire_num) .. '];\n'
                elseif node_type == CircuitNodeTypes.SDG then
                    -- S dagger gate
                    qasm_str = qasm_str .. 'sdg q[' .. tostring(wire_num) .. '];\n'
                elseif node_type == CircuitNodeTypes.T then
                    -- T gate
                    qasm_str = qasm_str .. 't q[' .. tostring(wire_num) .. '];\n'
                elseif node_type == CircuitNodeTypes.TDG then
                    -- T dagger gate
                    qasm_str = qasm_str .. 'tdg q[' .. tostring(wire_num) .. '];\n'
                elseif node_type == CircuitNodeTypes.H then
                    if ctrl_a ~= -1 then
                        -- Controlled Hadamard
                        qasm_str = qasm_str .. 'ch q[' .. tostring(ctrl_a) .. '],'
                        qasm_str = qasm_str .. 'q[' .. tostring(wire_num) .. '];\n'
                    else
                        -- Hadamard gate
                        qasm_str = qasm_str .. 'h q[' .. tostring(wire_num) .. '];\n'
                    end

                --TODO: Implement SWAP gate in circuit blocks
                --[[
                elseif node_type == CircuitNodeTypes.SWAP then
                    if ctrl_a ~= -1 then
                        -- Controlled Swap
                        qasm_str = qasm_str .. 'cswap q[' .. tostring(ctrl_a) .. '],'
                        qasm_str = qasm_str .. 'q[' .. tostring(wire_num) .. '],'
                        qasm_str = qasm_str .. 'q[' .. tostring(swap) .. '];\n'
                    else
                        -- Swap gate
                        qasm_str = qasm_str .. 'swap q[' .. tostring(wire_num) .. '],'
                        qasm_str = qasm_str .. 'q[' .. tostring(swap) .. '];\n'
                    end
                --]]
                else
                    print("Unknown gate!")
                end
            end

        end
    end


    --[[
    qasm_str = qasm_str .. 'qreg q[' .. tostring(self.max_wires) .. '];\n'
    qasm_str = qasm_str .. 'creg q[' .. tostring(self.max_wires) .. '];\n'

    -- Add a column of identity gates to protect simulators from an empty circuit
    qasm_str = qasm_str .. 'id q;\n'

    for column_num = 1, self.max_columns do
        for wire_num = 1, self.max_wires do
            local node = self.nodes[wire_num][column_num]
            if node then
                if node.node_type == CircuitNodeTypes.IDEN then
                    -- Identity gate
                    qasm_str = qasm_str .. 'id q[' .. tostring(wire_num) .. '];\n'
                elseif node.node_type == CircuitNodeTypes.X then
                    if node.radians == 0 then
                        if node.ctrl_a ~= -1 then
                            if node.ctrl_b ~= -1 then
                                -- Toffoli gate
                                qasm_str = qasm_str .. 'ccx q[' .. tostring(node.ctrl_a) .. '],'
                                qasm_str = qasm_str .. 'q[' .. tostring(node.ctrl_b) .. '],'
                                qasm_str = qasm_str .. 'q[' .. tostring(wire_num) .. '];\n'
                            else
                                -- Controlled X gate
                                qasm_str = qasm_str .. 'cx q[' .. tostring(node.ctrl_a) .. '],'
                                qasm_str = qasm_str .. 'q[' .. tostring(wire_num) .. '];\n'
                            end
                        else
                            -- Pauli-X gate
                            qasm_str = qasm_str .. 'x q[' .. tostring(wire_num) .. '];\n'
                        end
                    else
                        -- Rotation around X axis
                        qasm_str = qasm_str .. 'rx(' .. tostring(node.radians) .. ') '
                        qasm_str = qasm_str .. 'q[' .. tostring(wire_num) .. '];\n'
                    end
                elseif node.node_type == CircuitNodeTypes.Y then
                    if node.radians == 0 then
                        if node.ctrl_a ~= -1 then
                            -- Controlled Y gate
                            qasm_str = qasm_str .. 'cy q[' .. tostring(node.ctrl_a) .. '],'
                            qasm_str = qasm_str .. 'q[' .. tostring(wire_num) .. '];\n'
                        else
                            -- Pauli-Y gate
                            qasm_str = qasm_str .. 'y q[' .. tostring(wire_num) .. '];\n'
                        end
                    else
                        -- Rotation around Y axis
                        qasm_str = qasm_str .. 'ry(' .. tostring(node.radians) .. ') '
                        qasm_str = qasm_str .. 'q[' .. tostring(wire_num) .. '];\n'
                    end
                elseif node.node_type == CircuitNodeTypes.Z then
                    if node.radians == 0 then
                        if node.ctrl_a ~= -1 then
                            -- Controlled Z gate
                            qasm_str = qasm_str .. 'cz q[' .. tostring(node.ctrl_a) .. '],'
                            qasm_str = qasm_str .. 'q[' .. tostring(wire_num) .. '];\n'
                        else
                            -- Pauli-Z gate
                            qasm_str = qasm_str .. 'z q[' .. tostring(wire_num) .. '];\n'
                        end
                    else
                        if node.ctrl_a ~= -1 then
                            -- Controlled rotation around the Z axis
                            qasm_str = qasm_str .. 'crz(' .. tostring(node.radians) .. ') '
                            qasm_str = qasm_str .. 'q[' .. tostring(node.ctrl_a) .. '],'
                            qasm_str = qasm_str .. 'q[' .. tostring(wire_num) .. '];\n'
                        else
                            -- Rotation around Z axis
                            qasm_str = qasm_str .. 'rz(' .. tostring(node.radians) .. ') '
                            qasm_str = qasm_str .. 'q[' .. tostring(wire_num) .. '];\n'
                        end
                    end
                elseif node.node_type == CircuitNodeTypes.S then
                    -- S gate
                    qasm_str = qasm_str .. 's q[' .. tostring(wire_num) .. '];\n'
                elseif node.node_type == CircuitNodeTypes.SDG then
                    -- S dagger gate
                    qasm_str = qasm_str .. 'sdg q[' .. tostring(wire_num) .. '];\n'
                elseif node.node_type == CircuitNodeTypes.T then
                    -- T gate
                    qasm_str = qasm_str .. 't q[' .. tostring(wire_num) .. '];\n'
                elseif node.node_type == CircuitNodeTypes.TDG then
                    -- T dagger gate
                    qasm_str = qasm_str .. 'tdg q[' .. tostring(wire_num) .. '];\n'
                elseif node.node_type == CircuitNodeTypes.H then
                    if node.ctrl_a ~= -1 then
                        -- Controlled Hadamard
                        qasm_str = qasm_str .. 'ch q[' .. tostring(node.ctrl_a) .. '],'
                        qasm_str = qasm_str .. 'q[' .. tostring(wire_num) .. '];\n'
                    else
                        -- Hadamard gate
                        qasm_str = qasm_str .. 'h q[' .. tostring(wire_num) .. '];\n'
                    end
                elseif node.node_type == CircuitNodeTypes.SWAP then
                    if node.ctrl_a ~= -1 then
                        -- Controlled Swap
                        qasm_str = qasm_str .. 'cswap q[' .. tostring(node.ctrl_a) .. '],'
                        qasm_str = qasm_str .. 'q[' .. tostring(wire_num) .. '],'
                        qasm_str = qasm_str .. 'q[' .. tostring(node.swap) .. '];\n'
                    else
                        -- Swap gate
                        qasm_str = qasm_str .. 'swap q[' .. tostring(wire_num) .. '],'
                        qasm_str = qasm_str .. 'q[' .. tostring(node.swap) .. '];\n'
                    end
                else
                    print("Unknown gate!")
                end
            end
        end
    end
    --]]

    return qasm_str

    -- TODO: Implement following lines
    --[[

                    elif node.node_type == node_types.SWAP:
                        if node.ctrl_a != -1:
                            # Controlled Swap
                            qc.cswap(qr[node.ctrl_a], qr[wire_num], qr[node.swap])
                        else:
                            # Swap gate
                            qc.swap(qr[wire_num], qr[node.swap])

        self.latest_computed_circuit = qc
        return qc
    --]]
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
    if(formname == "create_circuit_grid") then
        if fields.num_wires_str and fields.num_columns_str and
                fields.start_z_offset_str and fields.start_x_offset_str then
            local num_wires = tonumber(fields.num_wires_str)
            local num_columns = tonumber(fields.num_columns_str)
            local start_z_offset = tonumber(fields.start_z_offset_str)
            local start_x_offset = tonumber(fields.start_x_offset_str)

            if num_wires and num_wires > 0 and
                    num_columns and num_columns > 0 and
                    start_z_offset and start_z_offset > 0 and
                    start_x_offset then
                -- Store position of left-most, bottom-most block, and dimensions of circuit
                q_command.circuit_specs.pos.x = q_command.block_pos.x - start_x_offset
                q_command.circuit_specs.pos.y = q_command.block_pos.y
                q_command.circuit_specs.pos.z = q_command.block_pos.z + start_z_offset
                q_command.circuit_specs.num_wires = num_wires
                q_command.circuit_specs.num_columns = num_columns
                minetest.debug("q_command.circuit_specs: " .. dump(q_command.circuit_specs))

                -- Create circuit grid with empty blocks
                q_command:create_blank_circuit_grid()

                -- Put location of circuit into the q_command block metadata
                local meta = minetest.get_meta(q_command.block_pos)
                meta:set_int("circuit_specs_pos_x", q_command.circuit_specs.pos.x)
                meta:set_int("circuit_specs_pos_y", q_command.circuit_specs.pos.y)
                meta:set_int("circuit_specs_pos_z", q_command.circuit_specs.pos.z)
            else
                -- TODO: Show error message dialog?
                minetest.chat_send_player(player:get_player_name(),
                    "Circuit not created! ")
            end
            return
        end
    end
end)

minetest.register_node("q_command:q_block", {
    description = "Q command block",
    tiles = {"q_command_block.png"},
    groups = {oddly_breakable_by_hand=2},
    on_construct = function(pos)
        local meta = minetest.get_meta(pos)
        meta:set_string("infotext", "Quantum circuit command block")
        q_command.block_pos = pos
    end,
    on_rightclick = function(pos, node, clicker, itemstack)
        local player_name = clicker:get_player_name()
        local meta = minetest.get_meta(pos)
        local formspec = "size[5.0, 4.6]"..
                "field[1.0,0.5;1.5,1.5;num_wires_str;Wires:;3]" ..
                "field[3.0,0.5;1.5,1.5;num_columns_str;Columns:;5]" ..
                "field[1.0,2.0;1.5,1.5;start_z_offset_str;Forward offset:;4]" ..
                "field[3.0,2.0;1.5,1.5;start_x_offset_str;Left offset:;2]" ..
				"button_exit[1.8,3.5;1.5,1.0;create;Create]"
        minetest.show_formspec(player_name, "create_circuit_grid", formspec)
    end,
    on_punch = function(pos, node, player)
        local q_block = q_command:get_q_command_block(pos)
        q_command:debug_node_info(pos, "In on_punch, q_command_block")
        if q_block:circuit_grid_exists() then
            local circuit_grid_pos = q_block.get_circuit_pos()
            local circuit_block = circuit_blocks:get_circuit_block(circuit_grid_pos)
            local qasm_str = q_command:compute_circuit(circuit_block)
            minetest.debug("qasm_str:\n" .. qasm_str)
        else
            minetest.chat_send_player(player:get_player_name(),
                    "Must create a circuit first")
        end
    end,
    can_dig = function(pos, player)
        return false
    end
})

--[[
minetest.register_node("q_command:q_sphere", {
    description = "Q command sphere",
    drawtype = "mesh",
    mesh = "q_sphere.obj",
    tiles = {"q_command_block.png"},
    groups = {oddly_breakable_by_hand=2},
    on_construct = function(pos)
        local meta = minetest.get_meta(pos)
        meta:set_string("infotext", "Quantum circuit command block")
        q_command.block_pos = pos
    end,
    on_rightclick = function(pos, node, clicker, itemstack)
        local player_name = clicker:get_player_name()
        local meta = minetest.get_meta(pos)
        local formspec = "size[5.0, 4.6]"..
                "field[1.0,0.5;1.5,1.5;num_wires_str;Wires:;3]" ..
                "field[3.0,0.5;1.5,1.5;num_columns_str;Columns:;5]" ..
                "field[1.0,2.0;1.5,1.5;start_z_offset_str;Forward offset:;4]" ..
                "field[3.0,2.0;1.5,1.5;start_x_offset_str;Left offset:;2]" ..
				"button_exit[1.8,3.5;1.5,1.0;create;Create]"
        minetest.show_formspec(player_name, "create_circuit_grid", formspec)
    end
})
--]]




-- TODO:
--  Define Quantum control block that creates circuit, etc.

-- our API object
q_command = {}

q_command.block_pos = {}
q_command.circuit_specs = {} -- pos, num_wires, num_columns, is_on_grid
q_command.circuit_specs.pos = {} -- x, y, z

-- returns circuit_block object or nil

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


function q_command:compute_circuit()
    local qasm_str = 'OPENQASM 2.0;\ninclude "qelib1.inc";\n'

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
        local qasm_str = q_command:compute_circuit()
        minetest.debug("qasm_str:\n" .. qasm_str)
    end,
    can_dig = function(pos, player)
        return false
    end
})

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




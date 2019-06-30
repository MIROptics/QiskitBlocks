-- Quantum control block that creates circuit, etc.

dofile(minetest.get_modpath("q_command").."/dkjson.lua");
dofile(minetest.get_modpath("q_command").."/url_code.lua");
dofile(minetest.get_modpath("q_command").."/complex_module.lua");
dofile(minetest.get_modpath("q_command").."/wire_extension.lua");


request_http_api = minetest.request_http_api()
minetest.debug("request_http_api: " .. dump(request_http_api))

complex = create_complex()

BASIS_STATE_BLOCK_MAX_QUBITS = 4


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

        -- Flag that indicates whether to run qasm_simulator on next on_punch()
        -- 0 means don't run
        local qasm_simulator_flag = meta:get_int("qasm_simulator_flag")

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

            get_circuit_pos = function()
                local ret_pos = {}
                ret_pos.x = circuit_pos_x
                ret_pos.y = circuit_pos_y
                ret_pos.z = circuit_pos_z
				return ret_pos
			end,

            -- Get qasm simulator flag, integer
            get_qasm_simulator_flag = function()
				return qasm_simulator_flag
			end,

            -- Set qasm simulator flag, integer
            set_qasm_simulator_flag = function(zero_one)
                meta:set_int("qasm_simulator_flag", zero_one)
			end,

            -- Determine if circuit grid exists
            --
            circuit_grid_exists = function()
                local ret_exists = false
                if circuit_pos_x ~= 0 or circuit_pos_y ~= 0 or circuit_pos_z ~= 0 then
                    -- TODO: Close the loophole where the origin of a circuit is on 0,0,0
                    --       (or make it an Easter egg)
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
                        "circuit_pos_z: " .. tostring(circuit_pos_z) .. "\n" ..
                        "qasm_simulator_flag: " .. tostring(qasm_simulator_flag) .. "\n"
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

    -- Must be 0 for the circuit grid. This variable is
    -- to be used by wire extension to indicate which wire
    -- is being extended
    local circuit_specs_wire_num_offset = 0

    for wire = 1, circuit_num_wires do
        for column = 1, circuit_num_columns do
            local node_pos = {}
            node_pos.x = q_command.circuit_specs.pos.x + column - 1
            node_pos.y = q_command.circuit_specs.pos.y + circuit_num_wires - wire
            node_pos.z = q_command.circuit_specs.pos.z

            -- Put [0> blocks to the left of the circuit
            if column == 1 then
                local ket_pos = {x = node_pos.x - 1, y = node_pos.y, z = node_pos.z}
                minetest.set_node(ket_pos,
                        {name="circuit_blocks:qubit_0"})
            end

            minetest.set_node(node_pos,
                    {name="circuit_blocks:circuit_blocks_empty_wire"})

            -- Update the metadata in these newly created nodes
            local meta = minetest.get_meta(node_pos)
            meta:set_int("circuit_specs_wire_num_offset", circuit_specs_wire_num_offset)
            meta:set_int("circuit_specs_num_wires", circuit_num_wires)
            meta:set_int("circuit_specs_num_columns", circuit_num_columns)
            meta:set_int("circuit_specs_is_on_grid", 1)
            meta:set_int("circuit_specs_pos_x", q_command.circuit_specs.pos.x)
            meta:set_int("circuit_specs_pos_y", q_command.circuit_specs.pos.y)
            meta:set_int("circuit_specs_pos_z", q_command.circuit_specs.pos.z)
            meta:set_int("q_command_block_pos_x", q_command.block_pos.x)
            meta:set_int("q_command_block_pos_y", q_command.block_pos.y)
            meta:set_int("q_command_block_pos_z", q_command.block_pos.z)
        end
    end
end


function q_command:create_qasm_for_node(circuit_node_pos, wire_num, include_measurement_blocks)
    local qasm_str = ""
    local circuit_node_block = circuit_blocks:get_circuit_block(circuit_node_pos)

    if circuit_node_block then
        local node_type = circuit_node_block.get_node_type()

        if node_type == CircuitNodeTypes.EMPTY then
            -- Return immediately with zero length qasm_str
            return qasm_str
        end

        local ctrl_a = circuit_node_block.get_ctrl_a()
        local ctrl_b = circuit_node_block.get_ctrl_b()

        -- TODO: Implement swap gate
        -- local swap = circuit_node_block.get_swap()

        local radians = circuit_node_block.get_radians()

        -- For convenience and brevity, create a zero-based, string, wire number
        --local wire_num_idx = tostring(wire_num - 1 +
        --        circuit_node_block.get_circuit_specs_wire_num_offset())
        --local ctrl_a_idx = tostring(ctrl_a - 1 +
        --        circuit_node_block.get_circuit_specs_wire_num_offset())
        --local ctrl_b_idx = tostring(ctrl_b - 1 +
        --        circuit_node_block.get_circuit_specs_wire_num_offset())

        -- TODO: Replace above with below?

        local wire_num_idx = tostring(wire_num - 1)
        local ctrl_a_idx = tostring(ctrl_a - 1)
        local ctrl_b_idx = tostring(ctrl_b - 1)


        if node_type == CircuitNodeTypes.IDEN then
            -- Identity gate
            qasm_str = qasm_str .. 'id q[' .. wire_num_idx .. '];'

        elseif node_type == CircuitNodeTypes.X then
            if radians == 0 then
                if ctrl_a ~= -1 then
                    if ctrl_b ~= -1 then
                        -- Toffoli gate
                        qasm_str = qasm_str .. 'ccx q[' .. ctrl_a_idx .. '],'
                        qasm_str = qasm_str .. 'q[' .. ctrl_b_idx .. '],'
                        qasm_str = qasm_str .. 'q[' .. wire_num_idx .. '];'
                    else
                        -- Controlled X gate
                        qasm_str = qasm_str .. 'cx q[' .. ctrl_a_idx .. '],'
                        qasm_str = qasm_str .. 'q[' .. wire_num_idx .. '];'
                    end
                else
                    -- Pauli-X gate
                    qasm_str = qasm_str .. 'x q[' .. wire_num_idx .. '];'
                end
            else
                -- Rotation around X axis
                qasm_str = qasm_str .. 'rx(' .. tostring(radians) .. ') '
                qasm_str = qasm_str .. 'q[' .. wire_num_idx .. '];'
            end

        elseif node_type == CircuitNodeTypes.Y then
            if radians == 0 then
                if ctrl_a ~= -1 then
                    -- Controlled Y gate
                    qasm_str = qasm_str .. 'cy q[' .. ctrl_a_idx .. '],'
                    qasm_str = qasm_str .. 'q[' .. wire_num_idx .. '];'
                else
                    -- Pauli-Y gate
                    qasm_str = qasm_str .. 'y q[' .. wire_num_idx .. '];'
                end
            else
                -- Rotation around Y axis
                qasm_str = qasm_str .. 'ry(' .. tostring(radians) .. ') '
                qasm_str = qasm_str .. 'q[' .. wire_num_idx .. '];'
            end
        elseif node_type == CircuitNodeTypes.Z then
            if radians == 0 then
                if ctrl_a ~= -1 then
                    -- Controlled Z gate
                    qasm_str = qasm_str .. 'cz q[' .. ctrl_a_idx .. '],'
                    qasm_str = qasm_str .. 'q[' .. wire_num_idx .. '];'
                else
                    -- Pauli-Z gate
                    qasm_str = qasm_str .. 'z q[' .. wire_num_idx .. '];'
                end
            else
                if circuit_node_block.get_ctrl_a() ~= -1 then
                    -- Controlled rotation around the Z axis
                    qasm_str = qasm_str .. 'crz(' .. tostring(radians) .. ') '
                    qasm_str = qasm_str .. 'q[' .. ctrl_a_idx .. '],'
                    qasm_str = qasm_str .. 'q[' .. wire_num_idx .. '];'
                else
                    -- Rotation around Z axis
                    qasm_str = qasm_str .. 'rz(' .. tostring(radians) .. ') '
                    qasm_str = qasm_str .. 'q[' .. wire_num_idx .. '];'
                end
            end

        elseif node_type == CircuitNodeTypes.S then
            -- S gate
            qasm_str = qasm_str .. 's q[' .. wire_num_idx .. '];'
        elseif node_type == CircuitNodeTypes.SDG then
            -- S dagger gate
            qasm_str = qasm_str .. 'sdg q[' .. wire_num_idx .. '];'
        elseif node_type == CircuitNodeTypes.T then
            -- T gate
            qasm_str = qasm_str .. 't q[' .. wire_num_idx .. '];'
        elseif node_type == CircuitNodeTypes.TDG then
            -- T dagger gate
            qasm_str = qasm_str .. 'tdg q[' .. wire_num_idx .. '];'
        elseif node_type == CircuitNodeTypes.H then
            if ctrl_a ~= -1 then
                -- Controlled Hadamard
                qasm_str = qasm_str .. 'ch q[' .. ctrl_a_idx .. '],'
                qasm_str = qasm_str .. 'q[' .. wire_num_idx .. '];'
            else
                -- Hadamard gate
                qasm_str = qasm_str .. 'h q[' .. wire_num_idx .. '];'
            end
        elseif node_type == CircuitNodeTypes.MEASURE_Z then
            if include_measurement_blocks then
                -- Measurement block
                qasm_str = qasm_str .. 'measure q[' .. wire_num_idx .. '] -> c[' .. wire_num_idx .. '];'
            end
        elseif node_type == CircuitNodeTypes.CONNECTOR_M then
            -- Connector to wire extension, so traverse
            local wire_extension_block_pos = circuit_node_block.get_wire_extension_block_pos()

            q_command:debug_node_info(wire_extension_block_pos,
                    "Processing CONNECTOR_M, wire_extension_block")

            if wire_extension_block_pos.x > 0 then
                local wire_extension_block = circuit_blocks:get_circuit_block(wire_extension_block_pos)
                local wire_extension_circuit_pos = wire_extension_block.get_circuit_pos()

                q_command:debug_node_info(wire_extension_circuit_pos,
                        "Processing CONNECTOR_M, wire_extension_circuit")

                if wire_extension_circuit_pos.x > 0 then
                    local wire_extension_circuit = circuit_blocks:get_circuit_block(wire_extension_circuit_pos)
                    local extension_wire_num = wire_extension_circuit.get_circuit_specs_wire_num_offset() + 1
                    local extension_num_columns = wire_extension_circuit.get_circuit_num_columns()
                    for column_num = 1, extension_num_columns do
                         local circ_node_pos = {x = wire_extension_circuit_pos.x + column_num - 1,
                                                  y = wire_extension_circuit_pos.y,
                                                  z = wire_extension_circuit_pos.z}

                        q_command:debug_node_info(circ_node_pos,
                                "Processing CONNECTOR_M, circ_node_pos")

                         qasm_str = qasm_str ..
                                 q_command:create_qasm_for_node(circ_node_pos,
                                         extension_wire_num, include_measurement_blocks)
                    end
                end
            end
        end


        --TODO: Implement SWAP gate in circuit blocks
        --[[
        elseif node_type == CircuitNodeTypes.SWAP then
            if ctrl_a ~= -1 then
                -- Controlled Swap
                qasm_str = qasm_str .. 'cswap q[' .. ctrl_a_idx .. '],'
                qasm_str = qasm_str .. 'q[' .. wire_num_idx .. '],'
                qasm_str = qasm_str .. 'q[' .. tostring(swap) .. '];'
            else
                -- Swap gate
                qasm_str = qasm_str .. 'swap q[' .. wire_num_idx .. '],'
                qasm_str = qasm_str .. 'q[' .. tostring(swap) .. '];'
            end
        --]]
    else
        print("Unknown gate!")
    end
    minetest.debug("End of create_qasm_for_node(), qasm_str:\n" .. qasm_str)
    return qasm_str
end

function q_command:compute_circuit(circuit_block, include_measurement_blocks)
    local num_wires = circuit_block.get_circuit_num_wires()
    local num_columns = circuit_block.get_circuit_num_columns()
    local circuit_pos_x = circuit_block.get_circuit_pos().x
    local circuit_pos_y = circuit_block.get_circuit_pos().y
    local circuit_pos_z = circuit_block.get_circuit_pos().z


    local qasm_str = 'OPENQASM 2.0;include "qelib1.inc";'

    qasm_str = qasm_str .. 'qreg q[' .. tostring(num_wires) .. '];'
    qasm_str = qasm_str .. 'creg c[' .. tostring(num_wires) .. '];'

    -- Add a column of identity gates to protect simulators from an empty circuit
    qasm_str = qasm_str .. 'id q;'

    for column_num = 1, num_columns do
        for wire_num = 1, num_wires do
            local circuit_node_pos = {x = circuit_pos_x + column_num - 1,
                                      y = circuit_pos_y + num_wires - wire_num,
                                      z = circuit_pos_z}

            qasm_str = qasm_str .. q_command:create_qasm_for_node(circuit_node_pos, wire_num, include_measurement_blocks)
        end
    end

    minetest.debug("qasm_str:\n" .. qasm_str)
    return qasm_str
end


minetest.register_on_player_receive_fields(function(player, formname, fields)
    if(formname == "create_circuit_grid") then
        if fields.num_wires_str and fields.num_columns_str and
                fields.start_z_offset_str and fields.start_x_offset_str then
            local num_wires = tonumber(fields.num_wires_str)
            local num_columns = tonumber(fields.num_columns_str)
            local start_z_offset = tonumber(fields.start_z_offset_str)
            local start_x_offset = tonumber(fields.start_x_offset_str)
            local start_y_offset = 1  -- TODO: Perhaps make this configurable

            if num_wires and num_wires > 0 and
                    num_columns and num_columns > 0 and
                    start_z_offset and start_z_offset >= 0 and
                    start_x_offset then
                -- Store position of left-most, bottom-most block, and dimensions of circuit
                q_command.circuit_specs.pos.x = q_command.block_pos.x - start_x_offset
                q_command.circuit_specs.pos.y = q_command.block_pos.y + start_y_offset
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

                -- TODO: Find a better way (that works)
                -- Punch the q_command block (ourself) to run simulator and update resultant displays
                minetest.punch_node(q_command.block_pos)

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
        local q_block = q_command:get_q_command_block(pos)
        if not q_block:circuit_grid_exists() then
            local player_name = clicker:get_player_name()
            local meta = minetest.get_meta(pos)
            local formspec = "size[5.0, 4.6]"..
                    "field[1.0,0.5;1.5,1.5;num_wires_str;Wires:;3]" ..
                    "field[3.0,0.5;1.5,1.5;num_columns_str;Columns:;8]" ..
                    "field[1.0,2.0;1.5,1.5;start_z_offset_str;Forward offset:;0]" ..
                    "field[3.0,2.0;1.5,1.5;start_x_offset_str;Left offset:;-1]" ..
                    "button_exit[1.8,3.5;1.5,1.0;create;Create]"
            minetest.show_formspec(player_name, "create_circuit_grid", formspec)
        else
            minetest.chat_send_player(clicker:get_player_name(),
                    "Circuit already exists.")
        end
    end,
    on_punch = function(pos, node, player)
        local q_block = q_command:get_q_command_block(pos)
        q_command:debug_node_info(pos, "In on_punch, q_command_block")
        if q_block:circuit_grid_exists() then

            local circuit_block = circuit_blocks:get_circuit_block(q_block.get_circuit_pos())
            local num_wires = circuit_block.get_circuit_num_wires()
            local num_columns = circuit_block.get_circuit_num_columns()
            local circuit_pos_x = circuit_block.get_circuit_pos().x
            local circuit_pos_y = circuit_block.get_circuit_pos().y
            local circuit_pos_z = circuit_block.get_circuit_pos().z

            if player:get_player_control().sneak then
                -- Delete entire circuit and wire extensions

                for column_num = 1, num_columns do
                    for wire_num = 1, num_wires do
                        local node_pos = {x = circuit_pos_x + column_num - 1,
                                                  y = circuit_pos_y + num_wires - wire_num,
                                                  z = circuit_pos_z}

                        -- Delete ket blocks to the left of the circuit
                        if column_num == 1 then
                            local ket_pos = {x = node_pos.x - 1, y = node_pos.y, z = node_pos.z}
                            minetest.remove_node(ket_pos)
                        end

                        -- Delete histogram and basis state blocks at the bottom of the circuit
                        if wire_num == num_wires then
                            local hist_pos = {x = node_pos.x, y = node_pos.y - 1, z = node_pos.z}
                            minetest.remove_node(hist_pos)

                            -- Place basis state block
                            basis_state_node_pos = {x = hist_pos.x,
                                                    y = hist_pos.y - 1,
                                                    z = hist_pos.z - 1}

                            if num_wires <= BASIS_STATE_BLOCK_MAX_QUBITS then
                                minetest.remove_node(basis_state_node_pos)
                            end

                        end

                        local cur_block = circuit_blocks:get_circuit_block(node_pos)
                        if cur_block.get_node_type() == CircuitNodeTypes.CONNECTOR_M then
                            circuit_blocks:delete_wire_extension(cur_block)
                        end
                        minetest.remove_node(node_pos)
                    end
                end

                -- Remove the q_block
                minetest.remove_node(pos)

            else

                local circuit_grid_pos = q_block.get_circuit_pos()
                local circuit_block = circuit_blocks:get_circuit_block(circuit_grid_pos)

                local qasm_str = q_command:compute_circuit(circuit_block, false)
                local qasm_with_measurement_str = q_command:compute_circuit(circuit_block, true)

                local http_request_statevector = {
                    -- TODO: Make URL host and port configurable
                    url = "http://localhost:5000/api/run/statevector?backend=statevector_simulator&qasm=" ..
                            url_code.urlencode(qasm_str)
                }

                local http_request_qasm = {
                    -- TODO: Make URL host and port configurable
                    url = "http://localhost:5000/api/run/qasm?backend=qasm_simulator&qasm=" ..
                            url_code.urlencode(qasm_with_measurement_str)
                }

                local function process_backend_statevector_result(http_request_response)
                    minetest.debug("http_request_response (statevector):\n" .. dump(http_request_response))

                    if http_request_response.succeeded and
                            http_request_response.completed and
                            not http_request_response.timeout then

                        local sv_data = http_request_response.data
                        local statevector = {}
                        local obj, pos, err = json.decode (sv_data, 1, nil)
                        if err then
                            minetest.debug ("Error:", err)
                        else
                            local temp_statevector = obj.__ndarray__
                            for i = 1,#temp_statevector do
                                statevector[i] = complex.new(temp_statevector[i].__complex__[1],
                                        temp_statevector[i].__complex__[2])
                            end
                        end

                        minetest.debug("statevector:\n" .. dump(statevector))

                        -- Update the histogram
                        local hist_node_pos = nil
                        local basis_state_node_pos = nil

                        -- TODO: Put this constant somewhere
                        local BLOCK_WATER_LEVELS = 63

                        for col_num = 1, math.min(#statevector, num_columns) do
                            hist_node_pos = {x = circuit_grid_pos.x + col_num - 1,
                                             y = circuit_grid_pos.y - 1,
                                             z = circuit_grid_pos.z}

                            local probability = (complex.abs(statevector[col_num]))^2
                            local scaled_prob = math.floor(probability * BLOCK_WATER_LEVELS)

                            minetest.debug("probability :" .. tostring(probability))

                            minetest.set_node(hist_node_pos,
                                    {name="q_command:glass", param2 = scaled_prob})

                            -- Place basis state block
                            basis_state_node_pos = {x = hist_node_pos.x,
                                                    y = hist_node_pos.y - 1,
                                                    z = hist_node_pos.z - 1}

                            if num_wires <= BASIS_STATE_BLOCK_MAX_QUBITS then
                                local node_name = "q_command:q_command_state_" .. num_wires .. "qb_" .. tostring(col_num - 1)
                                minetest.set_node(basis_state_node_pos,
                                        {name=node_name})

                                -- Place ellipsis block if there are more
                                -- basis states than displayed
                                if num_columns < #statevector and col_num == num_columns then
                                    minetest.set_node(basis_state_node_pos,
                                        {name="q_command:q_command_state_ellipsis"})
                                end
                            end

                        end
                    else
                        minetest.debug("Call to statevector_simulator Didn't succeed")
                    end
                end


                local function update_measure_block(circuit_node_pos, num_wires, wire_num, basis_state_bit_str)
                    local circuit_node_block = circuit_blocks:get_circuit_block(circuit_node_pos)

                    if circuit_node_block then
                        local node_type = circuit_node_block.get_node_type()
                        if node_type == CircuitNodeTypes.MEASURE_Z then
                            local bit_str_idx = num_wires + 1 - wire_num
                            local meas_bit = string.sub(basis_state_bit_str, bit_str_idx, bit_str_idx)
                            local new_node_name = "circuit_blocks:circuit_blocks_measure_" .. meas_bit
                            minetest.swap_node(circuit_node_pos, {name = new_node_name})

                        elseif node_type == CircuitNodeTypes.CONNECTOR_M then
                            -- Connector to wire extension, so traverse
                            local wire_extension_block_pos = circuit_node_block.get_wire_extension_block_pos()

                            q_command:debug_node_info(wire_extension_block_pos,
                                    "Processing CONNECTOR_M, wire_extension_block")

                            if wire_extension_block_pos.x > 0 then
                                local wire_extension_block = circuit_blocks:get_circuit_block(wire_extension_block_pos)
                                local wire_extension_circuit_pos = wire_extension_block.get_circuit_pos()

                                q_command:debug_node_info(wire_extension_circuit_pos,
                                        "Processing CONNECTOR_M, wire_extension_circuit")

                                if wire_extension_circuit_pos.x > 0 then
                                    local wire_extension_circuit = circuit_blocks:get_circuit_block(wire_extension_circuit_pos)
                                    local extension_wire_num = wire_extension_circuit.get_circuit_specs_wire_num_offset() + 1
                                    local extension_num_columns = wire_extension_circuit.get_circuit_num_columns()
                                    for column_num = 1, extension_num_columns do
                                         local circ_node_pos = {x = wire_extension_circuit_pos.x + column_num - 1,
                                                                  y = wire_extension_circuit_pos.y,
                                                                  z = wire_extension_circuit_pos.z}

                                        q_command:debug_node_info(circ_node_pos,
                                                "Processing CONNECTOR_M, circ_node_pos")

                                        update_measure_block(circ_node_pos, num_wires, wire_num, basis_state_bit_str)
                                    end
                                end
                            end
                        end
                    end
                end


                local function process_backend_qasm_result(http_request_response)
                    minetest.debug("http_request_response (qasm):\n" .. dump(http_request_response))

                    if http_request_response.succeeded and
                            http_request_response.completed and
                            not http_request_response.timeout then

                        local qasm_data = http_request_response.data

                        minetest.debug ("qasm_data:", qasm_data)

                        local basis_state_bit_str = nil

                        local obj, pos, err = json.decode (qasm_data, 1, nil)
                        if err then
                            minetest.debug ("Error:", err)
                        else
                            local basis_freq = obj.result
                            minetest.debug("basis_freq:\n" .. dump(basis_freq))

                            -- Only one shot is requested from simulator,
                            -- so this table should have only one entry
                            for key, val in pairs(basis_freq) do
                                basis_state_bit_str = key
                                --minetest.debug("k: " .. k .. ", v: " .. v)
                            end
                        end

                        minetest.debug("basis_state_bit_str: " .. basis_state_bit_str)

                        -- Update measure blocks in the circuit
                        if basis_state_bit_str then
                            local num_wires = circuit_block.get_circuit_num_wires()
                            local num_columns = circuit_block.get_circuit_num_columns()
                            local circuit_pos_x = circuit_block.get_circuit_pos().x
                            local circuit_pos_y = circuit_block.get_circuit_pos().y
                            local circuit_pos_z = circuit_block.get_circuit_pos().z

                            for column_num = 1, num_columns do
                                for wire_num = 1, num_wires do
                                    local circuit_node_pos = {x = circuit_pos_x + column_num - 1,
                                                              y = circuit_pos_y + num_wires - wire_num,
                                                              z = circuit_pos_z}

                                    update_measure_block(circuit_node_pos, num_wires, wire_num, basis_state_bit_str)
                                end

                            end
                        end
                    else
                        minetest.debug("Call to statevector_simulator Didn't succeed")
                    end
                end

                request_http_api.fetch(http_request_statevector, process_backend_statevector_result)

                if q_block.get_qasm_simulator_flag() ~= 0 then
                    request_http_api.fetch(http_request_qasm, process_backend_qasm_result)
                    q_block.set_qasm_simulator_flag(0)
                end

            end

        else
            if player:get_player_control().sneak then
                -- Circuit doesn't exist, so just remove the q_block
                minetest.remove_node(pos)
            else
                minetest.chat_send_player(player:get_player_name(),
                        "Must create a circuit first")
            end
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

minetest.register_node("q_command:glass", {
	description = "Histogram Glass",
	drawtype = "glasslike_framed",
	tiles = {"q_command_glass.png", "q_command_rotation_0p16.png^q_command_glass_detail.png"},
    special_tiles = {"q_command_water.png"},
	paramtype = "light",
	paramtype2 = "glasslikeliquidlevel",
	--sunlight_propagates = true,
	--is_ground_content = false,
	groups = {cracky = 3},
	--sounds = default.node_sound_glass_defaults(),
})


minetest.register_node("q_command:q_command_state_ellipsis", {
    description = "Some basis states not displayed",
    tiles = {"q_command_state_ellipsis.png"},
    groups = {oddly_breakable_by_hand=2}
})

function q_command:register_basis_state_block(num_qubits, basis_state_num)
    local texture_name = "q_command_state_" .. num_qubits .. "qb_" ..
            tostring(basis_state_num)
    minetest.register_node("q_command:" .. texture_name, {
        description = "Basis state " .. tostring(basis_state_num) .. " block",
        tiles = {texture_name .. ".png"},
        groups = {oddly_breakable_by_hand=2}
    })
end


for num_qubits = 1, BASIS_STATE_BLOCK_MAX_QUBITS do
    for basis_state_num = 0, 2^num_qubits - 1 do
        q_command:register_basis_state_block(num_qubits, basis_state_num)
    end
end


--[[
Copyright 2019 the original author or authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
--]]

-- Quantum control block that creates circuit, etc.

-- intllib support
local S
if (minetest.get_modpath("intllib")) then
	S = intllib.Getter()
else
  S = function ( s ) return s end
end

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
q_command.circuit_specs = {} -- dir_str, pos, num_wires, num_columns, is_on_grid
q_command.circuit_specs.pos = {} -- x, y, z


-- returns q_command object or nil
function q_command:get_q_command_block(pos)
	local node_name = minetest.get_node(pos).name
	if minetest.registered_nodes[node_name] then

        -- Retrieve metadata
        local meta = minetest.get_meta(pos)
        -- local node_type = meta:get_int("node_type")
        local circuit_dir_str = meta:get_string("circuit_specs_dir_str")
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

            -- Direction that the back of the circuit is facing (+X, -X, +Z, -Z)
            get_circuit_dir_str = function()
				return circuit_dir_str
			end,

            -- Position of lower-left node of the circuit grid
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
                        "circuit_dir_str: " .. circuit_dir_str .. "\n" ..
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
        "get_circuit_dir_str() " .. block.get_circuit_dir_str() .. "\n" ..
        "get_circuit_pos() " .. dump(block.get_circuit_pos()) .. "\n")

end

--[[
    Computes player direction string +X, -X, +Z, or -Z
    TODO: Consider creating utils and moving this function there
--]]
function q_command:player_horiz_direction_string(player)
    local ret_dir = "+Z"
        local horiz_dir = player:get_look_horizontal()
    if horiz_dir > math.pi / 4 and horiz_dir <= 3*math.pi / 4 then
        ret_dir = "-X"
    elseif horiz_dir > 3*math.pi / 4 and horiz_dir <= 5*math.pi / 4 then
        ret_dir = "-Z"
    elseif horiz_dir > 5*math.pi / 4 and horiz_dir <= 7*math.pi / 4 then
        ret_dir = "+X"
    end

    minetest.chat_send_player(player:get_player_name(),
        "Direction facing: " .. ret_dir .. ", " .. horiz_dir)
    return ret_dir
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
            node_pos.y = q_command.circuit_specs.pos.y + circuit_num_wires - wire

            -- Assume dir_str is "+Z"
            local param2_dir = 0
            node_pos.x = q_command.circuit_specs.pos.x + column - 1
            node_pos.z = q_command.circuit_specs.pos.z

            if q_command.circuit_specs.dir_str == "+X" then
                param2_dir = 1
                node_pos.x = q_command.circuit_specs.pos.x
                node_pos.z = q_command.circuit_specs.pos.z - column + 1
            elseif q_command.circuit_specs.dir_str == "-X" then
                param2_dir = 3
                node_pos.x = q_command.circuit_specs.pos.x
                node_pos.z = q_command.circuit_specs.pos.z + column - 1
            elseif q_command.circuit_specs.dir_str == "-Z" then
                param2_dir = 2
                node_pos.x = q_command.circuit_specs.pos.x - column + 1
                node_pos.z = q_command.circuit_specs.pos.z
            end


            -- Put [0> blocks to the left of the circuit
            if column == 1 then
                local ket_pos = {x = node_pos.x - 1, y = node_pos.y, z = node_pos.z}

                if q_command.circuit_specs.dir_str == "+X" then
                    ket_pos = {x = node_pos.x, y = node_pos.y, z = node_pos.z + 1}
                elseif q_command.circuit_specs.dir_str == "-X" then
                    ket_pos = {x = node_pos.x, y = node_pos.y, z = node_pos.z - 1}
                elseif q_command.circuit_specs.dir_str == "-Z" then
                    ket_pos = {x = node_pos.x + 1, y = node_pos.y, z = node_pos.z}
                end

                minetest.set_node(ket_pos,
                        {name="circuit_blocks:_qubit_0", param2=param2_dir})
            end

            minetest.set_node(node_pos,
                    {name="circuit_blocks:circuit_blocks_empty_wire", param2=param2_dir})

            -- Update the metadata in these newly created nodes
            local meta = minetest.get_meta(node_pos)
            meta:set_int("circuit_specs_wire_num_offset", circuit_specs_wire_num_offset)
            meta:set_int("circuit_specs_num_wires", circuit_num_wires)
            meta:set_int("circuit_specs_num_columns", circuit_num_columns)
            meta:set_int("circuit_specs_is_on_grid", 1)
            meta:set_string("circuit_specs_dir_str", q_command.circuit_specs.dir_str)
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
        local swap = circuit_node_block.get_swap()

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
        local swap_idx = tostring(swap - 1)


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
        elseif node_type == CircuitNodeTypes.BARRIER then
            -- barrier
            qasm_str = qasm_str .. 'barrier q[' .. wire_num_idx .. '];'
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

            if wire_extension_block_pos.x ~= 0 then
                local wire_extension_block = circuit_blocks:get_circuit_block(wire_extension_block_pos)
                local wire_extension_dir_str = wire_extension_block.get_circuit_dir_str()
                local wire_extension_circuit_pos = wire_extension_block.get_circuit_pos()

                q_command:debug_node_info(wire_extension_circuit_pos,
                        "Processing CONNECTOR_M, wire_extension_circuit")

                if wire_extension_circuit_pos.x ~= 0 then
                    local wire_extension_circuit = circuit_blocks:get_circuit_block(wire_extension_circuit_pos)
                    local extension_wire_num = wire_extension_circuit.get_circuit_specs_wire_num_offset() + 1
                    local extension_num_columns = wire_extension_circuit.get_circuit_num_columns()
                    for column_num = 1, extension_num_columns do

                        -- Assume dir_str is "+Z"
                        local circ_node_pos = {x = wire_extension_circuit_pos.x + column_num - 1,
                                               y = wire_extension_circuit_pos.y,
                                               z = wire_extension_circuit_pos.z}

                        if wire_extension_dir_str == "+X" then
                            circ_node_pos = {x = wire_extension_circuit_pos.x,
                                                y = wire_extension_circuit_pos.y,
                                                z = wire_extension_circuit_pos.z - column_num + 1}
                        elseif wire_extension_dir_str == "-X" then
                            circ_node_pos = {x = wire_extension_circuit_pos.x,
                                                y = wire_extension_circuit_pos.y,
                                                z = wire_extension_circuit_pos.z + column_num - 1}
                        elseif wire_extension_dir_str == "-Z" then
                            circ_node_pos = {x = wire_extension_circuit_pos.x - column_num + 1,
                                                y = wire_extension_circuit_pos.y,
                                                z = wire_extension_circuit_pos.z}
                        end

                        q_command:debug_node_info(circ_node_pos,
                                "Processing CONNECTOR_M, circ_node_pos")

                         qasm_str = qasm_str ..
                                 q_command:create_qasm_for_node(circ_node_pos,
                                         extension_wire_num, include_measurement_blocks)
                    end
                end
            end

        elseif node_type == CircuitNodeTypes.SWAP and swap ~= -1 then
            if ctrl_a ~= -1 then
                -- Controlled Swap
                qasm_str = qasm_str .. 'cswap q[' .. ctrl_a_idx .. '],'
                qasm_str = qasm_str .. 'q[' .. wire_num_idx .. '],'
                qasm_str = qasm_str .. 'q[' .. swap_idx .. '];'
            else
                -- Swap gate
                qasm_str = qasm_str .. 'swap q[' .. wire_num_idx .. '],'
                qasm_str = qasm_str .. 'q[' .. swap_idx .. '];'
            end
        end

    else
        print("Unknown gate!")
    end
    minetest.debug("End of create_qasm_for_node(), qasm_str:\n" .. qasm_str)
    return qasm_str
end

function q_command:compute_circuit(circuit_block, include_measurement_blocks)
    local num_wires = circuit_block.get_circuit_num_wires()
    local num_columns = circuit_block.get_circuit_num_columns()
    local circuit_dir_str = circuit_block.get_circuit_dir_str()
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

            -- Assume dir_str is "+Z"
            local circuit_node_pos = {x = circuit_pos_x + column_num - 1,
                                      y = circuit_pos_y + num_wires - wire_num,
                                      z = circuit_pos_z}

            if circuit_dir_str == "+X" then
                circuit_node_pos = {x = circuit_pos_x,
                                    y = circuit_pos_y + num_wires - wire_num,
                                    z = circuit_pos_z - column_num + 1}
            elseif circuit_dir_str == "-X" then
                circuit_node_pos = {x = circuit_pos_x,
                                    y = circuit_pos_y + num_wires - wire_num,
                                    z = circuit_pos_z + column_num - 1}
            elseif circuit_dir_str == "-Z" then
                circuit_node_pos = {x = circuit_pos_x - column_num + 1,
                                      y = circuit_pos_y + num_wires - wire_num,
                                      z = circuit_pos_z}
            end



            qasm_str = qasm_str .. q_command:create_qasm_for_node(circuit_node_pos, wire_num, include_measurement_blocks)
        end
    end

    minetest.debug("qasm_str:\n" .. qasm_str)
    return qasm_str
end


minetest.register_on_player_receive_fields(function(player, formname, fields)
    if(formname == "create_circuit_grid") then
        if fields.num_wires_str and fields.num_columns_str then
            local num_wires = tonumber(fields.num_wires_str)
            local num_columns = tonumber(fields.num_columns_str)
            local start_z_offset = 0
            local start_x_offset = -1
            local start_y_offset = 1

            local horiz_dir_str = q_command:player_horiz_direction_string(player)

            if num_wires and num_wires > 0 and
                    num_columns and num_columns > 0 and
                    start_z_offset and start_z_offset >= 0 and
                    start_x_offset then
                -- Store direction string, position of left-most, bottom-most block, and dimensions of circuit
                q_command.circuit_specs.dir_str = horiz_dir_str

                q_command.circuit_specs.pos.y = q_command.block_pos.y + start_y_offset

                -- Assume dir_str is "+Z"
                q_command.circuit_specs.pos.x = q_command.block_pos.x - start_x_offset
                q_command.circuit_specs.pos.z = q_command.block_pos.z + start_z_offset

                if q_command.circuit_specs.dir_str == "+X" then
                    q_command.circuit_specs.pos.x = q_command.block_pos.x + start_z_offset
                    q_command.circuit_specs.pos.z = q_command.block_pos.z + start_x_offset
                elseif q_command.circuit_specs.dir_str == "-X" then
                    q_command.circuit_specs.pos.x = q_command.block_pos.x - start_z_offset
                    q_command.circuit_specs.pos.z = q_command.block_pos.z - start_x_offset
                elseif q_command.circuit_specs.dir_str == "-Z" then
                    q_command.circuit_specs.pos.x = q_command.block_pos.x + start_x_offset
                    q_command.circuit_specs.pos.z = q_command.block_pos.z - start_z_offset
                end

                q_command.circuit_specs.num_wires = num_wires
                q_command.circuit_specs.num_columns = num_columns

                -- Create circuit grid with empty blocks
                q_command:create_blank_circuit_grid()

                -- Put direction and location of circuit into the q_command block metadata
                local meta = minetest.get_meta(q_command.block_pos)
                meta:set_string("circuit_specs_dir_str", q_command.circuit_specs.dir_str)
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

function q_command:parse_json_statevector(sv_data)
    local statevector = {}
    local obj, pos, err = json.decode (sv_data, 1, nil)
    if err then
        minetest.debug ("Error in parse_json_statevector:", err)
    else
        local temp_statevector = obj.__ndarray__
        for i = 1,#temp_statevector do
            statevector[i] = complex.new(temp_statevector[i].__complex__[1],
                    temp_statevector[i].__complex__[2])
        end
    end
    return statevector
end

function q_command:register_q_command_block(suffix_correct_solution,
                                            suffix_incorrect_solution,
                                            correct_solution_statevector,
                                            block_represents_correct_solution)
    if not suffix_correct_solution or not suffix_incorrect_solution then
        suffix_incorrect_solution = "default"
        suffix_correct_solution = "default_success"
    end

    if not block_represents_correct_solution then
        block_represents_correct_solution = false
    end

    local texture_correct_solution = "q_command_block_" .. suffix_correct_solution .. ".png"
    local texture_incorrect_solution = "q_command_block_" .. suffix_incorrect_solution .. ".png"

    local q_block_node_name = "q_command:q_block_" .. suffix_incorrect_solution
    local other_q_block_node_name = "q_command:q_block_" .. suffix_correct_solution
    local block_desc = "Q command block " .. suffix_incorrect_solution
    local block_texture = "q_command_block_" .. suffix_incorrect_solution .. ".png"
    if block_represents_correct_solution then
        q_block_node_name = "q_command:q_block_" .. suffix_correct_solution
        other_q_block_node_name = "q_command:q_block_" .. suffix_incorrect_solution
        block_desc = "Q command block " .. suffix_correct_solution
        block_texture = "q_command_block_" .. suffix_correct_solution .. ".png"
    end

    minetest.register_node(q_block_node_name, {
        description = block_desc,
        tiles = {block_texture},
        groups = {oddly_breakable_by_hand=2},
        paramtype2 = "facedir",
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
                        "field[1.0,0.5;1.5,1.5;num_wires_str;Wires:;2]" ..
                        "field[3.0,0.5;1.5,1.5;num_columns_str;Columns:;4]" ..
                        --"field[1.0,2.0;1.5,1.5;start_z_offset_str;Forward offset:;0]" ..
                        --"field[3.0,2.0;1.5,1.5;start_x_offset_str;Left offset:;-1]" ..
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
                local circuit_dir_str = circuit_block.get_circuit_dir_str()
                local circuit_pos_x = circuit_block.get_circuit_pos().x
                local circuit_pos_y = circuit_block.get_circuit_pos().y
                local circuit_pos_z = circuit_block.get_circuit_pos().z

                if player:get_player_control().sneak then
                    -- Delete entire circuit and wire extensions

                    for column_num = 1, num_columns do
                        for wire_num = 1, num_wires do

                            -- Assume dir_str is "+Z"
                            local node_pos = {x = circuit_pos_x + column_num - 1,
                                              y = circuit_pos_y + num_wires - wire_num,
                                              z = circuit_pos_z}

                            if circuit_dir_str == "+X" then
                                node_pos = {x = circuit_pos_x,
                                            y = circuit_pos_y + num_wires - wire_num,
                                            z = circuit_pos_z - column_num + 1}
                            elseif circuit_dir_str == "-X" then
                                node_pos = {x = circuit_pos_x,
                                            y = circuit_pos_y + num_wires - wire_num,
                                            z = circuit_pos_z + column_num - 1}
                            elseif circuit_dir_str == "-Z" then
                                node_pos = {x = circuit_pos_x - column_num + 1,
                                            y = circuit_pos_y + num_wires - wire_num,
                                            z = circuit_pos_z}
                            end

                            -- Delete ket blocks to the left of the circuit
                            if column_num == 1 then
                                local ket_pos = {x = node_pos.x - 1, y = node_pos.y, z = node_pos.z}

                                if circuit_dir_str == "+X" then
                                    ket_pos = {x = node_pos.x, y = node_pos.y, z = node_pos.z + 1}
                                elseif circuit_dir_str == "-X" then
                                    ket_pos = {x = node_pos.x, y = node_pos.y, z = node_pos.z - 1}
                                elseif circuit_dir_str == "-Z" then
                                    ket_pos = {x = node_pos.x + 1, y = node_pos.y, z = node_pos.z}
                                end

                                minetest.remove_node(ket_pos)
                            end

                            -- Delete histogram and basis state blocks at the bottom of the circuit
                            if wire_num == num_wires then
                                local hist_pos = {x = node_pos.x, y = node_pos.y - 1, z = node_pos.z}

                                minetest.remove_node(hist_pos)

                                -- Remove basis state block
                                local basis_state_node_pos = {x = hist_pos.x,
                                                              y = hist_pos.y - 1,
                                                              z = hist_pos.z - 1}

                                if circuit_dir_str == "+X" then
                                    basis_state_node_pos = {x = hist_pos.x - 1,
                                                            y = hist_pos.y - 1,
                                                            z = hist_pos.z}
                                elseif circuit_dir_str == "-X" then
                                    basis_state_node_pos = {x = hist_pos.x + 1,
                                                            y = hist_pos.y - 1,
                                                            z = hist_pos.z}
                                elseif circuit_dir_str == "-Z" then
                                    basis_state_node_pos = {x = hist_pos.x,
                                                            y = hist_pos.y - 1,
                                                            z = hist_pos.z + 1}
                                end

                                if num_wires <= BASIS_STATE_BLOCK_MAX_QUBITS then
                                    minetest.remove_node(basis_state_node_pos)
                                end

                            end

                            local cur_block = circuit_blocks:get_circuit_block(node_pos)
                            if cur_block.get_node_type() == CircuitNodeTypes.CONNECTOR_M then
                                circuit_blocks:delete_wire_extension(cur_block, player)
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

                    --[[
                    bit_idx is one-based
                    --]]
                    local function bit_is_set(num, num_bits, bit_idx)
                        num_bits = num_bits or math.max(1, select(2, math.frexp(num)))
                        local bits_table = {} -- will contain the bits
                        for b = 1, num_bits do
                            bits_table[b] = math.fmod(num, 2)
                            num = math.floor((num - bits_table[b]) / 2)
                        end
                        return bits_table[bit_idx] == 1
                    end

                    local function update_bloch_sphere_block(circuit_node_pos, num_wires, wire_num, statevector)
                        local circuit_node_block = circuit_blocks:get_circuit_block(circuit_node_pos)

                        if circuit_node_block then
                            local node_type = circuit_node_block.get_node_type()
                            if node_type == CircuitNodeTypes.BLOCH_SPHERE then
                                local new_node_name = "circuit_blocks:circuit_blocks_qubit_bloch_blank"
                                -- TODO: Ascertain the state of this qubit, and whether it is entangled
                                local y_pi8rot = 0
                                local z_pi8rot = 0

                                local complex_0 = complex.new(0, 0)
                                local complex_1 = complex.new(0, 0)
                                local entangled = false
                                local temp_complex_0 = nil
                                local temp_complex_1 = nil
                                for basis_state_num = 0, #statevector - 1 do
                                    minetest.debug("basis_state_num: " .. basis_state_num)
                                    if bit_is_set(basis_state_num, #statevector, wire_num) then
                                        minetest.debug("#" .. wire_num .. " bit is set, in basis_state_num: " .. basis_state_num)
                                        if temp_complex_1 and
                                                not complex.nearly_equals(temp_complex_1, statevector[basis_state_num + 1]) then
                                            entangled = true
                                            break
                                        end
                                        temp_complex_1 = complex.new(statevector[basis_state_num + 1].r,
                                                statevector[basis_state_num + 1].i)
                                    else
                                        minetest.debug("#" .. wire_num .. " bit is NOT set, in basis_state_num: " .. basis_state_num)
                                        if temp_complex_0 and
                                                not complex.nearly_equals(temp_complex_0, statevector[basis_state_num + 1]) then
                                            entangled = true
                                            break
                                        end
                                        temp_complex_0 = complex.new(statevector[basis_state_num + 1].r,
                                                statevector[basis_state_num + 1].i)
                                    end
                                end

                                if not entangled then
                                    local norm_0 = complex.abs(temp_complex_0) * math.sqrt(1/2) / math.sqrt(1/8)
                                    local y_rot = math.acos(norm_0) * 2
                                    y_pi8rot = math.floor(y_rot * 8 / math.pi)
                                    minetest.debug("norm_0: " .. norm_0 .. ", y_rot: " .. y_rot ..
                                            "y_pi8rot: " ..  y_pi8rot)

                                    local phase_0 = complex.polar_radians(temp_complex_0) * math.sqrt(1/2) / math.sqrt(1/8)
                                    local phase_1 = complex.polar_radians(temp_complex_1) * math.sqrt(1/2) / math.sqrt(1/8)
                                    local global_phase = ((phase_1 - phase_0) + 2 * math.pi) % (2 * math.pi)

                                    minetest.debug("phase_0: " .. phase_0 .. ", phase_1: " .. phase_1 ..
                                            "global_phase: " ..  global_phase)

                                    local z_rot = global_phase
                                    z_pi8rot = math.floor(z_rot * 8 / math.pi)
                                    minetest.debug("global_phase: " .. global_phase .. ", z_rot: " .. z_rot ..
                                            "z_pi8rot: " ..  z_pi8rot)

                                    new_node_name = "circuit_blocks:circuit_blocks_qubit_bloch_y" ..
                                            y_pi8rot .. "p8_z" .. z_pi8rot .. "p8"
                                end


                                local circuit_dir_str = circuit_node_block.get_circuit_dir_str()
                                local param2_dir = 0
                                if circuit_dir_str == "+X" then
                                    param2_dir = 1
                                elseif circuit_dir_str == "-X" then
                                    param2_dir = 3
                                elseif circuit_dir_str == "-Z" then
                                    param2_dir = 2
                                end

                                minetest.swap_node(circuit_node_pos, {name = new_node_name, param2 = param2_dir})

                            elseif node_type == CircuitNodeTypes.CONNECTOR_M then
                                -- Connector to wire extension, so traverse
                                local wire_extension_block_pos = circuit_node_block.get_wire_extension_block_pos()

                                q_command:debug_node_info(wire_extension_block_pos,
                                        "Processing CONNECTOR_M, wire_extension_block")

                                if wire_extension_block_pos.x ~= 0 then
                                    local wire_extension_block = circuit_blocks:get_circuit_block(wire_extension_block_pos)
                                    local wire_extension_dir_str = wire_extension_block.get_circuit_dir_str()
                                    local wire_extension_circuit_pos = wire_extension_block.get_circuit_pos()

                                    q_command:debug_node_info(wire_extension_circuit_pos,
                                            "In update_bloch_sphere_block(), processing CONNECTOR_M, wire_extension_circuit")

                                    if wire_extension_circuit_pos.x ~= 0 then
                                        local wire_extension_circuit = circuit_blocks:get_circuit_block(wire_extension_circuit_pos)
                                        local extension_wire_num = wire_extension_circuit.get_circuit_specs_wire_num_offset() + 1
                                        local extension_num_columns = wire_extension_circuit.get_circuit_num_columns()
                                        for column_num = 1, extension_num_columns do

                                            -- Assume dir_str is "+Z"
                                            local circ_node_pos = {x = wire_extension_circuit_pos.x + column_num - 1,
                                                                   y = wire_extension_circuit_pos.y,
                                                                   z = wire_extension_circuit_pos.z}

                                            if wire_extension_dir_str == "+X" then
                                                circ_node_pos = {x = wire_extension_circuit_pos.x,
                                                                 y = wire_extension_circuit_pos.y,
                                                                 z = wire_extension_circuit_pos.z - column_num + 1}
                                            elseif wire_extension_dir_str == "-X" then
                                                circ_node_pos = {x = wire_extension_circuit_pos.x,
                                                                 y = wire_extension_circuit_pos.y,
                                                                 z = wire_extension_circuit_pos.z + column_num - 1}
                                            elseif wire_extension_dir_str == "-Z" then
                                                circ_node_pos = {x = wire_extension_circuit_pos.x - column_num + 1,
                                                                 y = wire_extension_circuit_pos.y,
                                                                 z = wire_extension_circuit_pos.z}
                                            end

                                            q_command:debug_node_info(circ_node_pos,
                                                    "In update_bloch_sphere_block(), Processing CONNECTOR_M, circ_node_pos")

                                            update_bloch_sphere_block(circ_node_pos, num_wires, wire_num, statevector)
                                        end
                                    end
                                end
                            end
                        end
                    end


                    local function process_backend_statevector_result(http_request_response)
                        minetest.debug("http_request_response (statevector):\n" .. dump(http_request_response))

                        if http_request_response.succeeded and
                                http_request_response.completed and
                                not http_request_response.timeout then

                            local sv_data = http_request_response.data

                            local statevector = q_command:parse_json_statevector(sv_data)

                            -- minetest.debug("statevector:\n" .. dump(statevector))

                            -- minetest.debug("correct_solution_statevector:\n" .. dump(correct_solution_statevector))

                            local is_correct_solution = true
                            if statevector and correct_solution_statevector and
                                    #statevector == #correct_solution_statevector then
                                for sv_idx = 1, #statevector do
                                    if not complex.nearly_equals(statevector[sv_idx],
                                                    correct_solution_statevector[sv_idx]) then
                                        is_correct_solution = false
                                        break
                                    end
                                end
                            else
                                is_correct_solution = false
                            end
                            minetest.debug("is_correct_solution: " .. tostring(is_correct_solution))

                            if (is_correct_solution and not block_represents_correct_solution) or
                                    (not is_correct_solution and block_represents_correct_solution) then
                                minetest.swap_node(q_block.get_node_pos(), {name = other_q_block_node_name})
                            end

                            -- Update the histogram
                            local hist_node_pos = nil
                            local basis_state_node_pos = nil
                            local under_hist_node_pos = nil

                            -- TODO: Put this constant somewhere
                            local BLOCK_WATER_LEVELS = 63

                            -- Place a platform under the circuit
                            for col_num = 1, math.min(#statevector, num_columns) + 3 do
                                for row_num = 1, 4 do
                                    -- Assume dir_str is "+Z"
                                    local platform_node_pos = {x = circuit_grid_pos.x + col_num - 3,
                                                     y = circuit_grid_pos.y - 2,
                                                     z = circuit_grid_pos.z + 2 - row_num}
                                    if circuit_block.get_circuit_dir_str() == "+X" then
                                        platform_node_pos = {x = circuit_grid_pos.x + 2 - row_num,
                                                             y = circuit_grid_pos.y - 2,
                                                             z = circuit_grid_pos.z - col_num + 3}
                                    elseif circuit_block.get_circuit_dir_str() == "-X" then
                                        platform_node_pos = {x = circuit_grid_pos.x - 2 + row_num,
                                                             y = circuit_grid_pos.y - 2,
                                                             z = circuit_grid_pos.z + col_num - 3}
                                    elseif circuit_block.get_circuit_dir_str() == "-Z" then
                                        platform_node_pos = {x = circuit_grid_pos.x - col_num + 3,
                                                             y = circuit_grid_pos.y - 2,
                                                             z = circuit_grid_pos.z - 2 + row_num}
                                    end

                                    minetest.set_node(platform_node_pos,
                                                {name="default:desert_stone_block"})
                                end
                            end

                            for col_num = 1, math.min(#statevector, num_columns) do

                                -- Assume dir_str is "+Z"
                                hist_node_pos = {x = circuit_grid_pos.x + col_num - 1,
                                                 y = circuit_grid_pos.y - 1,
                                                 z = circuit_grid_pos.z}

                                if circuit_block.get_circuit_dir_str() == "+X" then
                                    hist_node_pos = {x = circuit_grid_pos.x,
                                                     y = circuit_grid_pos.y - 1,
                                                     z = circuit_grid_pos.z - col_num + 1}
                                elseif circuit_block.get_circuit_dir_str() == "-X" then
                                    hist_node_pos = {x = circuit_grid_pos.x,
                                                     y = circuit_grid_pos.y - 1,
                                                     z = circuit_grid_pos.z + col_num - 1}
                                elseif circuit_block.get_circuit_dir_str() == "-Z" then
                                    hist_node_pos = {x = circuit_grid_pos.x - col_num + 1,
                                                     y = circuit_grid_pos.y - 1,
                                                     z = circuit_grid_pos.z}
                                end

                                local amp = statevector[col_num]
                                local phase_rad = (complex.polar_radians(amp) + math.pi * 2) % (math.pi * 2)

                                local p16_radians = 0
                                local threshold = 0.0001
                                if math.abs(phase_rad - 0) > threshold and
                                        math.abs(phase_rad - math.pi * 2) > threshold then
                                    p16_radians = math.floor(phase_rad * 16 / math.pi + 0.5)
                                    minetest.debug("phase_rad: " .. tostring(phase_rad) .. ", p16_radians: " .. tostring(p16_radians))

                                    if p16_radians < 1 then
                                        p16_radians = 1
                                    elseif p16_radians > 32 then
                                        p16_radians = 32
                                    end
                                end

                                local probability = (complex.abs(statevector[col_num]))^2
                                local scaled_prob = math.floor(probability * BLOCK_WATER_LEVELS)

                                minetest.debug("probability :" .. tostring(probability))

                                local hist_node_name = "q_command:statevector_glass_no_arrow"
                                if scaled_prob > 0 then
                                    hist_node_name = "q_command:statevector_glass_" .. tostring(p16_radians) .. "p16"
                                end
                                minetest.set_node(hist_node_pos,
                                        {name=hist_node_name, param2 = scaled_prob})

                                -- Place basis state block
                                -- Assume dir_str is "+Z"
                                local param2_dir = 0
                                basis_state_node_pos = {x = hist_node_pos.x,
                                                        y = hist_node_pos.y - 1,
                                                        z = hist_node_pos.z - 1}
                                under_hist_node_pos = {x = hist_node_pos.x,
                                                        y = hist_node_pos.y - 1,
                                                        z = hist_node_pos.z}

                                if circuit_block.get_circuit_dir_str() == "+X" then
                                    param2_dir = 1
                                    basis_state_node_pos = {x = hist_node_pos.x - 1,
                                                            y = hist_node_pos.y - 1,
                                                            z = hist_node_pos.z}
                                    under_hist_node_pos = {x = hist_node_pos.x,
                                                            y = hist_node_pos.y - 1,
                                                            z = hist_node_pos.z}
                                elseif circuit_block.get_circuit_dir_str() == "-X" then
                                    param2_dir = 3
                                    basis_state_node_pos = {x = hist_node_pos.x + 1,
                                                            y = hist_node_pos.y - 1,
                                                            z = hist_node_pos.z}
                                    under_hist_node_pos = {x = hist_node_pos.x,
                                                            y = hist_node_pos.y - 1,
                                                            z = hist_node_pos.z}
                                elseif circuit_block.get_circuit_dir_str() == "-Z" then
                                    param2_dir = 2
                                    basis_state_node_pos = {x = hist_node_pos.x,
                                                            y = hist_node_pos.y - 1,
                                                            z = hist_node_pos.z + 1}
                                    under_hist_node_pos = {x = hist_node_pos.x,
                                                            y = hist_node_pos.y - 1,
                                                            z = hist_node_pos.z}
                                end

                                if num_wires <= BASIS_STATE_BLOCK_MAX_QUBITS then
                                    local node_name = "q_command:q_command_state_" .. num_wires .. "qb_" .. tostring(col_num - 1)
                                    minetest.set_node(basis_state_node_pos,
                                            {name=node_name, param2=param2_dir})
                                    minetest.set_node(under_hist_node_pos,
                                        {name="wool:dark_grey", param2=param2_dir})

                                    -- Place ellipsis block if there are more
                                    -- basis states than displayed
                                    if num_columns < #statevector and col_num == num_columns then
                                        minetest.set_node(basis_state_node_pos,
                                            {name="q_command:q_command_state_ellipsis", param2=param2_dir})
                                    end
                                end

                            end

                            -- Update bloch sphere blocks in the circuit
                            if statevector then
                                local num_wires = circuit_block.get_circuit_num_wires()
                                local num_columns = circuit_block.get_circuit_num_columns()
                                local circuit_dir_str = circuit_block.get_circuit_dir_str()
                                local circuit_pos_x = circuit_block.get_circuit_pos().x
                                local circuit_pos_y = circuit_block.get_circuit_pos().y
                                local circuit_pos_z = circuit_block.get_circuit_pos().z

                                local column_num = num_columns
                                for wire_num = 1, num_wires do

                                    -- Assume dir_str is "+Z"
                                    local circuit_node_pos = {x = circuit_pos_x + column_num - 1,
                                                              y = circuit_pos_y + num_wires - wire_num,
                                                              z = circuit_pos_z}

                                    if circuit_dir_str == "+X" then
                                        circuit_node_pos = {x = circuit_pos_x,
                                                            y = circuit_pos_y + num_wires - wire_num,
                                                            z = circuit_pos_z - column_num + 1}
                                    elseif circuit_dir_str == "-X" then
                                        circuit_node_pos = {x = circuit_pos_x,
                                                            y = circuit_pos_y + num_wires - wire_num,
                                                            z = circuit_pos_z + column_num - 1}
                                    elseif circuit_dir_str == "-Z" then
                                        circuit_node_pos = {x = circuit_pos_x - column_num + 1,
                                                            y = circuit_pos_y + num_wires - wire_num,
                                                            z = circuit_pos_z}
                                    end

                                    update_bloch_sphere_block(circuit_node_pos, num_wires, wire_num, statevector)
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

                                -- Use cat measure textures if measure block is cat-related
                                if circuit_node_block.get_node_name():sub(1, 47) ==
                                        "circuit_blocks:circuit_blocks_measure_alice_cat" then
                                    new_node_name = "circuit_blocks:circuit_blocks_measure_alice_cat_" .. meas_bit
                                elseif circuit_node_block.get_node_name():sub(1, 45) ==
                                        "circuit_blocks:circuit_blocks_measure_bob_cat" then
                                    new_node_name = "circuit_blocks:circuit_blocks_measure_bob_cat_" .. meas_bit
                                end

                                local circuit_dir_str = circuit_node_block.get_circuit_dir_str()
                                local param2_dir = 0
                                if circuit_dir_str == "+X" then
                                    param2_dir = 1
                                elseif circuit_dir_str == "-X" then
                                    param2_dir = 3
                                elseif circuit_dir_str == "-Z" then
                                    param2_dir = 2
                                end

                                minetest.swap_node(circuit_node_pos, {name = new_node_name, param2 = param2_dir})

                            elseif node_type == CircuitNodeTypes.CONNECTOR_M then
                                -- Connector to wire extension, so traverse
                                local wire_extension_block_pos = circuit_node_block.get_wire_extension_block_pos()

                                q_command:debug_node_info(wire_extension_block_pos,
                                        "Processing CONNECTOR_M, wire_extension_block")

                                if wire_extension_block_pos.x ~= 0 then
                                    local wire_extension_block = circuit_blocks:get_circuit_block(wire_extension_block_pos)
                                    local wire_extension_dir_str = wire_extension_block.get_circuit_dir_str()
                                    local wire_extension_circuit_pos = wire_extension_block.get_circuit_pos()

                                    q_command:debug_node_info(wire_extension_circuit_pos,
                                            "Processing CONNECTOR_M, wire_extension_circuit")

                                    if wire_extension_circuit_pos.x ~= 0 then
                                        local wire_extension_circuit = circuit_blocks:get_circuit_block(wire_extension_circuit_pos)
                                        local extension_wire_num = wire_extension_circuit.get_circuit_specs_wire_num_offset() + 1
                                        local extension_num_columns = wire_extension_circuit.get_circuit_num_columns()
                                        for column_num = 1, extension_num_columns do

                                            -- Assume dir_str is "+Z"
                                            local circ_node_pos = {x = wire_extension_circuit_pos.x + column_num - 1,
                                                                   y = wire_extension_circuit_pos.y,
                                                                   z = wire_extension_circuit_pos.z}

                                            if wire_extension_dir_str == "+X" then
                                                circ_node_pos = {x = wire_extension_circuit_pos.x,
                                                                    y = wire_extension_circuit_pos.y,
                                                                    z = wire_extension_circuit_pos.z - column_num + 1}
                                            elseif wire_extension_dir_str == "-X" then
                                                circ_node_pos = {x = wire_extension_circuit_pos.x,
                                                                    y = wire_extension_circuit_pos.y,
                                                                    z = wire_extension_circuit_pos.z + column_num - 1}
                                            elseif wire_extension_dir_str == "-Z" then
                                                circ_node_pos = {x = wire_extension_circuit_pos.x - column_num + 1,
                                                                    y = wire_extension_circuit_pos.y,
                                                                    z = wire_extension_circuit_pos.z}
                                            end

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
                                local circuit_dir_str = circuit_block.get_circuit_dir_str()
                                local circuit_pos_x = circuit_block.get_circuit_pos().x
                                local circuit_pos_y = circuit_block.get_circuit_pos().y
                                local circuit_pos_z = circuit_block.get_circuit_pos().z

                                for column_num = 1, num_columns do
                                    for wire_num = 1, num_wires do

                                        -- Assume dir_str is "+Z"
                                        local circuit_node_pos = {x = circuit_pos_x + column_num - 1,
                                                                  y = circuit_pos_y + num_wires - wire_num,
                                                                  z = circuit_pos_z}

                                        if circuit_dir_str == "+X" then
                                            circuit_node_pos = {x = circuit_pos_x,
                                                                y = circuit_pos_y + num_wires - wire_num,
                                                                z = circuit_pos_z - column_num + 1}
                                        elseif circuit_dir_str == "-X" then
                                            circuit_node_pos = {x = circuit_pos_x,
                                                                y = circuit_pos_y + num_wires - wire_num,
                                                                z = circuit_pos_z + column_num - 1}
                                        elseif circuit_dir_str == "-Z" then
                                            circuit_node_pos = {x = circuit_pos_x - column_num + 1,
                                                                y = circuit_pos_y + num_wires - wire_num,
                                                                z = circuit_pos_z}
                                        end

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
end
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


minetest.register_node("q_command:q_command_state_ellipsis", {
    description = "Some basis states not displayed",
    tiles = {"q_command_state_ellipsis.png"},
    groups = {oddly_breakable_by_hand=2},
    paramtype2 = "facedir"
})

function q_command:register_basis_state_block(num_qubits, basis_state_num)
    local texture_name = "q_command_state_" .. num_qubits .. "qb_" ..
            tostring(basis_state_num)
    minetest.register_node("q_command:" .. texture_name, {
        description = "Basis state " .. tostring(basis_state_num) .. " block",
        tiles = {texture_name .. ".png"},
        paramtype2 = "facedir",
        groups = {oddly_breakable_by_hand=2}
    })
end


minetest.register_node("q_command:statevector_glass_no_arrow", {
    description = "Statevector Glass with no arrow",
    drawtype = "glasslike_framed",
    tiles = {"q_command_glass.png", "q_command_transparent_blank.png^q_command_glass_detail.png"},
    special_tiles = {"q_command_water.png"},
    paramtype = "light",
    paramtype2 = "glasslikeliquidlevel",
    --sunlight_propagates = true,
    --is_ground_content = false,
    groups = {cracky = 3},
    --sounds = default.node_sound_glass_defaults(),
})


function q_command:register_statevector_liquid_block(pi16rotation)
    local texture_name = "q_command_rotation_" .. pi16rotation .. "p16"
    minetest.register_node("q_command:statevector_glass_" .. pi16rotation .. "p16", {
        description = "Statevector Glass " .. pi16rotation .. "p16",
        drawtype = "glasslike_framed",
        tiles = {"q_command_glass.png", texture_name .. ".png^q_command_glass_detail.png"},
        special_tiles = {"q_command_water.png"},
        paramtype = "light",
        paramtype2 = "glasslikeliquidlevel",
        --sunlight_propagates = true,
        --is_ground_content = false,
        groups = {cracky = 3},
        --sounds = default.node_sound_glass_defaults(),
    })
end

function q_command:convert_newlines(str)
	if(type(str)~="string") then
		return "ERROR: No string found!"
	end

	local function convert(s)
		return s:gsub("\n", function(slash, what)
			return ","
		end)
	end

	return convert(str)
end


--- Help buttons ---
function q_command:register_help_button(suffix, caption, fulltext)
	--q_command.captions[itemstringpart] = caption
	minetest.register_node("q_command:q_command_button_wall_help_" .. suffix, {
		description = suffix .. " help button",
		drawtype = "nodebox",
		tiles = {"q_command_button_wall_help.png"},
		inventory_image = "q_command_button_wield_help.png",
		wield_image = "q_command_button_wield_help.png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.4375, 0.4375, -0.3125, 0.4375, 0.5, 0.3125},
			wall_bottom = {-0.4375, -0.5, -0.3125, 0.4375, -0.4375, 0.3125},
			wall_side   = {-0.5, -0.3125, -0.4375, -0.4375, 0.3125, 0.4375},
		},
		groups = {cracky = 2, attached_node = 1},
		legacy_wallmounted = true,
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			local formspec = ""..
			"size[12,6]"..
			"label[-0.15,-0.4;"..minetest.formspec_escape(S(caption)).."]"..
			"tablecolumns[text]"..
			"tableoptions[background=#000000;highlight=#000000;border=false]"..
			"table[0,0.25;12,5.2;infosign_text;"..
			q_command:convert_newlines(minetest.formspec_escape(S(fulltext)))..
			"]"..
			"button_exit[4.5,5.5;3,1;close;"..minetest.formspec_escape(S("Close")).."]"
			meta:set_string("formspec", formspec)
			meta:set_string("infotext", string.format(S("%s (Right-click for hints)"), S(caption)))
			meta:set_string("id", itemstringpart)
			meta:set_string("caption", caption)
		end,
		on_receive_fields = function(pos, formname, fields, sender)
			--print("Sign at "..minetest.pos_to_string(pos).." got "..dump(fields))
			local player_name = sender:get_player_name()
			if minetest.is_protected(pos, player_name) then
				minetest.record_protection_violation(pos, player_name)
				return
			end
			local text = fields.text
			if not text then
				return
			end
			if string.len(text) > 512 then
				minetest.chat_send_player(player_name, "Text too long")
				return
			end
			minetest.log("action", (player_name or "") .. " wrote \"" ..
				text .. "\" to sign at " .. minetest.pos_to_string(pos))
			local meta = minetest.get_meta(pos)
			meta:set_string("text", text)
			meta:set_string("infotext", '"' .. text .. '"')
		end,
	})
end

q_command.texts = {}

q_command.texts.quantum_circuit_world =
[[Welcome to the world of quantum computing circuits! The block-world environment you are currently
in is created with the Minetest.net open-source library. The quantum circuits with which you will
interact are powered by Qiskit.org quantum simulators.

There are an increasing number of areas that you may explore in this environment. The first place
you may want to visit is the quantum cats sandbox. It this area, some basic quantum computing circuits
and gates are demonstrated with grumpy and happy cats instead of the usual qubits. To get there,
just follow the light blocks just outside the front doors into the woods.

If you are too grown-up to play with cats, then a good place to begin your journey would be in the
quantum circuit garden on the other side of the large wall outside the front doors. Wherever you
choose to begin, please be sure to right-click the Help buttons (labeled with a question mark) as
you encounter them.
]]
q_command:register_help_button("quantum_circuit_world", "Quantum circuit world", q_command.texts.quantum_circuit_world)

q_command.texts.quantum_cats_sandbox =
[[There are so many ones and zeros in quantum computing that some folks find it easier to initially
relate to states with real world concepts (e.g. cats) rather than jumping straight to qubits. In the
Quantum Cats Sandbox, each of the circuits start out with cats (Alice Cat and Bob Cat) in their
grumpy state. The gates in the circuits evolve their quantum states, resulting in various
probabilities of the cats being being grumpy or happy when observed (measured). These probabilities
are expressed by the liquid levels in the glass blocks below each circuit. The binary digits 0 and 1
in front of the liquid blocks represent grumpy and happy states, respectively, with the rightmost digit
representing the topmost cat.

Take a look at the circuits, beginning with the one-wire circuits on the opposite wall, and
right-click their Help buttons to learn more about them. Feel free to remove (by left-clicking)
and add (by right-clicking) gates on a circuit to see the effects on the probabilities as well as
measurements. To measure a circuit, right-click on a block that has the appearance of a measuring
device. You will find a couple of gates and some other items in the chest, which you may open and
close by right-clicking. To move an item from the chest into your inventory, drag it from the upper
to the lower section of the chest dialog box.

There are a couple of tools in the chest with which you may add control qubits to a gate, as well
as to rotate a gate. To use these tools, position the cursor on an appropriate gate and left-click
or right-click.
]]
q_command:register_help_button("quantum_cats_sandbox", "Quantum cats sandbox", q_command.texts.quantum_cats_sandbox)

q_command.texts.making_cats_happy =
[[This circuit, consisting of only one wire (cat), leverages the Pauli-X gate, also known as the NOT,
or bit-flip, gate. Its effect on a grumpy cat is to make it happy, and vice-versa. Notice how the
outcome probabilities and measurement results change as this gate is removed and added.
]]
q_command:register_help_button("making_cats_happy", "Making a cat happy", q_command.texts.making_cats_happy)

q_command.texts.superpositional_cat =
[[This circuit leverages the Hadamard gate to put a cat into an equal superposition of grumpy and
happy. Notice how the outcome probabilities and measurement results change as this gate is removed
and added.
]]
q_command:register_help_button("superpositional_cat", "Superposition of grumpy and happy cat", q_command.texts.superpositional_cat)

q_command.texts.entangling_cats =
[[This two-wire circuit demonstrates the property known as quantum entanglement. Notice that each
of the wires in the circuit are continued by blocks separated from the main circuit. This illustrates
the idea that two entangled quantum particles may be separated by a great distance and continue
to be entangled. Measuring one of the particles (cats) results in the measured state of the other
particle to be determined. Try it out by right-clicking one of the measurement blocks. Also notice
that the probabilities indicate that states 00 (grumpy-grumpy) and 11 (happy-happy) are equally likely.

The CNOT gate (the two-wire gate that has the appearance of cross-hairs and a vertical line with a
dot), is partially responsible for the entanglement. The cross-hairs symbol has the functionality
of a NOT gate used in another circuit in this cat sandbox. The difference is that it is conditional
on the state of the other wire, performing the NOT operation whenever the other wire is in the
happy cat state.
]]
q_command:register_help_button("entangling_cats", "Entangling cats", q_command.texts.entangling_cats)

q_command.texts.quantum_circuit_garden =
[[Welcome to the quantum circuit garden, which contains various circuit-based puzzles to solve.
For more information on the challenge for a given circuit, right-click its Help button. To solve
a puzzle, add the appropriate gates to its circuit. You can find the necessary gates in the chest
below this sign, which you may open and close by right-clicking. To move an item from the chest
into your inventory, drag it from the upper to the lower section of the chest dialog box. To add a
gate to a circuit, choose the gate block from the hotbar, position the cursor on the circuit, and
right-click. Left-clicking a gate removes it from the circuit. When you solve a given circuit
puzzle, the black block will turn gold.

There are a couple of tools in the chest with which you may add control qubits to a gate, as well
as to rotate a gate. To use these tools, position the cursor on an appropriate gate and left-click
or right-click.

Notice that each circuit has a set of glass blocks with liquid levels that express the measurement
probability of each basis state. The rightmost digit of each basis state represents the topmost
wire. To measure a circuit, right-click on a block that has the appearance of a measuring
device.
]]
q_command:register_help_button("quantum_circuit_garden", "Quantum circuit garden", q_command.texts.quantum_circuit_garden)

q_command:register_q_command_block("default")

q_command.texts.x_gate =
[[This circuit, consisting of only one wire, leverages the Pauli-X gate, also known as the NOT,
or bit-flip, gate. Its effect on the |0> state is to make it |1>, and vice-versa. To solve this
circuit puzzle, get an X block out of the chest and place it on the circuit. Notice how the
outcome probabilities and measurement results change as this gate is removed and added.
]]
q_command:register_help_button("x_gate", "Quantum NOT gate", q_command.texts.x_gate)
local solution_statevector_x_gate =
{
	{
		r = 0,
		i = 0
	},
	{
		r = 1,
		i = 0
	}
}
q_command:register_q_command_block( "x_gate_success", "x_gate",
        solution_statevector_x_gate, true)
q_command:register_q_command_block( "x_gate_success", "x_gate",
        solution_statevector_x_gate, false)


q_command.texts.h_gate =
[[
This circuit leverages the Hadamard gate to put a qubit into an equal superposition of |0> and |1>.
To solve this circuit puzzle, get an H block out of the chest and place it on the circuit. Notice
how the outcome probabilities and measurement results change as this gate is removed and added.
Notice how the outcome probabilities and measurement results change as this gate is removed
and added.
]]
q_command:register_help_button("h_gate", "Hadamard gate", q_command.texts.h_gate)
local solution_statevector_h_gate =
{
	{
		r = 0.707,
		i = 0
	},
	{
		r = 0.707,
		i = 0
	}
}
q_command:register_q_command_block( "h_gate_success", "h_gate",
        solution_statevector_h_gate, true)
q_command:register_q_command_block( "h_gate_success", "h_gate",
        solution_statevector_h_gate, false)



q_command.texts.equal_super_2wire =
[[This circuit leverages two Hadamard gates to create an equal superposition of |00>, |01>, |10>,
and |11>. To solve this circuit puzzle, place an H block on each wire. Notice how the outcome
probabilities and measurement results change as these gates are removed and added. This pattern of
placing an H gate on each wire of a circuit is commonly used to create a superposition consisting
of 2^numQubits states.
]]
q_command:register_help_button("equal_super_2wire", "Equal superposition with two qubits", q_command.texts.equal_super_2wire)
local solution_statevector_equal_super_2wire =
{
	{
		r = 0.5,
		i = 0
	},
	{
		r = 0.5,
		i = 0
	},
	{
		r = 0.5,
		i = 0
	},
	{
		r = 0.5,
		i = 0
	}
}
q_command:register_q_command_block( "equal_super_2wire_success", "equal_super_2wire",
        solution_statevector_equal_super_2wire, true)
q_command:register_q_command_block( "equal_super_2wire_success", "equal_super_2wire",
        solution_statevector_equal_super_2wire, false)


q_command.texts.hxx_gates =
[[This circuit leverages Hadamard and X gates to create a state |001> + |101>. To solve this
circuit puzzle, place the appropriate gates on the wires.
]]
q_command:register_help_button("hxx_gates", "Hadamard and X gates", q_command.texts.hxx_gates)
local solution_statevector_hxx_gates =
{
	{
		r = 0,
		i = 0
	},
	{
		r = 0.707,
		i = 0
	},
	{
		r = 0,
		i = 0
	},
	{
		r = 0,
		i = 0
	},
	{
		r = 0,
		i = 0
	},
	{
		r = 0.707,
		i = 0
	},
	{
		r = 0,
		i = 0
	},
	{
		r = 0,
		i = 0
	}
}
q_command:register_q_command_block( "hxx_gates_success", "hxx_gates",
        solution_statevector_hxx_gates, true)
q_command:register_q_command_block( "hxx_gates_success", "hxx_gates",
        solution_statevector_hxx_gates, false)


q_command.texts.bell_phi_plus =
[[The four simplest examples of quantum entanglement are the Bell states. The most well-known Bell
state, symbolized by Φ+ (phi plus), may be realized with a Hadamard gate and a CNOT gate. The CNOT
gate is a two-wire gate that has the appearance of cross-hairs and a vertical line with a dot. The
cross-hairs symbol has the functionality of the X gate, with the difference being that it is
conditional on the state of the other wire, performing the NOT operation whenever the other wire
is |1>.

Measuring one of the qubits results in the measured state of the other qubit to be determined. A
correct Φ+ Bell state solution will have probabilities indicating that measurement results |00>
and |11> are equally likely, as well has having identical phases. The notation for a phase on these
block-world circuits is an arrow that points in a direction signifying its counterclockwise
rotation, from 0 radians pointing rightward.

One way to realize this state is to place a Hadamard gate on the top wire, and an X gate on the
second wire in a column to the right of the Hadamard gate. Then select the control tool from
the hotbar (after having retrieved it from the chest). While positioning the cursor on the X gate
in the circuit, left-click until the control qubit is on the same wire as the Hadamard gate.
]]
q_command:register_help_button("bell_phi_plus", "Bell State: Φ+", q_command.texts.bell_phi_plus)
local solution_statevector_bell_phi_plus =
{
	{
		r = 0.707,
		i = 0
	},
	{
		r = 0,
		i = 0
	},
	{
		r = 0,
		i = 0
	},
	{
		r = 0.707,
		i = 0
	}
}
q_command:register_q_command_block( "bell_phi_plus_success", "bell_phi_plus",
        solution_statevector_bell_phi_plus, true)
q_command:register_q_command_block( "bell_phi_plus_success", "bell_phi_plus",
        solution_statevector_bell_phi_plus, false)


q_command.texts.bell_phi_minus =
[[The four simplest examples of quantum entanglement are the Bell states. One of these Bell states,
symbolized by Φ- (phi minus), may be realized by placing an X gate on the top wire, and adding the
Φ+ Bell state circuit (as instructed in another puzzle) to the right of the X gate,

Measuring one of the qubits results in the measured state of the other qubit to be determined. A
correct Φ- Bell state solution will have probabilities indicating that measurement results |00>
and |11> are equally likely, as well has having opposite phases. The notation for a phase on these
block-world circuits is an arrow that points in a direction signifying its counterclockwise
rotation, from 0 radians pointing rightward. As an example, a leftward pointing arrow signifies a
phase of π radians.

The interference of phases in the elements of a quantum state vector are used in quantum algorithms
to increase the likelihood of measurements resulting in the correct answers.
]]
q_command:register_help_button("bell_phi_minus", "Bell State: Φ-", q_command.texts.bell_phi_minus)
local solution_statevector_bell_phi_minus =
{
	{
		r = 0.707,
		i = 0
	},
	{
		r = 0,
		i = 0
	},
	{
		r = 0,
		i = 0
	},
	{
		r = -0.707,
		i = 0
	}
}
q_command:register_q_command_block( "bell_phi_minus_success", "bell_phi_minus",
        solution_statevector_bell_phi_minus, true)
q_command:register_q_command_block( "bell_phi_minus_success", "bell_phi_minus",
        solution_statevector_bell_phi_minus, false)


q_command.texts.bell_psi_plus =
[[The four simplest examples of quantum entanglement are the Bell states. One of these Bell states,
symbolized by Ψ+ (psi plus), may be realized by placing an X gate on the second wire, and adding
the Φ+ Bell state circuit (as instructed in another puzzle) to the right of the X gate,

Measuring one of the qubits results in the measured state of the other qubit to be determined. A
correct Ψ+ Bell state solution will have probabilities indicating that measurement results |01>
and |10> are equally likely, as well has having identical phases. The notation for a phase on these
block-world circuits is an arrow that points in a direction signifying its counterclockwise
rotation, from 0 radians pointing rightward. The Ψ+ Bell state is known as one of the singlet
states, where measuring one of the qubits determines that the other qubit will be measured as the
opposite state.
]]
q_command:register_help_button("bell_psi_plus", "Bell State: Ψ+", q_command.texts.bell_psi_plus)
local solution_statevector_bell_psi_plus =
{
	{
		r = 0,
		i = 0
	},
	{
		r = 0.707,
		i = 0
	},
	{
		r = 0.707,
		i = 0
	},
	{
		r = 0,
		i = 0
	}
}
q_command:register_q_command_block( "bell_psi_plus_success", "bell_psi_plus",
        solution_statevector_bell_psi_plus, true)
q_command:register_q_command_block( "bell_psi_plus_success", "bell_psi_plus",
        solution_statevector_bell_psi_plus, false)


q_command.texts.bell_psi_minus =
[[The four simplest examples of quantum entanglement are the Bell states. One of these Bell states,
symbolized by Ψ- (psi minus), may be realized by placing X gates on the top and second wires, and
adding the Φ+ Bell state circuit (as instructed in another puzzle) to the right of the X gates,

Measuring one of the qubits results in the measured state of the other qubit to be determined. A
correct Ψ- Bell state solution will have probabilities indicating that measurement results |01>
and |10> are equally likely, as well has having opposite phases. The notation for a phase on these
block-world circuits is an arrow that points in a direction signifying its counterclockwise
rotation, from 0 radians pointing rightward. As an example, a leftward pointing arrow signifies a
phase of π radians. The Ψ- Bell state is known as one of the singlet states, where measuring one
of the qubits determines that the other qubit will be measured as the opposite state.
]]
q_command:register_help_button("bell_psi_minus", "Bell State: Ψ-", q_command.texts.bell_psi_minus)
local solution_statevector_bell_psi_minus =
{
	{
		r = 0,
		i = 0
	},
	{
		r = -0.707,
		i = 0
	},
	{
		r = 0.707,
		i = 0
	},
	{
		r = 0,
		i = 0
	}
}
q_command:register_q_command_block( "bell_psi_minus_success", "bell_psi_minus",
        solution_statevector_bell_psi_minus, true)
q_command:register_q_command_block( "bell_psi_minus_success", "bell_psi_minus",
        solution_statevector_bell_psi_minus, false)


q_command.texts.ghz_state =
[[GHZ (Greenberger–Horne–Zeilinger) states are entangled states involving three or more qubits,
where the basis states involved contain all zeros or all ones. For example, the entangled state
in this three-wire circuit puzzle has equal probabilities of being measured as |000> and |111>.
Please refer to the Bell state circuit puzzles for more information on entanglement.

One way to realize this state is to place a Hadamard gate on the top wire, and an X gate on the
second wire in a column to the right of the Hadamard gate. Then select the control tool from
the hotbar (after having retrieved it from the chest). While positioning the cursor on the X gate
in the circuit, convert it to a CNOT gate by left-clicking, until the control qubit is on the same
wire as the Hadamard gate. Repeat this process to place another CNOT gate whose X gate is on the
third wire and control qubit is on the top wire.

Note that measuring the circuit (by right-clicking the measurement blocks) results in either |000>
or |111> each time.
]]
q_command:register_help_button("ghz_state", "GHZ states", q_command.texts.ghz_state)
local solution_statevector_ghz_state =
{
	{
		r = 0.707,
		i = 0
	},
	{
		r = 0,
		i = 0
	},
	{
		r = 0,
		i = 0
	},
	{
		r = 0,
		i = 0
	},
	{
		r = 0,
		i = 0
	},
	{
		r = 0,
		i = 0
	},
	{
		r = 0,
		i = 0
	},
	{
		r = 0.707,
		i = 0
	}
}
q_command:register_q_command_block( "ghz_state_success", "ghz_state",
        solution_statevector_ghz_state, true)
q_command:register_q_command_block( "ghz_state_success", "ghz_state",
        solution_statevector_ghz_state, false)


for num_qubits = 1, BASIS_STATE_BLOCK_MAX_QUBITS do
    for basis_state_num = 0, 2^num_qubits - 1 do
        q_command:register_basis_state_block(num_qubits, basis_state_num)
    end
end

local ROTATION_RESOLUTION = 32
for idx = 0, ROTATION_RESOLUTION do
    q_command:register_statevector_liquid_block(idx)
end



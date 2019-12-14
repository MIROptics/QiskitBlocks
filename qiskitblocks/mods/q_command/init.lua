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

LOG_DEBUG = false

local qiskit_service_host = minetest.settings:get("qiskit_service_host") or
        "https://qiskit-blocks-service.herokuapp.com"

local qiskit_service_timeout = tonumber(minetest.settings:get("qiskit_service_timeout")) or 10

dofile(minetest.get_modpath("q_command").."/dkjson.lua");
dofile(minetest.get_modpath("q_command").."/url_code.lua");
dofile(minetest.get_modpath("q_command").."/complex_module.lua");
dofile(minetest.get_modpath("q_command").."/wire_extension.lua");


request_http_api = minetest.request_http_api()
if LOG_DEBUG then
    minetest.debug("request_http_api: " .. dump(request_http_api))
end

complex = create_complex()

BASIS_STATE_BLOCK_MAX_QUBITS = 4
USE_COLOR_QUBITS = true
MAX_COLOR_QUBITS = 4
CIRCUIT_MAX_WIRES = 8
CIRCUIT_MAX_COLUMNS = 64

-- Background music IDs
MUSIC_CHILL = 1
MUSIC_ACTIVE = 2
MUSIC_EXCITED = 3
MUSIC_CONGRATS = 4

-- Regions (e.g. escape room levels and circuit garden)
ESC_ROOMS_LEVEL_1_REGION_ID = 1
ESC_ROOMS_LEVEL_2_REGION_ID = 2
ESC_ROOMS_LEVEL_3_REGION_ID = 3
ESC_ROOMS_LEVEL_4_REGION_ID = 4
ESC_ROOMS_LEVEL_5_REGION_ID = 5
ESC_ROOMS_LEVEL_6_REGION_ID = 6
ESC_ROOMS_LEVEL_7_REGION_ID = 7
ESC_ROOMS_LEVEL_8_REGION_ID = 8
ESC_ROOMS_LEVEL_9_REGION_ID = 9
ESC_ROOMS_LEVEL_10_REGION_ID = 10
ESC_ROOMS_LEVEL_11_REGION_ID = 11
ESC_ROOMS_LEVEL_12_REGION_ID = 12
ESC_ROOMS_LEVEL_13_REGION_ID = 13
ESC_ROOMS_LEVEL_14_REGION_ID = 14
ESC_ROOMS_LEVEL_15_REGION_ID = 15
ESC_ROOMS_LEVEL_16_REGION_ID = 16

CIRCUIT_GARDEN_REGION_ID = 17

NUM_AREAS_IN_EACH_ESC_ROOM = 16
NUM_AREAS_IN_CIRCUIT_GARDEN = 0 --TODO: Plug in correct number

HUB_PORTALS_RADIUS = 1
RETURN_LOOK_RAD = 3 * (math.pi / 2)

-- our API object
q_command = {}

q_command.tools_placed = false
q_command.game_running_time = 0

q_command.block_pos = {}
q_command.circuit_specs = {} -- dir_str, pos, num_wires, num_columns, is_on_grid
q_command.circuit_specs.pos = {} -- x, y, z

q_command.areas = {} -- Holds definitions for help signs and Prof Q chat
q_command.regions = {} -- Holds areas, and information about a given region

-- TODO: Put these in a loop from 1 to 16
q_command.regions.esc_rooms_level_1 = {}
q_command.regions.esc_rooms_level_1.id = ESC_ROOMS_LEVEL_1_REGION_ID
q_command.regions.esc_rooms_level_1.num_areas = NUM_AREAS_IN_EACH_ESC_ROOM
q_command.regions.esc_rooms_level_1.cur_area = 1  -- One-indexed
q_command.regions.esc_rooms_level_1.hub_portal = {}
q_command.regions.esc_rooms_level_1.hub_portal.center_pos = {x = 224, y = 0, z = 98}
q_command.regions.esc_rooms_level_1.hub_portal.return_pos = {x = 226, y = 0, z = 98}
q_command.regions.esc_rooms_level_1.hub_portal.return_look_rad = RETURN_LOOK_RAD

q_command.regions.esc_rooms_level_2 = {}
q_command.regions.esc_rooms_level_2.id = ESC_ROOMS_LEVEL_2_REGION_ID
q_command.regions.esc_rooms_level_2.num_areas = NUM_AREAS_IN_EACH_ESC_ROOM
q_command.regions.esc_rooms_level_2.cur_area = 1  -- One-indexed
q_command.regions.esc_rooms_level_2.hub_portal = {}
q_command.regions.esc_rooms_level_2.hub_portal.center_pos = {x = 224, y = 0, z = 100}
q_command.regions.esc_rooms_level_2.hub_portal.return_pos = {x = 226, y = 0, z = 100}
q_command.regions.esc_rooms_level_2.hub_portal.return_look_rad = RETURN_LOOK_RAD

q_command.regions.esc_rooms_level_3 = {}
q_command.regions.esc_rooms_level_3.id = ESC_ROOMS_LEVEL_3_REGION_ID
q_command.regions.esc_rooms_level_3.num_areas = NUM_AREAS_IN_EACH_ESC_ROOM
q_command.regions.esc_rooms_level_3.cur_area = 1  -- One-indexed
q_command.regions.esc_rooms_level_3.hub_portal = {}
q_command.regions.esc_rooms_level_3.hub_portal.center_pos = {x = 224, y = 0, z = 102}
q_command.regions.esc_rooms_level_3.hub_portal.return_pos = {x = 226, y = 0, z = 102}
q_command.regions.esc_rooms_level_3.hub_portal.return_look_rad = RETURN_LOOK_RAD

q_command.regions.esc_rooms_level_4 = {}
q_command.regions.esc_rooms_level_4.id = ESC_ROOMS_LEVEL_4_REGION_ID
q_command.regions.esc_rooms_level_4.num_areas = NUM_AREAS_IN_EACH_ESC_ROOM
q_command.regions.esc_rooms_level_4.cur_area = 1  -- One-indexed
q_command.regions.esc_rooms_level_4.hub_portal = {}
q_command.regions.esc_rooms_level_4.hub_portal.center_pos = {x = 224, y = 0, z = 104}
q_command.regions.esc_rooms_level_4.hub_portal.return_pos = {x = 226, y = 0, z = 104}
q_command.regions.esc_rooms_level_4.hub_portal.return_look_rad = RETURN_LOOK_RAD

q_command.regions.esc_rooms_level_5 = {}
q_command.regions.esc_rooms_level_5.id = ESC_ROOMS_LEVEL_5_REGION_ID
q_command.regions.esc_rooms_level_5.num_areas = NUM_AREAS_IN_EACH_ESC_ROOM
q_command.regions.esc_rooms_level_5.cur_area = 1  -- One-indexed
q_command.regions.esc_rooms_level_5.hub_portal = {}
q_command.regions.esc_rooms_level_5.hub_portal.center_pos = {x = 224, y = 0, z = 106}
q_command.regions.esc_rooms_level_5.hub_portal.return_pos = {x = 226, y = 0, z = 106}
q_command.regions.esc_rooms_level_5.hub_portal.return_look_rad = RETURN_LOOK_RAD

q_command.regions.esc_rooms_level_6 = {}
q_command.regions.esc_rooms_level_6.id = ESC_ROOMS_LEVEL_6_REGION_ID
q_command.regions.esc_rooms_level_6.num_areas = NUM_AREAS_IN_EACH_ESC_ROOM
q_command.regions.esc_rooms_level_6.cur_area = 1  -- One-indexed
q_command.regions.esc_rooms_level_6.hub_portal = {}
q_command.regions.esc_rooms_level_6.hub_portal.center_pos = {x = 224, y = 0, z = 108}
q_command.regions.esc_rooms_level_6.hub_portal.return_pos = {x = 226, y = 0, z = 108}
q_command.regions.esc_rooms_level_6.hub_portal.return_look_rad = RETURN_LOOK_RAD

q_command.regions.esc_rooms_level_7 = {}
q_command.regions.esc_rooms_level_7.id = ESC_ROOMS_LEVEL_7_REGION_ID
q_command.regions.esc_rooms_level_7.num_areas = NUM_AREAS_IN_EACH_ESC_ROOM
q_command.regions.esc_rooms_level_7.cur_area = 1  -- One-indexed
q_command.regions.esc_rooms_level_7.hub_portal = {}
q_command.regions.esc_rooms_level_7.hub_portal.center_pos = {x = 224, y = 0, z = 110}
q_command.regions.esc_rooms_level_7.hub_portal.return_pos = {x = 226, y = 0, z = 110}
q_command.regions.esc_rooms_level_7.hub_portal.return_look_rad = RETURN_LOOK_RAD

q_command.regions.esc_rooms_level_8 = {}
q_command.regions.esc_rooms_level_8.id = ESC_ROOMS_LEVEL_8_REGION_ID
q_command.regions.esc_rooms_level_8.num_areas = NUM_AREAS_IN_EACH_ESC_ROOM
q_command.regions.esc_rooms_level_8.cur_area = 1  -- One-indexed
q_command.regions.esc_rooms_level_8.hub_portal = {}
q_command.regions.esc_rooms_level_8.hub_portal.center_pos = {x = 223, y = 0, z = 112}
q_command.regions.esc_rooms_level_8.hub_portal.return_pos = {x = 226, y = 0, z = 112}
q_command.regions.esc_rooms_level_8.hub_portal.return_look_rad = RETURN_LOOK_RAD

q_command.regions.esc_rooms_level_9 = {}
q_command.regions.esc_rooms_level_9.id = ESC_ROOMS_LEVEL_9_REGION_ID
q_command.regions.esc_rooms_level_9.num_areas = NUM_AREAS_IN_EACH_ESC_ROOM
q_command.regions.esc_rooms_level_9.cur_area = 1  -- One-indexed
q_command.regions.esc_rooms_level_9.hub_portal = {}
q_command.regions.esc_rooms_level_9.hub_portal.center_pos = {x = 223, y = 0, z = 114}
q_command.regions.esc_rooms_level_9.hub_portal.return_pos = {x = 226, y = 0, z = 114}
q_command.regions.esc_rooms_level_9.hub_portal.return_look_rad = RETURN_LOOK_RAD

q_command.regions.esc_rooms_level_10 = {}
q_command.regions.esc_rooms_level_10.id = ESC_ROOMS_LEVEL_10_REGION_ID
q_command.regions.esc_rooms_level_10.num_areas = NUM_AREAS_IN_EACH_ESC_ROOM
q_command.regions.esc_rooms_level_10.cur_area = 1  -- One-indexed
q_command.regions.esc_rooms_level_10.hub_portal = {}
q_command.regions.esc_rooms_level_10.hub_portal.center_pos = {x = 223, y = 0, z = 116}
q_command.regions.esc_rooms_level_10.hub_portal.return_pos = {x = 226, y = 0, z = 116}
q_command.regions.esc_rooms_level_10.hub_portal.return_look_rad = RETURN_LOOK_RAD

q_command.regions.esc_rooms_level_11 = {}
q_command.regions.esc_rooms_level_11.id = ESC_ROOMS_LEVEL_11_REGION_ID
q_command.regions.esc_rooms_level_11.num_areas = NUM_AREAS_IN_EACH_ESC_ROOM
q_command.regions.esc_rooms_level_11.cur_area = 1  -- One-indexed
q_command.regions.esc_rooms_level_11.hub_portal = {}
q_command.regions.esc_rooms_level_11.hub_portal.center_pos = {x = 223, y = 0, z = 118}
q_command.regions.esc_rooms_level_11.hub_portal.return_pos = {x = 226, y = 0, z = 118}
q_command.regions.esc_rooms_level_11.hub_portal.return_look_rad = RETURN_LOOK_RAD

q_command.regions.esc_rooms_level_12 = {}
q_command.regions.esc_rooms_level_12.id = ESC_ROOMS_LEVEL_12_REGION_ID
q_command.regions.esc_rooms_level_12.num_areas = NUM_AREAS_IN_EACH_ESC_ROOM
q_command.regions.esc_rooms_level_12.cur_area = 1  -- One-indexed
q_command.regions.esc_rooms_level_12.hub_portal = {}
q_command.regions.esc_rooms_level_12.hub_portal.center_pos = {x = 223, y = 0, z = 120}
q_command.regions.esc_rooms_level_12.hub_portal.return_pos = {x = 226, y = 0, z = 120}
q_command.regions.esc_rooms_level_12.hub_portal.return_look_rad = RETURN_LOOK_RAD

q_command.regions.esc_rooms_level_13 = {}
q_command.regions.esc_rooms_level_13.id = ESC_ROOMS_LEVEL_13_REGION_ID
q_command.regions.esc_rooms_level_13.num_areas = NUM_AREAS_IN_EACH_ESC_ROOM
q_command.regions.esc_rooms_level_13.cur_area = 1  -- One-indexed
q_command.regions.esc_rooms_level_13.hub_portal = {}
q_command.regions.esc_rooms_level_13.hub_portal.center_pos = {x = 223, y = 0, z = 122}
q_command.regions.esc_rooms_level_13.hub_portal.return_pos = {x = 226, y = 0, z = 122}
q_command.regions.esc_rooms_level_13.hub_portal.return_look_rad = RETURN_LOOK_RAD

q_command.regions.esc_rooms_level_14 = {}
q_command.regions.esc_rooms_level_14.id = ESC_ROOMS_LEVEL_14_REGION_ID
q_command.regions.esc_rooms_level_14.num_areas = NUM_AREAS_IN_EACH_ESC_ROOM
q_command.regions.esc_rooms_level_14.cur_area = 1  -- One-indexed
q_command.regions.esc_rooms_level_14.hub_portal = {}
q_command.regions.esc_rooms_level_14.hub_portal.center_pos = {x = 223, y = 0, z = 124}
q_command.regions.esc_rooms_level_14.hub_portal.return_pos = {x = 226, y = 0, z = 124}
q_command.regions.esc_rooms_level_14.hub_portal.return_look_rad = RETURN_LOOK_RAD

q_command.regions.esc_rooms_level_15 = {}
q_command.regions.esc_rooms_level_15.id = ESC_ROOMS_LEVEL_15_REGION_ID
q_command.regions.esc_rooms_level_15.num_areas = NUM_AREAS_IN_EACH_ESC_ROOM
q_command.regions.esc_rooms_level_15.cur_area = 1  -- One-indexed
q_command.regions.esc_rooms_level_15.hub_portal = {}
q_command.regions.esc_rooms_level_15.hub_portal.center_pos = {x = 223, y = 0, z = 126}
q_command.regions.esc_rooms_level_15.hub_portal.return_pos = {x = 226, y = 0, z = 126}
q_command.regions.esc_rooms_level_15.hub_portal.return_look_rad = RETURN_LOOK_RAD

q_command.regions.esc_rooms_level_16 = {}
q_command.regions.esc_rooms_level_16.id = ESC_ROOMS_LEVEL_16_REGION_ID
q_command.regions.esc_rooms_level_16.num_areas = NUM_AREAS_IN_EACH_ESC_ROOM
q_command.regions.esc_rooms_level_16.cur_area = 1  -- One-indexed
q_command.regions.esc_rooms_level_16.hub_portal = {}
q_command.regions.esc_rooms_level_16.hub_portal.center_pos = {x = 223, y = 0, z = 128}
q_command.regions.esc_rooms_level_16.hub_portal.return_pos = {x = 226, y = 0, z = 128}
q_command.regions.esc_rooms_level_16.hub_portal.return_look_rad = RETURN_LOOK_RAD

--q_command.regions.circuit_garden = {}
--q_command.regions.circuit_garden.id = CIRCUIT_GARDEN_REGION_ID
--q_command.regions.circuit_garden.num_areas = NUM_AREAS_IN_CIRCUIT_GARDEN
--q_command.regions.circuit_garden.cur_area = 1  -- One-indexed


dofile(minetest.get_modpath("q_command").."/q_make_wall_blocks.lua");
dofile(minetest.get_modpath("q_command").."/q_esc_rooms_level_1.lua");
dofile(minetest.get_modpath("q_command").."/q_esc_rooms_level_2.lua");
dofile(minetest.get_modpath("q_command").."/q_esc_rooms_level_3.lua");
dofile(minetest.get_modpath("q_command").."/q_esc_rooms_level_4.lua");
dofile(minetest.get_modpath("q_command").."/q_esc_rooms_level_5.lua");
dofile(minetest.get_modpath("q_command").."/q_esc_rooms_level_6.lua");
dofile(minetest.get_modpath("q_command").."/q_esc_rooms_level_7.lua");
--dofile(minetest.get_modpath("q_command").."/q_esc_rooms_level_8.lua");
--dofile(minetest.get_modpath("q_command").."/q_esc_rooms_level_9.lua");
--dofile(minetest.get_modpath("q_command").."/q_esc_rooms_level_10.lua");
--dofile(minetest.get_modpath("q_command").."/q_esc_rooms_level_11.lua");
--dofile(minetest.get_modpath("q_command").."/q_esc_rooms_level_12.lua");
--dofile(minetest.get_modpath("q_command").."/q_esc_rooms_level_13.lua");
--dofile(minetest.get_modpath("q_command").."/q_esc_rooms_level_14.lua");
--dofile(minetest.get_modpath("q_command").."/q_esc_rooms_level_15.lua");
--dofile(minetest.get_modpath("q_command").."/q_esc_rooms_level_16.lua");
dofile(minetest.get_modpath("q_command").."/q_circuit_garden_puzzles.lua");
dofile(minetest.get_modpath("q_command").."/q_qasm_chasm_puzzles.lua");
dofile(minetest.get_modpath("q_command").."/q_basic_algos_lodge.lua");
dofile(minetest.get_modpath("q_command").."/q_cat_sandbox.lua");
dofile(minetest.get_modpath("q_command").."/q_starting_room_help.lua");
dofile(minetest.get_modpath("q_command").."/q_portal_room.lua");


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

        -- Variable that indicates whether to run state tomography, and if so,
        -- on which measurement basis currently
        -- 1: X, 2: Y, 3: Z, 0: Don't run state tomography
        local state_tomography_basis = meta:get_int("state_tomography_basis")

        -- JSON data returned from tomography measurements in x, y and z bases
        local qasm_data_json_for_1k_x_basis_meas = meta:get_string("qasm_data_json_for_1k_x_basis_meas")
        local qasm_data_json_for_1k_y_basis_meas = meta:get_string("qasm_data_json_for_1k_y_basis_meas")
        local qasm_data_json_for_1k_z_basis_meas = meta:get_string("qasm_data_json_for_1k_z_basis_meas")

        -- Indicator that Bloch sphere block is present in circuit
        local bloch_present_flag = meta:get_int("bloch_present_flag")

        -- Indicator that measurement sphere block is present in circuit
        local measure_present_flag = meta:get_int("measure_present_flag")

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
				qasm_simulator_flag = meta:get_int("qasm_simulator_flag")
                return qasm_simulator_flag
			end,

            -- Set qasm simulator flag, integer
            set_qasm_simulator_flag = function(zero_one)
                qasm_simulator_flag = zero_one
                meta:set_int("qasm_simulator_flag", zero_one)
			end,

            -- Get current state tomography basis, integer
            -- 1: X, 2: Y, 3: Z, 0: Don't run state tomography
            get_state_tomography_basis = function()
                state_tomography_basis = meta:get_int("state_tomography_basis")
				return state_tomography_basis
			end,

            -- Set current state tomography basis, integer
            -- 1: X, 2: Y, 3: Z, 0: Don't run state tomography
            set_state_tomography_basis = function(state_tomography_basis_num)
                state_tomography_basis = state_tomography_basis_num
                meta:set_int("state_tomography_basis", state_tomography_basis_num)
			end,


            -- Get JSON results of tomography x-basis measurements
            get_qasm_data_json_for_1k_x_basis_meas = function()
                qasm_data_json_for_1k_x_basis_meas = meta:get_string("qasm_data_json_for_1k_x_basis_meas")
                return qasm_data_json_for_1k_x_basis_meas
            end,

            -- Set JSON results of tomography x-basis measurements
            set_qasm_data_json_for_1k_x_basis_meas = function(qasm_data_json)
                qasm_data_json_for_1k_x_basis_meas = qasm_data_json
                meta:set_string("qasm_data_json_for_1k_x_basis_meas",
                        qasm_data_json)
            end,


            -- Get JSON results of tomography y-basis measurements
            get_qasm_data_json_for_1k_y_basis_meas = function()
                qasm_data_json_for_1k_y_basis_meas = meta:get_string("qasm_data_json_for_1k_y_basis_meas")
                return qasm_data_json_for_1k_y_basis_meas
            end,

            -- Set JSON results of tomography y-basis measurements
            set_qasm_data_json_for_1k_y_basis_meas = function(qasm_data_json)
                qasm_data_json_for_1k_y_basis_meas = qasm_data_json
                meta:set_string("qasm_data_json_for_1k_y_basis_meas",
                        qasm_data_json)
            end,


            -- Get JSON results of tomography z-basis measurements
            get_qasm_data_json_for_1k_z_basis_meas = function()
                qasm_data_json_for_1k_z_basis_meas = meta:get_string("qasm_data_json_for_1k_z_basis_meas")
                return qasm_data_json_for_1k_z_basis_meas
            end,

            -- Set JSON results of tomography z-basis measurements
            set_qasm_data_json_for_1k_z_basis_meas = function(qasm_data_json)
                qasm_data_json_for_1k_z_basis_meas = qasm_data_json
                meta:set_string("qasm_data_json_for_1k_z_basis_meas",
                        qasm_data_json)
            end,


            -- Get measure block present flag, integer
            get_measure_present_flag = function()
				measure_present_flag = meta:get_int("measure_present_flag")
                return measure_present_flag
			end,

            -- Set measure block present flag, integer
            set_measure_present_flag = function(zero_one)
                measure_present_flag = zero_one
                meta:set_int("measure_present_flag", zero_one)
			end,


            -- Get Bloch sphere block present flag, integer
            get_bloch_present_flag = function()
				bloch_present_flag = meta:get_int("bloch_present_flag")
                return bloch_present_flag
			end,

            -- Set Bloch sphere present flag, integer
            set_bloch_present_flag = function(zero_one)
                bloch_present_flag = zero_one
                meta:set_int("bloch_present_flag", zero_one)
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


            -- Determine if circuit is solved
            circuit_puzzle_solved = function()
                local ret_circuit_puzzle_solved = false
                if node_name and node_name:sub(-7) == "success" then
                    ret_circuit_puzzle_solved = true
                end
                return ret_circuit_puzzle_solved
            end,

            -- Compute ratio (numerator / 1) of |0> measurements in a given basis (X:1, Y:2, Z:3)
            compute_meas_ket_0_ratio = function(meas_basis, wire_num)
                local q_block = q_command:get_q_command_block(pos)
                local qasm_data = nil
                if meas_basis == 1 then
                    qasm_data = meta:get_string("qasm_data_json_for_1k_x_basis_meas")
                elseif meas_basis == 2 then
                    qasm_data = meta:get_string("qasm_data_json_for_1k_y_basis_meas")
                elseif meas_basis == 3 then
                    qasm_data = meta:get_string("qasm_data_json_for_1k_z_basis_meas")
                end

                if qasm_data and qasm_data ~= "" and q_block:circuit_grid_exists() then
                    -- TODO: Finish this logic
                    local circuit_block = circuit_blocks:get_circuit_block(q_block:get_circuit_pos())
                    local num_wires = circuit_block.get_circuit_num_wires()
                    local bit_str_idx = num_wires + 1 - wire_num

                    local basis_state_bit_str = nil
                    local num_zeros = 0
                    local num_ones_and_zeros = 0


                    local obj, pos, err = json.decode (qasm_data, 1, nil)
                    if err then
                        minetest.debug ("Error in compute_meas_ket_0_ratio:", err)
                        return nil
                    else
                        local basis_freq = obj.result
                        if LOG_DEBUG then
                            minetest.debug("basis_freq:\n" .. dump(basis_freq))
                        end

                        for key, val in pairs(basis_freq) do
                            basis_state_bit_str = key:gsub("%s+", "")
                            local meas_bit = string.sub(basis_state_bit_str, bit_str_idx, bit_str_idx)
                            if meas_bit == "0" then
                                num_zeros = num_zeros + val
                            end
                            num_ones_and_zeros = num_ones_and_zeros + val
                            --minetest.debug("key: " .. basis_state_bit_str .. ", val: " .. val)
                        end
                        --minetest.debug("num_zeros: " .. num_zeros .. ", num_ones_and_zeros: " .. num_ones_and_zeros)
                    end

                    return num_zeros / num_ones_and_zeros

                else
                    return nil
                end
            end,

            compute_yz_pi_8_rots_by_meas_ratios = function(x_basis_ratio, y_basis_ratio, z_basis_ratio)
                local y_pi8rot = nil
                local z_pi8rot = nil
                local entangled = false

                if x_basis_ratio and y_basis_ratio and z_basis_ratio then
                    -- Origin of sphere is 0, 0, 0
                    local x_coord = x_basis_ratio - 0.5
                    local y_coord = y_basis_ratio - 0.5
                    local z_coord = z_basis_ratio - 0.5

                    if LOG_DEBUG then
                        minetest.debug("x_coord: " .. tostring(x_coord) ..
                               ", y_coord: " .. tostring(y_coord) ..
                               ", z_coord: " .. tostring(z_coord))
                    end

                    local radius = math.sqrt(x_coord^2 + y_coord^2 + z_coord^2)

                    -- Protect against divide by zero error and do polar calculations
                    if radius ~= 0 and x_coord ~= 0 then
                        local polar_rads = math.acos(z_coord / radius)
                        local azimuth_rads = math.atan(y_coord / x_coord)

                        polar_rads = (polar_rads + (2 * math.pi)) % (2 * math.pi)
                        if x_coord < 0.0 then
                            azimuth_rads = azimuth_rads + math.pi
                        end
                        azimuth_rads = (azimuth_rads + (2 * math.pi)) % (2 * math.pi)

                        y_pi8rot = math.floor(polar_rads * 8 / math.pi + .5)
                        z_pi8rot = math.floor(azimuth_rads * 8 / math.pi + .5) % 16
                    end

                    -- TODO: Find more reliable determination of entanglement
                    if radius < 0.47 then
                        entangled = true
                    end
                end
                return y_pi8rot, z_pi8rot, entangled
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
                        "qasm_simulator_flag: " .. tostring(qasm_simulator_flag) .. "\n" ..
                        "state_tomography_basis: " .. tostring(state_tomography_basis) .. "\n" ..
                        "qasm_data_json_for_1k_x_basis_meas: " ..
                        tostring(qasm_data_json_for_1k_x_basis_meas) .. "\n" ..
                        "qasm_data_json_for_1k_y_basis_meas: " ..
                        tostring(qasm_data_json_for_1k_y_basis_meas) .. "\n" ..
                        "qasm_data_json_for_1k_z_basis_meas: " ..
                        tostring(qasm_data_json_for_1k_z_basis_meas) .. "\n"
                return ret_str
            end
		}
	else
		return nil
	end
end


function q_command:get_locale_lang()
	local lang = minetest.setting_get("language")
	minetest.debug("minetest.setting_get('language'):" .. minetest.setting_get('language'))
	if lang then
		if lang ~= "ja" and
            lang ~= "es" then
			lang = "en"

		end
	else
		lang = "en"
	end
	return lang
end

local locale_lang = q_command:get_locale_lang()
minetest.debug("q_command_locale_lang: " .. locale_lang)




function q_command:debug_node_info(pos, message)
    if not LOG_DEBUG then return end

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

                local qubit_block_name = "circuit_blocks:_qubit_0"
                if USE_COLOR_QUBITS and circuit_num_wires <= MAX_COLOR_QUBITS then
                    qubit_block_name = qubit_block_name .. "_color_" .. tostring(circuit_num_wires - wire + 1)
                end
                minetest.set_node(ket_pos,
                        {name=qubit_block_name, param2=param2_dir})
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


function q_command:create_qasm_for_node(circuit_node_pos, wire_num,
                                        include_measurement_blocks, c_if_table, tomo_meas_basis, exclude_reset_blocks)
    local qasm_str = ""
    local circuit_node_block = circuit_blocks:get_circuit_block(circuit_node_pos)
    local q_block = q_command:get_q_command_block(circuit_node_pos)

    if circuit_node_block then
        local node_type = circuit_node_block.get_node_type()

        if node_type == CircuitNodeTypes.EMPTY or
                node_type == CircuitNodeTypes.TRACE or
                node_type == CircuitNodeTypes.CTRL then
            -- Throw away a c_if if present
            c_if_table[wire_num] = ""
            -- Return immediately with zero length qasm_str
            return qasm_str
        else
            if c_if_table[wire_num] and c_if_table[wire_num] ~= "" then
                qasm_str = qasm_str .. c_if_table[wire_num] .. " "
                c_if_table[wire_num] = ""
            end
        end

        local ctrl_a = circuit_node_block.get_ctrl_a()
        local ctrl_b = circuit_node_block.get_ctrl_b()
        local swap = circuit_node_block.get_swap()

        local radians = circuit_node_block.get_radians()

        local wire_num_idx = tostring(wire_num - 1)
        local ctrl_a_idx = tostring(ctrl_a - 1)
        local ctrl_b_idx = tostring(ctrl_b - 1)
        local swap_idx = tostring(swap - 1)


        if node_type == CircuitNodeTypes.IDEN then
            -- Identity gate
            qasm_str = qasm_str .. 'id q[' .. wire_num_idx .. '];'

        elseif node_type == CircuitNodeTypes.X then
            local threshold = 0.0001
            if math.abs(radians - math.pi) <= threshold then
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
            local threshold = 0.0001
            if math.abs(radians - math.pi) <= threshold then
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
            local threshold = 0.0001
            if math.abs(radians - math.pi) <= threshold then
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
                --qasm_str = qasm_str .. 'measure q[' .. wire_num_idx .. '] -> c[' .. wire_num_idx .. '];'
                qasm_str = qasm_str .. 'measure q[' .. wire_num_idx .. '] -> c' .. wire_num_idx .. '[0];'
            end
        elseif node_type == CircuitNodeTypes.QUBIT_BASIS then
            if not exclude_reset_blocks then
                qasm_str = qasm_str .. 'reset q[' .. wire_num_idx .. '];'
                if circuit_node_block.get_node_name():sub(-2) == "_1" then
                    qasm_str = qasm_str .. 'x q[' .. wire_num_idx .. '];'
                end
            end
        elseif node_type == CircuitNodeTypes.CONNECTOR_M then
            -- Connector to wire extension, so traverse
            local wire_extension_block_pos = circuit_node_block.get_wire_extension_block_pos()

            if wire_extension_block_pos.x ~= 0 then
                local wire_extension_block = circuit_blocks:get_circuit_block(wire_extension_block_pos)
                local wire_extension_dir_str = wire_extension_block.get_circuit_dir_str()
                local wire_extension_circuit_pos = wire_extension_block.get_circuit_pos()

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

                        qasm_str = qasm_str ..
                                q_command:create_qasm_for_node(circ_node_pos,
                                        extension_wire_num, include_measurement_blocks,
                                        c_if_table, tomo_meas_basis, exclude_reset_blocks)
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

        elseif node_type == CircuitNodeTypes.C_IF then
            local node_name = circuit_node_block.get_node_name()
            local register_idx_str = node_name:sub(35, 35)
            local eq_val_str = node_name:sub(39, 39)
            c_if_table[wire_num] = "if(c" .. register_idx_str .. "==" ..
                    eq_val_str .. ")"

        elseif node_type == CircuitNodeTypes.BLOCH_SPHERE or
                node_type == CircuitNodeTypes.COLOR_QUBIT then
            if include_measurement_blocks then
                if tomo_meas_basis == 1 then
                    -- Measure in the X basis (by first rotating -pi/2 radians on Y axis)
                    qasm_str = qasm_str .. 'ry(' .. tostring(-math.pi / 2) .. ') '
                    qasm_str = qasm_str .. 'q[' .. wire_num_idx .. '];'
                elseif tomo_meas_basis == 2 then
                    -- Measure in the Y basis (by first rotating pi/2 radians on X axis)
                    qasm_str = qasm_str .. 'rx(' .. tostring(math.pi / 2) .. ') '
                    qasm_str = qasm_str .. 'q[' .. wire_num_idx .. '];'
                elseif tomo_meas_basis == 3 then
                    -- Measure in the Z basis (no rotation necessary)
                end
                qasm_str = qasm_str .. 'measure q[' .. wire_num_idx .. '] -> c' .. wire_num_idx .. '[0];'
            end
        end

    else
        print("Unknown gate!")
    end

    if LOG_DEBUG then
        minetest.debug("End of create_qasm_for_node(), qasm_str:\n" .. qasm_str)
    end
    return qasm_str
end

function q_command:compute_circuit(circuit_block, include_measurement_blocks, tomo_meas_basis, exclude_reset_blocks)
    local num_wires = circuit_block.get_circuit_num_wires()
    local num_columns = circuit_block.get_circuit_num_columns()
    local circuit_dir_str = circuit_block.get_circuit_dir_str()
    local circuit_pos_x = circuit_block.get_circuit_pos().x
    local circuit_pos_y = circuit_block.get_circuit_pos().y
    local circuit_pos_z = circuit_block.get_circuit_pos().z

    -- Holds conditional if statements for each wire
    local c_if_table = {}

    local qasm_str = 'OPENQASM 2.0;include "qelib1.inc";'

    qasm_str = qasm_str .. 'qreg q[' .. tostring(num_wires) .. '];'

    -- Create a classical register for each qubit
    for wire_num = 1, num_wires do
        qasm_str = qasm_str .. 'creg c' .. tostring(wire_num - 1) .. '[1];'
    end

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



            qasm_str = qasm_str .. q_command:create_qasm_for_node(circuit_node_pos, wire_num,
                    include_measurement_blocks, c_if_table, tomo_meas_basis, exclude_reset_blocks)
        end
    end

    if LOG_DEBUG then
        minetest.debug("qasm_str:\n" .. qasm_str)
    end

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

            if num_wires and num_wires >= 1 and num_wires <= CIRCUIT_MAX_WIRES and
                    num_columns and num_columns >= 1 and num_columns <= CIRCUIT_MAX_COLUMNS and
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
                    "Circuit not created! Max wires is " .. CIRCUIT_MAX_WIRES ..
                            ", max columns is " .. CIRCUIT_MAX_COLUMNS)
            end
            return
        end
    elseif(formname == "q_block_dialog") then
        -- TODO: Process fields to be added on that formspec
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

function q_command:parse_json_unitary(uni_data)
    local unitary = {}
    local obj, pos, err = json.decode (uni_data, 1, nil)
    if err then
        minetest.debug ("Error in parse_json_unitary:", err)
    else
        local temp_unitary_row = obj.__ndarray__
        for i = 1,#temp_unitary_row do
            unitary[i] = temp_unitary_row[i]
            local temp_unitary_col = temp_unitary_row[i]
            for j = 1,#temp_unitary_col do
                unitary[i][j] = complex.new(temp_unitary_col[j].__complex__[1],
                    temp_unitary_col[j].__complex__[2])

            end
        end
    end
    return unitary
end

function q_command:register_q_command_block(suffix_correct_solution,
                                            suffix_incorrect_solution,
                                            correct_solution_statevector,
                                            correct_solution_unitary,
                                            block_represents_correct_solution,
                                            door_pos,
                                            chest_pos,
                                            chest_inv)
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
            meta:set_string("infotext", "Q block (right-click for QASM code to run on IBM quantum hardware)")
            q_command.block_pos = pos
            --minetest.debug("mpd.playing:" .. tostring(mpd.playing))
        end,
        on_rightclick = function(pos, node, clicker, itemstack)
            local q_block = q_command:get_q_command_block(pos)
            local player_name = clicker:get_player_name()
            local formspec = nil
            if not q_block:circuit_grid_exists() then
                local meta = minetest.get_meta(pos)
                formspec = "size[5.0, 4.6]"..
                        "field[1.0,0.5;1.8,1.5;num_wires_str;Wires (max " .. CIRCUIT_MAX_WIRES .. ");2]" ..
                        "field[3.0,0.5;1.8,1.5;num_columns_str;Cols (max " .. CIRCUIT_MAX_COLUMNS .. ");4]" ..
                        --"field[1.0,2.0;1.5,1.5;start_z_offset_str;Forward offset:;0]" ..
                        --"field[3.0,2.0;1.5,1.5;start_x_offset_str;Left offset:;-1]" ..
                        "button_exit[1.8,3.5;1.5,1.0;create;Create]"
                minetest.show_formspec(player_name, "create_circuit_grid", formspec)
            else
                if mpd.playing then
                    minetest.chat_send_player(clicker:get_player_name(),
                            "Pausing music")
                    mpd.stop_song()
                else
                    minetest.chat_send_player(clicker:get_player_name(),
                            "Starting music")
                    mpd.play_song(MUSIC_CHILL)
                end

                local circuit_block = circuit_blocks:get_circuit_block(q_block.get_circuit_pos())
                local qasm_with_measurement_str = q_command:compute_circuit(circuit_block,
                        true, 0, false)

		        formspec = "size[12,7]"..
                    "textarea[0.3,0.3;12,7;qasm_str;To run on a real quantum computer copy/paste into Circuit Composer at quantum-computing.ibm.com;"..
                        minetest.formspec_escape(q_command:convert_semicolons(S(qasm_with_measurement_str)))..
                        "]" ..
                    "button_exit[4.9,6.5;2,1;close;Close]"
                minetest.show_formspec(player_name, "q_block_dialog", formspec)
            end
        end,
        on_punch = function(pos, node, player)
            local q_block = q_command:get_q_command_block(pos)
            if q_block:circuit_grid_exists() then

                local circuit_block = circuit_blocks:get_circuit_block(q_block.get_circuit_pos())
                local num_wires = circuit_block.get_circuit_num_wires()
                local num_columns = circuit_block.get_circuit_num_columns()
                local circuit_dir_str = circuit_block.get_circuit_dir_str()
                local circuit_pos_x = circuit_block.get_circuit_pos().x
                local circuit_pos_y = circuit_block.get_circuit_pos().y
                local circuit_pos_z = circuit_block.get_circuit_pos().z

                if player:get_player_control().sneak or
                            player:get_player_control().aux1 then
                    -- TODO: Remove shift key and only support aux key, because Android really only supports aux
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

                    local qasm_str = q_command:compute_circuit(circuit_block, false,
                            0, false)
                    local qasm_for_unitary_str = q_command:compute_circuit(circuit_block,
                            false, 0, true)
                    local qasm_with_measurement_str = q_command:compute_circuit(circuit_block,
                            true, 0, false)
                    local qasm_with_tomo_x_str = q_command:compute_circuit(circuit_block, true,
                            1, false)
                    local qasm_with_tomo_y_str = q_command:compute_circuit(circuit_block, true,
                            2, false)
                    local qasm_with_tomo_z_str = q_command:compute_circuit(circuit_block, true,
                            3, false)

                    local http_request_statevector = {
                        url = qiskit_service_host .. "/api/run/statevector?backend=statevector_simulator&qasm=" ..
                                url_code.urlencode(qasm_str),
                        timeout = qiskit_service_timeout
                    }

                    local http_request_unitary = {
                        url = qiskit_service_host .. "/api/run/unitary?backend=unitary_simulator&qasm=" ..
                                url_code.urlencode(qasm_for_unitary_str),
                        timeout = qiskit_service_timeout
                    }

                    local http_request_qasm = {
                        url = qiskit_service_host .. "/api/run/qasm?backend=qasm_simulator&qasm=" ..
                                url_code.urlencode(qasm_with_measurement_str) .. "&num_shots=1",
                        timeout = qiskit_service_timeout
                    }

                    local http_request_qasm_tomo_x = {
                        url = qiskit_service_host .. "/api/run/qasm?backend=qasm_simulator&qasm=" ..
                                url_code.urlencode(qasm_with_tomo_x_str) .. "&num_shots=1000",
                        timeout = qiskit_service_timeout
                    }

                    local http_request_qasm_tomo_y = {
                        url = qiskit_service_host .. "/api/run/qasm?backend=qasm_simulator&qasm=" ..
                                url_code.urlencode(qasm_with_tomo_y_str) .. "&num_shots=1000",
                        timeout = qiskit_service_timeout
                    }

                    local http_request_qasm_tomo_z = {
                        url = qiskit_service_host .. "/api/run/qasm?backend=qasm_simulator&qasm=" ..
                                url_code.urlencode(qasm_with_tomo_z_str) .. "&num_shots=1000",
                        timeout = qiskit_service_timeout
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


                    local function update_measure_block(circuit_node_pos, num_wires, wire_num, basis_state_bit_str, reset)
                        local circuit_node_block = circuit_blocks:get_circuit_block(circuit_node_pos)

                        if circuit_node_block then
                            local node_type = circuit_node_block.get_node_type()
                            if node_type == CircuitNodeTypes.MEASURE_Z then
                                q_block.set_measure_present_flag(1)
                                local new_node_name = nil
                                if reset then
                                    new_node_name = "circuit_blocks:circuit_blocks_measure_z"

                                    -- Use cat measure textures if measure block is cat-related
                                    if circuit_node_block.get_node_name():sub(1, 47) ==
                                            "circuit_blocks:circuit_blocks_measure_alice_cat" then
                                        new_node_name = "circuit_blocks:circuit_blocks_measure_alice_cat"
                                    elseif circuit_node_block.get_node_name():sub(1, 45) ==
                                            "circuit_blocks:circuit_blocks_measure_bob_cat" then
                                        new_node_name = "circuit_blocks:circuit_blocks_measure_bob_cat"
                                    end
                                else
                                    local bit_str_idx = num_wires + 1 - wire_num
                                    local meas_bit = string.sub(basis_state_bit_str, bit_str_idx, bit_str_idx)
                                    new_node_name = "circuit_blocks:circuit_blocks_measure_" .. meas_bit

                                    -- Use cat measure textures if measure block is cat-related
                                    if circuit_node_block.get_node_name():sub(1, 47) ==
                                            "circuit_blocks:circuit_blocks_measure_alice_cat" then
                                        new_node_name = "circuit_blocks:circuit_blocks_measure_alice_cat_" .. meas_bit
                                    elseif circuit_node_block.get_node_name():sub(1, 45) ==
                                            "circuit_blocks:circuit_blocks_measure_bob_cat" then
                                        new_node_name = "circuit_blocks:circuit_blocks_measure_bob_cat_" .. meas_bit
                                    end
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


                                if LOG_DEBUG then
                                    q_command:debug_node_info(wire_extension_block_pos,
                                            "Processing CONNECTOR_M, wire_extension_block")
                                end

                                if wire_extension_block_pos.x ~= 0 then
                                    local wire_extension_block = circuit_blocks:get_circuit_block(wire_extension_block_pos)
                                    local wire_extension_dir_str = wire_extension_block.get_circuit_dir_str()
                                    local wire_extension_circuit_pos = wire_extension_block.get_circuit_pos()

                                    if LOG_DEBUG then
                                        q_command:debug_node_info(wire_extension_circuit_pos,
                                                "Processing CONNECTOR_M, wire_extension_circuit")
                                    end

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

                                            if LOG_DEBUG then
                                                q_command:debug_node_info(circ_node_pos,
                                                        "Processing CONNECTOR_M, circ_node_pos")
                                            end

                                            update_measure_block(circ_node_pos, num_wires, wire_num, basis_state_bit_str, reset)
                                        end
                                    end
                                end
                            end
                        end
                    end


                    local function update_bloch_sphere_block(circuit_node_pos, num_wires, wire_num, reset)
                        local circuit_node_block = circuit_blocks:get_circuit_block(circuit_node_pos)

                        if circuit_node_block then
                            local node_type = circuit_node_block.get_node_type()
                            local new_node_name_prefix = "circuit_blocks:circuit_blocks_qubit_"
                            --local new_node_name = "circuit_blocks:circuit_blocks_qubit_bloch_blank"

                            if node_type == CircuitNodeTypes.BLOCH_SPHERE or
                                    node_type == CircuitNodeTypes.COLOR_QUBIT then

                                local new_node_name = "circuit_blocks:circuit_blocks_qubit_bloch_blank"
                                local qubit_rep_type_str = "bloch"
                                if node_type == CircuitNodeTypes.COLOR_QUBIT then
                                    qubit_rep_type_str = "hsv"
                                end

                                q_block.set_bloch_present_flag(1)
                                local circuit_dir_str = circuit_node_block.get_circuit_dir_str()
                                local param2_dir = 0
                                if circuit_dir_str == "+X" then
                                    param2_dir = 1
                                elseif circuit_dir_str == "-X" then
                                    param2_dir = 3
                                elseif circuit_dir_str == "-Z" then
                                    param2_dir = 2
                                end

                                if reset then
                                    new_node_name = "circuit_blocks:circuit_blocks_qubit_" ..
                                            qubit_rep_type_str .. "_blank"
                                    minetest.swap_node(circuit_node_pos, {name = new_node_name, param2 = param2_dir})
                                else
                                    local y_pi8rot = 0
                                    local z_pi8rot = 0
                                    local entangled = false

                                    local x_json = q_block.get_qasm_data_json_for_1k_x_basis_meas(1)
                                    local y_json = q_block.get_qasm_data_json_for_1k_x_basis_meas(2)
                                    local z_json = q_block.get_qasm_data_json_for_1k_x_basis_meas(3)

                                    if x_json and x_json ~= "" and
                                            y_json and y_json ~= "" and
                                            z_json and z_json ~= "" then
                                        y_pi8rot, z_pi8rot, entangled = q_block.compute_yz_pi_8_rots_by_meas_ratios(
                                                q_block.compute_meas_ket_0_ratio(1, wire_num),
                                                q_block.compute_meas_ket_0_ratio(2, wire_num),
                                                q_block.compute_meas_ket_0_ratio(3, wire_num))

                                        if entangled and y_pi8rot and z_pi8rot then
                                            new_node_name = "circuit_blocks:circuit_blocks_qubit_" ..
                                                    qubit_rep_type_str .. "_entangled"
                                            minetest.swap_node(circuit_node_pos, {name = new_node_name, param2 = param2_dir})
                                        elseif y_pi8rot and z_pi8rot then
                                            new_node_name = "circuit_blocks:circuit_blocks_qubit_" ..
                                                    qubit_rep_type_str .. "_y" ..
                                                    y_pi8rot .. "p8_z" .. z_pi8rot .. "p8"
                                            minetest.swap_node(circuit_node_pos, {name = new_node_name, param2 = param2_dir})
                                        else
                                            -- Not all tomo measurements are available
                                            --minetest.debug("y_pi8rot: " .. tostring(y_pi8rot) ..
                                            --        ", z_pi8rot: " .. tostring(z_pi8rot) ..
                                            --        ", entangled: " .. tostring(entangled))
                                        end


                                    else
                                        --minetest.debug("x_json:[" .. x_json .. "]" ..
                                        --        ", y_json:[" .. y_json .. "]" ..
                                        --        ", z_json:[" .. z_json .. "]")
                                    end
                                end



                            elseif node_type == CircuitNodeTypes.CONNECTOR_M then
                                -- Connector to wire extension, so traverse
                                local wire_extension_block_pos = circuit_node_block.get_wire_extension_block_pos()

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

                                            update_bloch_sphere_block(circ_node_pos, num_wires, wire_num, reset)
                                        end
                                    end
                                end
                            end
                        end
                    end


                    local function react_solution_attempt(player_correct)
                        local door = nil
                        if door_pos and doors then
                            door = doors.get(door_pos)
                        end

                        if player_correct then
                            if mpd.playing then
                                mpd.play_song(MUSIC_CONGRATS)
                            end
                            mpd.queue_next_song(MUSIC_ACTIVE)

                            if door and door.open then
                                door:open(nil)
                            end

                            -- If there is a chest, restock it
                            if chest_pos and chest_inv then
                                local chest_meta = minetest.get_meta(chest_pos)
                                chest_meta:from_table(chest_inv)
                            end

                        else
                            if mpd.playing then
                                if mpd.playing == MUSIC_CHILL then
                                    mpd.play_song(MUSIC_ACTIVE)
                                elseif mpd.playing == MUSIC_ACTIVE then
                                    mpd.queue_next_song(MUSIC_ACTIVE)
                                elseif mpd.playing == MUSIC_EXCITED then
                                    mpd.queue_next_song(MUSIC_ACTIVE)
                                elseif mpd.playing == MUSIC_CONGRATS then
                                    mpd.queue_next_song(MUSIC_ACTIVE)
                                end
                            end

                            if door and door.close then
                                door:close(nil)
                            end
                        end

                        if LOG_DEBUG then
                            minetest.debug("player_correct: " .. tostring(player_correct))
                        end
                        if (player_correct and not block_represents_correct_solution) or
                                (not player_correct and block_represents_correct_solution) then
                            minetest.swap_node(q_block.get_node_pos(), {name = other_q_block_node_name})
                        end
                    end


                    local function process_backend_statevector_result(http_request_response)
                        if LOG_DEBUG then
                            minetest.debug("http_request_response (statevector):\n" .. dump(http_request_response))
                        end
                        if http_request_response.succeeded and
                                http_request_response.completed and
                                not http_request_response.timeout then

                            local sv_data = http_request_response.data
                            local statevector = q_command:parse_json_statevector(sv_data)
                            minetest.debug("statevector:\n" .. dump(statevector))

                            -- Only check for a correct player solution if correct_solution_statevector exists
                            if correct_solution_statevector then
                                --minetest.debug("correct_solution_statevector:\n" .. dump(correct_solution_statevector))
                                local is_correct_solution_statevector = true
                                if statevector and correct_solution_statevector and
                                        #statevector == #correct_solution_statevector then
                                    for sv_idx = 1, #statevector do
                                        if not complex.nearly_equals(statevector[sv_idx],
                                                correct_solution_statevector[sv_idx]) then
                                            is_correct_solution_statevector = false
                                            break
                                        end
                                    end
                                else
                                    is_correct_solution_statevector = false
                                end
                                react_solution_attempt(is_correct_solution_statevector)
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
                                    if LOG_DEBUG then
                                        minetest.debug("phase_rad: " .. tostring(phase_rad) .. ", p16_radians: " .. tostring(p16_radians))
                                    end
                                    if p16_radians < 1 then
                                        p16_radians = 1
                                    elseif p16_radians > 32 then
                                        p16_radians = 32
                                    end
                                end

                                local probability = (complex.abs(statevector[col_num]))^2
                                local scaled_prob = math.floor(probability * BLOCK_WATER_LEVELS)

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
                                    if USE_COLOR_QUBITS and num_wires <= MAX_COLOR_QUBITS then
                                        node_name = node_name .. "_colors"
                                    end

                                    --minetest.debug("node_name:" .. node_name)

                                    minetest.set_node(basis_state_node_pos,
                                            {name=node_name, param2=param2_dir})
                                    minetest.set_node(under_hist_node_pos,
                                            {name="default:desert_stone_block", param2=param2_dir})

                                    -- Place ellipsis block if there are more
                                    -- basis states than displayed
                                    if num_columns < #statevector and col_num == num_columns then
                                        minetest.set_node(basis_state_node_pos,
                                                {name="q_command:q_command_state_ellipsis", param2=param2_dir})
                                    end
                                end

                            end

                            -- Reset measure blocks and Bloch sphere blocks in the circuit
                            local num_wires = circuit_block.get_circuit_num_wires()
                            local num_columns = circuit_block.get_circuit_num_columns()
                            local circuit_dir_str = circuit_block.get_circuit_dir_str()
                            local circuit_pos_x = circuit_block.get_circuit_pos().x
                            local circuit_pos_y = circuit_block.get_circuit_pos().y
                            local circuit_pos_z = circuit_block.get_circuit_pos().z

                            q_block.set_measure_present_flag(0)
                            q_block.set_bloch_present_flag(0)

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

                                    update_measure_block(circuit_node_pos, num_wires, wire_num, nil, true)
                                    update_bloch_sphere_block(circuit_node_pos, num_wires, wire_num, true)
                                end

                            end

                            -- If Bloch sphere blocks are present, measure the circuit and do state tomography
                            if q_block.get_bloch_present_flag() == 1 then
                                -- Nil the tomo measurement data
                                q_block.set_qasm_data_json_for_1k_x_basis_meas(nil)
                                q_block.set_qasm_data_json_for_1k_y_basis_meas(nil)
                                q_block.set_qasm_data_json_for_1k_z_basis_meas(nil)

                                -- Indicate that the qasm_simulator should be run, with state tomography,
                                -- beginning with the X measurement basis (1 is X)
                                -- TODO: Make constants for these?

                                q_block.set_qasm_simulator_flag(1)
                                q_block.set_state_tomography_basis(1)
                                minetest.punch_node(q_block.get_node_pos())

                                q_block.set_qasm_simulator_flag(1)
                                q_block.set_state_tomography_basis(2)
                                minetest.punch_node(q_block.get_node_pos())

                                q_block.set_qasm_simulator_flag(1)
                                q_block.set_state_tomography_basis(3)
                                minetest.punch_node(q_block.get_node_pos())

                                -- Also indicate that the qasm_simulator should be run, without state tomography?
                                --circuit_blocks:set_node_with_circuit_specs_meta(pos,
                                --        orig_node_name, player)
                                q_block.set_qasm_simulator_flag(1)
                                q_block.set_state_tomography_basis(0)
                                minetest.punch_node(q_block.get_node_pos())
                            end


                        else
                            minetest.debug("Call to statevector_simulator Didn't succeed")
                        end
                    end


                    local function process_backend_unitary_result(http_request_response)
                        if LOG_DEBUG then
                            minetest.debug("http_request_response (unitary):\n" .. dump(http_request_response))
                        end
                        if http_request_response.succeeded and
                                http_request_response.completed and
                                not http_request_response.timeout then

                            local uni_data = http_request_response.data
                            local unitary = q_command:parse_json_unitary(uni_data)
                            --minetest.debug("unitary:\n" .. dump(unitary))

                            -- Only check for a correct player solution if correct_solution_unitary exists
                            if correct_solution_unitary then
                                --minetest.debug("correct_solution_unitary:\n" .. dump(correct_solution_unitary))
                                local is_correct_solution_unitary = true
                                if unitary and correct_solution_unitary and
                                        #unitary == #correct_solution_unitary then
                                    for uni_row_idx = 1, #unitary do
                                        for uni_col_idx = 1, #unitary do
                                            if not complex.nearly_equals(unitary[uni_row_idx][uni_col_idx],
                                                    correct_solution_unitary[uni_row_idx][uni_col_idx]) then
                                                is_correct_solution_unitary = false
                                                break
                                            end
                                        end
                                    end
                                else
                                    is_correct_solution_unitary = false
                                end
                                minetest.debug("is_correct_solution_unitary: " .. tostring(is_correct_solution_unitary))
                                react_solution_attempt(is_correct_solution_unitary)
                            end
                        else
                            minetest.debug("Call to unitary_simulator Didn't succeed")
                        end

                    end


                    local function common_process_backend_qasm_result(http_request_response, state_tomo_basis)
                        if LOG_DEBUG then
                            minetest.debug("http_request_response (qasm):\n" .. dump(http_request_response))
                        end
                        if http_request_response.succeeded and
                                http_request_response.completed and
                                not http_request_response.timeout then

                            local qasm_data = http_request_response.data

                            if LOG_DEBUG then
                                minetest.debug ("qasm_data:", qasm_data)
                            end

                            local basis_state_bit_str = nil

                            local obj, pos, err = json.decode (qasm_data, 1, nil)
                            if err then
                                minetest.debug ("Error:", err)
                            else
                                local basis_freq = obj.result
                                if LOG_DEBUG then
                                    minetest.debug("basis_freq:\n" .. dump(basis_freq))
                                end

                                if state_tomo_basis == 1 then
                                    q_block.set_qasm_data_json_for_1k_x_basis_meas(qasm_data)
                                elseif state_tomo_basis == 2 then
                                    q_block.set_qasm_data_json_for_1k_y_basis_meas(qasm_data)
                                elseif state_tomo_basis == 3 then
                                    q_block.set_qasm_data_json_for_1k_z_basis_meas(qasm_data)
                                end

                                for key, val in pairs(basis_freq) do
                                    basis_state_bit_str = key:gsub("%s+", "")
                                end
                            end

                            if LOG_DEBUG then
                            minetest.debug("state_tomo_basis: " .. state_tomo_basis ..
                                    ", basis_state_bit_str: " .. basis_state_bit_str)
                            end

                            if basis_state_bit_str then

                                if mpd.playing then
                                    if mpd.playing == MUSIC_CHILL then
                                        mpd.play_song(MUSIC_EXCITED)
                                        mpd.queue_next_song(MUSIC_ACTIVE)
                                    elseif mpd.playing == MUSIC_ACTIVE then
                                        mpd.play_song(MUSIC_EXCITED)
                                        mpd.queue_next_song(MUSIC_ACTIVE)
                                    elseif mpd.playing == MUSIC_EXCITED then
                                        mpd.queue_next_song(MUSIC_EXCITED)
                                    elseif mpd.playing == MUSIC_CONGRATS then
                                        mpd.queue_next_song(MUSIC_ACTIVE)
                                    end
                                end

                                -- Update measure blocks in the circuit
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


                                        --if state_tomo_basis == 0 then
                                        --    update_measure_block(circuit_node_pos, num_wires, wire_num, basis_state_bit_str)
                                        --else
                                        --    update_bloch_sphere_block(circuit_node_pos, num_wires, wire_num)
                                        --end

                                        if state_tomo_basis == 0 then
                                            update_measure_block(circuit_node_pos, num_wires, wire_num, basis_state_bit_str)
                                        end
                                        update_bloch_sphere_block(circuit_node_pos, num_wires, wire_num)
                                    end

                                end
                            end

                        else
                            minetest.debug("Call to qasm_simulator Didn't succeed")
                        end
                    end

                    local function process_backend_qasm_result_no_tomo(http_request_response)
                        common_process_backend_qasm_result(http_request_response, 0)
                    end

                    local function process_backend_qasm_result_tomo_x_meas_basis(http_request_response)
                        common_process_backend_qasm_result(http_request_response, 1)
                    end

                    local function process_backend_qasm_result_tomo_y_meas_basis(http_request_response)
                        common_process_backend_qasm_result(http_request_response, 2)
                    end

                    local function process_backend_qasm_result_tomo_z_meas_basis(http_request_response)
                        common_process_backend_qasm_result(http_request_response, 3)
                    end

                    if q_block.get_qasm_simulator_flag() ~= 0 then

                        if q_block.get_state_tomography_basis() == 0 then
                            -- Run qasm_simulator without state tomography
                            request_http_api.fetch(http_request_qasm, process_backend_qasm_result_no_tomo)
                        elseif q_block.get_state_tomography_basis() == 1 then
                            -- Measure in X basis for state tomography
                            request_http_api.fetch(http_request_qasm_tomo_x, process_backend_qasm_result_tomo_x_meas_basis)
                        elseif q_block.get_state_tomography_basis() == 2 then
                            -- Measure in Y basis for state tomography
                            request_http_api.fetch(http_request_qasm_tomo_y, process_backend_qasm_result_tomo_y_meas_basis)
                        elseif q_block.get_state_tomography_basis() == 3 then
                            -- Measure in Z basis for state tomography
                            request_http_api.fetch(http_request_qasm_tomo_z, process_backend_qasm_result_tomo_z_meas_basis)
                        end

                        q_block.set_qasm_simulator_flag(0)
                        q_block.set_state_tomography_basis(0)
                    else
                        -- Only run statevector_simulator
                        request_http_api.fetch(http_request_statevector, process_backend_statevector_result)

                        -- If there is a correct unitary solution, run the unitary_simulator
                        -- TODO: Add code that creates and checks for a correct unitary
                        if correct_solution_unitary then
                            request_http_api.fetch(http_request_unitary, process_backend_unitary_result)
                        end
                    end
                end

            else
                if player:get_player_control().sneak or
                            player:get_player_control().aux1 then
                    -- TODO: Remove shift key and only support aux key, because Android really only supports aux
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

    -- Also create basis state blocks with colors
    if num_qubits <= MAX_COLOR_QUBITS then
        texture_name = texture_name .. "_colors"
        minetest.register_node("q_command:" .. texture_name, {
            description = "Basis state " .. tostring(basis_state_num) .. " block w/colors",
            tiles = {texture_name .. ".png"},
            paramtype2 = "facedir",
            groups = {oddly_breakable_by_hand=2}
        })
    end

end

-- TODO: Create function to create these liquid wall blocks
minetest.register_node("q_command:q_command_liquid_full_0_rad", {
    description = "Faux liquid block full, 0 radians",
    tiles = {"q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_liquid_full_0_rad.png"},
    groups = {oddly_breakable_by_hand=2},
    paramtype2 = "facedir"
})

minetest.register_node("q_command:q_command_liquid_full_pi_rad", {
    description = "Faux liquid block full, pi radians",
    tiles = {"q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_liquid_full_pi_rad.png"},
    groups = {oddly_breakable_by_hand=2},
    paramtype2 = "facedir"
})

minetest.register_node("q_command:q_command_liquid_half_0_rad", {
    description = "Faux liquid block half, 0 radians",
    tiles = {"q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_liquid_half_0_rad.png"},
    groups = {oddly_breakable_by_hand=2},
    paramtype2 = "facedir"
})

minetest.register_node("q_command:q_command_liquid_half_pi_rad", {
    description = "Faux liquid block half, pi radians",
    tiles = {"q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_liquid_half_pi_rad.png"},
    groups = {oddly_breakable_by_hand=2},
    paramtype2 = "facedir"
})

minetest.register_node("q_command:q_command_liquid_quarter_0_rad", {
    description = "Faux liquid block quarter, 0 radians",
    tiles = {"q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_liquid_quarter_0_rad.png"},
    groups = {oddly_breakable_by_hand=2},
    paramtype2 = "facedir"
})

minetest.register_node("q_command:q_command_liquid_quarter_pi_rad", {
    description = "Faux liquid block quarter, pi radians",
    tiles = {"q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_liquid_quarter_pi_rad.png"},
    groups = {oddly_breakable_by_hand=2},
    paramtype2 = "facedir"
})

minetest.register_node("q_command:q_command_liquid_quarter_pi_2_rad", {
    description = "Faux liquid block quarter, pi/2 radians",
    tiles = {"q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_liquid_quarter_pi_2_rad.png"},
    groups = {oddly_breakable_by_hand=2},
    paramtype2 = "facedir"
})

minetest.register_node("q_command:q_command_liquid_quarter_3pi_2_rad", {
    description = "Faux liquid block quarter, 3pi/2 radians",
    tiles = {"q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_liquid_quarter_3pi_2_rad.png"},
    groups = {oddly_breakable_by_hand=2},
    paramtype2 = "facedir"
})

minetest.register_node("q_command:q_command_liquid_eighth_0_rad", {
    description = "Faux liquid block eighth, 0 radians",
    tiles = {"q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_liquid_eighth_0_rad.png"},
    groups = {oddly_breakable_by_hand=2},
    paramtype2 = "facedir"
})

minetest.register_node("q_command:q_command_liquid_85pc_0_rad", {
    description = "Faux liquid block 85%, 0 radians",
    tiles = {"q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_liquid_85pc_0_rad.png"},
    groups = {oddly_breakable_by_hand=2},
    paramtype2 = "facedir"
})

minetest.register_node("q_command:q_command_liquid_15pc_pi_2_rad", {
    description = "Faux liquid block 15%, pi/2 radians",
    tiles = {"q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_silver_sandstone_wall_tile.png",
             "q_command_liquid_15pc_pi_2_rad.png"},
    groups = {oddly_breakable_by_hand=2},
    paramtype2 = "facedir"
})


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

function q_command:convert_semicolons(str)
	if(type(str)~="string") then
		return "ERROR: No string found!"
	end

	local function convert(s)
		return s:gsub(";", function(slash, what)
			return ";\n"
		end)
	end

	return convert(str)
end

--- Help buttons ---
function q_command:register_help_button(suffix, caption, fulltext)
    local localized_fulltext = fulltext[locale_lang]
    local localized_caption = caption[locale_lang]
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
		on_rightclick = function(pos)
			local meta = minetest.get_meta(pos)
			local formspec = ""..
			"size[12,6]"..
			"label[-0.15,-0.4;"..minetest.formspec_escape(S(localized_caption)).."]"..
			"tablecolumns[text]"..
			"tableoptions[background=#000000;highlight=#000000;border=false]"..
			"table[0,0.25;12,5.2;infosign_text;"..
			q_command:convert_newlines(minetest.formspec_escape(S(localized_fulltext)))..
			"]"..
			"button_exit[4.5,5.5;3,1;close;"..minetest.formspec_escape(S("Close")).."]"
			meta:set_string("formspec", formspec)
			meta:set_string("infotext", string.format(S("%s (Right-click for hints)"), S(localized_caption)))
			--meta:set_string("id", itemstringpart)
			meta:set_string("caption", localized_caption)
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


q_command:register_q_command_block("default")


q_command.texts.notsingleplayer = {}
q_command.texts.notsingleplayer.en =
[[
You are now playing QiskitBlocks in multiplayer mode, but QiskitBlocks
is optimized for the singleplayer mode.

Unless you are sure no other players will join, please exit now and
start QiskitBlocks in singleplayer mode.
]]
q_command.texts.notsingleplayer.es = q_command.texts.notsingleplayer.en
q_command.texts.notsingleplayer.ja =
[[
現在、マルチプレイヤーモードでQiskitBlocksをプレイしていますが、QiskitBlocksはシングル
プレイヤーモード用に最適化されています。

他のプレイヤーが参加しないことが確実でない限り、今すぐ終了し、シングルプレイ
ヤーモードでQiskitBlocksを起動してください。
]]


q_command.texts.creative = {}
q_command.texts.creative.en =
[[
The Creative Mode is turned on, but QiskitBlocks is designed to be
played with the Creative Mode checkbox deselected.

You can leave now by clicking the Leave QiskitBlocks button, or later by
pressing [Esc].
]]
q_command.texts.creative.es = q_command.texts.creative.en
q_command.texts.creative.ja =
[[
クリエイティブモードはオンになっていますが、QiskitBlocksは、クリエイティブモードの
チェックボックスをオフにしてプレイするように設計されています。

「QiskitBlocksを退出」ボタンをクリックするか、後で[Esc]を押して退出できます。
]]


function q_command:erase_player_inventory()
	local player_inv = minetest.get_player_by_name("singleplayer"):get_inventory()
	local player_inv_main_size = player_inv:get_size("main")
	player_inv:set_size("main", 0)
	player_inv:set_size("main", player_inv_main_size)
end

-- Register help buttons and q_command blocks for areas such as escape rooms
for key, area in pairs(q_command.areas) do
    if area.help_btn_text then
        --minetest.debug(tostring(key))
        q_command:register_help_button(key,
                area.help_btn_caption, area.help_btn_text)
    end
    if area.solution_statevector or area.solution_unitary then
        q_command:register_q_command_block( key .. "_success",
                key,
                area.solution_statevector,
                area.solution_unitary,
                true,
                area.door_pos,
                area.chest_pos,
                area.chest_inv)
        q_command:register_q_command_block( key .. "_success",
                key,
                area.solution_statevector,
                area.solution_unitary,
                false,
                area.door_pos,
                area.chest_pos,
                area.chest_inv)
    end
end

-- Periodically check all areas for player
minetest.register_globalstep(function(dtime)

	for key, area in pairs(q_command.areas) do
        if area.center_pos and area.radius then
            for _,object in
            ipairs(minetest.get_objects_inside_radius(
                    area.center_pos,
                    area.radius)) do
                if object:is_player() then
                    if not area.help_chat_sent then
                        minetest.chat_send_player(object:get_player_name(), "----- Prof Q: -----")
                        if area.help_chat_msg[locale_lang] then
                            for idx = 1, #area.help_chat_msg[locale_lang] do
                                minetest.chat_send_player(object:get_player_name(), area.help_chat_msg[locale_lang][idx])
                            end
                        elseif area.help_chat_msg then
                            for idx = 1, #area.help_chat_msg do
                                minetest.chat_send_player(object:get_player_name(), area.help_chat_msg[idx])
                            end
                        end
                        area.help_chat_sent = true
                        q_command:erase_player_inventory()

                        -- Make note of the current area within the region
                        if area.region and area.region.id and area.region.cur_area and
                                area.area_num then
                            minetest.debug("Cur region ID: " .. area.region.id)
                            area.region.cur_area = area.area_num
                            minetest.debug("cur_area in region: " .. area.region.cur_area)
                        end
                    end

                    if area.q_block_pos and
                            q_command:get_q_command_block(area.q_block_pos).circuit_puzzle_solved() and
                            not area.success_chat_sent then
                        minetest.chat_send_player(object:get_player_name(), "----- Prof Q: -----")
                        if area.help_success_msg[locale_lang] then
                            for idx = 1, #area.help_success_msg[locale_lang] do
                                minetest.chat_send_player(object:get_player_name(), area.help_success_msg[locale_lang][idx])
                            end
                        elseif area.help_success_msg then
                            for idx = 1, #area.help_success_msg do
                                minetest.chat_send_player(object:get_player_name(), area.help_success_msg[idx])
                            end
                        end
                        area.success_chat_sent = true
                    end
                end
            end
        end

        -- Check to see if player wants to teleport to the hub
        --if area.chest_pos then
        if area.portal_pos then
            for _,object in
            ipairs(minetest.get_objects_inside_radius(
                    area.portal_pos,
                    HUB_PORTALS_RADIUS)) do
                if object:is_player() and area.region.hub_portal and
                        area.region.hub_portal.return_pos and
                        area.region.hub_portal.return_look_rad then
                    -- Teleport to area
                    minetest.chat_send_player(object:get_player_name(), "Teleporting back to the portal room")
                    object:set_pos(area.region.hub_portal.return_pos)
                    object:set_look_horizontal(area.region.hub_portal.return_look_rad)
                end
            end
        end
	end

    -- Check hub portals and teleport
	for key, region in pairs(q_command.regions) do
        if region.hub_portal and region.hub_portal.center_pos then
            for _,object in
            ipairs(minetest.get_objects_inside_radius(
                    region.hub_portal.center_pos,
                    HUB_PORTALS_RADIUS)) do
                if object:is_player() then
                    -- Teleport to area
                    minetest.chat_send_player(object:get_player_name(), "Teleporting from the portal room")
                    if region[region.cur_area] and region[region.cur_area].center_pos then
                        --object:set_pos(region[region.cur_area].center_pos)

                        -- For now, just teleport to the first area in the region
                        object:set_pos(region[1].center_pos)
                    end
                end
            end
        end
	end


end)
-- END TODO: Move this prof and escape room code to a more appropriate area




minetest.register_on_player_receive_fields(function(player, formname, fields)
    if(fields.leave) then
        minetest.kick_player(player:get_player_name(), S("You have voluntarily exited QiskitBlocks"))
        return
    end
end)

minetest.register_on_joinplayer(function(player)
	local formspec = nil
	if(minetest.is_singleplayer() == false) then
		formspec = "size[12,6]"..
		"label[-0.15,-0.4;"..minetest.formspec_escape(S("Warning: You're not playing in singleplayer mode")).."]"..
		"tablecolumns[text]"..
		"tableoptions[background=#000000;highlight=#000000;border=false]"..
		"table[0,0.25;12,5.2;creative_text;"..
        q_command:convert_newlines(minetest.formspec_escape(S(q_command.texts.notsingleplayer[locale_lang])))..
		"]"..
		"button_exit[2.5,5.5;3,1;close;"..minetest.formspec_escape(S("Continue anyway")).."]"..
		"button_exit[6.5,5.5;3,1;leave;"..minetest.formspec_escape(S("Leave QiskitBlocks")).."]"
	elseif(minetest.settings:get_bool("creative_mode")) then
		formspec = "size[12,6]"..
		"label[-0.15,-0.4;"..(minetest.formspec_escape(S("Warning: Creative mode is active"))).."]"..
		"tablecolumns[text]"..
		"tableoptions[background=#000000;highlight=#000000;border=false]"..
		"table[0,0.25;12,5.2;creative_text;"..
        q_command:convert_newlines(minetest.formspec_escape(S(q_command.texts.creative[locale_lang])))..
		"]"..
		"button_exit[2.5,5.5;3,1;close;"..minetest.formspec_escape(S("Continue anyway")).."]"..
		"button_exit[6.5,5.5;3,1;leave;"..minetest.formspec_escape(S("Leave QiskitBlocks")).."]"
	end
	if(formspec~=nil) then
		minetest.show_formspec(player:get_player_name(), "intro", formspec)
	end

    local inv = player:get_inventory()
    local inv_main_size = inv:get_size("main")
    inv:set_size("main", 0)
    inv:set_size("main", inv_main_size)
end)


minetest.register_node("q_command:block_no_function", {
    description = "Non-functional Q command block",
    tiles = {"q_command_block_no_function.png"},
    groups = {oddly_breakable_by_hand=2},
	paramtype2 = "facedir",
    on_rightclick = function(pos, node, clicker, itemstack)
        if mpd.playing then
            minetest.chat_send_player(clicker:get_player_name(),
                    "Pausing music")
            mpd.stop_song()
        else
            minetest.chat_send_player(clicker:get_player_name(),
                    "Starting music")
            mpd.play_song(MUSIC_CHILL)
        end
    end
})


for num_qubits = 1, BASIS_STATE_BLOCK_MAX_QUBITS do
    for basis_state_num = 0, 2^num_qubits - 1 do
        q_command:register_basis_state_block(num_qubits, basis_state_num)
    end
end

local ROTATION_RESOLUTION = 32
for idx = 0, ROTATION_RESOLUTION do
    q_command:register_statevector_liquid_block(idx)
end


minetest.register_globalstep(function(dtime)
    q_command.game_running_time = q_command.game_running_time + dtime

    if not q_command.tools_placed and q_command.game_running_time > 60 then
        local pos_beneath_rotate_tool = {x = 232, y = 8, z = 76}
        local rotate_tool_pos = {x = 232, y = 9, z = 76}

        local pos_beneath_control_tool = {x = 232, y = 8, z = 74}
        local control_tool_pos = {x = 232, y = 9, z = 74}

        local pos_beneath_swap_tool = {x = 230, y = 8, z = 72}
        local swap_tool_pos = {x = 230, y = 9, z = 72}

        local pos_beneath_wire_extension_block = {x = 235, y = 8, z = 78}
        local wire_extension_block_pos = {x = 235, y = 9, z = 78}

        local cart_entity_1_pos = {x = 230, y = 9, z = 83}
        local cart_entity_2_pos = {x = 189, y = 9, z = 72}

        if minetest.get_node(pos_beneath_rotate_tool).name ==
                "default:copperblock" then
            -- Tools were already placed, so this world must have been
            -- loaded from a database this time rather than being generated.
            q_command.tools_placed = true
        else
            -- Place the tools, spinning on the floor. Use a different
            -- block so that we can tell if they were already placed
            -- when the world was loaded.
            --minetest.debug("placing tools, q_command.game_running_time: " ..
            --        tostring(q_command.game_running_time))
            minetest.set_node(pos_beneath_rotate_tool,
                    {name = "default:copperblock"})
            minetest.item_drop(ItemStack("circuit_blocks:rotate_tool"),
                    nil, rotate_tool_pos)

            minetest.set_node(pos_beneath_control_tool,
                    {name = "default:copperblock"})
            minetest.item_drop(ItemStack("circuit_blocks:control_tool"),
                    nil, control_tool_pos)

            minetest.set_node(pos_beneath_swap_tool,
                    {name = "default:copperblock"})
            minetest.item_drop(ItemStack("circuit_blocks:swap_tool"),
                    nil, swap_tool_pos)

            minetest.set_node(pos_beneath_wire_extension_block,
                    {name = "default:copperblock"})
            minetest.item_drop(ItemStack("q_command:wire_extension_block"),
                    nil, wire_extension_block_pos)
            q_command.tools_placed = true

            -- Place a cart entity
            minetest.add_entity(cart_entity_1_pos, "carts:cart")
            minetest.add_entity(cart_entity_2_pos, "carts:cart")
        end
    end
end)



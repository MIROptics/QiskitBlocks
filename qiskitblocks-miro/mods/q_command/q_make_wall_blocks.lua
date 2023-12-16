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

--[[
Make wall blocks for areas in the game
--]]
function q_command:register_wall_block(texture_name)
    minetest.register_node("q_command:dr_" .. texture_name, {
        description = "Wall block " .. texture_name,
        tiles = {"q_command_silver_sandstone_wall_tile.png",
                 "q_command_silver_sandstone_wall_tile.png",
                 "q_command_silver_sandstone_wall_tile.png",
                 "q_command_silver_sandstone_wall_tile.png",
                 "q_command_silver_sandstone_wall_tile.png",
                 texture_name .. ".png",},
        groups = {oddly_breakable_by_hand=2},
        paramtype2 = "facedir"
    })
end


q_command:register_wall_block("q_command_dirac_blank")
q_command:register_wall_block("q_command_dirac_vert")
q_command:register_wall_block("q_command_dirac_rangle")
q_command:register_wall_block("q_command_dirac_plus")
q_command:register_wall_block("q_command_dirac_minus")
q_command:register_wall_block("q_command_dirac_rangle_plus")
q_command:register_wall_block("q_command_dirac_rangle_minus")
q_command:register_wall_block("q_command_dirac_rangle_space_vert")
q_command:register_wall_block("q_command_dirac_rangle_plus_vert")
q_command:register_wall_block("q_command_dirac_rangle_minus_vert")
--q_command:register_wall_tile("sqrt")
q_command:register_wall_block("q_command_dirac_sqrt_1_2")
q_command:register_wall_block("q_command_dirac_sqrt_1_4")
q_command:register_wall_block("q_command_dirac_sqrt_1_8")
q_command:register_wall_block("q_command_dirac_sqrt_15")
q_command:register_wall_block("q_command_dirac_sqrt_85")
q_command:register_wall_block("q_command_dirac_sqrt_1_2_vert")
q_command:register_wall_block("q_command_dirac_sqrt_1_4_vert")
q_command:register_wall_block("q_command_dirac_sqrt_1_8_vert")

q_command:register_wall_block("q_command_dirac_plus_state")
q_command:register_wall_block("q_command_dirac_minus_state")
q_command:register_wall_block("q_command_dirac_i_state")
q_command:register_wall_block("q_command_dirac_equal_sign")

q_command:register_wall_block("q_command_dirac_111_bottom")
q_command:register_wall_block("q_command_dirac_i_eq_000_top")
q_command:register_wall_block("q_command_dirac_111_bottom_colors")
q_command:register_wall_block("q_command_dirac_i_eq_000_top_colors")

q_command:register_wall_block("q_command_math_sum")
q_command:register_wall_block("q_command_math_e_i_pi")
q_command:register_wall_block("q_command_math_e_i_pi_2")
q_command:register_wall_block("q_command_math_e_i_pi_4")
q_command:register_wall_block("q_command_math_e_i_3pi_2")

q_command:register_wall_block("q_command_char_lower_a")
q_command:register_wall_block("q_command_chars_paren_lower_a")
q_command:register_wall_block("q_command_char_lower_b")
q_command:register_wall_block("q_command_chars_lower_b_paren")
q_command:register_wall_block("q_command_char_lower_c")
q_command:register_wall_block("q_command_char_lower_d")
q_command:register_wall_block("q_command_char_lower_e")
q_command:register_wall_block("q_command_char_lower_f")
q_command:register_wall_block("q_command_chars_xor_2")
q_command:register_wall_block("q_command_chars_lower_ot")
q_command:register_wall_block("q_command_chars_lower_he")
q_command:register_wall_block("q_command_chars_lower_rw")
q_command:register_wall_block("q_command_chars_lower_ise")
q_command:register_wall_block("q_command_chars_and_1")
q_command:register_wall_block("q_command_chars_and_2")
q_command:register_wall_block("q_command_chars_or")
q_command:register_wall_block("q_command_chars_nand_1")
q_command:register_wall_block("q_command_chars_nand_2")
q_command:register_wall_block("q_command_chars_not_1")
q_command:register_wall_block("q_command_chars_not_2")
q_command:register_wall_block("q_command_chars_nor_1")
q_command:register_wall_block("q_command_chars_nor_2")
q_command:register_wall_block("q_command_chars_xor_1")
q_command:register_wall_block("q_command_chars_xor_2")
q_command:register_wall_block("q_command_chars_if_c_underlined")
q_command:register_wall_block("q_command_chars_equal_underlined")
q_command:register_wall_block("q_command_chars_not_equal_underlined")
q_command:register_wall_block("q_command_chars_one_state_underlined")


q_command:register_wall_block("q_command_horiz_line_mid")
q_command:register_wall_block("q_command_lines_swap_1")
q_command:register_wall_block("q_command_lines_swap_2")

-- TODO: Define function to create this basis state blocks
q_command:register_wall_block("q_command_state_1qb_0")
q_command:register_wall_block("q_command_state_1qb_1")

q_command:register_wall_block("q_command_state_2qb_0")
q_command:register_wall_block("q_command_state_2qb_1")
q_command:register_wall_block("q_command_state_2qb_2")
q_command:register_wall_block("q_command_state_2qb_3")

q_command:register_wall_block("q_command_state_3qb_0")
q_command:register_wall_block("q_command_state_3qb_1")
q_command:register_wall_block("q_command_state_3qb_2")
q_command:register_wall_block("q_command_state_3qb_3")
q_command:register_wall_block("q_command_state_3qb_4")
q_command:register_wall_block("q_command_state_3qb_5")
q_command:register_wall_block("q_command_state_3qb_6")
q_command:register_wall_block("q_command_state_3qb_7")

q_command:register_wall_block("q_command_state_4qb_0")
q_command:register_wall_block("q_command_state_4qb_1")
q_command:register_wall_block("q_command_state_4qb_2")
q_command:register_wall_block("q_command_state_4qb_3")
q_command:register_wall_block("q_command_state_4qb_4")
q_command:register_wall_block("q_command_state_4qb_5")
q_command:register_wall_block("q_command_state_4qb_6")
q_command:register_wall_block("q_command_state_4qb_7")
q_command:register_wall_block("q_command_state_4qb_8")
q_command:register_wall_block("q_command_state_4qb_9")
q_command:register_wall_block("q_command_state_4qb_10")
q_command:register_wall_block("q_command_state_4qb_11")
q_command:register_wall_block("q_command_state_4qb_12")
q_command:register_wall_block("q_command_state_4qb_13")
q_command:register_wall_block("q_command_state_4qb_14")
q_command:register_wall_block("q_command_state_4qb_15")

q_command:register_wall_block("q_command_state_1qb_0_colors")
q_command:register_wall_block("q_command_state_1qb_1_colors")

q_command:register_wall_block("q_command_state_2qb_0_colors")
q_command:register_wall_block("q_command_state_2qb_1_colors")
q_command:register_wall_block("q_command_state_2qb_2_colors")
q_command:register_wall_block("q_command_state_2qb_3_colors")

q_command:register_wall_block("q_command_state_3qb_0_colors")
q_command:register_wall_block("q_command_state_3qb_1_colors")
q_command:register_wall_block("q_command_state_3qb_2_colors")
q_command:register_wall_block("q_command_state_3qb_3_colors")
q_command:register_wall_block("q_command_state_3qb_4_colors")
q_command:register_wall_block("q_command_state_3qb_5_colors")
q_command:register_wall_block("q_command_state_3qb_6_colors")
q_command:register_wall_block("q_command_state_3qb_7_colors")


q_command:register_wall_block("q_command_esc_room_exit_wall_tile")
q_command:register_wall_block("q_command_esc_room_exit_left")
q_command:register_wall_block("q_command_esc_room_no_entry_wall_tile")
q_command:register_wall_block("q_command_construction_wall_tile")
q_command:register_wall_block("q_command_portal_top_wall_tile")
q_command:register_wall_block("q_command_portal_bottom_wall_tile")
q_command:register_wall_block("q_command_portal_return_top_wall_tile")
q_command:register_wall_block("q_command_portal_return_bottom_wall_tile")
q_command:register_wall_block("q_command_read_first_wall_tile")
q_command:register_wall_block("q_command_bloch_minus_state_wall_tile")

q_command:register_wall_block("q_command_9_3_4_wall_tile")

q_command:register_wall_block("q_command_silver_sandstone_wall_tile")

q_command:register_wall_block("prof_q_top_low_res")
q_command:register_wall_block("prof_q_bottom_low_res")



--Added by team #49
q_command:register_wall_block("q_command_human_ch_wall_tile")

q_command:register_wall_block("q_command_letter_capital_C_wall_tile")
q_command:register_wall_block("q_command_letter_capital_D_wall_tile")
q_command:register_wall_block("q_command_letter_capital_G_wall_tile")
q_command:register_wall_block("q_command_letter_capital_H_wall_tile")
q_command:register_wall_block("q_command_letter_capital_J_wall_tile")
q_command:register_wall_block("q_command_letter_capital_M_wall_tile")
q_command:register_wall_block("q_command_letter_capital_Q_wall_tile")
q_command:register_wall_block("q_command_letter_capital_S_wall_tile")
q_command:register_wall_block("q_command_letter_capital_T_wall_tile")
q_command:register_wall_block("q_command_letter_capital_W_wall_tile")
q_command:register_wall_block("q_command_letter_capital_Y_wall_tile")

q_command:register_wall_block("q_command_letter_g_wall_tile")
q_command:register_wall_block("q_command_letter_h_wall_tile")
q_command:register_wall_block("q_command_letter_i_wall_tile")
q_command:register_wall_block("q_command_letter_j_wall_tile")
q_command:register_wall_block("q_command_letter_k_wall_tile")
q_command:register_wall_block("q_command_letter_l_wall_tile")
q_command:register_wall_block("q_command_letter_m_wall_tile")
q_command:register_wall_block("q_command_letter_n_wall_tile")
q_command:register_wall_block("q_command_letter_o_wall_tile")
q_command:register_wall_block("q_command_letter_p_wall_tile")
q_command:register_wall_block("q_command_letter_q_wall_tile")
q_command:register_wall_block("q_command_letter_r_wall_tile")
q_command:register_wall_block("q_command_letter_s_wall_tile")
q_command:register_wall_block("q_command_letter_t_wall_tile")
q_command:register_wall_block("q_command_letter_u_wall_tile")
q_command:register_wall_block("q_command_letter_v_wall_tile")
q_command:register_wall_block("q_command_letter_w_wall_tile")
q_command:register_wall_block("q_command_letter_x_wall_tile")
q_command:register_wall_block("q_command_letter_y_wall_tile")
q_command:register_wall_block("q_command_letter_z_wall_tile")
q_command:register_wall_block("q_command_letter_capital_I_wall_tile")
q_command:register_wall_block("q_command_letter_bra_state_0_wall_tile")
q_command:register_wall_block("q_command_letter_number_2_wall_tile")
q_command:register_wall_block("q_command_letter_number_wall_tile")
q_command:register_wall_block("q_command_letter_4_wall_tile")
q_command:register_wall_block("q_command_letter_9_wall_tile")


q_command:register_wall_block("q_command_esc_room_1_7")
q_command:register_wall_block("q_command_esc_room_2_7")
q_command:register_wall_block("q_command_esc_room_3_7")
q_command:register_wall_block("q_command_esc_room_4_7")
q_command:register_wall_block("q_command_esc_room_5_7")
q_command:register_wall_block("q_command_esc_room_6_7")
q_command:register_wall_block("q_command_esc_room_7_7")


local NUM_ESCAPE_ROOMS = 16
for idx = 1, NUM_ESCAPE_ROOMS do
    q_command:register_wall_block("q_command_esc_room_" .. tostring(idx) .. "_16")
end

local NUM_ESCAPE_ROOM_LEVELS = 16
for idx = 1, NUM_ESCAPE_ROOM_LEVELS do
    q_command:register_wall_block("q_command_esc_room_level_" .. tostring(idx))
end





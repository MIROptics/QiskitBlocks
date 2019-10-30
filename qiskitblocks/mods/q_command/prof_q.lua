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
Facility that guides the player through solving circuit puzzles and
other challenges, including navigation and understanding quantum
computing concepts. Includes chat and an NPC (non-player character)
--]]


-- our API object
prof_q = {}

function prof_q:get_locale_lang()
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

function prof_q:erase_player_inventory()
	local player_inv = minetest.get_player_by_name("singleplayer"):get_inventory()
	local player_inv_main_size = player_inv:get_size("main")
	player_inv:set_size("main", 0)
	player_inv:set_size("main", player_inv_main_size)
end


-- Areas in the world in which Prof Q interacts with players
prof_q.areas = {}


local locale_lang = prof_q:get_locale_lang()
minetest.debug("prof_q_locale_lang: " .. locale_lang)


-- Periodically check all areas for player
minetest.register_globalstep(function(dtime)

	for key, area in pairs(prof_q.areas) do
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
					prof_q:erase_player_inventory()
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
					--prof_q:erase_player_inventory()
				end
			end
		end
	end
end)


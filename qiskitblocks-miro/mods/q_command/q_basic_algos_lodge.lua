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
Elements of the q_command table that supply information about areas in the game
--]]

-- Basic algos lodge puzzles ------------------------------------------------
q_command.areas.deutsch_algo_puzzle = {}
q_command.areas.deutsch_algo_puzzle.solution_statevector =
{{r=0,i=0},{r=-0.707,i=0},{r=0,i=0},{r=0.707,i=0}}
q_command.areas.deutsch_algo_puzzle.help_btn_text = {}
q_command.areas.deutsch_algo_puzzle.help_btn_text.en =
[[
The Deutsch algorithm, first published in 1985, is the Hello World of
quantum algorithms.

To work through this puzzle, place appropriate gates between the
barriers to implement a balanced oracle whose output on the bottom wire
is the flipped state of its input on the top wire.
]]
q_command.areas.deutsch_algo_puzzle.help_btn_text.es = q_command.areas.deutsch_algo_puzzle.help_btn_text.en
q_command.areas.deutsch_algo_puzzle.help_btn_text.ja =
[[
1985年に最初に公開されたドイチのアルゴリズムは、量子アルゴリズムのHello Worldです。

このパズルは、バリア間に適切なゲートを配置して、一番下の線の出力が一番上の線の入力の
反転状態になるバランスのとれたオラクルを実装することによって解くことができます。
]]
q_command.areas.deutsch_algo_puzzle.help_btn_caption = {}
q_command.areas.deutsch_algo_puzzle.help_btn_caption.en = "Deutsch's algorithm"
q_command.areas.deutsch_algo_puzzle.help_btn_caption.es = q_command.areas.deutsch_algo_puzzle.help_btn_caption.en
q_command.areas.deutsch_algo_puzzle.help_btn_caption.ja = "ドイチのアルゴリズム"

-- END Basic algos lodge puzzles --------------------------------------------



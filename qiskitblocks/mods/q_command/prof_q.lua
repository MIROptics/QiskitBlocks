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


-- Relevant data about areas
-- x_gate_escape:
prof_q.areas.x_gate_escape = {}
prof_q.areas.x_gate_escape.center_pos = {x = 238, y = 0, z = 72}
prof_q.areas.x_gate_escape.radius = 5
prof_q.areas.x_gate_escape.q_block_pos = {x = 240, y = 0, z = 74}
prof_q.areas.x_gate_escape.help_chat_msg = {
	"Hello test subject #576, I mean esteemed colleague! My name is Professor Q and I'm",
	"standing behind this blast glass because we're going to try an experiment. Hopefully",
	"it won't vaporize you or scramble your molecules :-) For this experiment, change the",
	"quantum state of the circuit from |0> to the state shown on the wall."
}
prof_q.areas.x_gate_escape.help_chat_msg.es = {
	"Hola, sujeto #576, digo... ¡estimado colega! Mi nombre es Profesor Q y me encuentro aquí,",
	"detrás de esta mampara de cristal porque vamos a probar un experimento. Con suerte, ni te",
	"vaporizará, ni esparcirá tus moléculas por ahí. Para este experimento, cambia el estado",
	"cuántico del circuito de |0> al estado que se muestra en la pared."
}
prof_q.areas.x_gate_escape.help_chat_msg.ja = {
	"こんにちは、被験者＃576、尊敬される同僚を意味します！ 私の名前はQ教授です。実験をし",
	"ようと思っているので、このブラストガラスの後ろに立っています。 うまくいけば、気化した",
	"り、分子をスクランブルしたりしないでください:-)この実験では、回路の量子状態を| 0>から",
	"壁に表示される状態に変更します。"
}
prof_q.areas.x_gate_escape.help_chat_sent = false
--[[ Input from CJ:
 Try to move chat to lower middle area of screen
--]]
prof_q.areas.x_gate_escape.help_success_msg = {
	"That was great how you used the Pauli-X gate, or NOT gate, to change the quantum",
	"state from |0> to |1>. In addition to making the liquid levels show 100% probability",
	"that measurements will result in |1>, notice that the marker on the Bloch sphere moved",
	"from the top representing |0>, to the bottom representing |1>. Congrats, and now please",
	"move on to the next circuit puzzle!"
}
prof_q.areas.x_gate_escape.help_success_msg.es = {
	"Ha estado muy bien cómo has usado la puerta Pauli-X, también conocida como puerta NOT,",
	"para cambiar el estado cuántico de |0> a |1>. Fíjate cómo la marca en la esfera de",
	"Bloch se ha movido de arriba, representando |0>, a abajo, representando |1>.",
	"¡Enhorabuena! Ahora, procede al siguiente puzzle."
}
prof_q.areas.x_gate_escape.help_success_msg.ja = {
	"Pauli-Xゲート（NOTゲート）を使用して量子状態を| 0>から| 1>に変更する方法は素晴らし",
	"かったです。 液面レベルを測定すると100％の確率で| 1>が表示されることに加えて、ブロッ",
	"ホ球のマーカーが| 0>を表す上部から| 1>を表す下部に移動したことに注意してください。 お",
	"めでとう、そして次のサーキットパズルに進んでください！"
}
prof_q.areas.x_gate_escape.success_chat_sent = false


-- x_gates_2_wire:
prof_q.areas.x_gates_2_wire = {}
prof_q.areas.x_gates_2_wire.center_pos = {x = 238, y = 0, z = 62}
prof_q.areas.x_gates_2_wire.radius = 5
prof_q.areas.x_gates_2_wire.q_block_pos = {x = 240, y = 0, z = 65}
prof_q.areas.x_gates_2_wire.help_chat_msg = {
	"Now let's play with multi-qubit circuits like this one. Please make its quantum state",
	"match the state on the wall.",
}
prof_q.areas.x_gates_2_wire.help_chat_msg.es = {
	"Vamos a trabajar ahora con circuitos multi-cúbit, como este. Por favor, haz que el",
	"estado cuántico del mismo se corresponda con el estado en la pared.",
}
prof_q.areas.x_gates_2_wire.help_chat_sent = false
prof_q.areas.x_gates_2_wire.help_success_msg = {
	"Well done! Now the liquid levels show 100% probability that measurements will",
	"result in |10>",
	"Also, the marker on the bottom Bloch sphere moved from representing |0> to |1>"
}
prof_q.areas.x_gates_2_wire.help_success_msg.es = {
	"¡Bien hecho! Ahora los niveles de líquido muestran que, al 100% de probabilidad,",
	"las mediciones resultarán en |10>. Además, la marca en la esfera de Bloch se ha",
	"movido desde la representación de |0> a |1>."
}
prof_q.areas.x_gates_2_wire.success_chat_sent = false


-- x_gates_3_wire:
prof_q.areas.x_gates_3_wire = {}
prof_q.areas.x_gates_3_wire.center_pos = {x = 248, y = 0, z = 62}
prof_q.areas.x_gates_3_wire.radius = 5
prof_q.areas.x_gates_3_wire.q_block_pos = {x = 244, y = -1, z = 64}
prof_q.areas.x_gates_3_wire.help_chat_msg = {
	"Here you'll do more of the same, but with one additional wire and twice the",
	"number of basis states."
}
prof_q.areas.x_gates_3_wire.help_chat_msg.es = {
	"Aquí vas a hacer lo mismo, pero con una línea adicional y el doble de estados base."
}
prof_q.areas.x_gates_3_wire.help_chat_sent = false
prof_q.areas.x_gates_3_wire.help_success_msg = {
	"You're catching on quickly! You're also noticing that there are 2 to the n power of",
	"basis states, where n is the number of wires. Here, there are 3 wires, so 8 basis",
	"states, |000> through |111>"
}
prof_q.areas.x_gates_3_wire.help_success_msg.es = {
	"¡Lo pillas rápido! También te habrás dado cuenta de que el número de estados bae es 2",
	"elevado a la n potencia, donde n es el número de líneas. En este caso hay 3 líneas,",
	"luego 8 estados base, del |000> al |111>"
}
prof_q.areas.x_gates_3_wire.success_chat_sent = false


-- h_gate_escape:
prof_q.areas.h_gate_escape = {}
prof_q.areas.h_gate_escape.center_pos = {x = 248, y = 0, z = 72}
prof_q.areas.h_gate_escape.radius = 5
prof_q.areas.h_gate_escape.q_block_pos = {x = 247, y = 0, z = 74}
prof_q.areas.h_gate_escape.help_chat_msg = {
	"This room is where Schroedinger's cat starts getting nervous. Put the qubit in an equal",
	"superposition of dead and alive, I mean |0> and |1>"
}
prof_q.areas.h_gate_escape.help_chat_msg.es = {
	"Esta es la habitación donde el gato de Schrodinger comienza a ponerse nervioso. Pon",
	"el cúbit en igual superposición de vivo y muerto. Quiero decir, de |0> y |1>"
}
prof_q.areas.h_gate_escape.help_chat_sent = false
prof_q.areas.h_gate_escape.help_success_msg = {
	"You've put the qubit in the |+> (pronounced 'plus') state where it has an equal probability",
	"that measurements will result in |0> or |1>. You also made the marker on the Bloch sphere",
	"move to its equator, where the distances to the north pole |0> and the south pole |1>",
	"are equal. Fun fact: The probability of a |0> measurement result is proportional to",
	"the vertical (Z axis) distance of the qubit's state to the south pole on the Bloch sphere!"
}
prof_q.areas.h_gate_escape.help_success_msg.es = {
	"Acabas de poner el cúbit en el estado |+> (pronunciado, “más”). También has hecho que la",
	"marca de la esfera de Bloch se mueva hacia el ecuador, donde las distancias al polo norte,",
	"|0>, y al polo sur, |1>, son iguales. Dato interesante: la probabilidad de medir |0> es",
	"proporcional a la distancia vertical (eje Z) del estado del cúbit al polo sur, en la",
	"esfera de Bloch."
}
prof_q.areas.h_gate_escape.success_chat_sent = false


-- h_x_gate:
prof_q.areas.h_x_gate = {}
prof_q.areas.h_x_gate.center_pos = {x = 258, y = 0, z = 72}
prof_q.areas.h_x_gate.radius = 5
prof_q.areas.h_x_gate.q_block_pos = {x = 260, y = 0, z = 73}
prof_q.areas.h_x_gate.help_chat_msg = {
	"Now let's visit the back side of the Bloch sphere, in a state commonly known as |->",
	"(pronounced 'minus'), where measurements resulting in |0> or |1> are also equally likely"
}
prof_q.areas.h_x_gate.help_chat_msg.es = {
	"Visitemos ahora el otro lado de la esfera de Bloch, un estado conocido como |-> (pronunciado",
	"“menos”), donde las mediciones que resultan en |0> o |1> son igualmente probables."
}
prof_q.areas.h_x_gate.help_chat_sent = false
prof_q.areas.h_x_gate.help_success_msg = {
	"Nice navigation! You're noticing how the quantum computing gates such as X and Hadamard",
	"may be represented as rotations on the Bloch sphere. The X gate rotates 180 degrees, also",
	"known as pi (3.14...) radians, around the X axis (which is the axis coming toward you)",
	"but a bit down and to the left). You also may have noticed that the H gate rotates pi",
	"radians around an axis that is halfway in-between the X and Z axes."
}
prof_q.areas.h_x_gate.help_success_msg.es = {
	"¡Bien dirigido! Te estarás percatando de cómo las puertas X y Hadamard se pueden",
	"representar como rotaciones en la esfera de Bloch. La puerta X rota 180 grados, o PI (3.14…) ",
	"radianes, la marca, alrededor del eje X (que es el eje que apunta hacia ti, aunque un",
	"poco más hacia abajo y a la izquierda). También habrás notado que la puerta H rota PI",
	"radianes la marca, alrededor de un eje que se encuentra a medio camino entre los ejes X y Z."
}
prof_q.areas.h_x_gate.success_chat_sent = false


-- h_z_gate:
prof_q.areas.h_z_gate = {}
prof_q.areas.h_z_gate.center_pos = {x = 258, y = 0, z = 62}
prof_q.areas.h_z_gate.radius = 5
prof_q.areas.h_z_gate.q_block_pos = {x = 259, y = 0, z = 60}
prof_q.areas.h_z_gate.help_chat_msg = {
	"Let's take another trip to the |-> state, but this time via a different route. I've taken",
	"the liberty of replacing your X gate with a Z gate, so you'll need to experiment. Good luck!"
}
prof_q.areas.h_z_gate.help_chat_msg.es = {
	"Vamos a alcanzar de nuevo el estado |->, esta vez siguiendo otra ruta. Me he tomado",
	"la libertad de reemplazar tu puerta X con una puerta Z, así que tendrás que experimentar",
	"un poco. ¡Buena suerte!"
}
prof_q.areas.h_z_gate.help_chat_sent = false
prof_q.areas.h_z_gate.help_success_msg = {
	"Fascinating! You've demonstrated that there are several different ways (an infinite amount)",
	"for a quantum state to evolve to a different quantum state. This time, you used the H gate to",
	"move to the |+> state, and then you changed the phase of the quantum state by pi radians, using",
	"the Z gate to rotate around the Z axis. Did you notice that the arrows in the liquid blocks point",
	"in opposite directions (pi radians out of phase) when this one-qubit circuit is in the |-> state?"
}
prof_q.areas.h_z_gate.help_success_msg.es = {
	"¡Fascinante! Acabas de demostrar que existen distintas formas (infinitas, de hecho) para que un estado",
	"cuántico evolucione hacia otro distinto. Esta vez, has usado una puerta H para alcanzar el estado |+>,",
	"y después has cambiado la fase del estado cuántico en PI radianes, usando la puerta Z para rotar alrededor",
	"del eje Z. ¿Te has dado cuenta de que las flechas de los bloques líquidos apuntan en direcciones",
	"opuestas (desfasadas PI radianes), cuando este circuito de un cúbit se encuentra en el estado |->?"
}
prof_q.areas.h_z_gate.success_chat_sent = false


-- hxx_gates_escape:
prof_q.areas.hxx_gates_escape = {}
prof_q.areas.hxx_gates_escape.center_pos = {x = 268, y = 0, z = 62}
prof_q.areas.hxx_gates_escape.radius = 5
prof_q.areas.hxx_gates_escape.q_block_pos = {x = 271, y = -1, z = 66}
prof_q.areas.hxx_gates_escape.help_chat_msg = {
	"Go ahead and solve this puzzle by thinking about one wire at a time"
}
prof_q.areas.hxx_gates_escape.help_chat_msg.es = {
	"Continua y resuelve este puzzle línea por línea."
}
prof_q.areas.hxx_gates_escape.help_chat_sent = false
prof_q.areas.hxx_gates_escape.help_success_msg = {
	"You're really getting the hang of this! By thinking about the effects of various gates on",
	"individual wires, you've successfully crafted the desired composite quantum state."
}
prof_q.areas.hxx_gates_escape.help_success_msg.es = {
	"¡Le vas cogiendo el truco! Pensando en el efecto de múltiples puertas en líneas individuales,",
	"has conseguido crear el estado cuántico deseado."
}
prof_q.areas.hxx_gates_escape.success_chat_sent = false


-- equal_super_2wire_escape:
prof_q.areas.equal_super_2wire_escape = {}
prof_q.areas.equal_super_2wire_escape.center_pos = {x = 268, y = 0, z = 72}
prof_q.areas.equal_super_2wire_escape.radius = 5
prof_q.areas.equal_super_2wire_escape.q_block_pos = {x = 266, y = 0, z = 75}
prof_q.areas.equal_super_2wire_escape.help_chat_msg = {
	"Now put four basis states into equal superpositions"
}
prof_q.areas.equal_super_2wire_escape.help_chat_msg.es = {
	"Ahora pon los cuatro estados base en igual superposición."
}
prof_q.areas.equal_super_2wire_escape.help_chat_sent = false
prof_q.areas.equal_super_2wire_escape.help_success_msg = {
	"Incredible! By putting each wire into a superposition, you've caused all four of the",
	"basis states in this quantum state to be in equal superpositions. As indicated by the",
	"formula on the wall, each state has a 1/4 probability of being the result when measured.",
	"Note that the measurement probability of a given basis state is the square of its",
	"coefficient (referred to by physicists as its amplitude)"
}
prof_q.areas.equal_super_2wire_escape.help_success_msg.es = {
	"¡Increíble! Poniendo cada línea en superposición, has hecho que los cuatro estados base de",
	"este estado cuántico estén en igual superposición. Como indica la fórmula en la pared, cada",
	"estado tiene una probabilidad de ¼ de ser el resultado, tras una medición. Fíjate que la",
	"probabilidad de medición de un estado base cualquiera es el cuadrado de su coeficiente",
	"(llamado “amplitud”, por los físicos)."
}
prof_q.areas.equal_super_2wire_escape.success_chat_sent = false


-- equal_super_3wire_escape:
prof_q.areas.equal_super_3wire_escape = {}
prof_q.areas.equal_super_3wire_escape.center_pos = {x = 268, y = 0, z = 82}
prof_q.areas.equal_super_3wire_escape.radius = 5
prof_q.areas.equal_super_3wire_escape.q_block_pos = {x = 264, y = -1, z = 78}
prof_q.areas.equal_super_3wire_escape.help_chat_msg = {
	"This time, put eight basis states into equal superpositions"
}
prof_q.areas.equal_super_3wire_escape.help_chat_msg.es = {
	"Esta vez, pon ocho estados base en igual superposición."
}
prof_q.areas.equal_super_3wire_escape.help_chat_sent = false
prof_q.areas.equal_super_3wire_escape.help_success_msg = {
	"You've got this! You may be familiar with the 'sum' notation on the wall, which",
	"provides a succinct way to express this state in which all of the basis states have",
	"the same amplitude."
}
prof_q.areas.equal_super_3wire_escape.help_success_msg.es = {
	"¡Ya lo has pillado! Puede que te suene la notación “sumatorio” de la pared, que proporciona",
	"una forma breve de expresar este estado en el que todos los estados base tienen la misma",
	"amplitud."
}
prof_q.areas.equal_super_3wire_escape.success_chat_sent = false


-- bell_phi_plus_escape:
prof_q.areas.bell_phi_plus_escape = {}
prof_q.areas.bell_phi_plus_escape.center_pos = {x = 268, y = 0, z = 92}
prof_q.areas.bell_phi_plus_escape.radius = 5
prof_q.areas.bell_phi_plus_escape.q_block_pos = {x = 266, y = 0, z = 94}
prof_q.areas.bell_phi_plus_escape.help_chat_msg = {
	"Now we'll experiment with a phenomenon known as 'quantum entanglement' that Einstein",
	"referred to as 'spooky actions at a distance'. Your challenge is to entangle two",
	"qubits so that each one will have the same measurement result. Hint: You'll click the",
	"X gate while wielding the Control Tool to turn in into a CNOT gate."
}
prof_q.areas.bell_phi_plus_escape.help_chat_msg.es = {
	"Ahora vamos a experimentar con un fenómeno llamado “entrelazamiento cuántico”, y al que",
	"Einstein se refería como “acciones espeluznantes a distancia”. El reto consiste en entrelazar",
	"dos cubits de tal forma que se obtenga la misma medida para ambos. Pista: sostén la",
	"Herramienta Control y haz clic en la puerta X para convertirla en una puerta CNOT."
}
prof_q.areas.bell_phi_plus_escape.help_chat_sent = false
prof_q.areas.bell_phi_plus_escape.help_success_msg = {
	"Amazing! You've just entangled two qubits in one of the four Bell states. This one is",
	"known as the 'phi +' state. Did you notice that the Bloch spheres have question marks",
	"in them? That's because an entangled state can't be expressed in terms of the states of",
	"its qubits."
}
prof_q.areas.bell_phi_plus_escape.help_success_msg.es = {
	"¡Impresionante! Acabas de entrelazar dos cubits en uno de los cuatro estados de Bell. Este se",
	"conoce con el nombre de estado “phi +”. ¿Te has dado cuenta de que la esfera de Bloch",
	"muestra símbolos de interrogación en ella? Esto se debe a que un estado entrelazado no",
	"puede exprese en términos de los estados de sus cúbits."
}
prof_q.areas.bell_phi_plus_escape.success_chat_sent = false


-- bell_phi_minus_escape:
prof_q.areas.bell_phi_minus_escape = {}
prof_q.areas.bell_phi_minus_escape.center_pos = {x = 258, y = 0, z = 92}
prof_q.areas.bell_phi_minus_escape.radius = 5
prof_q.areas.bell_phi_minus_escape.q_block_pos = {x = 256, y = 0, z = 90}
prof_q.areas.bell_phi_minus_escape.help_chat_msg = {
	"Now entangle two qubits in another way, known as the 'phi -' Bell state."
}
prof_q.areas.bell_phi_minus_escape.help_chat_msg.es = {
	"Ahora entrelaza dos cúbits de otra manera, conocida como el estado de Bell “phi -“."
}
prof_q.areas.bell_phi_minus_escape.help_chat_sent = false
prof_q.areas.bell_phi_minus_escape.help_success_msg = {
	"Congratulations! You entangled those qubits in such a way that the measurement results",
	"are the same as the previous, 'phi +', Bell state. But did you notice that the phases",
	"in the relevant basis states are pi radians out of phase?"
}
prof_q.areas.bell_phi_minus_escape.help_success_msg.es = {
	"¡Enhorabuena! Has entrelazado esos cúbits de forma que los resultados medidos son los",
	"mismos que en el estado anterior, “phi +”. ¿Pero te has dado cuenta de que las fases de los",
	"estados se encuentran desfasadas PI radianes?"
}
prof_q.areas.bell_phi_minus_escape.success_chat_sent = false


-- bell_psi_plus_escape:
prof_q.areas.bell_psi_plus_escape = {}
prof_q.areas.bell_psi_plus_escape.center_pos = {x = 258, y = 0, z = 82}
prof_q.areas.bell_psi_plus_escape.radius = 5
prof_q.areas.bell_psi_plus_escape.q_block_pos = {x = 260, y = 0, z = 80}
prof_q.areas.bell_psi_plus_escape.help_chat_msg = {
	"Go ahead and entangle the two qubits in yet another way, this time in which the",
	"measurement result of one qubit is the opposite result of measuring the other qubit."
}
prof_q.areas.bell_psi_plus_escape.help_chat_msg.es = {
	"Continua y entrelaza ambos cúbits de otra forma más, esta vez en una en la que el resultado",
	"de un cúbit sea siempre opuesto al resultado del otro."
}
prof_q.areas.bell_psi_plus_escape.help_chat_sent = false
prof_q.areas.bell_psi_plus_escape.help_success_msg = {
	"Well done! The state you made is known as the 'psi +', Bell state."
}
prof_q.areas.bell_psi_plus_escape.help_success_msg.es = {
	"¡Bien hecho! Este estado se conoce como el estado de Bell “psi +”."
}
prof_q.areas.bell_psi_plus_escape.success_chat_sent = false


-- bell_psi_minus_escape:
prof_q.areas.bell_psi_minus_escape = {}
prof_q.areas.bell_psi_minus_escape.center_pos = {x = 248, y = 0, z = 82}
prof_q.areas.bell_psi_minus_escape.radius = 5
prof_q.areas.bell_psi_minus_escape.q_block_pos = {x = 245, y = 0, z = 80}
prof_q.areas.bell_psi_minus_escape.help_chat_msg = {
	"Let's tackle the fourth and final Bell state, this time also using a Z gate."
}
prof_q.areas.bell_psi_minus_escape.help_chat_msg.es = {
	"Vamos a por el cuarto estado de Bell, esta vez usando una puerta Z."
}
prof_q.areas.bell_psi_minus_escape.help_chat_sent = false
prof_q.areas.bell_psi_minus_escape.help_success_msg = {
	"Awesome! This one is called the 'psi -', Bell state."
}
prof_q.areas.bell_psi_minus_escape.help_success_msg.es = {
	"¡Alucinante! Este es el estado de Bell “psi -“."
}
prof_q.areas.bell_psi_minus_escape.success_chat_sent = false


-- ghz_state_escape:
prof_q.areas.ghz_state_escape = {}
prof_q.areas.ghz_state_escape.center_pos = {x = 248, y = 0, z = 92}
prof_q.areas.ghz_state_escape.radius = 5
prof_q.areas.ghz_state_escape.q_block_pos = {x = 244, y = 0, z = 96}
prof_q.areas.ghz_state_escape.help_chat_msg = {
	"Next you'll entangle three qubits so that they all either measure 0s or 1s"
}
prof_q.areas.ghz_state_escape.help_chat_msg.es = {
	"Ahora entrelazarás tres cúbits de forma que todos midan o 0, o 1."
}
prof_q.areas.ghz_state_escape.help_chat_sent = false
prof_q.areas.ghz_state_escape.help_success_msg = {
	"Congratulations! You've successfully created a state known as GHZ."
}
prof_q.areas.ghz_state_escape.help_success_msg.es = {
	"¡Enhorabuena! Has creado el estado conocido como “GHZ”."
}
prof_q.areas.ghz_state_escape.success_chat_sent = false


-- y_z_rot_1wire_escape:
prof_q.areas.y_z_rot_1wire_escape = {}
prof_q.areas.y_z_rot_1wire_escape.center_pos = {x = 238, y = 0, z = 92}
prof_q.areas.y_z_rot_1wire_escape.radius = 5
prof_q.areas.y_z_rot_1wire_escape.q_block_pos = {x = 236, y = 0, z = 90}
prof_q.areas.y_z_rot_1wire_escape.help_chat_msg = {
	"In this puzzle you'll experiment with the effects of rotating the state of a",
	"qubit in the Y and Z axes. Hint: You'll click the Ry and Rz blocks while wielding",
	"the Rotate Tool."
}
prof_q.areas.y_z_rot_1wire_escape.help_chat_msg.es = {
	"En este puzzle experimentarás con los efectos de rotar el estado de un cúbit alrededor de los",
	"ejes Y y Z. Pista: sostén la Herramienta Rotación y haz clic en los bloques Ry y Rz."
}
prof_q.areas.y_z_rot_1wire_escape.help_chat_sent = false
prof_q.areas.y_z_rot_1wire_escape.help_success_msg = {
	"Nice work! Did you notice that rotating the qubit on the Y axis changed the",
	"measurement probabilities, but rotating on the Z axis didn't?"
}
prof_q.areas.y_z_rot_1wire_escape.help_success_msg.es = {
	"¡Bien hecho! ¿Te has dado cuenta de que, rotando el cúbit alrededor del eje Y, cambian las",
	"probabilidades de la medida, pero rotándolo alrededor de Z, no cambian?"
}
prof_q.areas.y_z_rot_1wire_escape.success_chat_sent = false


-- phase_rot_2wire_escape:
prof_q.areas.phase_rot_2wire_escape = {}
prof_q.areas.phase_rot_2wire_escape.center_pos = {x = 238, y = 0, z = 82}
prof_q.areas.phase_rot_2wire_escape.radius = 5
prof_q.areas.phase_rot_2wire_escape.q_block_pos = {x = 240, y = -1, z = 80}
prof_q.areas.phase_rot_2wire_escape.help_chat_msg = {
	"Now you'll experiment with a pattern commonly used in quantum computing algorithms,",
	"in which Z axis rotations are sandwiched between pairs of H gates."
}
prof_q.areas.phase_rot_2wire_escape.help_chat_msg.es = {
	"Ahora experimentarás con un patrón comúnmente utilizado en algoritmos cuánticos, donde",
	"rotaciones alrededor del eje Z se encuentran en medio de pares de puertas H, como si fueran",
	"el relleno de un sándwich."
}
prof_q.areas.phase_rot_2wire_escape.help_chat_sent = false
prof_q.areas.phase_rot_2wire_escape.help_success_msg = {
	"Well done! The H gates transformed changes in phase to changes in measurement",
	"probabilities.",
	"Congratulations on solving these circuit puzzles! Feel free to revisit any of them,",
	"and then explore other areas after climbing the ladder back to the main room."
}
prof_q.areas.phase_rot_2wire_escape.help_success_msg.es = {
	"¡Muy bien! Las puertas H transforman cambios en la fase en cambios en la probabilidad.",
	"¡Mi más sentida enhorabuena por haber resuelto estos puzzles de circuitos! Vuelve a",
	"cualquiera de ellos si quieres y explora otras áreas tras subir las escaleras de vuelta",
	"a la habitación principal."
}
prof_q.areas.phase_rot_2wire_escape.success_chat_sent = false


-- Escape room puzzles Level II -------------------------------------------------
-------- Room 1 (Level II)
prof_q.areas.xor_escape = {}
prof_q.areas.xor_escape.center_pos = {x = 218, y = 0, z = 72}
prof_q.areas.xor_escape.radius = 5
prof_q.areas.xor_escape.q_block_pos = {x = 215, y = 0, z = 70}
prof_q.areas.xor_escape.help_chat_msg = {
	"Now you'll experiment with a pattern commonly used in quantum computing algorithms,",
	"in which Z axis rotations are sandwiched between pairs of H gates."
}
prof_q.areas.xor_escape.help_chat_sent = false
prof_q.areas.xor_escape.help_success_msg = {
	"Well done! The H gates transformed changes in phase to changes in measurement",
	"probabilities.",
	"Congratulations on solving these circuit puzzles! Feel free to revisit any of them,",
	"and then explore other areas after climbing the ladder back to the main room."
}
prof_q.areas.xor_escape.success_chat_sent = false


-------- Room 2 (Level II)
prof_q.areas.dj_bal_flip_ora_escape = {}
prof_q.areas.dj_bal_flip_ora_escape.center_pos = {x = 218, y = 0, z = 62}
prof_q.areas.dj_bal_flip_ora_escape.radius = 5
prof_q.areas.dj_bal_flip_ora_escape.q_block_pos = {x = 220, y = 0, z = 60}
prof_q.areas.dj_bal_flip_ora_escape.help_chat_msg = {
	"Now you'll experiment with a pattern commonly used in quantum computing algorithms,",
	"in which Z axis rotations are sandwiched between pairs of H gates."
}
prof_q.areas.dj_bal_flip_ora_escape.help_chat_sent = false
prof_q.areas.dj_bal_flip_ora_escape.help_success_msg = {
	"Well done! The H gates transformed changes in phase to changes in measurement",
	"probabilities.",
	"Congratulations on solving these circuit puzzles! Feel free to revisit any of them,",
	"and then explore other areas after climbing the ladder back to the main room."
}
prof_q.areas.dj_bal_flip_ora_escape.success_chat_sent = false


-------- Room 3 (Level II)
prof_q.areas.toffoli_escape = {}
prof_q.areas.toffoli_escape.center_pos = {x = 208, y = 0, z = 62}
prof_q.areas.toffoli_escape.radius = 5
prof_q.areas.toffoli_escape.q_block_pos = {x = 204, y = 0, z = 58}
prof_q.areas.toffoli_escape.help_chat_msg = {
	"Now you'll experiment with a pattern commonly used in quantum computing algorithms,",
	"in which Z axis rotations are sandwiched between pairs of H gates."
}
prof_q.areas.toffoli_escape.help_chat_sent = false
prof_q.areas.toffoli_escape.help_success_msg = {
	"Well done! The H gates transformed changes in phase to changes in measurement",
	"probabilities.",
	"Congratulations on solving these circuit puzzles! Feel free to revisit any of them,",
	"and then explore other areas after climbing the ladder back to the main room."
}
prof_q.areas.toffoli_escape.success_chat_sent = false


-------- Room 4 (Level II)
prof_q.areas.toffoli_nand_escape = {}
prof_q.areas.toffoli_nand_escape.center_pos = {x = 208, y = 0, z = 72}
prof_q.areas.toffoli_nand_escape.radius = 5
prof_q.areas.toffoli_nand_escape.q_block_pos = {x = 212, y = 0, z = 76}
prof_q.areas.toffoli_nand_escape.help_chat_msg = {
	"Now you'll experiment with a pattern commonly used in quantum computing algorithms,",
	"in which Z axis rotations are sandwiched between pairs of H gates."
}
prof_q.areas.toffoli_nand_escape.help_chat_sent = false
prof_q.areas.toffoli_nand_escape.help_success_msg = {
	"Well done! The H gates transformed changes in phase to changes in measurement",
	"probabilities.",
	"Congratulations on solving these circuit puzzles! Feel free to revisit any of them,",
	"and then explore other areas after climbing the ladder back to the main room."
}
prof_q.areas.toffoli_nand_escape.success_chat_sent = false


-------- Room 5 (Level II)
prof_q.areas.or_escape = {}
prof_q.areas.or_escape.center_pos = {x = 208, y = 0, z = 82}
prof_q.areas.or_escape.radius = 5
prof_q.areas.or_escape.q_block_pos = {x = 204, y = 0, z = 86}
prof_q.areas.or_escape.help_chat_msg = {
	"Now you'll experiment with a pattern commonly used in quantum computing algorithms,",
	"in which Z axis rotations are sandwiched between pairs of H gates."
}
prof_q.areas.or_escape.help_chat_sent = false
prof_q.areas.or_escape.help_success_msg = {
	"Well done! The H gates transformed changes in phase to changes in measurement",
	"probabilities.",
	"Congratulations on solving these circuit puzzles! Feel free to revisit any of them,",
	"and then explore other areas after climbing the ladder back to the main room."
}
prof_q.areas.or_escape.success_chat_sent = false


-------- Room 6 (Level II)
prof_q.areas.nor_escape = {}
prof_q.areas.nor_escape.center_pos = {x = 218, y = 0, z = 82}
prof_q.areas.nor_escape.radius = 5
prof_q.areas.nor_escape.q_block_pos = {x = 222, y = 0, z = 78}
prof_q.areas.nor_escape.help_chat_msg = {
	"Now you'll experiment with a pattern commonly used in quantum computing algorithms,",
	"in which Z axis rotations are sandwiched between pairs of H gates."
}
prof_q.areas.nor_escape.help_chat_sent = false
prof_q.areas.nor_escape.help_success_msg = {
	"Well done! The H gates transformed changes in phase to changes in measurement",
	"probabilities.",
	"Congratulations on solving these circuit puzzles! Feel free to revisit any of them,",
	"and then explore other areas after climbing the ladder back to the main room."
}
prof_q.areas.nor_escape.success_chat_sent = false


-------- Room 7 (Level II)
prof_q.areas.toffoli_mixed_escape = {}
prof_q.areas.toffoli_mixed_escape.center_pos = {x = 218, y = 0, z = 92}
prof_q.areas.toffoli_mixed_escape.radius = 5
prof_q.areas.toffoli_mixed_escape.q_block_pos = {x = 214, y = 0, z = 96}
prof_q.areas.toffoli_mixed_escape.help_chat_msg = {
	"Now you'll experiment with a pattern commonly used in quantum computing algorithms,",
	"in which Z axis rotations are sandwiched between pairs of H gates."
}
prof_q.areas.toffoli_mixed_escape.help_chat_sent = false
prof_q.areas.toffoli_mixed_escape.help_success_msg = {
	"Well done! The H gates transformed changes in phase to changes in measurement",
	"probabilities.",
	"Congratulations on solving these circuit puzzles! Feel free to revisit any of them,",
	"and then explore other areas after climbing the ladder back to the main room."
}
prof_q.areas.toffoli_mixed_escape.success_chat_sent = false


-------- Room 8 (Level II)
prof_q.areas.superpos_logic_and_escape = {}
prof_q.areas.superpos_logic_and_escape.center_pos = {x = 208, y = 0, z = 92}
prof_q.areas.superpos_logic_and_escape.radius = 5
prof_q.areas.superpos_logic_and_escape.q_block_pos = {x = 212, y = 0, z = 88}
prof_q.areas.superpos_logic_and_escape.help_chat_msg = {
	"Now you'll experiment with a pattern commonly used in quantum computing algorithms,",
	"in which Z axis rotations are sandwiched between pairs of H gates."
}
prof_q.areas.superpos_logic_and_escape.help_chat_sent = false
prof_q.areas.superpos_logic_and_escape.help_success_msg = {
	"Well done! The H gates transformed changes in phase to changes in measurement",
	"probabilities.",
	"Congratulations on solving these circuit puzzles! Feel free to revisit any of them,",
	"and then explore other areas after climbing the ladder back to the main room."
}
prof_q.areas.superpos_logic_and_escape.success_chat_sent = false


-------- Room 9 (Level II)
prof_q.areas.and_3_operands_x_escape = {}
prof_q.areas.and_3_operands_x_escape.center_pos = {x = 198, y = 0, z = 92}
prof_q.areas.and_3_operands_x_escape.radius = 5
prof_q.areas.and_3_operands_x_escape.q_block_pos = {x = 194, y = -1, z = 88}
prof_q.areas.and_3_operands_x_escape.help_chat_msg = {
	"Now you'll experiment with a pattern commonly used in quantum computing algorithms,",
	"in which Z axis rotations are sandwiched between pairs of H gates."
}
prof_q.areas.and_3_operands_x_escape.help_chat_sent = false
prof_q.areas.and_3_operands_x_escape.help_success_msg = {
	"Well done! The H gates transformed changes in phase to changes in measurement",
	"probabilities.",
	"Congratulations on solving these circuit puzzles! Feel free to revisit any of them,",
	"and then explore other areas after climbing the ladder back to the main room."
}
prof_q.areas.and_3_operands_x_escape.success_chat_sent = false


-------- Room 10 (Level II) TODO: LEFT OFF COORDS HERE
prof_q.areas.and_not_3_operands_x_escape = {}
prof_q.areas.and_not_3_operands_x_escape.center_pos = {x = 218, y = 0, z = 72}
prof_q.areas.and_not_3_operands_x_escape.radius = 5
prof_q.areas.and_not_3_operands_x_escape.q_block_pos = {x = 215, y = 0, z = 70}
prof_q.areas.and_not_3_operands_x_escape.help_chat_msg = {
	"Now you'll experiment with a pattern commonly used in quantum computing algorithms,",
	"in which Z axis rotations are sandwiched between pairs of H gates."
}
prof_q.areas.and_not_3_operands_x_escape.help_chat_sent = false
prof_q.areas.and_not_3_operands_x_escape.help_success_msg = {
	"Well done! The H gates transformed changes in phase to changes in measurement",
	"probabilities.",
	"Congratulations on solving these circuit puzzles! Feel free to revisit any of them,",
	"and then explore other areas after climbing the ladder back to the main room."
}
prof_q.areas.and_not_3_operands_x_escape.success_chat_sent = false


-------- Room 11 (Level II)
prof_q.areas.phase_a_and_b_escape = {}
prof_q.areas.phase_a_and_b_escape.center_pos = {x = 218, y = 0, z = 72}
prof_q.areas.phase_a_and_b_escape.radius = 5
prof_q.areas.phase_a_and_b_escape.q_block_pos = {x = 215, y = 0, z = 70}
prof_q.areas.phase_a_and_b_escape.help_chat_msg = {
	"Now you'll experiment with a pattern commonly used in quantum computing algorithms,",
	"in which Z axis rotations are sandwiched between pairs of H gates."
}
prof_q.areas.phase_a_and_b_escape.help_chat_sent = false
prof_q.areas.phase_a_and_b_escape.help_success_msg = {
	"Well done! The H gates transformed changes in phase to changes in measurement",
	"probabilities.",
	"Congratulations on solving these circuit puzzles! Feel free to revisit any of them,",
	"and then explore other areas after climbing the ladder back to the main room."
}
prof_q.areas.phase_a_and_b_escape.success_chat_sent = false


-------- Room 12 (Level II)
prof_q.areas.superpos_phase_and_escape = {}
prof_q.areas.superpos_phase_and_escape.center_pos = {x = 218, y = 0, z = 72}
prof_q.areas.superpos_phase_and_escape.radius = 5
prof_q.areas.superpos_phase_and_escape.q_block_pos = {x = 215, y = 0, z = 70}
prof_q.areas.superpos_phase_and_escape.help_chat_msg = {
	"Now you'll experiment with a pattern commonly used in quantum computing algorithms,",
	"in which Z axis rotations are sandwiched between pairs of H gates."
}
prof_q.areas.superpos_phase_and_escape.help_chat_sent = false
prof_q.areas.superpos_phase_and_escape.help_success_msg = {
	"Well done! The H gates transformed changes in phase to changes in measurement",
	"probabilities.",
	"Congratulations on solving these circuit puzzles! Feel free to revisit any of them,",
	"and then explore other areas after climbing the ladder back to the main room."
}
prof_q.areas.superpos_phase_and_escape.success_chat_sent = false


-------- Room 13 (Level II)
prof_q.areas.phase_a_or_b_escape = {}
prof_q.areas.phase_a_or_b_escape.center_pos = {x = 218, y = 0, z = 72}
prof_q.areas.phase_a_or_b_escape.radius = 5
prof_q.areas.phase_a_or_b_escape.q_block_pos = {x = 215, y = 0, z = 70}
prof_q.areas.phase_a_or_b_escape.help_chat_msg = {
	"Now you'll experiment with a pattern commonly used in quantum computing algorithms,",
	"in which Z axis rotations are sandwiched between pairs of H gates."
}
prof_q.areas.phase_a_or_b_escape.help_chat_sent = false
prof_q.areas.phase_a_or_b_escape.help_success_msg = {
	"Well done! The H gates transformed changes in phase to changes in measurement",
	"probabilities.",
	"Congratulations on solving these circuit puzzles! Feel free to revisit any of them,",
	"and then explore other areas after climbing the ladder back to the main room."
}
prof_q.areas.phase_a_or_b_escape.success_chat_sent = false


-------- Room 14 (Level II)
prof_q.areas.phase_a_and_b_no_z_escape = {}
prof_q.areas.phase_a_and_b_no_z_escape.center_pos = {x = 218, y = 0, z = 72}
prof_q.areas.phase_a_and_b_no_z_escape.radius = 5
prof_q.areas.phase_a_and_b_no_z_escape.q_block_pos = {x = 215, y = 0, z = 70}
prof_q.areas.phase_a_and_b_no_z_escape.help_chat_msg = {
	"Now you'll experiment with a pattern commonly used in quantum computing algorithms,",
	"in which Z axis rotations are sandwiched between pairs of H gates."
}
prof_q.areas.phase_a_and_b_no_z_escape.help_chat_sent = false
prof_q.areas.phase_a_and_b_no_z_escape.help_success_msg = {
	"Well done! The H gates transformed changes in phase to changes in measurement",
	"probabilities.",
	"Congratulations on solving these circuit puzzles! Feel free to revisit any of them,",
	"and then explore other areas after climbing the ladder back to the main room."
}
prof_q.areas.phase_a_and_b_no_z_escape.success_chat_sent = false


-------- Room 15 (Level II)
prof_q.areas.phase_a_and_b_and_c_escape = {}
prof_q.areas.phase_a_and_b_and_c_escape.center_pos = {x = 218, y = 0, z = 72}
prof_q.areas.phase_a_and_b_and_c_escape.radius = 5
prof_q.areas.phase_a_and_b_and_c_escape.q_block_pos = {x = 215, y = 0, z = 70}
prof_q.areas.phase_a_and_b_and_c_escape.help_chat_msg = {
	"Now you'll experiment with a pattern commonly used in quantum computing algorithms,",
	"in which Z axis rotations are sandwiched between pairs of H gates."
}
prof_q.areas.phase_a_and_b_and_c_escape.help_chat_sent = false
prof_q.areas.phase_a_and_b_and_c_escape.help_success_msg = {
	"Well done! The H gates transformed changes in phase to changes in measurement",
	"probabilities.",
	"Congratulations on solving these circuit puzzles! Feel free to revisit any of them,",
	"and then explore other areas after climbing the ladder back to the main room."
}
prof_q.areas.phase_a_and_b_and_c_escape.success_chat_sent = false


-------- Room 16 (Level II)
prof_q.areas.a_or_b_and_c_escape = {}
prof_q.areas.a_or_b_and_c_escape.center_pos = {x = 218, y = 0, z = 72}
prof_q.areas.a_or_b_and_c_escape.radius = 5
prof_q.areas.a_or_b_and_c_escape.q_block_pos = {x = 215, y = 0, z = 70}
prof_q.areas.a_or_b_and_c_escape.help_chat_msg = {
	"Now you'll experiment with a pattern commonly used in quantum computing algorithms,",
	"in which Z axis rotations are sandwiched between pairs of H gates."
}
prof_q.areas.a_or_b_and_c_escape.help_chat_sent = false
prof_q.areas.a_or_b_and_c_escape.help_success_msg = {
	"Well done! The H gates transformed changes in phase to changes in measurement",
	"probabilities.",
	"Congratulations on solving these circuit puzzles! Feel free to revisit any of them,",
	"and then explore other areas after climbing the ladder back to the main room."
}
prof_q.areas.a_or_b_and_c_escape.success_chat_sent = false
-- END Escape room puzzles Level II ---------------------------------------------


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


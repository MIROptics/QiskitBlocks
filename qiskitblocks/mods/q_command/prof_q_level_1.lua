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
Elements of the prof_q table that supply information about areas in the game,
used by Professor Q to interact with the player
--]]

-- Escape room puzzles Level I -------------------------------------------------
-------- Room 1 (Level I)
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

prof_q.areas.x_gate_escape.help_btn_text = {}
prof_q.areas.x_gate_escape.help_btn_text.en =
[[
TLDR: Most of the help that you'll need for these 'escape room' circuit
puzzles will appear in the chat area (upper left corner of your window)
by Professor Q. For all of these puzzles, get blocks from the chest and
place them on the circuit. The door to the next room will open when the
liquid levels and arrows in the blue blocks correspond to the quantum
state displayed on the wall behind the circuit in Dirac notation. The
Bloch sphere at the end of each wire estimates the state of its qubit,
and right-clicking it performs a measurement of the circuit.
----

This circuit, consisting of only one wire, leverages the X gate, also
known as the Pauli-X, NOT, or bit-flip, gate. Its effect on the |0>
state is to make it |1>, and vice-versa. To work through this puzzle,
take the following steps:

1) Notice that the blue liquid indicates there is a 100% probability
that the result will be |0> when the circuit is measured. Go ahead and
right-click the measurement block several times to verify that |0> is
always the result.

2) Get an X block out of the chest.

3) While wielding the X block, position the cursor on the empty place
on the circuit wire, and right-click.

4) Notice that the blue liquid now indicates there is a 100% probability
that the result will be |1> when the circuit is measured. Go ahead and
right-click the measurement block several times to verify that |1> is
always the result.

If the Q block turned gold, congratulations on solving the puzzle!
]]
prof_q.areas.x_gate_escape.help_btn_text.es = prof_q.areas.x_gate_escape.help_btn_text.en
prof_q.areas.x_gate_escape.help_btn_text.ja = prof_q.areas.x_gate_escape.help_btn_text.en
prof_q.areas.x_gate_escape.help_btn_caption = "Make quantum state of |1>"


-------- Room 2 (Level I)
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

prof_q.areas.x_gates_2_wire.help_btn_text = {}
prof_q.areas.x_gates_2_wire.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to a quantum state of |10>
Measure the circuit several times as extra validation of the correct solution.
----

This circuit, consisting of two wires, demonstrates that one or more X
gates may be leveraged to create a classical state. To work through this
puzzle, take the following steps:

1) Notice that the blue liquid indicates there is a 100% probability
that the result will be |00> when the circuit is measured. Go ahead and
right-click the measurement block several times to verify that |00> is
always the result.

2) Get an X block out of the chest.

3) While wielding the X block, position the cursor on the circuit wire
corresponding to each |1> qubit in the desired measurement result, and
right-click. Note that the bottom-most wire corresponds to the left-most
qubit.

4) Notice that the blue liquid now indicates there is a 100% probability
that the result will be |10> when the circuit is measured. Go ahead and
right-click the measurement block several times to verify that |10> is
always the result.

If the Q block turned gold, congratulations on solving the puzzle!
]]
prof_q.areas.x_gates_2_wire.help_btn_text.es = prof_q.areas.x_gates_2_wire.help_btn_text.en
prof_q.areas.x_gates_2_wire.help_btn_text.ja = prof_q.areas.x_gates_2_wire.help_btn_text.en
prof_q.areas.x_gates_2_wire.help_btn_caption = "Make quantum state of |10>"


-------- Room 3 (Level I)
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

prof_q.areas.x_gates_3_wire.help_btn_text = {}
prof_q.areas.x_gates_3_wire.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to a quantum state of |011>
The exit door is behind the circuit, so use the ladder.
----

This circuit, consisting of three wires, demonstrates that one or more X
gates may be leveraged to create a classical state. To work through this
puzzle, take the following steps:

1) Notice that the blue liquid indicates there is a 100% probability
that the result will be |000> when the circuit is measured. Go ahead and
right-click the measurement block several times to verify that |000> is
always the result.

2) Get an X block out of the chest.

3) While wielding the X block, position the cursor on the circuit wire
corresponding to each |1> qubit in the desired measurement result, and
right-click. Note that the bottom-most wire corresponds to the left-most
qubit.

4) Notice that the blue liquid now indicates there is a 100% probability
that the result will be |011> when the circuit is measured. Go ahead and
right-click the measurement block several times to verify that |011> is
always the result.

If the Q block turned gold, congratulations on solving the puzzle!
]]
prof_q.areas.x_gates_3_wire.help_btn_text.es = prof_q.areas.x_gates_3_wire.help_btn_text.en
prof_q.areas.x_gates_3_wire.help_btn_text.ja = prof_q.areas.x_gates_3_wire.help_btn_text.en
prof_q.areas.x_gates_3_wire.help_btn_caption = "Make quantum state of |011>"


-------- Room 4 (Level I)
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

prof_q.areas.h_gate_escape.help_btn_text = {}
prof_q.areas.h_gate_escape.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to a quantum state of
sqrt(1/2) |0> + sqrt(1/2) |1>, which is commonly referred to as |+>
----

This circuit, consisting of only one wire, leverages the H gate, also
known as the the Hadamard gate. Its effect on the |0> state is to put it
into an equal superposition of |0> and |1>. Therefore, when the qubit is
measured, there is a 50% probability that the result will be |0>, and a
50% probability that the result will be |1>. To work through this
puzzle, take the following steps:

1) Notice that the blue liquid indicates there is a 100% probability
that the result will be |0> when the circuit is measured. Go ahead and
right-click the measurement block several times to verify that |0> is
always the result.

2) Get an H block out of the chest.

3) While wielding the H block, position the cursor on the empty place
on the circuit wire, and right-click.

4) Notice that the blue liquid now indicates there is a 50% probability
that the result will be |0> when the circuit is measured, and a 50%
probability that the result will be |1> when the circuit is measured. Go
ahead and right-click the measurement block several times to verify that
the results are fairly evenly distributed between |0> and |1>.

If the Q block turned gold, congratulations on solving the puzzle!
]]
prof_q.areas.h_gate_escape.help_btn_text.es = prof_q.areas.h_gate_escape.help_btn_text.en
prof_q.areas.h_gate_escape.help_btn_text.ja = prof_q.areas.h_gate_escape.help_btn_text.en
prof_q.areas.h_gate_escape.help_btn_caption = "Make a quantum state of |+>"


-------- Room 5 (Level I)
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

prof_q.areas.h_x_gate.help_btn_text = {}
prof_q.areas.h_x_gate.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to a quantum state of
sqrt(1/2) |0> - sqrt(1/2) |1>, which is commonly referred to as |->
----

This circuit, consisting of only one wire, demonstrates that the order
of gates on a wire often matters. It also show that the basis states in
a quantum state may have different phases. To work through this puzzle,
take the following steps:

1) Notice that the blue liquid indicates there is a 100% probability
that the result will be |0> when the circuit is measured. Go ahead and
right-click the measurement block several times to verify that |0> is
always the result.

2) Get an H block and an X block out of the chest, placing both on the
circuit.

3) The solution will have probabilities indicating that measurement
results |0> and |1> are equally likely, as well has having opposite
phases. The notation for a phase on these block-world circuits is an
arrow that points in a direction signifying its counterclockwise
rotation, from 0 radians pointing rightward. As an example, a leftward
pointing arrow signifies a phase of pi radians.

4) The blue liquid should indicate there is a 50% probability that the
result will be |0> when the circuit is measured, and a 50% probability
that the result will be |1> when the circuit is measured. Go ahead and
right-click the measurement block several times to verify that the
results are fairly evenly distributed between |0> and |1>.

If the Q block turned gold, congratulations on solving the puzzle!
]]
prof_q.areas.h_x_gate.help_btn_text.es = prof_q.areas.h_x_gate.help_btn_text.en
prof_q.areas.h_x_gate.help_btn_text.ja = prof_q.areas.h_x_gate.help_btn_text.en
prof_q.areas.h_x_gate.help_btn_caption = "Make a quantum state of |->"


-------- Room 6 (Level I)
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

prof_q.areas.h_z_gate.help_btn_text = {}
prof_q.areas.h_z_gate.help_btn_text.en =
[[
TLDR: Using a Z gate and one other gate, make the blue liquid levels
correspond to a quantum state of sqrt(1/2) |0> - sqrt(1/2) |1>, which is
commonly referred to as |->
----

This circuit, consisting of only one wire, demonstrates how a block
sphere models the state of a qubit. To work through this puzzle, take
the following steps:

1) Notice that instead of the usual measurement block, this circuit has
a (very pixelated) Bloch sphere. You can read more about this Bloch
sphere in the building you started in when first playing this game.

2) Get an H block and a Z block out of the chest, placing them on the
circuit. As you place each one, notice how the Bloch sphere changes,
reflecting the updated state of the qubit. Try placing them in a
different order, noticing the effects on the Bloch sphere and liquid
blocks.

3) The solution will have probabilities indicating that measurement
results |0> and |1> are equally likely, as well has having opposite
phases. Note that both the Bloch sphere, and the blue liquid blocks,
reflect these probabilities and phases.

If the Q block turned gold, congratulations on solving the puzzle!
]]
prof_q.areas.h_z_gate.help_btn_text.es = prof_q.areas.h_z_gate.help_btn_text.en
prof_q.areas.h_z_gate.help_btn_text.ja = prof_q.areas.h_z_gate.help_btn_text.en
prof_q.areas.h_z_gate.help_btn_caption = "Make a quantum state of |-> using gates including Z"


-------- Room 7 (Level I)
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

prof_q.areas.hxx_gates_escape.help_btn_text = {}
prof_q.areas.hxx_gates_escape.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to a quantum state of
sqrt(1/2) |001> + sqrt(1/2) |101>
----

This circuit leverages Hadamard and X gates to create a quantum state in
which the measurement results |001> and |101> are equally likely, and no
other measurement results are possible. This quantum state could be
expressed as |001> + |101>

To solve this circuit puzzle, place an H gate and an X gate on the
appropriate wires.

Hint: Use what you already have learned about the behaviors of H and X
gates on single-wire circuits.

If the Q block turned gold, congratulations on solving the puzzle!
]]
prof_q.areas.hxx_gates_escape.help_btn_text.es = prof_q.areas.hxx_gates_escape.help_btn_text.en
prof_q.areas.hxx_gates_escape.help_btn_text.ja = prof_q.areas.hxx_gates_escape.help_btn_text.en
prof_q.areas.hxx_gates_escape.help_btn_caption = "Make |001> + |101> quantum state"


-------- Room 8 (Level I)
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

prof_q.areas.equal_super_2wire_escape.help_btn_text = {}
prof_q.areas.equal_super_2wire_escape.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to the following quantum
state, commonly referred to as an equal superposition:
sqrt(1/4) |00> + sqrt(1/4) |01> + sqrt(1/4) |10> + sqrt(1/4) |11>
----

This circuit leverages two Hadamard gates to create an equal
superposition of |00>, |01>, |10>, and |11>. To solve this circuit
puzzle, place an H block on each wire. Notice how the outcome
probabilities and measurement results change as these gates are removed
and added. This pattern of placing an H gate on each wire of a circuit
is commonly used to create a superposition consisting of 2^numQubits
states.

If the Q block turned gold, congratulations on solving the puzzle!
]]
prof_q.areas.equal_super_2wire_escape.help_btn_text.es = prof_q.areas.equal_super_2wire_escape.help_btn_text.en
prof_q.areas.equal_super_2wire_escape.help_btn_text.ja = prof_q.areas.equal_super_2wire_escape.help_btn_text.en
prof_q.areas.equal_super_2wire_escape.help_btn_caption = "Equal superposition with two qubits"


-------- Room 9 (Level I)
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

prof_q.areas.equal_super_3wire_escape.help_btn_text = {}
prof_q.areas.equal_super_3wire_escape.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to an equal superposition
of its eight basis states.
----

This circuit leverages two Hadamard gates to create an equal
superposition of |000>, |001>, |010>, |011>, |100>, |101>, |110> and
|111>. A convenient way to express this state is to use the math sum
symbol as shown on the wall. To solve this circuit puzzle, place an H
block on each wire. Notice how the outcome probabilities and measurement
results change as these gates are removed and added. This pattern of
placing an H gate on each wire of a circuit is commonly used to create a
superposition consisting of 2^numQubits states.

If the Q block turned gold, congratulations on solving the puzzle!
]]
prof_q.areas.equal_super_3wire_escape.help_btn_text.es = prof_q.areas.equal_super_3wire_escape.help_btn_text.en
prof_q.areas.equal_super_3wire_escape.help_btn_text.ja = prof_q.areas.equal_super_3wire_escape.help_btn_text.en
prof_q.areas.equal_super_3wire_escape.help_btn_caption = "Equal superposition with three qubits"


-------- Room 10 (Level I)
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

prof_q.areas.bell_phi_plus_escape.help_btn_text = {}
prof_q.areas.bell_phi_plus_escape.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to a quantum state of
sqrt(1/2) |00> + sqrt(1/2) |11> which is referred to as the phi+ Bell
state.
----

The four simplest examples of quantum entanglement are the Bell states.
The most well-known Bell state, symbolized by phi+, may be
realized with a Hadamard gate and a CNOT gate. The CNOT gate is a
two-wire gate that has the appearance of cross-hairs and a vertical line
with a dot. The cross-hairs symbol has the functionality of the X gate,
with the difference being that it is conditional on the state of the
other wire, performing the NOT operation whenever the other wire is |1>.

Measuring one of the qubits results in the measured state of the other
qubit to be determined. A correct phi+ Bell state solution will have
probabilities indicating that measurement results |00> and |11> are
equally likely, as well has having identical phases. The notation for a
phase on these block-world circuits is an arrow that points in a
direction signifying its counterclockwise rotation, from 0 radians
pointing rightward.

One way to realize this state is to place a Hadamard gate on the top
wire, and an X gate on the second wire in a column to the right of the
Hadamard gate. Then select the control tool from the hotbar (after
having retrieved it from the chest). While positioning the cursor on the
X gate in the circuit, left-click until the control qubit is on the same
wire as the Hadamard gate.

If the Q block turned gold, congratulations on solving the puzzle!
]]
prof_q.areas.bell_phi_plus_escape.help_btn_text.es = prof_q.areas.bell_phi_plus_escape.help_btn_text.en
prof_q.areas.bell_phi_plus_escape.help_btn_text.ja = prof_q.areas.bell_phi_plus_escape.help_btn_text.en
prof_q.areas.bell_phi_plus_escape.help_btn_caption = "Make the phi+ Bell state"


-------- Room 11 (Level I)
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

prof_q.areas.bell_phi_minus_escape.help_btn_text = {}
prof_q.areas.bell_phi_minus_escape.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to a quantum state of
sqrt(1/2) |00> - sqrt(1/2) |11> which is referred to as the phi- Bell
state.
----

The four simplest examples of quantum entanglement are the Bell states.
One of these Bell states, symbolized by phi- (phi minus), may be realized
by placing an X gate on the top wire, and adding the phi+ Bell state
circuit (as instructed in another puzzle) to the right of the X gate.

Measuring one of the qubits results in the measured state of the other
qubit to be determined. A correct phi- Bell state solution will have
probabilities indicating that measurement results |00> and |11> are
equally likely, as well has having opposite phases. The notation for a
phase on these block-world circuits is an arrow that points in a
direction signifying its counterclockwise rotation, from 0 radians
pointing rightward. As an example, a leftward pointing arrow signifies a
phase of pi radians.

If the Q block turned gold, congratulations on solving the puzzle!
]]
prof_q.areas.bell_phi_minus_escape.help_btn_text.es = prof_q.areas.bell_phi_minus_escape.help_btn_text.en
prof_q.areas.bell_phi_minus_escape.help_btn_text.ja = prof_q.areas.bell_phi_minus_escape.help_btn_text.en
prof_q.areas.bell_phi_minus_escape.help_btn_caption = "Make the phi- Bell state"


-------- Room 12 (Level I)
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

prof_q.areas.bell_psi_plus_escape.help_btn_text = {}
prof_q.areas.bell_psi_plus_escape.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to a quantum state of
sqrt(1/2) |01> + sqrt(1/2) |10> which is referred to as the psi+ Bell
state.
----

The four simplest examples of quantum entanglement are the Bell states.
One of these Bell states, symbolized by psi+ (psi plus), may be realized
by placing an X gate on the second wire, and adding the phi+ Bell state
circuit (as instructed in another puzzle) to the right of the X gate,

Measuring one of the qubits results in the measured state of the other
qubit to be determined. A correct psi+ Bell state solution will have
probabilities indicating that measurement results |01> and |10> are
equally likely, as well has having identical phases. The notation for a
phase on these block-world circuits is an arrow that points in a
direction signifying its counterclockwise rotation, from 0 radians
pointing rightward. The psi+ Bell state is known as one of the singlet
states, where measuring one of the qubits determines that the other
qubit will be measured as the opposite state.

If the Q block turned gold, congratulations on solving the puzzle!
]]
prof_q.areas.bell_psi_plus_escape.help_btn_text.es = prof_q.areas.bell_psi_plus_escape.help_btn_text.en
prof_q.areas.bell_psi_plus_escape.help_btn_text.ja = prof_q.areas.bell_psi_plus_escape.help_btn_text.en
prof_q.areas.bell_psi_plus_escape.help_btn_caption = "Make the psi+ Bell state"


-------- Room 13 (Level I)
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

prof_q.areas.bell_psi_minus_escape.help_btn_text = {}
prof_q.areas.bell_psi_minus_escape.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to a quantum state of
sqrt(1/2) |01> - sqrt(1/2) |10> which is referred to as the psi- Bell
state.
----

The four simplest examples of quantum entanglement are the Bell states.
One of these Bell states, symbolized by psi- (psi minus), may be realized
by placing an X gate on the second wire, adding the phi+ Bell state
circuit (as instructed in another puzzle) to the right of the X gate,
and adding a Z gate to the second wire after the phi+ Bell state circuit.

Measuring one of the qubits results in the measured state of the other
qubit to be determined. A correct psi- Bell state solution will have
probabilities indicating that measurement results |01> and |10> are
equally likely, as well has having opposite phases. The notation for a
phase on these block-world circuits is an arrow that points in a
direction signifying its counterclockwise rotation, from 0 radians
pointing rightward. As an example, a leftward pointing arrow signifies a
phase of pi radians. The psi- Bell state is known as one of the singlet
states, where measuring one of the qubits determines that the other
qubit will be measured as the opposite state.

If the Q block turned gold, congratulations on solving the puzzle!
]]
prof_q.areas.bell_psi_minus_escape.help_btn_text.es = prof_q.areas.bell_psi_minus_escape.help_btn_text.en
prof_q.areas.bell_psi_minus_escape.help_btn_text.ja = prof_q.areas.bell_psi_minus_escape.help_btn_text.en
prof_q.areas.bell_psi_minus_escape.help_btn_caption = "Make the psi- Bell state"


-------- Room 14 (Level I)
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

prof_q.areas.ghz_state_escape.help_btn_text = {}
prof_q.areas.ghz_state_escape.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to a quantum state of
sqrt(1/2) |000> - sqrt(1/2) |111> which is referred to as the GHZ state.
----

GHZ (Greenberger–Horne–Zeilinger) states are entangled states involving
three or more qubits, where the basis states involved contain all zeros
or all ones. For example, the entangled state in this three-wire circuit
puzzle has equal probabilities of being measured as |000> and |111>.
Please refer to the Bell state circuit puzzles for more information on
entanglement.

One way to realize this state is to place a Hadamard gate on the top
wire, and an X gate on the second wire in a column to the right of the
Hadamard gate. Then select the control tool from the hotbar (after
having retrieved it from the chest). While positioning the cursor on the
X gate in the circuit, convert it to a CNOT gate by left-clicking, until
the control qubit is on the same wire as the Hadamard gate. Repeat this
process to place another CNOT gate whose X gate is on the third wire and
control qubit is on the top wire.

Note that measuring the circuit (by right-clicking the measurement
blocks) results in either |000> or |111> each time.

If the Q block turned gold, congratulations on solving the puzzle!
]]
prof_q.areas.ghz_state_escape.help_btn_text.es = prof_q.areas.ghz_state_escape.help_btn_text.en
prof_q.areas.ghz_state_escape.help_btn_text.ja = prof_q.areas.ghz_state_escape.help_btn_text.en
prof_q.areas.ghz_state_escape.help_btn_caption = "Make the GHZ state"


-------- Room 15 (Level I)
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

prof_q.areas.y_z_rot_1wire_escape.help_btn_text = {}
prof_q.areas.y_z_rot_1wire_escape.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to the following quantum
state:
sqrt(0.85) |0> + sqrt(0.15) e^i pi/2 |1>
----

This circuit leverages Ry and Rz gates to create a state that has approx
85% probability of measuring |0> and approx 15% probability of measuring
|1>. The latter basis states has a phase of pi/2. To solve this
circuit puzzle, place Ry and Rz gates on the wire, and change their
rotation angles by left and right-clicking the rotate tool until the
desired state is achieved.

If the Q block turned gold, congratulations on solving the puzzle!
]]
prof_q.areas.y_z_rot_1wire_escape.help_btn_text.es = prof_q.areas.y_z_rot_1wire_escape.help_btn_text.en
prof_q.areas.y_z_rot_1wire_escape.help_btn_text.ja = prof_q.areas.y_z_rot_1wire_escape.help_btn_text.en
prof_q.areas.y_z_rot_1wire_escape.help_btn_caption = "Rotate a qubit into a desired state"


-------- Room 16 (Level I)
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

prof_q.areas.phase_rot_2wire_escape.help_btn_text = {}
prof_q.areas.phase_rot_2wire_escape.help_btn_text.en =
[[
TLDR: Make the blue liquid levels correspond to the following quantum
state:
sqrt(1/4) |00> + sqrt(1/4) e^i pi/2 |01> +
sqrt(1/4) e^i 3pi/2 |10> + sqrt(1/4) |11>
----

This circuit leverages Hadamard gates and Rz gates to create a state
that has equal probabilities of measuring |00>, |01>, |10> and |11>,
with these basis states having various phase rotations. To solve this
circuit puzzle, place an Rz between two H blocks on each wire. Then
rotate the Rx gated by left and right-clicking them until the desired
state is achieved. Notice that phase (Z axis) rotations that you apply
become rotations on the X axis when sandwiched in-between Hadamard gates,
converting changes in phase to changes in measurement probabilities.

If the Q block turned gold, congratulations on solving the puzzle!
]]
prof_q.areas.phase_rot_2wire_escape.help_btn_text.es = prof_q.areas.phase_rot_2wire_escape.help_btn_text.en
prof_q.areas.phase_rot_2wire_escape.help_btn_text.ja = prof_q.areas.phase_rot_2wire_escape.help_btn_text.en
prof_q.areas.phase_rot_2wire_escape.help_btn_caption = "Convert phase rotations into measurement probabilities"
-- END Escape room puzzles Level I ---------------------------------------------


tutorial = {}

-- == DEBUG SETTINGS ==
-- If true, item spawner nodes become visible and pointable.
local edit_item_spawners = minetest.settings:get_bool("tutorial_debug_edit_item_spawners")

-- == END OF DEBUG SETTINGS ==

-- intllib support
local S
if (minetest.get_modpath("intllib")) then
	S = intllib.Getter()
else
  S = function ( s ) return s end
end

-- Saves tutorial state into file
function tutorial.save_state()
	local str = minetest.serialize(tutorial.state)
	local filepath = minetest.get_worldpath().."/tutorialdata.mt"
	local file = io.open(filepath, "w+")
	if(file) then
		file:write(str)
		minetest.log("action", "[tutorial] Tutorial state has been written into "..filepath..".")
	else
		minetest.log("error", "[tutorial] An attempt to save the tutorial state into "..filepath.." failed.")
	end
	io.close(file)
end


-- load tutorial state from file

local filepath = minetest.get_worldpath().."/tutorialdata.mt"
local file = io.open(filepath, "r")
local read = false
if file then
	local string = file:read()
	io.close(file)
	if(string ~= nil) then
		tutorial.state = minetest.deserialize(string)
		minetest.log("action", "[tutorial] Tutorial state has been read from "..filepath..".")
		read = true
	end
end
if(read==false) then
	tutorial.state = {}

	-- Is this the first time the player joins this tutorial? (used for spawn position)
	tutorial.state.first_join = true
	-- Has the regular introduction text been shown yet?
	tutorial.state.intro_text = false
	-- These variables store wheather a message for those events has been shown yet.
	tutorial.state.first_gold = false
	tutorial.state.last_gold = false
	tutorial.state.first_diamond = false
	tutorial.state.last_diamond = false
end

function tutorial.convert_newlines(str)
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

function tutorial.register_infosign(itemstringpart, caption, fulltext)
	tutorial.captions[itemstringpart] = caption
	minetest.register_node("tutorial:sign_"..itemstringpart, {
		description = string.format(S("tutorial sign '%s'"), S(caption)),
		drawtype = "signlike",
		tiles = {"default_sign_wall.png"},
		inventory_image = "default_sign_wall.png",
		wield_image = "default_sign_wall.png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		selection_box = { type = "wallmounted" },
		groups = {creative_breakable=1,attached_node=1,tutorial_sign=1},
		legacy_wallmounted = true,
		sounds = default.node_sound_defaults(),
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			local formspec = ""..
			"size[12,6]"..
			"label[-0.15,-0.4;"..minetest.formspec_escape(S(caption)).."]"..
			"tablecolumns[text]"..
			"tableoptions[background=#000000;highlight=#000000;border=false]"..
			"table[0,0.25;12,5.2;infosign_text;"..
			tutorial.convert_newlines(minetest.formspec_escape(S(fulltext)))..
			"]"..
			"button_exit[4.5,5.5;3,1;close;"..minetest.formspec_escape(S("Close")).."]"
			meta:set_string("formspec", formspec)
			meta:set_string("infotext", string.format(S("%s (Right-click to read)"), S(caption)))
			meta:set_string("id", itemstringpart)
			meta:set_string("caption", caption)
		end
	})
end

minetest.register_abm( {
	nodenames = {"group:tutorial_sign"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
		local id = meta:get_string("id")
		local caption = tutorial.captions[id]
		local formspec = ""..
			"size[12,6]"..
			"label[-0.15,-0.4;"..minetest.formspec_escape(S(caption)).."]"..
			"tablecolumns[text]"..
			"tableoptions[background=#000000;highlight=#000000;border=false]"..
			"table[0,0.25;12,5.2;infosign_text;"..
			tutorial.convert_newlines(minetest.formspec_escape(S(tutorial.texts[id])))..
			"]"..
			"button_exit[4.5,5.5;3,1;close;"..minetest.formspec_escape(S("Close")).."]"
			meta:set_string("formspec", formspec)
			meta:set_string("infotext", string.format(S("%s (Right-click to read)"), S(caption)))

	end }
)


-- Number of gold ingots/lumps
tutorial.gold = 13

-- Number of hidden diamonds
tutorial.diamonds = 12



tutorial.texts = {}

-- QC Intro content
tutorial.texts.qc_bell_states =
[[This will be info on Bell states
]]

tutorial.texts.qc_not_gate_cats =
[[This will explain the quantum version of a NOT gate. This will then
ask the user to get an X block out of the chest and place it on the circuit,
right-clicking the measure block to see effect of the X gate.
]]
-- End QC Intro content

tutorial.texts.intro =
[[Welcome! This tutorial will teach you the most crucial basics of Minetest.
This tutorial assumes that you have not changed the default keybindings yet.

Let's start for the most important keybindings right now:

   Look around: Move the mouse
   Walk forwards: [W]
   Strafe left: [A]
   Walk backwards: [S]
   Strafe right: [D]
   Action: [Right mouse button]
  Pause menu (you can exit the game here): [Esc]

You will find signs with more introductionary texts throughout this tutorial.
The "action" key has many uses. For now, let's just say you need it to read
the signs. Look at one and right-click it to read it.

To look at a sign, make sure you are close enough to it and the crosshair in the
center of the screen points directly on the sign.

You can exit the tutorial at any time, the world will be automatically saved.

Now feel free to walk around a bit and read the other signs to learn more.]]

tutorial.texts.minetest =
[[Minetest itself is not a game, it is a game engine.
To be able to actually play it, you need something called a "game".

Don't worry, Minetest comes pre-installed with a rather simple default game,
called "Minetest Game".

This tutorial teaches you the basics of Minetest (the engine), things which are true for
all games. This tutorial does not teach you how to play a particular game, not
even the default one.]]

tutorial.texts.subgame =
[[Now since you probably now the basics, you may want to actually play or build something.
Minetest comes bundled with a default game, which you may try out now.
Sadly, there is currently no tutorial for the default game.
You may want to read the "Getting Started" section of the Community Wiki,
which is more specific about the default game.
Said document can be found at:

<https://wiki.minetest.net/Getting_Started>

Alternatively, you may check out one of the games which are shared on the Minetest forums.]]


tutorial.texts.creative =
[[The creative mode is turned on. If you are here to learn how to play Minetest,
you should probably leave now, turn creative mode off and restart the
tutorial.

Roughly spoken, creative mode is for messing around with the game without
the normal gameplay restraints.

You can leave now by pressing "Leave tutorial", or later, by pressing [Esc].]]

tutorial.texts.notsingleplayer =
[[You are now playing the tutorial in multiplayer mode.
But this tutorial is optimized for the singleplayer mode.
This tutorial does not work properly with more than 1 player.

Unless you are sure no other players will join, you should
leave now and start the tutorial in singleplayer mode.]]

tutorial.texts.cam =
[=[Minetest has 3 different views which determine the way you see the world.
The three modes are:

- First-person view (default)
- Third-person view from behind
- Third-person view from the front

You can change the camera mode by pressing [F7] (but you have to close this
window first).

   Switch camera mode: [F7]]=]

tutorial.texts.minimap =
[=[Press the [F9] key to make a minimap appear on the top right.
The minimap helps you to find your way around the world.
Press it again to toggle through different minimap modes and zoom levels.

There are 2 minimap modes and 3 zoom levels.

Surface mode is a top-down view of the world, roughly resembling the
colors of the blocks this world is made on. It only shows the topmost
blocks, everything below is hidden, like a satellite photo. Surface
mode is useful if you got lost.

Radar mode is more complicated. It displays the "denseness" of the area
around you and changes with your height. Roughly, the more green an
area is, the less "dense" it is. Black areas have many blocks. Use
the radar to find caverns, hidden areas, walls and more. Currently,
radar mode does not work in the tutorial. Sorry, you have to try it
out in games.

There are also two different direction modes. Normally, "up" on the minimap
is always pointing to the North. But if you press [Shift]+[F9], the minimap
will instead rotate with your looking direction, so "up" is always your
looking direction.

In some games, the minimap may be disabled.

   Toggle minimap mode: [F9]
   Toggle minimap rotating: [Shift]+[F9]]=]

tutorial.texts.blocks =
[[The world of Minetest is made entirely out of blocks, or voxels, to be precise.
Blocks can be added or removed with the correct tools.

In this section, we'll show you a few special but common blocks which behave in unexpected,
ways.,

Of course, games can come up with more special weird blocks.]]

tutorial.texts.falling_node =
[[Some blocks need to rest on top of another block, otherwise, they fall down.
Try it and mine the block below the uppermost block.]]

tutorial.texts.attached_node =
[[Some blocks have to be attached to another block, otherwise, they drop as an item
as if you would have mined it.

Attached here is a picture frame. You can't collect or mine it directly, but if you mine
the block it is attached to, it will drop as an item which you can collect.]]

tutorial.texts.disable_jump =
[[These nasty blocks on the floor prevent you from jumping when you stand on them.]]

tutorial.texts.bouncy =
[[Whee! The blocks will make you bounce if you jump on them. They also can bounce
you from the side, if you are fast enough.]]

tutorial.texts.runover =
[[This abyss behind this sign is so small that you can even walk over it,
as long as you don't stop midway. But you can jump over it anyways, just to be,
safe.]]

tutorial.texts.jumpup =
[[You can't reach this upper block by walking. But luckily, you are able to jump.
For our purposes, you can jump just high enough to reach one block above you.
But you can't two blocks high.
Press the space bar once to jump at a constant height.

   Jump: [Space]

Now try it to continue.]]


tutorial.texts.jumpover =
[=[Here is a slightly larger abyss. Luckily, you can also jump just far enough to
cross a gap of this width. Don't worry, the abyss is not deep enough to hurt you
when you fall down. There are stairs which lead back up here.

   Jump: [Space]]=]

tutorial.texts.orientation =
[[From this point on, there will be branching paths. For orientation, we placed
some arrow signs. They just show a short text when you hover them, that's all.

You don't have to follow the sections in any particular order, with one exception,
for which you will be informed.]]

tutorial.texts.sneak =
[=[Sneaking is a special move. As long as you sneak, you walk slower, but you are
guaranteed to not accidentally fall off the edge of a block. This also allows you to
"lean over" in a sense.
To sneak, keep the sneak key pressed. As soon as you release the sneak key,
you walk at normal speed again. Be careful not releasing the sneak key when you
are at a ledge, you might fall!

   Sneak: [Shift]

Keep in mind that the [Shift] key is used for a large number of other things in Minetest.
Sneaking only works when you are not in a liquid, stand on solid ground and are not at a
ladder.

You may try out sneaking at this little blocky pyramid.]=]

tutorial.texts.hotbar =
[[At the bottom of the screen you see 8 squares. This is called the 'hotbar'.
The hotbar allows you to quickly access some items from your inventory.
In our case, the upper 8 slots in your inventory.
You can change the selected item with the mouse wheel, if you have one, or with the
number keys.

   Select previous item in hotbar: [Mouse wheel up]
   Select next item in hotbar: [Mouse wheel down]
   Select item #N in hotbar: the key with the number #N

The item you've selected is also the item you wield. This will be important later for
tools, mining, building, etc.]]


tutorial.texts.eat =
[[In this chest you find some comestibles. Comestibles are items which instantly
heal you when eaten. This removes the item from your inventory.
To eat one, select the comestible in your hotbar, then click the left mouse button.
Unlike other items, you cannot punch or attack while holding a comestible. To be able
to attack, you have to select something else.
Of course, this does not have to be the only way to heal you.

   Eat comestible: [Left mouse button]

Don't forget to take the gold ingot.]]

tutorial.texts.chest =
[[Treasure chests are a common sight in Minetest. They are actually not built-in
into the game.]]

tutorial.texts.damageblock =
[[Careful! These spikes hurt you when you stand inside, so don't walk into them.
Try to walk around and get the gold ingot.

They damage you every second you stand in them.

This is one of the many ways you can get hurt in Minetest.]]

tutorial.texts.ladder =
[[This is a ladder. Ladders help you to climb up great heights or to climb down safely.
To climb a ladder, go into the block occupied by the ladder and hold one of the
following keys:

   Climb up ladder: [Space]
   Climb down ladder: [Shift]

Note that sneaking and jumping do not work when you are at a ladder.]]

tutorial.texts.swim =
[[What you see here is a small swimming pool. You are able to swim and dive.
Diving usually costs you breath. While diving, 10 bubbles appear in the heads-up display.
These bubbles disappear over time while diving and when you are out of bubbles,
you slowly lose some health points. You have to back up to the surface from time to
time to restore the bubbles.

Movement in a liquid is slightly different than on solid ground:

   Swim forwards: [W]
   Swim backwards: [S]
   Swim leftwards: [A]
   Swim rightwards: [D]
   Swim upwards: [Space]
   Swim downwards: [Shift]

At the bottom of the pool lies a gold ingot. Try to get it!]]


tutorial.texts.dive =
[=[To get to the other side, you have to dive here. Don't worry, the tunnel is not
long. But don't stay too long in the water, or else you take damage.
At the bottom of the pool lies a gold ingot. Try to get it!

   Swim forwards: [W]
   Swim backwards: [S]
   Swim leftwards: [A]
   Swim rightwards: [D]
   Swim upwards: [Space]
   Swim downwards: [Shift]]=]

tutorial.texts.waterfall = ""..
[=[You can easily swim up this waterfall. Go into the water and hold the space bar until you're
at the top

   Swim forwards: [W]
   Swim backwards: [S]
   Swim leftwards: [A]
   Swim rightwards: [D]
   Swim upwards: [Space]
   Swim downwards: [Shift]]=]

tutorial.texts.liquidtypes =
[=[Liquids behave somewhat weirdly in Minetest. Actually, there are 2 kinds of liquids.
If you watched the waterfall closely, you may have noticed that there is a slight difference
between the water blocks that make the waterfall, and those up here in the basin.

Minetest distinguishes between liquid source and flowing liquid.

A liquid source block is always a full cube.
A flowing liquid block looks slightly different. Often, it is not a full cube, but has a more or less
triangular shape. Also, flowing liquids usually have an unique "flowing" animation, but this may
not be the case for all liquids.

Up in the basin, you see four rows of liquid sources, followed by one row of flowing
liquids, followed by the waterfall itself. The waterfall itself is solely made of flowing liquids.

Liquid sources generate flowing liquids around them. Liquid sources can also exist on their own.
Flowing liquids are not able to exist on their own. They have to originate from a liquid source.
If the liquid source is gone, or the way to one is blocked, the flowing liquid will slowly dry
out.

To the right of this sign is a special block. When used, it will block the liquid flow.
Use that block, being close enough and looking at it, and watch the waterfall dry out.

   Use something: [Right mouse button]]=]

tutorial.texts.viscosity =
[[Minetest mods can introduce various liquids which differ in their properties.
Probably the most important property is their viscosity. Here you have some
pools which differ in their viscosity. Feel free to try them out.]]

tutorial.texts.pointing1 =
[[An important general concept in Minetest is pointing. As mentioned earlier,
there is a crosshair in the center of the screen.

You can point several things in Minetest:

- Blocks
- Dropped items
- Other players
- Many other things

You can only point one thing at once, or nothing at all. You can tell when
you point something if it is surrounded by a thin cuboid wireframe or
highlighted (you can change the style in your settings).

To point something, three conditions have to be met:
1. The thing in question must be pointable at all
2. Your crosshair must be exactly over the thing in question
3. You must be close enough to the thing

When a thing is pointed, you can do different stuff with it; e.g. collecting it,
punching it, building to it, etc. We come to all that later.

Now collect that apple from the small tree in front of this sign, and the gold bar.
To do that, you must point it and click with the left mouse button.]]


tutorial.texts.pointing2 =
[[The distance you need to point to things solely depends on the tool you carry.
Most tools share a default value but some tools may have a longer or shorter distance.

At the moment, your only "tool" is the hand. It was good enough to collect the apple
from the small tree.

Above this sign hang some apples, but you cannot reach them by normal means. At the
wall in front of this sign lies a special example tool which you can use to retrieve the apple
from afar.

To take the tool, point to it and click the left mouse button. Then select it with the
mouse wheel or the number keys. You will learn more about tools in a different section.]]

tutorial.texts.health =
[[Unless you have damage disabled, all players start with 20 hit points (HP), represented
by ten hearts in the heads-up display. One HP is represented by half a heart in this
tutorial, but the actual representation can vary from game to game.

You can take damage for the following reasons (including, but not limited to):
- Falling too deep
- Standing in a block which hurts you
- Attacks from other players
- Staying too long in a liquid

In this tutorial, you can regain health by eating a comestible. This is only an example,
mods and games may come with other mechanisms to heal you.

When you lose all your hit points, you die. Death is normally not really that bad in Minetest.
When you die, you will usually lose all your possessions. You are able to put yourself
into the world immediately again. This is called "respawning". Normally you appear at a
more or less random location.
In the tutorial you can die, too, but don't worry about that. You will
respawn at a special location you can't normally reach and keep all your posessions.
Games may introduce special events on a player's death.]]

tutorial.texts.death =
[[Oops! So it seems you just have died. Don't worry, you don't have lost any of your
possessions and you have been revived. You are still in Tutorial World at a different
location.

You have arrived at the so-called respawn location of Tutorial World. You will
always appear here after you died. This is called "respawning". In most worlds,
however, you will respawn in a slightly randomized location.

The tutorial uses a so-called fixed spawn point, so you respawn always at the same
spot. This is unusual for singleplayer worlds, but in online play, some servers
use fixed spawn points, too.

Under normal conditions you would have lost all or a part of your possessions or some
other bad thing would have happened to you. But not here, this is a tutorial.

To continue, just drop out at the end of that gangway. The drop is safe.]]




tutorial.texts.items =
[[Throughout your journey, you will probably collect many items. Once you collected
them, blocks are considered to be items, too.

Items can be stored in your inventory and selected with the hotbar (see the other signs).
You can wield any items; you can even punch with almost any item to hurt enemies.
Usually, you will deal a minimal default damage with most items. Even if you do not hold,
an item at all.
If you don't want to have an item anymore, you can always throw it away. Likewise,
you can collect items which lie around by pointing and leftclicking them.

   Collect item: [Left mouse button]
   Drop carried item stack: [Q]
   Drop single item from carried item stack: [Shift] + [Q]

On the table at the right to this sign lies an item stack of 50 rocks so you have some items,
to test out the inventory.]]

tutorial.texts.tools =
[[A tool is a special kind of item.
Tools can be used for many things, such as:
- Breaking blocks
- Collecting liquids
- Rotating blocks
- Many others!
The number of tools which are possible in Minetest is innumberable and are
too many to cover in this tutorial.
But at least we will look at a very common and important tool type: mining tools,
We will come to that in the mining section.

Many tools wear off and get destroyed after you used them for a while. In an
inventory the tool's "health" is indicated by a colored bar

Tools may be able to be repaired, see the sign about repairing.]]

tutorial.texts.inventory =
[[The inventory menu usually contains the player inventory. This allows you
to carry along items throughout the world.

Every inventory is made out of slots where you can store items in. You can store one
entire stack of items per slot, the only condition is that the items are of the same
type. In this tutorial all items except for tools stack up to 99 items, but this number
can vary in actual games.

Here are the controls which explain how to move around the items within the inventory:

In the game:
   Open inventory menu: [I]

When the inventory is opened and you don't hold any items:
   Take item stack: [Left mouse button]
   Take 10 items from item stack: [Middle mouse button]
   Take half item stack: [Right mouse button]

When you took an item stack in the inventory:
   Put item stack: [Left mouse button]
   Put 10 items from item stack: [Middle mouse button]
   Put single item from item stack: [Right mouse button]

You can also drop an item stack by holding it in the inventory, then clicking anywhere
outside of the window.]]

tutorial.texts.listrings =
[=[By the way, if you are tired of clicking, there is a little convenience
feature:
Hold [Shift] while you left-click on an item stack in a menu to
move it instantly to another relevant section. For example, in this tutorial
you can use it to move an item stack from the chest into your inventory (and
vice-versa) with a single click.

   [Shift]+[Left click]: Move full item stack to other section in menu]=]

tutorial.texts.chest =
[[This is a chest. You can view its contents by right-clicking it. In the menu you will see
two inventories, on the upper part the chest inventory and on the lower part the player
inventory. Exchanging items works exactly the same as in the inventory menu.]]


tutorial.texts.build =
[[Another important task in Minetest is building blocks.
"Building" here refers to the task of placing one block in your possession onto
another block in the world.
Unlike mining, building a block happens instantanous. To build, select a block in your
hotbar, point to any block in the world and press the right mouse button.
Your block will be immediately placed on the pointed side.
It is important that the block you want to build to is pointable. This means you cannot build
next to or on liquids by normal means.

   Build on ordinary block: [Right mouse button]

Try to get up to that little hole by using the wood blocks in the chest. There is another
gold ingot waiting for you.]]

tutorial.texts.build_special =
[=[You may have wondered how you can build on a block which you can use, like a chest.
For this, you have to hold the sneak key and then use the build key.

   Build on usable block: [Shift] + [Right mouse button]]=]

tutorial.texts.mine =
[[Mining is a method to remove a single block with a mining tool. It is a very important
task in Minetest which you will use often.

(It is recommended that you go to the crafting and items house first. It is right in front of
this sign.)

To be able to mine a block, you need

1. to have minable block, after all,
2. to point on the block and
3. to carry an appropriate tool.

   Mine: [Left mouse button]

When you are ready, hold the left mouse button while pointing the block. Depending on
the block type and the tool properties, this can take some time. Some tools are fast with
some particular block types, some other tools may be slower to mine other block types.
If you do not carry an appropriate tool, you are not able to mine the block at all.
You can tell that you are actually mining when you see cracks or some other animation
on the block in question.

When done mining, blocks will often add one or more items to your inventory. This is called
the "drop" of a block and depends on the block type. Now try to mine those large cubes in
this area, using different tools. Note that all blocks here are just examples to show you
different kinds of drops.]]

tutorial.texts.mine_cobble =
[[This is cobblestone. You can mine it with a pickaxe.
This cobblestone will always drop itself, that means, cobblestone. Dropping itself is the
usual dropping behaviour of a block, throughout many games.]]

tutorial.texts.mine_wood =
[[These are wooden planks. In the tutorial, you can only mine those blocks with an axe.
Wooden planks drop themselves.

In Minetest, we use the term "mining" in a general sense, regardless of the material.]]

tutorial.texts.mine_conglomerate =
[[This is a cube of conglomerate. You need a pickaxe to mine it.
Conglomerate drops something based on probability. Conglomerate randomly drops between 1
and 5 rocks, when mined.]]

tutorial.texts.mine_glass =
[[This is some weak glass. You can break it with your bare hands. Or you can use your pickaxe,
which is faster. Note that it looks slightly different than the other glass in this world.
These glass blocks don't drop anything.]]

tutorial.texts.mine_stone =
[[This is stone. You need a pickaxe to mine it. When mined, stone will drop cobblestone.]]

tutorial.texts.mine_immortal =
[[There can always be some blocks which are not minable by any tool. In our tutorial, all
those castle walls can't me mined, for example.]]

tutorial.texts.craft1 =
[[Crafting is the task of taking several items and combining them to form a new item.
Crafting is another important task in Minetest.

To craft something, you need a few items and a so-called crafting grid.

In this tutorial, you have a grid of size 3 times 3 in your inventory.
Let's get right into crafting:

1. Take 3 sheets of paper from the chest next to this sign.
2. Open the inventory menu with [I].
3. Place the paper in the crafting grid so that they form a 1×3 vertical line.
4. A book should appear in the output slot. Click on it to take it,
   then put it in your player inventory.

This process consumes the paper.
When you have the book in your inventory, go on with the next sign.]]

tutorial.texts.craft2 =
[[To craft the book you have used a so-called crafting recipe. You must know the crafting
recipes as well so you can craft.

The crafting recipe you used in particular is a so-called shaped recipe. This means the
pattern you place in the crafting grid matters, but you can move the entire pattern
freely.

There is another kind of crafting recipe: Shapeless.
Shapeless recipes only care about which items you place in the crafting grid, but not in
which pattern. In the next chest you find some wheat. Let's make dough from it! For this,
you have to place at least 1 wheat in 4 different slots, but the other slots must be empty.
What is special about this recipe is that you can place them anywhere in the grid.

When you got your dough, go on with the next sign.]]

tutorial.texts.craft3 =
[[Do you got your dough? Good.

You may have noticed that crafting always consumes one item from each occupied slot
of the crafting grid. This is true for all crafting recipes.
You can speed crafting up a bit when you click with the middle mouse button on the
item in the output slot. Doing so will attempt to do the same craft up to 10 times,
instead of just once.

Feel free to try it with the remaining wheat or just go on with the next sign.]]

tutorial.texts.craft4 =
[[Another important thing to know about crafting are so-called groups. Crafting recipes do
not always require you to use the exactly same items every time.
This tutorial has a special recipe for books. In the chest, you will find paper in 4
different colors. You can also make a book by placing 3 paper sheets of any color
in a vertical line.
The paper color does not matter here, you can use only white paper, only orange paper
or even mix it. What is important here are the occupied slots.
This is possible because all 4 types of (example) paper belong to the same group and
our book recipe accepts not only white paper, but any paper of that group.

Feel free to experiment a bit around with this.]]

tutorial.texts.smelt =
[[This is a furnace. Furnaces can be used to turn a smeltable item with help of a fuel
to a new item. Many items can be furnace fuels, but not all. A few items are smeltable.

In order to operate a furnace, you have to put the smeltable item into the 'Source' slot
and the fuel into the 'Fuel' slot.
As soon as the items have been placed, the furnace automatically starts to smelt the
items. The furnace becomes active and consumes an item in the fuel slot. The flame
goes on and will continue burning for a given time. The time depends on the fuel type.
Some fuels burn very short, and others burn longer. In the furnace menu, the burn time
is indicated by the flame symbol. As soon as the flame goes out, the furnace may
continue burning if there is still fuel and smeltable material in the furnace,
otherwise, the furnace becomes inactive again.
The smeltable material has to be exposed to the flame for a given time as well. This
time depends on the type of the material, too. Some material smelt faster than others.
You can see the smelting progress of a single item on the progress arrow. If one item
has been smelt, the result goes to one of the output slots, where you can take it.

In the left chest you find some fuels and in the right chest you find some materials to
smelt. Feel free to experiment with the furnace a bit. Smelt the gold lump to receive
this station's gold bar.

Again, this furnace is just an example; the exact operation may differ slightly from
game to game.]]

tutorial.texts.repair =
[[Some games may come with a special recipe which allows you to repair your tools.
In those, repairing works always the same way:
Place two more or less worn out tools of the same kind into the crafting crid and
take the result. The result is a new tool which is slightly repaired by a fixed percentage.

Of course, this tutorial comes with such a recipe. The chest next to this sign stores
some damaged tools which you may try to repair now.]]


tutorial.texts.use =
[=[You will often meet some blocks you can use. Something special happens when you
right-click while pointing on them.
In fact, you already used such blocks: All the signs you read are "usable" blocks.

There is a strange device next to this sign. Use it and see what happens.

   Use usable block: [Right mouse button]]=]


tutorial.texts.basic_end =
[[If you think you have enough of this tutorial, you can leave at any time. There are
13 gold ingots at the stations to be found, to help you keep track.

You can find the gold ingots at the following stations:
- Ladders
- Sneaking
- Swimming
- Diving
- Waterfall
- Viscosity
- Comestibles and Eating
- Pointing
- Crafting
- Smelting
- Mining
- Building
- Damage and Health

If you've got 13 gold ingots (in total), you probably know now everything which can be
learned from this tutorial. Collecting the gold ingots is optional.

After you closed this dialog, you can press [Esc] to open the pause menu and return
to the main menu or quit Minetest.

In the next room there are some further signs with information, but it is entirely optional
and not related to gameplay.]]

tutorial.texts.fallout =
[[You somehow managed to fall from the castle or got otherwise below it!
How did you do that?

Anyways, you've got teleported back to the starting location. Whatever you did, be more
careful next time.]]

tutorial.texts.first_gold =
[[You have collected your first gold ingot. Those will help you to keep track in this tutorial.
There are 13 gold ingots in this tutorial.

There is a gold ingot at every important station. If you collected all ingots, you are
done with the tutorial, but collecting the gold ingots is not mandatory.]]

tutorial.texts.last_gold =
[[You have collected all the gold ingots in this tutorial.

This means you have now travelled to each station. If you read and understood everything,
you have learned everything which can be learned from this tutorial.

If this is the case, you are finished with this tutorial and can leave now. But feel
free to stay in this world to explore the area a bit further.

You may also want to visit the Good-Bye room, which has a few more informational
signs with supplemental information, but nothing of is is essential or gameplay-relevant.

If you want to stay, you leave later by pressing [Esc] to open the pause menu and then
return to the main menu or quit Minetest.]]

tutorial.texts.first_diamond =
[[Great, you have found and collected a hidden diamond! In Tutorial World, there are 12 hidden
diamonds. Can you find them all? The first diamond may have been easy to collect, but the
remaining 11 diamonds probably won't be that easy.

If you manage to find them all, you will be awarded a symbolic prize.]]

tutorial.texts.last_diamond =
[[Congratulations!
You have collected all the diamonds of Tutorial World!

To recognize this achievement, you have been awarded with a diamond cup. It has been placed in
the Good-Bye Room for you.]]


tutorial.texts.controls =
[[To recap, here is an overview over the most important default controls:

   Move forwards: [W]
   Move left: [A]
   Move backwards: [S]
   Move right: [D]
   Jump: [Space]
   Sneak: [Shift]
   Move upwards (ladder/liquid): [Space]
   Move downwards (ladder/liquid): [Shift]

   Toggle camera mode: [F7]
   Toggle minimap mode: [F9]

   Select item in hotbar: [Mouse wheel]
   Select item in hotbar: [0] - [9]
   Inventory menu: [I]

   Collect pointed item: [Left mouse button]
   Drop item stack: [Q]
   Drop single item: [Shift] + [Q]

   Punch: [Left mouse button]
   Mine: [Left mouse button]
   Build/use: [Right mouse button]
   Build: [Shift] + [Right mouse button]

   Abort/open pause menu: [Esc]

You can review a shorter version of the controls in the pause menu.]]


tutorial.texts.online =
[[You may want to check out these online resources related to Minetest:

Official homepage of Minetest: <https://minetest.net/>
The main place to find the most recent version of Minetest.

Community wiki: <https://wiki.minetest.net/>
A community-based documentation website for Minetest. Anyone with an account can edit
it! It also features a documentation of the default game, which was NOT covered by
this tutorial.

Webforums: <https://forum.minetest.net/>
A web-based discussion platform where you can discuss everything related to Minetest.
This is also a place where player-made mods and games are published and
discussed. The discussions are mainly in English, but there is also space for
discussion in other languages.

Chat: <irc://irc.freenode.net#minetest>
A generic Internet Relay Chat channel for everything related to Minetest where people can
meet to discuss in real-time.
If you do not understand IRC, see the Community Wiki for help.]]

tutorial.captions = {}

tutorial.locations = {
	intro = { { x = 42, y = 0.5, z = 28 }, math.pi * 0.5 },
	jumpup = { { x = 64, y = 0.5, z = 30 }, math.pi * 1.5, math.pi * 0.2 },
	ladder = { { x = 70, y = 0.5, z = 37 }, math.pi * 0.5 },
	swim = { { x = 85, y = 0.5 , z = 50 }, math.pi * 0.5 },
	dive = { { x = 59, y = 0.5 , z = 62 }, math.pi * 0.5 },
	sneak = { { x = 33, y = 0.5, z = 41 }, math.pi * 0.5 },
	eat = { { x = 67, y = -3.5, z = 60}, 0 },
	health = { { x = 50, y = 0.5, z = 58 }, 0 },
	viscosity = { { x = 44, y = 0.5, z = 53 }, 0, math.pi * 0.2 },
	waterfall = { { x = 40, y = 0.5 , z = 81 }, 0 },
	pointing1 = { { x = 89, y = 0.5, z = 62 }, math.pi * 0.5 },
	items = { { x = 70, y = 0.5, z = 65 }, math.pi },
	craft1 = { { x = 74, y = 0.5, z = 59 }, math.pi * 1.5 },
	repair = { { x = 80, y = 0.5, z = 59 }, math.pi },
	smelt = { { x = 78, y = 4.5, z = 63 }, math.pi * 1.5 },
	mine = { { x = 79, y = 0.5, z = 75 }, 0, math.pi * 0.2 },
	build = { { x = 66, y = 0.5, z = 83 }, math.pi },
	goodbye = { { x = 22.5, y = 0.5, z = 73 }, math.pi * 0.5 },
}

tutorial.locations_order = {
	"intro", "jumpup", "pointing1", "items", "eat", "craft1", "repair", "smelt", "mine", "build", "swim", "dive", "viscosity", "waterfall", "health", "sneak", "goodbye"
}

-- QC Intro content
tutorial.register_infosign("qc_bell_states", "The Bell states", tutorial.texts.qc_bell_states)
tutorial.register_infosign("qc_not_gate_cats", "The quantum version of a NOT gate", tutorial.texts.qc_not_gate_cats)
-- End QC Intro content

tutorial.register_infosign("intro", "Introduction", tutorial.texts.intro)
tutorial.register_infosign("minetest", "Minetest", tutorial.texts.minetest)
tutorial.register_infosign("cam", "Player Camera", tutorial.texts.cam)
tutorial.register_infosign("minimap", "Minimap", tutorial.texts.minimap)
tutorial.register_infosign("runover", "Small Abysses", tutorial.texts.runover)
tutorial.register_infosign("jumpup", "Jumping (1)", tutorial.texts.jumpup)
tutorial.register_infosign("jumpover", "Jumping (2)", tutorial.texts.jumpover)
tutorial.register_infosign("sneak", "Sneaking", tutorial.texts.sneak)
tutorial.register_infosign("orientation", "Information about the following tutorial sections", tutorial.texts.orientation)
tutorial.register_infosign("hotbar", "Hotbar", tutorial.texts.hotbar)
tutorial.register_infosign("eat", "Comestibles and Eating", tutorial.texts.eat)
tutorial.register_infosign("chest", "Chests", tutorial.texts.chest)
tutorial.register_infosign("damageblock", "Blocks Which Hurt You", tutorial.texts.damageblock)
tutorial.register_infosign("ladder", "Climbing Ladders", tutorial.texts.ladder)
tutorial.register_infosign("swim", "Swimming", tutorial.texts.swim)
tutorial.register_infosign("dive", "Diving", tutorial.texts.dive)
tutorial.register_infosign("waterfall", "Swimming up a Waterfall", tutorial.texts.waterfall)
tutorial.register_infosign("viscosity", "Viscosity", tutorial.texts.viscosity)
tutorial.register_infosign("liquidtypes", "Liquid sources and flowing liquids", tutorial.texts.liquidtypes)
tutorial.register_infosign("pointing1", "Pointing (1)", tutorial.texts.pointing1)
tutorial.register_infosign("pointing2", "Pointing (2)", tutorial.texts.pointing2)
tutorial.register_infosign("health", "Health and Damage", tutorial.texts.health)
tutorial.register_infosign("death", "Death and Respawning", tutorial.texts.death)
tutorial.register_infosign("items", "Items", tutorial.texts.items)
tutorial.register_infosign("tools", "Tools", tutorial.texts.tools)
tutorial.register_infosign("inventory", "Using the Inventory", tutorial.texts.inventory)
tutorial.register_infosign("listrings", "Inventory shortcut", tutorial.texts.listrings)
tutorial.register_infosign("chest", "Comment About Chests", tutorial.texts.chest)
tutorial.register_infosign("build", "Building Some Blocks", tutorial.texts.build)
tutorial.register_infosign("build_special", "Building at Usable Blocks", tutorial.texts.build_special)
tutorial.register_infosign("mine", "Mining blocks", tutorial.texts.mine)
tutorial.register_infosign("mine_cobble", "Mining example: Cobblestone", tutorial.texts.mine_cobble)
tutorial.register_infosign("mine_stone", "Mining example: Stone", tutorial.texts.mine_stone)
tutorial.register_infosign("mine_conglomerate", "Mining example: Conglomerate", tutorial.texts.mine_conglomerate)
tutorial.register_infosign("mine_wood", "Mining example: Wooden Planks", tutorial.texts.mine_wood)
tutorial.register_infosign("mine_glass", "Mining example: Weak glass", tutorial.texts.mine_glass)
tutorial.register_infosign("mine_immortal", "Unminable blocks", tutorial.texts.mine_immortal)
tutorial.register_infosign("blocks", "Special blocks", tutorial.texts.blocks)
tutorial.register_infosign("disable_jump", "No-jumping blocks", tutorial.texts.disable_jump)
tutorial.register_infosign("bouncy", "Bouncy blocks", tutorial.texts.bouncy)
tutorial.register_infosign("falling_node", "Falling blocks", tutorial.texts.falling_node)
tutorial.register_infosign("attached_node", "Attached blocks", tutorial.texts.attached_node)
tutorial.register_infosign("use", "Using blocks", tutorial.texts.use)
tutorial.register_infosign("craft1", "Crafting Basics", tutorial.texts.craft1)
tutorial.register_infosign("craft2", "Crafting using Shapeless Recipes", tutorial.texts.craft2)
tutorial.register_infosign("craft3", "Crafting Faster", tutorial.texts.craft3)
tutorial.register_infosign("craft4", "Crafting Groups", tutorial.texts.craft4)
tutorial.register_infosign("smelt", "Furnace Operation Instructions", tutorial.texts.smelt)
tutorial.register_infosign("repair", "Repairing Tools", tutorial.texts.repair)
tutorial.register_infosign("basic_end", "End of the Basic Tutorial", tutorial.texts.basic_end)
tutorial.register_infosign("controls", "Controls Overview", tutorial.texts.controls)
tutorial.register_infosign("online", "Online Resources", tutorial.texts.online)
tutorial.register_infosign("subgame", "Games", tutorial.texts.subgame)

minetest.register_node("tutorial:wall", {
	description = S("reinforced wall"),
	tiles = {"default_stone_brick.png"},
	is_ground_content = true,
	groups = {creative_breakable=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("tutorial:reinforced_glass", {
	description = S("reinforced glass"),
	drawtype = "glasslike",
	tiles = {"tutorial_reinforced_glass.png"},
	inventory_image = minetest.inventorycube("tutorial_reinforced_glass.png"),
	paramtype = "light",
	sunlight_propagates = true,
	groups = { creative_breakable=1 },
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("tutorial:weak_glass", {
	description = S("weak glass"),
	drawtype = "glasslike",
	tiles = {"tutorial_weak_glass.png"},
	inventory_image = minetest.inventorycube("tutorial_weak_glass.png"),
	paramtype = "light",
	sunlight_propagates = true,
	groups = { cracky=3, oddly_breakable_by_hand=1 },
	drop = "",
	sounds = default.node_sound_glass_defaults(),
})


minetest.register_tool("tutorial:snatcher", {
	description = S("apple snatcher"),
	inventory_image = "tutorial_snatcher.png",
	wield_image = "tutorial_snatcher.png",
	wield_scale = { x = 1, y = 1, z = 1 },
	range = 10,
	tool_capabilities = {},
})

--[[ A special switch which, when flipped, exchanges day for night and vice versa. ]]
minetest.register_node("tutorial:day", {
	description = S("day/night switch (day)"),
	tiles = { "tutorial_day.png" },
	groups = {creative_breakable=1},
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		minetest.set_timeofday(0)
		minetest.set_node(pos, {name="tutorial:night"})
	end
})
minetest.register_node("tutorial:night", {
	description = S("day/night switch (night)"),
	tiles = { "tutorial_night.png" },
	groups = {creative_breakable=1},
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		minetest.set_timeofday(0.5)
		minetest.set_node(pos, {name="tutorial:day"})
	end
})

--[[ A special switch which "activates" and "deactivates" the waterfall in Tutorial World.
It only works on a prepared map! ]]
minetest.register_node("tutorial:waterfall_on", {
	description = S("waterfall switch (on)"),
	tiles = { "tutorial_waterfall_on.png" },
	groups = {creative_breakable=1},
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		local wpos = { y = 5, z = 86 }
		for x=33,46 do
			wpos.x = x
			minetest.set_node(wpos, {name="tutorial:wall"})
		end
		minetest.set_node({x=30,y=7,z=91}, {name="tutorial:waterfall_off"})
		minetest.set_node({x=40,y=2,z=86}, {name="tutorial:waterfall_off"})
	end
})
minetest.register_node("tutorial:waterfall_off", {
	description = S("waterfall switch (off)"),
	tiles = { "tutorial_waterfall_off.png" },
	groups = {creative_breakable=1},
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		local wpos = { y = 5, z = 86 }
		for x=33,46 do
			wpos.x = x
			minetest.remove_node(wpos)
		end
		minetest.set_node({x=30,y=7,z=91}, {name="tutorial:waterfall_on"})
		minetest.set_node({x=40,y=2,z=86}, {name="tutorial:waterfall_on"})
	end
})

-- Ruler (used in sneaking section)
minetest.register_node("tutorial:ruler", {
	description = S("ruler"),
	drawtype = "signlike",
	selection_box = {
		type = "wallmounted",
		wall_side = { -0.5, -0.5, 1/16, -0.4, 0.5, 0.5 },
	},
	walkable = false,
	tiles = { "tutorial_ruler.png" },
	inventory_image = "tutorial_ruler.png",
	wield_image = "tutorial_ruler.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	groups = {creative_breakable=1, attached_node=1},
})

local is_drawtype, is_pointable, is_diggable, is_air_equivalent, is_tiles
-- Make some changes to item spawner node if debug setting is active
if edit_item_spawners then
	-- This makes the item spawner visible and clickable
	is_drawtype = "glasslike"
	is_pointable = true
	is_diggable = true
	is_air_equivalent = false
	is_tiles = { "tutorial_item_spawner.png" }
else
	-- Normal invisible non-pointable non-editable item spawner
	is_drawtype = "airlike"
	is_pointable = false
	is_diggable = false
	is_air_equivalent = true
	is_tiles = nil
end

-- Item spawner
minetest.register_node("tutorial:itemspawner", {
	description = S("item spawner"),
	paramtype = "light",
	walkable = false,
	-- See above
	drawtype = is_drawtype,
	pointable = is_pointable,
	diggable = is_diggable,
	air_equivalent = is_air_equivalent,
	tiles = is_tiles,
	floodable = false,
	inventory_image = "tutorial_item_spawner.png",
	wield_image = "tutorial_item_spawner.png",
	buildable_to = false,
	sunlight_propagates = true,
	groups = {creative_breakable=1},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_int("configged", 0)
		local formspec = ""..
		"size[12,6]"..
		"label[-0.15,-0.4;"..minetest.formspec_escape(S("Item spawner")).."]"..
		"field[0,1;10,1;offset;"..minetest.formspec_escape(S("Offset"))..";(0,0,0)]"..
		"field[0,2;10,1;itemstring;"..minetest.formspec_escape(S("Itemstring"))..";]"..
		"button_exit[4.5,5.5;3,1;close;"..minetest.formspec_escape(S("OK")).."]"
		meta:set_string("formspec", formspec)
		meta:set_string("infotext", S("Item spawner (inactive)"))
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		if not fields.offset or fields.offset == "" then
			fields.offset = "(0,0,0)"
		end
		if fields.offset and fields.itemstring then
			local meta = minetest.get_meta(pos)
			meta:set_string("offset", fields.offset)
			meta:set_int("configged", 1)
			meta:set_string("itemstring", fields.itemstring)
			meta:set_string("formspec", "")
			meta:set_string("infotext", "")
		end
	end,
	on_timer = function(pos, elapsed)
		local meta = minetest.get_meta(pos)
		if meta:get_int("configged") == 0 or edit_item_spawners then
			return
		end

		local offset = minetest.string_to_pos(meta:get_string("offset"))
		local itemstring = meta:get_string("itemstring")
		local x, y, z = offset.x, offset.y, offset.z
		local spawnpos = {x=pos.x+x, y=pos.y+y, z=pos.z+z}
		local objs = minetest.get_objects_inside_radius(spawnpos, 1)
		for o=1, #objs do
			local ent = objs[o]:get_luaentity()
			if ent then
				if ent.name == "__builtin:item" and ent.itemstring == itemstring then
					-- Remove node when item was spawned successfully.
					-- So it doesn't get in the way.
					minetest.remove_node(pos)
					return
				end
			end
		end
		if itemstring ~= nil and itemstring ~= "" then
			minetest.add_item(spawnpos, itemstring)
			local timer = minetest.get_node_timer(pos)
			timer:start(1)
			return
		end

		local timer = minetest.get_node_timer(pos)
		timer:start(1)
	end,
})

-- Crafting guides (example crafting images at crafting section)
function tutorial.craftguideinfo(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string("infotext", S("This is a crafting example."))
end

function tutorial.register_craftguide(subId, desc, imageStatic, imageAnim, animFrames)
	local id = "tutorial:craftguide_"..subId

	local tiles
	if imageAnim ~= nil then
		tiles = {
			{
				name = imageAnim,
				animation = {
					type = "vertical_frames",
					aspect_w = 32,
					aspect_h = 32,
					length = animFrames * 4.0,
				},
			}
		}
	else
		tiles = { imageStatic }
	end

	minetest.register_node(id, {
		description = desc,
		drawtype = "signlike",
		selection_box = {
			type = "wallmounted",
			wall_side = { -0.5, -0.5, -0.5, -0.4, 0.5, 0.5 },
		},
		walkable = false,
		tiles = tiles,
	inventory_image = imageStatic,
		wield_image = imageStatic,
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		groups = {creative_breakable=1, attached_node=1},
		on_construct = tutorial.craftguideinfo,
	})

	minetest.register_abm({
		nodenames = id,
		interval = 5,
		chance = 1,
		action = tutorial.craftguideinfo,
	})
end

tutorial.register_craftguide("paper", S("crafting example: white paper"), "tutorial_craftguide_paper_white.png")
tutorial.register_craftguide("wheat", S("crafting example: wheat"), "tutorial_craftguide_wheat.png", "tutorial_craftguide_wheat_anim.png", 3)
tutorial.register_craftguide("paper_color", S("crafting example: colored paper"), "tutorial_craftguide_paper_color.png", "tutorial_craftguide_paper_color_anim.png", 4)
tutorial.register_craftguide("repair", S("crafting example: tool repair"), "tutorial_craftguide_repair.png", "tutorial_craftguide_repair_anim.png", 3)

--[[ Tutorial cups, awarded for achievements ]]
tutorial.cupnodebox = {
	type = "fixed",
	fixed = {
		{-0.3,-0.5,-0.3,0.3,-0.4,0.3}, -- stand
		{-0.1,-0.4,-0.1,0.1,0,0.1}, -- handle
		{-0.3,0,-0.3,0.3,0.1,0.3}, -- cup (lower part)
		-- the 4 sides of the upper part
		{-0.2,0.1,-0.3,0.2,0.5,-0.2},
		{-0.2,0.1,0.2,0.2,0.5,0.3},
		{-0.3,0.1,-0.3,-0.2,0.5,0.3},
		{0.2,0.1,-0.3,0.3,0.5,0.3},
	}
}

tutorial.cupselbox = {
	type = "fixed",
	fixed = {
		{-0.3,-0.5,-0.3,0.3,-0.4,0.3}, -- stand
		{-0.1,-0.4,-0.1,0.1,0,0.1}, -- handle
		{-0.3,0,-0.3,0.3,0.5,0.3}, -- upper part
	}
}

function tutorial.goldinfo(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string("infotext", S("This golden cup has been awarded for finishing the tutorial."))
end

function tutorial.diamondinfo(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string("infotext", S("This diamond cup has been awarded for collecting all hidden diamonds."))
end


--[[ awarded for collecting all gold ingots ]]
minetest.register_node("tutorial:cup_gold", {
	description = S("golden cup"),
	tiles = { "default_gold_block.png" },
	paramtype = "light",
	drawtype = "nodebox",
	node_box = tutorial.cupnodebox,
	selection_box = tutorial.cupselbox,
	groups = { creative_breakable = 1 },
	on_construct = tutorial.goldinfo,
})

--[[ awarded for collecting all diamonds ]]
minetest.register_node("tutorial:cup_diamond", {
	description = S("diamond cup"),
	tiles = { "default_diamond_block.png" },
	paramtype = "light",
	drawtype = "nodebox",
	node_box = tutorial.cupnodebox,
	selection_box = tutorial.cupselbox,
	groups = { creative_breakable = 1 },
	on_construct = tutorial.diamondinfo,
})

minetest.register_abm({
	nodenames = {"tutorial:cup_gold"},
	interval = 5,
	chance = 1,
	action = tutorial.goldinfo,
})

minetest.register_abm({
	nodenames = {"tutorial:cup_diamond"},
	interval = 5,
	chance = 1,
	action = tutorial.diamondinfo,
})

--[[ This function shows a simple dialog window with scrollable text
	name: name of the player to show the formspec to
	caption: Caption of the dialog window (not escaped)
	text: The text to be shown. Must be escaped manually for formspec, an unescaped
	      comma generates a line break.
]]
function tutorial.show_default_dialog(name, caption, text)
	local formspec = "size[12,6]"..
	"label[-0.15,-0.4;"..minetest.formspec_escape(caption).."]"..
	"tablecolumns[text]"..
	"tableoptions[background=#000000;highlight=#000000;border=false]"..
	"table[0,0.25;12,5.2;text_table;"..
	tutorial.convert_newlines(minetest.formspec_escape(S(text)))..
	"]"..
	"button_exit[4.5,5.5;3,1;close;"..S("Close").."]"
	minetest.show_formspec(name, "tutorial_dialog", formspec)
end

minetest.register_on_joinplayer(function(player)
	local formspec = nil
	if(minetest.is_singleplayer() == false) then
		formspec = "size[12,6]"..
		"label[-0.15,-0.4;"..minetest.formspec_escape(S("Warning: You're not playing in singleplayer mode")).."]"..
		"tablecolumns[text]"..
		"tableoptions[background=#000000;highlight=#000000;border=false]"..
		"table[0,0.25;12,5.2;creative_text;"..
		tutorial.convert_newlines(minetest.formspec_escape(S(tutorial.texts.notsingleplayer)))..
		"]"..
		"button_exit[2.5,5.5;3,1;close;"..minetest.formspec_escape(S("Continue anyways")).."]"..
		"button_exit[6.5,5.5;3,1;leave;"..minetest.formspec_escape(S("Leave tutorial")).."]"
	elseif(minetest.settings:get_bool("creative_mode")) then
		formspec = "size[12,6]"..
		"label[-0.15,-0.4;"..(minetest.formspec_escape(S("Warning: Creative mode is active"))).."]"..
		"tablecolumns[text]"..
		"tableoptions[background=#000000;highlight=#000000;border=false]"..
		"table[0,0.25;12,5.2;creative_text;"..
		tutorial.convert_newlines(minetest.formspec_escape(S(tutorial.texts.creative)))..
		"]"..
		"button_exit[2.5,5.5;3,1;close;"..minetest.formspec_escape(S("Continue anyways")).."]"..
		"button_exit[6.5,5.5;3,1;leave;"..minetest.formspec_escape(S("Leave tutorial")).."]"

	elseif(tutorial.state.intro_text == false) then
		formspec = "size[12,6]"..
		"label[-0.15,-0.4;"..minetest.formspec_escape(S("Introduction")).."]"..
		"tablecolumns[text]"..
		"tableoptions[background=#000000;highlight=#000000;border=false]"..
		"table[0,0.25;12,5.2;intro_text;"..
		tutorial.convert_newlines(minetest.formspec_escape(S(tutorial.texts.intro)))..
		"]"..
		"button_exit[4.5,5.5;3,1;close;"..minetest.formspec_escape(S("Close")).."]"
		tutorial.state.intro_text = true
	end
	if tutorial.state.first_join==true and tutorial.first_spawn then
		player:set_pos(tutorial.first_spawn.pos)
		player:set_look_horizontal(tutorial.first_spawn.yaw)
		tutorial.state.first_join = false
	end
	tutorial.save_state()
	if(formspec~=nil) then
		minetest.show_formspec(player:get_player_name(), "intro", formspec)
	end
end
)

local teleport_dialog = function(player)
	local formspec = "size[10,10]" ..
	"label[0,0;"..minetest.formspec_escape(S("Select teleport destination:")).."]"
	local y = 1
	local x = 0
	local id, data
	for i = 1, #tutorial.locations_order do
		local id = tutorial.locations_order[i]
		local data = tutorial.locations[id]
		local caption
		if id == "goodbye" then
			caption = S("Good-Bye room")
		else
			caption = S(tutorial.captions[id])
		end
		formspec = formspec .. "button_exit["..x..","..y..";5,1;".."teleport_"..id..";"..minetest.formspec_escape(caption).."]"
		y = y + 1
		if y > 9 then
			y = 1
			x = x + 5
		end
	end
	minetest.show_formspec(player:get_player_name(), "tutorial_teleport", formspec)
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if(fields.leave) then
		minetest.kick_player(player:get_player_name(), S("You have voluntarily exited the tutorial."))
		return
	elseif(fields.teleport) then
		teleport_dialog(player)
		return
	elseif(fields.gotoend) then
		tutorial.go_to_end(player)
		return
	end
	if formname == "tutorial_teleport" then
		for id, data in pairs(tutorial.locations) do
			if(fields["teleport_"..id]) then
				tutorial.teleport(player, data[1], data[2], data[3])
				break
			end
		end
	end
end)

tutorial.steptimer = 0
minetest.register_globalstep(function(dtime)
	tutorial.steptimer = tutorial.steptimer + dtime
	local players = minetest.get_connected_players()
	if(tutorial.steptimer > 2) then
		for p=1,#players do
			local player = players[p]
			local name = player:get_player_name()
			if(player:get_pos().y < -12 and (not minetest.settings:get_bool("creative_mode"))) then
			-- teleport players back to the start when they fell away
				tutorial.back_to_start(player)
				tutorial.show_default_dialog(name, S("You fell from the castle!"), tutorial.texts.fallout)

			else
				local inv = player:get_inventory()
				local state_changed = false

				if(tutorial.state.first_gold ~= true) then
					local gold_stack = ItemStack("default:gold_ingot 1")
					if(inv:contains_item("main", gold_stack)) then
						tutorial.show_default_dialog(
							name,
							S("Gold ingots in the tutorial"),
							tutorial.texts.first_gold
						)
						tutorial.state.first_gold = true
						state_changed = true
					end
				end
				if(tutorial.state.last_gold ~= true) then
					local gold_stack = ItemStack("default:gold_ingot "..tostring(tutorial.gold))
					if(inv:contains_item("main", gold_stack)) then
						local formspec = "size[12,6]"..
						"label[-0.15,-0.4;"..minetest.formspec_escape(S("You've finished the tutorial!")).."]"..
						"tablecolumns[text]"..
						"tableoptions[background=#000000;highlight=#000000;border=false]"..
						"table[0,0.25;12,5.2;creative_text;"..
						tutorial.convert_newlines(minetest.formspec_escape(S(tutorial.texts.last_gold)))..
						"]"..
						"button_exit[0.5,5.5;3,1;close;"..minetest.formspec_escape(S("Continue")).."]"..
						"button_exit[4.5,5.5;3,1;leave;"..minetest.formspec_escape(S("Leave tutorial")).."]"..
						"button_exit[8.5,5.5;3,1;gotoend;"..minetest.formspec_escape(S("Go to Good-Bye room")).."]"

						minetest.show_formspec(name, "tutorial_last_gold", formspec)

						minetest.set_node({x=19,y=2,z=72}, {name="tutorial:cup_gold"})
						tutorial.state.last_gold = true
						state_changed = true
					end
				end

				if(tutorial.state.first_diamond ~= true) then
					local diamond_stack = ItemStack("default:diamond 1")
					if(inv:contains_item("main", diamond_stack)) then
						tutorial.show_default_dialog(
							name,
							S("You found a hidden diamond!"),
							tutorial.texts.first_diamond
						)
						tutorial.state.first_diamond = true
						state_changed = true
					end
				end
				if(tutorial.state.last_diamond ~= true) then
					local diamond_stack = ItemStack("default:diamond "..tostring(tutorial.diamonds))
					if(inv:contains_item("main", diamond_stack)) then
						local formspec = "size[12,6]"..
						"label[-0.15,-0.4;"..minetest.formspec_escape(S("You have collected all hidden diamonds!")).."]"..
						"tablecolumns[text]"..
						"tableoptions[background=#000000;highlight=#000000;border=false]"..
						"table[0,0.25;12,5.2;last_diamond_text;"..
						tutorial.convert_newlines(minetest.formspec_escape(S(tutorial.texts.last_diamond)))..
						"]"..
						"button_exit[2.5,5.5;3,1;close;"..minetest.formspec_escape(S("Continue")).."]"..
						"button_exit[6.5,5.5;3,1;gotoend;"..minetest.formspec_escape(S("Go to Good-Bye room")).."]"
						minetest.show_formspec(name, "tutorial_last_diamond", formspec)

						minetest.set_node({x=19,y=2,z=74}, {name="tutorial:cup_diamond"})
						tutorial.state.last_diamond = true
						state_changed = true
					end
				end

				if(state_changed) then
					tutorial.save_state()
				end
			end
		end
		tutorial.steptimer = 0
	end
end)

function tutorial.teleport(player, pos, look_horizontal, look_vertical)
	player:set_pos(pos)
	player:set_look_horizontal(look_horizontal)
	if not look_vertical then
		look_vertical = 0
	end
	player:set_look_vertical(look_vertical)
end

function tutorial.back_to_start(player)
	tutorial.teleport(player, tutorial.locations.intro[1], tutorial.locations.intro[2])
end

function tutorial.go_to_end(player)
	tutorial.teleport(player, tutorial.locations.goodbye[1], tutorial.locations.goodbye[2])
end

--[[
Helper tools for sign text extracting
must be called with /lua from luacmd
An ugly, quick and dirty hack.
TODO: Toss away intllib in favor of gettext as soon as possible
]]

function tutorial.convert_newlines_for_intllib(str)
	local function convert(s)
		return s:gsub("\n", function(slash, what)
			return "\\n"
		end)
	end

	return convert(str)
end

function tutorial.extract_texts()
	local filepath = minetest.get_modpath("tutorial").."/locale/template_texts.txt"
	local file = io.open(filepath, "w+")
	if(file) then
		for k,v in pairs(tutorial.texts) do
			file:write("# Tutorial text: "..k.."\n")
			file:write(tutorial.convert_newlines_for_intllib(v).."\n\n")
		end
	else
		minetest.log("error", "[tutorial] An attempt to write into "..filepath.." failed.")
	end
	io.close(file)
end

-- Load map generation and map data management functions
dofile(minetest.get_modpath("tutorial").."/mapgen.lua")

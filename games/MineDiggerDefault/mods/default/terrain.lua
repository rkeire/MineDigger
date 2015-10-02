terrain = {}

  -- Stone
  minetest.register_node("default:stone", {
	  description = "Stone",
	  tiles ={"default_stone.png"},
	  groups = {cracky=3},
	  drop = 'default:stone',
	  legacy_mineral = true,
	  -- sounds = default.node_sound_stone_defaults(),
  })
  
  -- Dirt
  minetest.register_node("default:dirt", {
	description = "Dirt",
	tiles ={"default_grass.png",
		tileable_vertical = false}},
	groups = {crumbly=3, soil=1},
	drop = 'default:dirt',
	-- sounds = default.node_sound_dirt_defaults({
		-- footstep = {name="default_grass_footstep", gain=0.4},
	  }),
  })

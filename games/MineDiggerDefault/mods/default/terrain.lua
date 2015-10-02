terrain = {}

-- Stone
	minetest.register_node("default:stone", {
		description = "Stone",
		tiles ={"default_stone.png"},
		groups = {cracky=3},
		drop = 'default:stone',
		legacy_mineral = true,
	})

-- Dirt
	minetest.register_node("default:dirt", {
		description = "Dirt",
		tiles ={"default_grass.png",
		tileable_vertical = false},
		groups = {crumbly=3, soil=1},
		drop = 'default:dirt',
	})

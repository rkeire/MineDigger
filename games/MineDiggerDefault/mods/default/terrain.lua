minetest.register_alias("mapgen_stone", "default:stone")
minetest.register_alias("mapgen_dirt", "default:dirt")

-- Stone

-- Dirt
	minetest.register_ore({
		ore_type		= "blob",
		ore			= "default:dirt",
		wherein			= {"default:stone"},
		clust_scarcity		= 16 * 16 * 16,
		clust_size		= 5,
		y_min			= -31,
		y_max			= 31000,
		noise_threshhold	= 0.0,
		noise_params = {
			offset	= 0.5,
			scale	= 0.2,
			spread	= {x = 5, y = 5, z = 5},
			seed	= 17676,
			octaves	= 1,
			persist	= 0.0
		},
	})
	
minetest.clear_registered_biomes()

	minetest.register_biome({
		name		= "default:terrain",
		node_top	= "default:dirt",
		depth_top	= 1,
		node_filler	= "default:dirt",
		depth_filler	= 1,
		node_stone	= "default:stone",
		y_min		= -20,
		y_max		= 31000,
		heat_point	= 50,
		humidity_point	= 50,
	})

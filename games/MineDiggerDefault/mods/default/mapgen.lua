minetest.register_alias("mapgen_stone", "default:stone")
minetest.register_alias("mapgen_dirt", "default:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "default:dirt")
minetest.register_alias("mapgen_sand", "default:dirt")
minetest.register_alias("mapgen_water_source", "default:water_source")
minetest.register_alias("mapgen_river_water_source", "default:dirt")
minetest.register_alias("mapgen_lava_source", "default:dirt")
minetest.register_alias("mapgen_gravel", "default:stone")
minetest.register_alias("mapgen_desert_stone", "default:stone")
minetest.register_alias("mapgen_desert_sand", "default:dirt")
minetest.register_alias("mapgen_dirt_with_snow", "default:dirt")
minetest.register_alias("mapgen_snowblock", "default:dirt")
minetest.register_alias("mapgen_snow", "default:dirt")
minetest.register_alias("mapgen_ice", "default:stone")
minetest.register_alias("mapgen_sandstone", "default:stone")
minetest.register_alias("mapgen_tree", "default:stone")
minetest.register_alias("mapgen_leaves", "default:dirt")
minetest.register_alias("mapgen_apple", "air")
minetest.register_alias("mapgen_jungletree", "default:stone")
minetest.register_alias("mapgen_jungleleaves", "default:dirt")
minetest.register_alias("mapgen_junglegrass", "air")
minetest.register_alias("mapgen_pine_tree", "default:stone")
minetest.register_alias("mapgen_pine_needles", "default:dirt")
minetest.register_alias("mapgen_cobble", "default:dirt")
minetest.register_alias("mapgen_stair_cobble", "default:dirt")
minetest.register_alias("mapgen_mossycobble", "default:stone")
minetest.register_alias("mapgen_sandstonebrick", "default:stone")
minetest.register_alias("mapgen_stair_sandstonebrick", "default:stone")

  -- Stone


  -- Dirt
    minetest.register_ore({
	  	ore_type          = "blob",
		  ore               = "default:dirt",
		  wherein           = {"default:stone"},
		  clust_scarcity    = 16 * 16 * 16,
		  clust_size        = 5,
		  y_min             = -31,
		  y_max             = 31000,
		  noise_threshhold  = 0.0,
		  noise_params      = {
		    offset  = 0.5,
			  scale   = 0.2,
			  spread  = {x = 5, y = 5, z = 5},
			  seed    = 17676,
			  octaves = 1,
			  persist = 0.0
		  },
	})
	
minetest.clear_registered_biomes()

	minetest.register_biome({
		name = "default:terrain",
		node_top = "default:dirt",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 1,
		node_stone = "default:stone",
		y_min = -20,
		y_max = 31000,
		heat_point = 50,
		humidity_point = 50,
	})

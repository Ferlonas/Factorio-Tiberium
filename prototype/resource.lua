local TiberiumMaxPerTile = settings.startup["tiberium-growth"].value * 100
local startingArea = settings.startup["tiberium-starting-area"].value or settings.startup["tiberium-ore-removal"].value or false
local tibOnly = settings.startup["tiberium-ore-removal"].value or false

data:extend{
	{
		type = "autoplace-control",
		name = "tibGrowthNode",
		richness = true,
		order = "b-f",
		category = "resource",
	},
	{
		type = "noise-layer",
		name = "tiberium-ore"
	},
	{
		type = "resource-category",
		name = "basic-solid-tiberium"
	},
	{
		type = "resource-category",
		name = "advanced-solid-tiberium"
	},
	{
		type = "resource-category",
		name = "advanced-liquid-tiberium"
	},
	{
		type = "resource",
		name = "tiberium-ore",
		category = "basic-solid-tiberium",
		icon = tiberiumInternalName.."/graphics/icons/tiberium-ore.png",
		icon_size = 64,
		icon_mipmaps = 4,
		flags = {"placeable-neutral"},
		order="a-b-f",
		minable = {
			hardness = 0.05,
			mining_particle = "stone-particle",
			mining_time = 1,
			result = "tiberium-ore",
			--fluid_amount = 10,
			--required_fluid = "sulfuric-acid"
		},
		collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		stage_counts = {
			TiberiumMaxPerTile * 0.9,
			TiberiumMaxPerTile * 0.75,
			TiberiumMaxPerTile * 0.6,
			TiberiumMaxPerTile * 0.47,
			TiberiumMaxPerTile * 0.35,
			TiberiumMaxPerTile * 0.25,
			TiberiumMaxPerTile * 0.15,
			TiberiumMaxPerTile * 0.8,
			TiberiumMaxPerTile * 0.4,
			TiberiumMaxPerTile * 0.2,
			TiberiumMaxPerTile * 0.1,
			1
		},
		stages = {
			sheet = {
				filename = tiberiumInternalName.."/graphics/entity/ores/tiberium-ore.png",
				priority = "extra-high",
				width = 64,
				height = 64,
				frame_count = 12,
				variation_count = 12,
				hr_version = {
					filename = tiberiumInternalName.."/graphics/entity/ores/hr-tiberium-ore.png",
					priority = "extra-high",
					width = 128,
					height = 128,
					frame_count = 12,
					variation_count = 12,
					scale = 0.5
				}
			}
		},
		stages_effect = {
			sheet = {
				filename = tiberiumInternalName.."/graphics/entity/ores/tiberium-ore-glow.png",
				priority = "extra-high",
				width = 64,
				height = 64,
				frame_count = 12,
				variation_count = 12,
				blend_mode = "additive",
				flags = {"light"},
				--hr_version = {
				--  filename = tiberiumInternalName.."/graphics/entity/ores/hr-tiberium-ore-glow.png",
				--  priority = "extra-high",
				--  width = 128,
				--  height = 128,
				--  frame_count = 8,
				--  variation_count = 8,
				--  scale = 0.5,
				--  blend_mode = "additive",
				--  flags = {"light"},
				--}
			}
		},
		effect_animation_period = 4,
		effect_animation_period_deviation = 1,
		effect_darkness_multiplier = 2.0,
		min_effect_alpha = 0.3,
		max_effect_alpha = 0.5,
		map_color = {0.02, 1.0, 0.02}
	},
	{
		type = "resource",
		name = "tiberium-ore-blue",
		category = "basic-solid-tiberium",
		icon = tiberiumInternalName.."/graphics/icons/tiberium-ore-blue-20-114-10.png",
		icon_size = 64,
		icon_mipmaps = 4,
		flags = {"placeable-neutral"},
		order="a-b-f",
		minable = {
			hardness = 0.05,
			mining_particle = "stone-particle",
			mining_time = 1,
			result = "tiberium-ore-blue",
		},
		collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		stage_counts = {
			TiberiumMaxPerTile * 0.9,
			TiberiumMaxPerTile * 0.75,
			TiberiumMaxPerTile * 0.6,
			TiberiumMaxPerTile * 0.47,
			TiberiumMaxPerTile * 0.35,
			TiberiumMaxPerTile * 0.25,
			TiberiumMaxPerTile * 0.15,
			TiberiumMaxPerTile * 0.8,
			TiberiumMaxPerTile * 0.4,
			TiberiumMaxPerTile * 0.2,
			TiberiumMaxPerTile * 0.1,
			1
		},
		stages = {
			sheet = {
				filename = tiberiumInternalName.."/graphics/entity/ores/tiberium-ore-blue-20-114-0.png",
				priority = "extra-high",
				width = 64,
				height = 64,
				frame_count = 12,
				variation_count = 12,
				-- hr_version = {
				-- 	filename = tiberiumInternalName.."/graphics/entity/ores/hr-tiberium-ore.png",
				-- 	priority = "extra-high",
				-- 	width = 128,
				-- 	height = 128,
				-- 	frame_count = 12,
				-- 	variation_count = 12,
				-- 	scale = 0.5
				-- }
			}
		},
		stages_effect = {
			sheet = {
				filename = tiberiumInternalName.."/graphics/entity/ores/tiberium-ore-glow-blue-61-139-20.png",
				priority = "extra-high",
				width = 64,
				height = 64,
				frame_count = 12,
				variation_count = 12,
				blend_mode = "additive",
				flags = {"light"},
			}
		},
		effect_animation_period = 4,
		effect_animation_period_deviation = 1,
		effect_darkness_multiplier = 2.0,
		min_effect_alpha = 0.3,
		max_effect_alpha = 0.5,
		map_color = {0.15, 0.45, 1.0}
	},
}

local noise = require("noise");
local tne = noise.to_noise_expression;
resource_autoplace = require("resource-autoplace");
resource_autoplace.initialize_patch_set("tibGrowthNode", startingArea)

data:extend{
	{
		type = "simple-entity",
		name = "tibNode_tree",
		icon = tiberiumInternalName.."/graphics/entity/nodes/tiberium_blossom_tree.png",
		icon_size = 32,
		flags = {"placeable-neutral", "not-repairable", "not-flammable"},
		subgroup = "remnants",
		order = "a[remnants]",
		--selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		selection_priority = 2,
		collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
		collision_mask = {"item-layer", "object-layer"},
		picture = {
			filename = tiberiumInternalName.."/graphics/entity/nodes/tiberium_blossom_tree.png",
			width = 320,
			height = 251,
		},
	},
	{
		type = "resource",
		name = "tibGrowthNode",
		icon = tiberiumInternalName.."/graphics/sonic wall/empty.png",
		icon_size = 32,
		flags = {"placeable-neutral"},
		category = "advanced-solid-tiberium",
		order="a-b-a",
		infinite = false,
		highlight = true,
		minimum = 600000,
		normal = 3000000,
		resource_patch_search_radius = 12,
		tree_removal_probability = 0.8,
		tree_removal_max_distance = 32 * 32,
		minable = {mining_time = 1, result = "tiberium-ore"},
		collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		autoplace = resource_autoplace.resource_autoplace_settings{
			name = "tibGrowthNode",
			order = "c", -- Other resources are "b"; oil won't get placed if something else is already there.
			base_density = 3.0,
			base_spots_per_km2 = tibOnly and 12 or 1.8,
			random_probability = tibOnly and 1 / 36 or 1 / 48,
			random_spot_size_minimum = 1,
			random_spot_size_maximum = 1, -- don't randomize spot size
			additional_richness = 200000, -- this increases the total everywhere, so base_density needs to be decreased to compensate
			has_starting_area_placement = startingArea,
			regular_rq_factor_multiplier = 1
		},
		stage_counts = {0},
		stages = {
			sheet = common.blankAnimation
		},
		map_color = {0.02, 1.0, 0.02},
		map_grid = false
	},
	{
		type = "resource",
		name = "tibGrowthNode_infinite",
		icon = tiberiumInternalName.."/graphics/sonic wall/empty.png",
		icon_size = 32,
		flags = {"placeable-neutral"},
		category = "advanced-liquid-tiberium",
		order="a-b-a",
		infinite = true,
		highlight = true,
		minimum = 600000,
		normal = 3000000,
		infinite_depletion_amount = 5,
		resource_patch_search_radius = 12,
		tree_removal_probability = 0.7,
		tree_removal_max_distance = 32 * 32,
		minable = {
			mining_time = 5,
			results = {
				{
					type = "fluid",
					name = "molten-tiberium",
					amount_min = 10,
					amount_max = 10,
					probability = 1
				}
			}
		},
		collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		stage_counts = {0},
		stages = {
			sheet = common.blankAnimation
		},
		map_color = {0.2, 0.9, 0},
		map_grid = false
	},
}

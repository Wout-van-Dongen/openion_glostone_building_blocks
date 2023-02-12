-- Mod Container -------------------------------------------------------
openion_glostone_building_blocks = {}

-- Settings ------------------------------------------------------------

--Mods
local enable_mod_stairs = minetest.settings:get_bool('openion_glostone_building_blocks_enable_mod_stairs', true)

--Light Emission
local stone_emission = minetest.registered_nodes['ethereal:glostone'].light_source or 12
local brick_emission_multiplier = minetest.settings:get('openion_glostone_building_blocks_brick_emission_multiplier') or 0.9
local block_emission_multiplier = minetest.settings:get('openion_glostone_building_blocks_block_emission_multiplier') or 1
local cobble_emission_multiplier = minetest.settings:get('openion_glostone_building_blocks_cobble_emission_multiplier') or 0.3 
local stair_emission_multiplier = minetest.settings:get('openion_glostone_building_blocks_stair_emission_multiplier') or 0.7
local slab_emission_multiplier = minetest.settings:get('openion_glostone_building_blocks_slab_emission_multiplier') or 0.5

-- Definitions ---------------------------------------------------------

local node_defs = {
	glostone = {
		description = 'Glostone',
		tiles = 'ethereal_glostone.png',
		light_source = stone_emission,
	},
	glostone_brick = {
		description = 'Glostone Brick',
		tiles = {
			'ethereal_glostone.png^openion_glostone_building_blocks_brick_overlay.png',
		},
		light_source = stone_emission * brick_emission_multiplier,
	},
	glostone_block = {
		description = 'Glostone Block',
		tiles = {
			'ethereal_glostone.png^openion_glostone_building_blocks_block_overlay.png',
		},
		light_source = stone_emission * block_emission_multiplier,
	},
	glostone_cobble = {
		description = 'Glostone Cobble',
		tiles = {
			'ethereal_glostone.png^openion_glostone_building_blocks_cobble_overlay.png',
		},
		light_source = stone_emission * cobble_emission_multiplier,
	}
}

-- Registering ---------------------------------------------------------

for node_name, def in pairs(node_defs) do
	local mod_prefix = 'ethereal:'
	if minetest.registered_nodes[mod_prefix .. node_name] == nil then
		mod_prefix = 'openion_glostone_building_blocks:'
		minetest.register_node(
			mod_prefix .. node_name,
			{
				description = def.description,
				tiles = def.tiles,
				groups = {cracky = 2},
				light_source = def.light_source,
				drop = mod_prefix .. node_name,
				sounds = default.node_sound_stone_defaults()
			}
		)
	end
	
	--Registering Stairs
	if minetest.get_modpath("stairs") ~= nil and enable_mod_stairs then
		stairs.register_stair_and_slab(
			node_name,
			mod_prefix .. node_name,
			{
				cracky = 2
			},
			type(def.tiles) == 'table' and def.tiles or {def.tiles},
			def.description .. ' Stair',
			def.description .. ' Slab',
			default.node_sound_stone_defaults()
		)
	
	--Override Light Emission
	minetest.override_item(
        'stairs:stair_' .. node_name,
        {
            light_source = def.light_source * stair_emission_multiplier
        }
    )
    minetest.override_item(
        'stairs:stair_outer_' .. node_name,
        {
            light_source = def.light_source * stair_emission_multiplier
        }
    )
    minetest.override_item(
        'stairs:stair_inner_' .. node_name,
        {
            light_source = def.light_source * stair_emission_multiplier
        }
    )
    minetest.override_item(
        'stairs:slab_' .. node_name,
        {
            light_source = def.light_source * slab_emission_multiplier
        }
    )
    end
end

-- Recipes -------------------------------------------------------------

--Brick Recipe
minetest.register_craft(
    {
        output = 'openion_glostone_building_blocks:glostone_brick 4',
        recipe = {
            {'ethereal:glostone', 'ethereal:glostone'},
            {'ethereal:glostone', 'ethereal:glostone'}
        }
    }
)

--Reverse Brick Recipe
minetest.register_craft(
	{
		type = 'cooking',
		output = 'ethereal:glostone',
		recipe = 'openion_glostone_building_blocks:glostone_brick',
		cooktime = 9,
	}
)

--Block Recipe
minetest.register_craft(
    {
        output = 'openion_glostone_building_blocks:glostone_block 9',
        recipe = {
            {'ethereal:glostone', 'ethereal:glostone', 'ethereal:glostone'},
            {'ethereal:glostone', 'ethereal:glostone', 'ethereal:glostone'},
            {'ethereal:glostone', 'ethereal:glostone', 'ethereal:glostone'}
        }
    }
)

--Reverse Block Recipe
minetest.register_craft(
	{
		type = 'cooking',
		output = 'ethereal:glostone',
		recipe = 'openion_glostone_building_blocks:glostone_block',
		cooktime = 9,
	}
)

--Cobble Recipe
minetest.register_craft(
    {
        output = 'openion_glostone_building_blocks:glostone_cobble',
        recipe = {
            {'ethereal:glostone'},
        }
    }
)

--Reverse Block Recipe
minetest.register_craft(
	{
		type = 'cooking',
		output = 'ethereal:glostone',
		recipe = 'openion_glostone_building_blocks:glostone_cobble',
		cooktime = 9,
	}
)

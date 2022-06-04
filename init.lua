-- Not really used for now, but I think it makes good practise to define this for each mod
openion_glostone_building_blocks = {}

-- Settings
local stone_emission = minetest.registered_nodes["ethereal:glostone"].light_source or 12
local stone_stairs_emission_multiplier = minetest.settings:get("openion_glostone_building_blocks_stone_stairs_emission") or 0.7
local stone_slabs_emission_multiplier = minetest.settings:get("openion_glostone_building_blocks_stone_slabs_emission") or 0.5
local brick_emission_multiplier = minetest.settings:get("openion_glostone_building_blocks_brick_emission") or 0.9
local brick_stairs_emission_multiplier = minetest.settings:get("openion_glostone_building_blocks_brick_stairs_emission") or 0.7
local brick_slabs_emission_multiplier = minetest.settings:get("openion_glostone_building_blocks_brick_slabs_emission") or 0.5
local block_emission_multiplier = minetest.settings:get("openion_glostone_building_blocks_block_emission") or 1
local block_stairs_emission_multiplier = minetest.settings:get("openion_glostone_building_blocks_block_stairs_emission") or 0.7
local block_slabs_emission_multiplier = minetest.settings:get("openion_glostone_building_blocks_block_slabs_emission") or 0.5

-- Glostone Brick
minetest.register_node(
    'openion_glostone_building_blocks:glostone_brick',
    {
    	description = 'Glo Stone Brick',
    	tiles = {
            'ethereal_glostone.png^openion_glostone_building_blocks_brick_overlay.png'
        },
    	groups = {
            cracky = 2
        },
    	light_source = stone_emission * brick_emission_multiplier,
    	drop = 'openion_glostone_building_blocks:glostone_brick',
        sounds = default.node_sound_stone_defaults()
    }
)

minetest.register_craft(
    {
        output = 'openion_glostone_building_blocks:glostone_brick 4',
        recipe = {
            {'ethereal:glostone', 'ethereal:glostone'},
            {'ethereal:glostone', 'ethereal:glostone'}
        }
    }
)

-- Glostone Block
minetest.register_node(
    'openion_glostone_building_blocks:glostone_block',
    {
    	description = 'Glo Stone Block',
    	tiles = {
            'ethereal_glostone.png^openion_glostone_building_blocks_block_overlay.png'
        },
    	groups = {
            cracky = 2
        },
    	light_source = stone_emission * block_emission_multiplier,
    	drop = 'openion_glostone_building_blocks:glostone_block',
        sounds = default.node_sound_stone_defaults()
    }
)

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

-- Register stairs
if minetest.get_modpath("stairs") ~= nil then
    -- Glostone Brick stairs
    stairs.register_stair_and_slab(
        'glostone',
        'ethereal:glostone',
        {
            cracky = 2
        },
        {
            'ethereal_glostone.png'
        },
        'Glostone Stair',
        'Glostone Slab',
        default.node_sound_stone_defaults()
    )

    minetest.override_item(
        'stairs:stair_glostone',
        {
            light_source = stone_emission * stone_stairs_emission_multiplier
        }
    )
    minetest.override_item(
        'stairs:stair_outer_glostone',
        {
            light_source = stone_emission * stone_stairs_emission_multiplier
        }
    )
    minetest.override_item(
        'stairs:stair_inner_glostone',
        {
            light_source = stone_emission * stone_stairs_emission_multiplier
        }
    )
    minetest.override_item(
        'stairs:slab_glostone',
        {
            light_source = stone_emission * stone_slabs_emission_multiplier
        }
    )

    -- Glostone Brick stairs
    stairs.register_stair_and_slab(
        'glostone_brick',
        'openion_glostone_building_blocks:glostone_brick',
        {
            cracky = 2
        },
        {
            'ethereal_glostone.png^openion_glostone_building_blocks_brick_overlay.png'
        },
        'Glostone Brick Stair',
        'Glostone Brick Slab',
        default.node_sound_stone_defaults()
    )

    minetest.override_item(
        'stairs:stair_glostone_brick',
        {
            light_source = stone_emission * brick_stairs_emission_multiplier
        }
    )
    minetest.override_item(
        'stairs:stair_outer_glostone_brick',
        {
            light_source = stone_emission * brick_stairs_emission_multiplier
        }
    )
    minetest.override_item(
        'stairs:stair_inner_glostone_brick',
        {
            light_source = stone_emission * brick_stairs_emission_multiplier
        }
    )
    minetest.override_item(
        'stairs:slab_glostone_brick',
        {
            light_source = stone_emission * brick_slabs_emission_multiplier
        }
    )

    -- Glostone Block stairs
    stairs.register_stair_and_slab(
        'glostone_block',
        'openion_glostone_building_blocks:glostone_block',
        {
            cracky = 2
        },
        {
            'ethereal_glostone.png^openion_glostone_building_blocks_block_overlay.png'
        },
        'Glostone Block Stair',
        'Glostone Block Slab',
        default.node_sound_stone_defaults()
    )

    minetest.override_item(
        'stairs:stair_glostone_block',
        {
            light_source = stone_emission * block_stairs_emission_multiplier
        }
    )
    minetest.override_item(
        'stairs:stair_outer_glostone_block',
        {
            light_source = stone_emission * block_stairs_emission_multiplier
        }
    )
    minetest.override_item(
        'stairs:stair_inner_glostone_block',
        {
            light_source = stone_emission * block_stairs_emission_multiplier
        }
    )
    minetest.override_item(
        'stairs:slab_glostone_block',
        {
            light_source = stone_emission * block_slabs_emission_multiplier
        }
    )
end

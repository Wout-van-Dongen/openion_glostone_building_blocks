-- Mod Container -------------------------------------------------------
openion_glostone_building_blocks = {}

-- Functions -----------------------------------------------------------
local function table_copy(table)
	local copy = {}
	for key, value in pairs(table) do
		copy[key] = value
	end
	return copy
end

function table_update(table, def)
	for key, value in pairs(def) do
		table[key] = value
	end
end


-- Settings ------------------------------------------------------------

--Mods
local mod_name = minetest.get_current_modname()
local enable_mod_stairs = minetest.get_modpath('stairs') ~= nil and minetest.settings:get_bool('openion_glostone_building_blocks_enable_mod_stairs', true)
local enable_mod_moreblocks = minetest.get_modpath('moreblocks') ~= nil and minetest.settings:get_bool('openion_glostone_building_blocks_enable_mod_moreblocks', false)

 --Ethereal
local glostone_def = minetest.registered_nodes['ethereal:glostone']


--Light Emission
local stone_emission = glostone_def.light_source or 12
local brick_emission_multiplier = minetest.settings:get('openion_glostone_building_blocks_brick_emission_multiplier') or 0.9
local block_emission_multiplier = minetest.settings:get('openion_glostone_building_blocks_block_emission_multiplier') or 1
local cobble_emission_multiplier = minetest.settings:get('openion_glostone_building_blocks_cobble_emission_multiplier') or 0.3 
local stair_emission_multiplier = minetest.settings:get('openion_glostone_building_blocks_stair_emission_multiplier') or 0.7
local slab_emission_multiplier = minetest.settings:get('openion_glostone_building_blocks_slab_emission_multiplier') or 0.5
local micro_emission_multiplier = minetest.settings:get('openion_glostone_building_blocks_micro_emission_multiplier') or 0.125
local panel_emission_multiplier = minetest.settings:get('openion_glostone_building_blocks_panel_emission_multiplier') or 0.5
local slope_emission_multiplier = minetest.settings:get('openion_glostone_building_blocks_slope_emission_multiplier') or 0.5

-- Data ----------------------------------------------------------------

local data_node_light = {
	stair = {
		{
			stairs = {prefix ='stairs:stair_', suffix = ''},
			moreblocks = {prefix = mod_name .. ':stair_', suffix = ''},
			light_source_multiplier = stair_emission_multiplier
		},
		{
			stairs = {prefix = 'stairs:stair_outer_', suffix = ''},
			moreblocks = {prefix = mod_name .. ':stair_', suffix = '_outer'},
			light_source_multiplier = stair_emission_multiplier
		},
		{
			stairs = {prefix = 'stairs:stair_inner_', suffix = ''},
			moreblocks = {prefix = mod_name .. ':stair_', suffix = '_inner'},
			light_source_multiplier = stair_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':stair_', suffix = '_half'},
			light_source_multiplier = stair_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':stair_', suffix = '_right_half'},
			light_source_multiplier = stair_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':stair_', suffix = '_alt'},
			light_source_multiplier= stair_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':stair_', suffix = '_alt_1'},
			light_source_multiplier = stair_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':stair_', suffix = '_alt_2'},
			light_source_multiplier = stair_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':stair_', suffix = '_alt_4'},
			light_source_multiplier = stair_emission_multiplier
		},
	},
	--Slabs
	slab = {
		{
			stairs = {prefix = 'stairs:slab_', suffix = ''},
			moreblocks =  {prefix = mod_name .. ':slab_', suffix = ''},
			light_source_multiplier = slab_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks =  {prefix = mod_name .. ':slab_', suffix = '_quarter'},
			light_source_multiplier = slab_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks =  {prefix = mod_name .. ':slab_', suffix = '_three_quarter'},
			light_source_multiplier = slab_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks =  {prefix = mod_name .. ':slab_', suffix = '_two_sides'},
			light_source_multiplier = slab_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks =  {prefix = mod_name .. ':slab_', suffix = '_three_sides'},
			light_source_multiplier = slab_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks =  {prefix = mod_name .. ':slab_', suffix = '_1'},
			light_source_multiplier = slab_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks =  {prefix = mod_name .. ':slab_', suffix = '_2'},
			light_source_multiplier = slab_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks =  {prefix = mod_name .. ':slab_', suffix = '_14'},
			light_source_multiplier = slab_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks =  {prefix = mod_name .. ':slab_', suffix = '_15'},
			light_source_multiplier = slab_emission_multiplier
		},
	},
	--Micro Blocks
	micro = {
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':micro_', suffix = ''},
			light_source_multiplier =  micro_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks =  {prefix = mod_name .. ':micro_', suffix = '_1'},
			light_source_multiplier = micro_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks =  {prefix = mod_name .. ':micro_', suffix = '_2'},
			light_source_multiplier = micro_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks =  {prefix = mod_name .. ':micro_', suffix = '_4'},
			light_source_multiplier = micro_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks =  {prefix = mod_name .. ':micro_', suffix = '_12'},
			light_source_multiplier = micro_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks =  {prefix = mod_name .. ':micro_', suffix = '_14'},
			light_source_multiplier = micro_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks =  {prefix = mod_name .. ':micro_', suffix = '_15'},
			light_source_multiplier = micro_emission_multiplier
		},
	},
	--Panels
	panel = {
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':panel_', suffix = ''},
			light_source_multiplier = panel_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':panel_', suffix = '_1'},
			light_source_multiplier = panel_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':panel_', suffix = '_2'},
			light_source_multiplier = panel_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':panel_', suffix = '_4'},
			light_source_multiplier = panel_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':panel_', suffix = '_12'},
			light_source_multiplier = panel_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':panel_', suffix = '_14'},
			light_source_multiplier = panel_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':panel_', suffix = '_15'},
			light_source_multiplier = panel_emission_multiplier
		},
	},
	--Slopes
	slope = {
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':slope_', suffix = ''},
			light_source_multiplier = slope_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':slope_', suffix = '_half'},
			light_source_multiplier = slope_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':slope_', suffix = '_half_raised'},
			light_source_multiplier = slope_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':slope_', suffix = '_inner'},
			light_source_multiplier = slope_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':slope_', suffix = '_inner_half'},
			light_source_multiplier = slope_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':slope_', suffix = '_inner_half_raised'},
			light_source_multiplier = slope_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':slope_', suffix = '_inner_cut'},
			light_source_multiplier = slope_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':slope_', suffix = '_inner_cut_half'},
			light_source_multiplier = slope_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':slope_', suffix = '_inner_cut_half_raised'},
			light_source_multiplier = slope_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':slope_', suffix = '_inner'},
			light_source_multiplier = slope_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':slope_', suffix = '_outer_half'},
			light_source_multiplier = slope_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':slope_', suffix = '_outer_half_raised'},
			light_source_multiplier = slope_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':slope_', suffix = '_outer_cut'},
			light_source_multiplier = slope_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':slope_', suffix = '_outer_cut_half'},
			light_source_multiplier = slope_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':slope_', suffix = '_outer_cut_half_raised'},
			light_source_multiplier = slope_emission_multiplier
		},
		{
			stairs = nil,
			moreblocks = {prefix = mod_name .. ':slope_', suffix = '_cut'},
			light_source_multiplier = slope_emission_multiplier
		},
	},
}

-- Definitions ---------------------------------------------------------

local node_defs = {
	glostone = {

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
	local base_def = table_copy(glostone_def)
	table_update(base_def, def)
	base_def.drop = nil
	
	if minetest.registered_nodes[mod_prefix .. node_name] == nil then
		mod_prefix = mod_name .. ':'
				
		minetest.register_node(
			mod_prefix .. node_name,
			base_def
		)
	end
	
	--Registering MoreBlocks
	if enable_mod_moreblocks then
				
		stairsplus:register_all(
            'openion_glostone_building_blocks',
            node_name,
            mod_prefix .. node_name,
            base_def
        )
        
        for index, cat in pairs(data_node_light) do
			for jndex, entry in pairs(cat) do
				--Set Lighting
				minetest.override_item(
					entry['moreblocks']['prefix'] .. node_name .. entry['moreblocks']['suffix'],
					{
						light_source = base_def.light_source * entry['light_source_multiplier']
					}
				)
							
				--Register Aliases
				if entry['stairs'] ~= nil then
					minetest.register_alias(
						entry['stairs']['prefix'] .. node_name .. entry['stairs']['suffix'],
						entry['moreblocks']['prefix'] .. node_name .. entry['moreblocks']['suffix']
					)
				end
			end
        end
	end

	--Registering Stairs
	if enable_mod_stairs and not enable_mod_moreblocks then
		stairs.register_stair_and_slab(
			node_name,
			mod_prefix .. node_name,
			base_def.groups,
			type(base_def.tiles) == 'table' and base_def.tiles or {base_def.tiles},
			base_def.description .. ' Stair',
			base_def.description .. ' Slab',
			base_def.sounds
		)
		
		for index, cat in pairs(data_node_light) do
			for jndex, entry in pairs(cat) do
				if entry['stairs'] ~= nil then
					--Set Lighting
					minetest.override_item(
						entry['stairs']['prefix'] .. node_name .. entry['stairs']['suffix'],
						{
							light_source = base_def.light_source * entry['light_source_multiplier']
						}
					)
								
					--Register Aliases
					minetest.register_alias(
						entry['moreblocks']['prefix'] .. node_name .. entry['moreblocks']['suffix'],
						entry['stairs']['prefix'] .. node_name .. entry['stairs']['suffix']
					)
				end
			end
        end
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

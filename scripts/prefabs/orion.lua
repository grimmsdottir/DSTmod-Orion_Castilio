
local MakePlayerCharacter = require "prefabs/player_common"


local assets = {

        Asset( "ANIM", "anim/player_basic.zip" ),
        Asset( "ANIM", "anim/player_idles_shiver.zip" ),
        Asset( "ANIM", "anim/player_actions.zip" ),
        Asset( "ANIM", "anim/player_actions_axe.zip" ),
        Asset( "ANIM", "anim/player_actions_pickaxe.zip" ),
        Asset( "ANIM", "anim/player_actions_shovel.zip" ),
        Asset( "ANIM", "anim/player_actions_blowdart.zip" ),
        Asset( "ANIM", "anim/player_actions_eat.zip" ),
        Asset( "ANIM", "anim/player_actions_item.zip" ),
        Asset( "ANIM", "anim/player_actions_uniqueitem.zip" ),
        Asset( "ANIM", "anim/player_actions_bugnet.zip" ),
        Asset( "ANIM", "anim/player_actions_fishing.zip" ),
        Asset( "ANIM", "anim/player_actions_boomerang.zip" ),
        Asset( "ANIM", "anim/player_bush_hat.zip" ),
        Asset( "ANIM", "anim/player_attacks.zip" ),
        Asset( "ANIM", "anim/player_idles.zip" ),
        Asset( "ANIM", "anim/player_rebirth.zip" ),
        Asset( "ANIM", "anim/player_jump.zip" ),
        Asset( "ANIM", "anim/player_amulet_resurrect.zip" ),
        Asset( "ANIM", "anim/player_teleport.zip" ),
        Asset( "ANIM", "anim/wilson_fx.zip" ),
        Asset( "ANIM", "anim/player_one_man_band.zip" ),
        Asset( "ANIM", "anim/shadow_hands.zip" ),
        Asset( "SOUND", "sound/sfx.fsb" ),
        Asset( "SOUND", "sound/wilson.fsb" ),
        Asset( "ANIM", "anim/beard.zip" ),

        Asset( "ANIM", "anim/orion.zip" ),
        Asset( "ANIM", "anim/ghost_orion_build.zip" ),
}
local prefabs = {
	
	"item_battery",
	"item_battery_charged",
	
	"item_nutribar",
	"meat",
	
	"up_kit",
	"up_blaster",
	"up_pow",
	"up_stun",
	
	"item_blaster",
}
local start_inv = {

	"item_battery_charged",
	"item_battery_charged",
	"item_battery_charged",
	"item_battery_charged",
	"item_battery_charged",
	"item_battery_charged",
	
	"item_nutribar",
	"item_nutribar",
	"item_nutribar",
	"item_nutribar",
	"item_nutribar",
	
	"up_kit",
	"up_blaster",
	"up_pow",
	"up_stun",
	
	"meat",
	
	"item_blaster",
}

-- This initializes for both clients and the host
local common_postinit = function(inst) 
-- Minimap icon
	inst.MiniMapEntity:SetIcon( "orion.tex" )
	
--Initiate Key readers
	inst:AddComponent("keyhandler")
	inst.components.keyhandler:AddActionListener("Orion", TUNING.ORION.BLASTERCYCLEFIREMODEKEY, "CYCLEFIRE")
	
--Set states
	inst.blasterblaster = true
	inst.blasterstun = false

--Set Battery states
	inst.batteriesnum = 0
	
--Set Blaster stats
	inst.blasterblasterdamage = 60
	inst.blasterblasterlevel = 1
	inst.blasterstunpower = 1
	inst.blasterstunlevel = 1
	
--Base cost of the blasting stick, do not change it
	inst.blasterstuncost = 2
	inst.blasterblastercost = 3
	
--Set Upgrade stats
	inst.blasterbattefficiency = 0
	inst.blasterbattefficiencylevel = 1
end

--When eating food, check if she ate an upgrade kit
	local function oneat(inst, food)
		--Blaster upgrade
		if food and food.components.edible and food.components.edible.foodtype == "ORIONUPBLASTER" then
			if inst.blasterblasterlevel < 10 then
				inst.blasterblasterlevel = inst.blasterblasterlevel + 1
				inst.blasterblasterdamage = inst.blasterblasterdamage + 30
				inst.blasterblastercost = inst.blasterblastercost + 1	
				inst.components.talker:Say("Blaster upgraded! Now 10% more pew pew than before.")
			else
				inst.components.talker:Say("My blaster is as tricked out as it can be.")
				inst.components.inventory:GiveItem(SpawnPrefab("up_kit"))
			end
			return
		end
		--Stun upgrade
		if food and food.components.edible and food.components.edible.foodtype == "ORIONUPSTUN" then
			if inst.blasterstunlevel < 5 then
				inst.blasterstunlevel = inst.blasterstunlevel + 1
				inst.blasterstunpower = inst.blasterstunpower + 1
				inst.blasterstuncost = inst.blasterstuncost + 1	
				inst.components.talker:Say("Blaster upgraded! Now 10% more ZZZs than before.")
			else
				inst.components.talker:Say("My blaster is as tricked out as it can be.")
				inst.components.inventory:GiveItem(SpawnPrefab("up_kit"))
			end
			return
		end
		--Blaster efficiency upgrade
		if food and food.components.edible and food.components.edible.foodtype == "ORIONUPPOW" then
			if inst.blasterbattefficiencylevel < 5 then
				inst.blasterbattefficiencylevel = inst.blasterbattefficiencylevel + 1
				inst.blasterbattefficiency = inst.blasterbattefficiency + 1
				inst.components.talker:Say("Blaster upgraded! Now 10% more battery per battery than before.")
			else
				inst.components.talker:Say("My blaster is as tricked out as it can be.")
				inst.components.inventory:GiveItem(SpawnPrefab("up_kit"))
			end
			return
		end
	end

-- This initializes for the host only
local master_postinit = function(inst)
	-- choose which sounds this character will play
	inst.soundsname = "willow"
	-- Stats	
	inst.components.health:SetMaxHealth(150)
	inst.components.hunger:SetMax(150)
	inst.components.sanity:SetMax(200)
	
	inst.components.eater:SetDiet({ FOODGROUP.ORIONOMNI }, { FOODGROUP.ORIONUSABLE })
	inst.components.eater:SetOnEatFn(oneat)
end

return MakePlayerCharacter("orion", prefabs, assets, common_postinit, master_postinit, start_inv)

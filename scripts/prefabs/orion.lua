
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
	"nitre",
	
	"up_kit",
	"up_blaster",
	"up_pow",
	"up_stun",
	"up_health",
	"up_hunger",
	"up_sanity",
	"up_speed",
	
	"item_blaster",
}
local start_inv = {

	"item_battery_charged",
	"item_battery_charged",
	"item_battery_charged",
	
	"item_nutribar",
	"item_nutribar",
	"nitre",
	"nitre",
	"nitre",
	"nitre",
	"nitre",
	
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
	
--Set Blaster stats
	inst.blasterblasterdamage = 60
	inst.blasterblasterlevel = 0
	inst.blasterstunpower = 1
	inst.blasterstunlevel = 0
	
--Base cost of the blasting stick
	inst.blasterstuncost = 2
	inst.blasterblastercost = 3
	
--Blaster efficiencies
	inst.blasterbattefficiency = 0
	inst.blasterbattefficiencylevel = 0
	
--Suit upgrades
	inst.uphealthlevel = 0
	inst.uphungerlevel = 0
	inst.upsanitylevel = 0
	inst.upspeedlevel = 0
	
--Tags Orion for her custom recipes
	inst:AddTag("orioncraftingtag")
end

--When eating food, check if she ate an upgrade kit, or some minerals
	local function oneat(inst, food)
		--Blaster upgrade
		if food and food.components.edible and food.components.edible.foodtype == "ORIONUPBLASTER" then
			if inst.blasterblasterlevel < 10 then
				inst.blasterblasterlevel = inst.blasterblasterlevel + 1
				inst.blasterblasterdamage = inst.blasterblasterdamage + 30
				inst.blasterblastercost = inst.blasterblastercost + 1	
				inst.components.talker:Say("Blaster upgraded! Now 10% more pew pew than before!")
			else
				inst.components.talker:Say("My blaster is as tricked out as it can be!")
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
				inst.components.talker:Say("Blaster upgraded! Now 10% more ZZZs than before!")
			else
				inst.components.talker:Say("My blaster is as tricked out as it can be!")
				inst.components.inventory:GiveItem(SpawnPrefab("up_kit"))
			end
			return
		end
		--Blaster efficiency upgrade
		if food and food.components.edible and food.components.edible.foodtype == "ORIONUPPOW" then
			if inst.blasterbattefficiencylevel < 5 then
				inst.blasterbattefficiencylevel = inst.blasterbattefficiencylevel + 1
				inst.blasterbattefficiency = inst.blasterbattefficiency + 1
				inst.components.talker:Say("Blaster upgraded! Now 10% more battery per battery than before!")
			else
				inst.components.talker:Say("My blaster is as tricked out as it can be!")
				inst.components.inventory:GiveItem(SpawnPrefab("up_kit"))
			end
			return
		end
		if food and food.components.edible and food.components.edible.foodtype == "ORIONUPHEALTH" then
			if inst.uphealthlevel < 10 then
				inst.uphealthlevel = inst.uphealthlevel + 1
				local maxhealth =  inst.components.health.maxhealth
				maxhealth = maxhealth + 10
				inst.components.health:SetMaxHealth(maxhealth)
				local healthabsorb = inst.components.health.absorb
				healthabsorb = healthabsorb + 0.05
				inst.components.health:SetAbsorptionAmount(healthabsorb)
				inst.components.talker:Say("Suit upgraded! Now 10% more health than before!")
			else
				inst.components.talker:Say("My suit is as tricked out as it can be!")
				inst.components.inventory:GiveItem(SpawnPrefab("up_kit"))
			end
			return
		end
		if food and food.components.edible and food.components.edible.foodtype == "ORIONUPHUNGER" then
			if inst.uphungerlevel < 10 then
				inst.uphungerlevel = inst.uphungerlevel + 1
				local maxhunger = inst.components.hunger.max
				maxhunger = maxhunger + 10
				inst.components.hunger:SetMax(maxhunger)
				local newhungerrate = 1 - (inst.uphungerlevel*0.05)
				inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * newhungerrate)				
				inst.components.talker:Say("Suit upgraded! Now 10% more hunger than before!")
			else
				inst.components.talker:Say("My suit is as tricked out as it can be!")
				inst.components.inventory:GiveItem(SpawnPrefab("up_kit"))
			end
			return
		end
		if food and food.components.edible and food.components.edible.foodtype == "ORIONUPSANITY" then
			if inst.upsanitylevel < 10 then
				inst.upsanitylevel = inst.upsanitylevel + 1
				local maxsanity = inst.components.sanity.max	
				maxsanity = maxsanity + 10
				inst.components.sanity:SetMax(maxsanity)
				local sanitymulti = 1.3 - (inst.upsanitylevel* 0.1)
				inst.components.sanity.night_drain_mult = sanitymulti
				inst.components.sanity.neg_aura_mult = sanitymulti
				inst.components.talker:Say("Suit upgraded! Now 10% more sane than before!")
			else
				inst.components.talker:Say("My suit is as tricked out as it can be!")
				inst.components.inventory:GiveItem(SpawnPrefab("up_kit"))
			end
			return
		end
		if food and food.components.edible and food.components.edible.foodtype == "ORIONUPSPEED" then
			if inst.upspeedlevel < 5 then
				inst.upspeedlevel = inst.upspeedlevel + 1
				local speedmulti = 1 + (inst.upspeedlevel * 0.06)
				inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * speedmulti)
				inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * speedmulti)
				inst.components.talker:Say("Suit upgraded! Now 5% more faster than before!")
			else
				inst.components.talker:Say("My suit is as tricked out as it can be!")
				inst.components.inventory:GiveItem(SpawnPrefab("up_kit"))
			end
			return
		end
		if food and food.components.edible and food.prefab == "nitre" then
			--Orion's fav food is nitre, so it boosts the most sanity
			--say something about food, maybe
			inst.components.talker:Say("I ate nitre!")
			--remove the old hunger bonus
			inst.components.hunger:DoDelta(-2)
			--give the new edibleness
			inst.components.hunger:DoDelta(TUNING.CALORIES_MED)
			inst.components.health:DoDelta(TUNING.HEALING_TINY)
			inst.components.sanity:DoDelta(TUNING.SANITY_MED)
			inst.HUD.controls.status.heart:PulseGreen()
			inst.HUD.controls.status.heart:ScaleTo(1.3,1,.7)
			inst.HUD.controls.status.brain:PulseGreen()
			inst.HUD.controls.status.brain:ScaleTo(1.3,1,.7)
			return
		end
		if food and food.components.edible and food.prefab == "rocks" then
			--Orion's staple is rock, so it only restores hunger
			--say something about food, maybe
			inst.components.talker:Say("I ate rocks!")
			--remove the old hunger bonus
			inst.components.hunger:DoDelta(-1)
			--give the new edibleness
			inst.components.hunger:DoDelta(TUNING.CALORIES_MED)
			return
		end
		if food and food.components.edible and food.prefab == "gold" then
			--Gold restores health?
			--say something about food, maybe
			inst.components.talker:Say("I ate gold!")
			--remove the old hunger bonus
			inst.components.hunger:DoDelta(-2)
			--give the new edibleness
			inst.components.hunger:DoDelta(TUNING.CALORIES_MED)
			inst.components.health:DoDelta(TUNING.HEALING_MEDLARGE)
			inst.components.sanity:DoDelta(TUNING.SANITY_SUPERTINY)
			inst.HUD.controls.status.heart:PulseGreen()
			inst.HUD.controls.status.heart:ScaleTo(1.3,1,.7)
			inst.HUD.controls.status.brain:PulseGreen()
			inst.HUD.controls.status.brain:ScaleTo(1.3,1,.7)
			return
		end
		if food and food.components.edible and food.prefab == "flint" then
			--Flint is more or less the same as rock
			--say something about food, maybe
			inst.components.talker:Say("I ate flint!")
			--remove the old hunger bonus
			inst.components.hunger:DoDelta(-1)
			--give the new edibleness
			inst.components.hunger:DoDelta(TUNING.CALORIES_MED)
			return
		end
	end

-- This initializes for the host only
local master_postinit = function(inst)
	-- choose which sounds this character will play
	inst.soundsname = "willow"

	--Orion's special diet
	inst.components.eater:SetDiet({ FOODGROUP.ORIONOMNI }, { FOODGROUP.ORIONUSABLE })
	--Check if Orion is eating upgrade kits 
	inst.components.eater:SetOnEatFn(oneat)
	
--Orion's stats
	--Health
	inst.components.health:SetMaxHealth(100)
	inst.components.health:SetAbsorptionAmount(0)
	--Hunger
	inst.components.hunger:SetMax(100)
	inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1)
	--Sanity
	inst.components.sanity:SetMax(100)
	inst.components.sanity.night_drain_mult = 1.3
	inst.components.sanity.neg_aura_mult = 1.3
	--Speed
	inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1)
	inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1)
	
	
end

return MakePlayerCharacter("orion", prefabs, assets, common_postinit, master_postinit, start_inv)



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
	
	"item_blaster",
}
local start_inv = {

	"item_battery_charged",
	"item_battery_charged",
	"item_battery_charged",
	
	"item_blaster",
}

-- This initializes for both clients and the host
local common_postinit = function(inst) 
-- Minimap icon
	inst.MiniMapEntity:SetIcon( "orion.tex" )
	
--Initiate Key readers
	inst:AddComponent("keyhandler")
	inst.components.keyhandler:AddActionListener("Orion", TUNING.ORION.BLASTERCYCLEFIREMODEKEY, "CYCLEFIRE")
	inst.components.keyhandler:AddActionListener("Orion", TUNING.ORION.BLASTERCYCLEFIREMODEREVERSEKEY, "CYCLEFIREREVERSE")
	
--Set states
	inst.blasterblaster = true
	inst.blasterstun = false
	inst.blasterincinerate = false
	inst.blasterovercharge = false
	
	
end

-- This initializes for the host only
local master_postinit = function(inst)
	-- choose which sounds this character will play
	inst.soundsname = "willow"
	-- Stats	
	inst.components.health:SetMaxHealth(150)
	inst.components.hunger:SetMax(150)
	inst.components.sanity:SetMax(200)
end

return MakePlayerCharacter("orion", prefabs, assets, common_postinit, master_postinit, start_inv)

PrefabFiles = {
	"orion",
	
	"item_battery",	
	"item_battery_charged",	
	
	"item_blaster",	
	
}

Assets = {

--Orion's assets
    Asset( "IMAGE", "images/saveslot_portraits/orion.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/orion.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/orion.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/orion.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/orion_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/orion_silho.xml" ),

    Asset( "IMAGE", "bigportraits/orion.tex" ),
    Asset( "ATLAS", "bigportraits/orion.xml" ),
	
	Asset( "IMAGE", "images/map_icons/orion.tex" ),
	Asset( "ATLAS", "images/map_icons/orion.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_orion.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_orion.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_orion.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_orion.xml" ),
	
--Battery assets
	Asset( "IMAGE", "images/inventoryimages/item_battery.tex" ),
    Asset( "ATLAS", "images/inventoryimages/item_battery.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- The character select screen lines
STRINGS.CHARACTER_TITLES.orion = "The Space Ranger"
STRINGS.CHARACTER_NAMES.orion = "Orion Castilio"
STRINGS.CHARACTER_DESCRIPTIONS.orion = "*Battery powered abilities\n*Can't eat regular food\n*Starts with a blaster"
STRINGS.CHARACTER_QUOTES.orion = "\"This planet is truly alien\""

-- Custom speech strings
STRINGS.CHARACTERS.ORION = require "speech_orion"

-- The character's name as appears in-game 
STRINGS.NAMES.ORION = "Orion Castilio"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ORION = 
{
	GENERIC = "It's Orion!",
	ATTACKER = "That Orion looks shifty...",
	MURDERER = "Murderer!",
	REVIVER = "Orion, friend of ghosts.",
	GHOST = "Orion could use a heart.",
}

--Item names and descriptions

	GLOBAL.STRINGS.NAMES.ITEM_BATTERY = "Battery"
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.ITEM_BATTERY = "An odd little device."
	GLOBAL.STRINGS.CHARACTERS.ORION.DESCRIBE.ITEM_BATTERY = "A miniature thermal micro-fusion battery. This needs to be charged at a fire."
	
	GLOBAL.STRINGS.NAMES.ITEM_BATTERY_CHARGED = "Charged Battery"
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.ITEM_BATTERY_CHARGED = "An odd, hot little device."
	GLOBAL.STRINGS.CHARACTERS.ORION.DESCRIBE.ITEM_BATTERY_CHARGED = "A powered battery, the lifeblood of a Ranger."
	
	GLOBAL.STRINGS.NAMES.ITEM_BLASTER = "Blasting Stick"
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.ITEM_BLASTER = "A staff of unbeknownst magic."
	GLOBAL.STRINGS.CHARACTERS.ORION.DESCRIBE.ITEM_BLASTER = "My trusty stick, never leave home without it."

--Declare Tunings
	GLOBAL.TUNING.ORION = {}

--General Tunings their values
	GLOBAL.TUNING.ORION.BATTERYSTACKSIZE = TUNING.STACK_SIZE_SMALLITEM
	GLOBAL.TUNING.ORION.BATTERYLIFE = TUNING.PERISH_SUPERFAST
	
--Keys to activate the various powers
	GLOBAL.TUNING.ORION.BLASTERCYCLEFIREMODEKEY = GetModConfigData("key-cycle") or 93
	GLOBAL.TUNING.ORION.BLASTERCYCLEFIREMODEREVERSEKEY = GetModConfigData("key-cycle-reverse") or 91
	
--All the Functions
	
	--Lines to say while cycling fire
	local cycleblasterblaster = "Vanilla blasting"
	local cycleblasterstun = "Setting blaster to stun."
	
	--Cycle Fire mode
	local function cyclefireFn(inst)
	--If you are a ghost, just go back, lol
		if inst:HasTag("playerghost") then return end
		
	--Cycle from blaster > stun > incinerate > overcharge
		if inst.blasterblaster then 
		
			inst.blasterblaster = false
			inst.blasterstun = true
			inst.components.talker:Say(cycleblasterstun)
			return			
		else 
		
			inst.blasterblaster = true
			inst.blasterstun = false
			inst.components.talker:Say(cycleblasterblaster)
			return			
		end
	end
--Key to Function linkers
	AddModRPCHandler("Orion", "CYCLEFIRE", cyclefireFn)


AddMinimapAtlas("images/map_icons/orion.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("orion", "FEMALE")


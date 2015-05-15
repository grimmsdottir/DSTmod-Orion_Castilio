PrefabFiles = {
	"orion",
	
	"item_battery",	
	"item_battery_charged",	
	
	"item_nutribar",	
	
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
	
	Asset( "IMAGE", "images/inventoryimages/item_battery_charged.tex" ),
    Asset( "ATLAS", "images/inventoryimages/item_battery_charged.xml" ),

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
	
	GLOBAL.STRINGS.NAMES.ITEM_NUTRIBAR = "Nutri-bar"
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.ITEM_NUTRIBAR = "A peculiar bar, can it even be eaten?"
	GLOBAL.STRINGS.CHARACTERS.ORION.DESCRIBE.ITEM_NUTRIBAR = "A nutritious bar, just about the only thing on this planet remotely digestible"
	
	GLOBAL.STRINGS.NAMES.UP_KIT = "Upgrade Kit"
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.UP_KIT = "An odd rectangular box. It sounds like there are things inside."
	GLOBAL.STRINGS.CHARACTERS.ORION.DESCRIBE.UP_KIT = "An upgrade kit, it contains nanomachines that can be used to upgrade my gear"
	
	GLOBAL.STRINGS.NAMES.UP_BLASTER = "Blaster Capacitor Upgrage Kit"
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.UP_BLASTER = "An odd rectangular box. It sounds like there are things inside."
	GLOBAL.STRINGS.CHARACTERS.ORION.DESCRIBE.UP_BLASTER = "This can be used to increase the power of my blasting stick's damage."
	
	GLOBAL.STRINGS.NAMES.UP_STUN = "Neural Stunning Amplification Kit"
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.UP_STUN = "An odd rectangular box. It sounds like there are things inside."
	GLOBAL.STRINGS.CHARACTERS.ORION.DESCRIBE.UP_STUN = "This can be used to increase the power of my blasting stick's stuns"
	
	GLOBAL.STRINGS.NAMES.UP_POW = "Power Efficiency Kit"
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.UP_POW = "An odd rectangular box. It sounds like there are things inside."
	GLOBAL.STRINGS.CHARACTERS.ORION.DESCRIBE.UP_POW = "This can be used to decrease the power cost of my blasting stick"
	
	GLOBAL.STRINGS.NAMES.UP_HEALTH = "Suit Plate Hardening Kit"
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.UP_HEALTH = "An odd rectangular box. It sounds like there are things inside."
	GLOBAL.STRINGS.CHARACTERS.ORION.DESCRIBE.UP_HEALTH = "This can be used to increase my general survivability"
	
	GLOBAL.STRINGS.NAMES.UP_HUNGER = "Metabolism Regulator Kit"
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.UP_HUNGER = "An odd rectangular box. It sounds like there are things inside."
	GLOBAL.STRINGS.CHARACTERS.ORION.DESCRIBE.UP_HUNGER = "This can be used to increase my nutritious longevity"
	
	GLOBAL.STRINGS.NAMES.UP_SANITY = "Nightmare Vision Kit"
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.UP_SANITY = "An odd rectangular box. It sounds like there are things inside."
	GLOBAL.STRINGS.CHARACTERS.ORION.DESCRIBE.UP_SANITY = "This can be used to pierce the nightmares of this place"
	
	GLOBAL.STRINGS.NAMES.UP_SPEED = "Exoskeletal Boost Kit"
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.UP_SPEED = "An odd rectangular box. It sounds like there are things inside."
	GLOBAL.STRINGS.CHARACTERS.ORION.DESCRIBE.UP_SPEED = "This can be used to go faster"
	
	GLOBAL.STRINGS.NAMES.ITEM_BLASTER = "Blasting Stick"
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.ITEM_BLASTER = "A staff of unbeknownst magic."
	GLOBAL.STRINGS.CHARACTERS.ORION.DESCRIBE.ITEM_BLASTER = "My trusty stick, never leave home without it."
	
	GLOBAL.STRINGS.RECIPE_DESC.ITEM_BATTERY = "A battery needed to power the Blasting Stick."
	GLOBAL.STRINGS.RECIPE_DESC.ITEM_BATTERY_CHARGED = "An way to charge batteries in a pinch."
	GLOBAL.STRINGS.RECIPE_DESC.ITEM_NUTRIBAR = "A deliciously wrapped bar of minerals."
	GLOBAL.STRINGS.RECIPE_DESC.UP_KIT = "A case of nanomachines."
	GLOBAL.STRINGS.RECIPE_DESC.UP_BLASTER = "Upgrades blaster damage."
	GLOBAL.STRINGS.RECIPE_DESC.UP_STUN = "Upgrades stunning effectiveness."
	GLOBAL.STRINGS.RECIPE_DESC.UP_POW = "Upgrades blaster efficiency."
	GLOBAL.STRINGS.RECIPE_DESC.UP_HEALTH = "Upgrades health and durability."
	GLOBAL.STRINGS.RECIPE_DESC.UP_HUNGER = "Upgrades hunger and metaboliism."
	GLOBAL.STRINGS.RECIPE_DESC.UP_SANITY = "Upgrades sanity and terror."
	GLOBAL.STRINGS.RECIPE_DESC.UP_SPEED = "Upgrades speed."
	
--Declare new foodgroup

	GLOBAL.FOODTYPE.ORIONNUTRI = "ORIONNUTRI"
	GLOBAL.FOODTYPE.ORIONUPBLASTER = "ORIONUPBLASTER"
	GLOBAL.FOODTYPE.ORIONUPPOW = "ORIONUPPOW"
	GLOBAL.FOODTYPE.ORIONUPSTUN = "ORIONUPSTUN"
	GLOBAL.FOODTYPE.ORIONUPHEALTH = "ORIONUPHEALTH"
	GLOBAL.FOODTYPE.ORIONUPHUNGER = "ORIONUPHUNGER"
	GLOBAL.FOODTYPE.ORIONUPSANITY = "ORIONUPSANITY"
	GLOBAL.FOODTYPE.ORIONUPSPEED = "ORIONUPSPEED"
	
	GLOBAL.FOODGROUP.ORIONOMNI = 
    {
        name = "ORIONOMNI",
        types =
        {
			GLOBAL.FOODTYPE.ELEMENTAL,
            GLOBAL.FOODTYPE.MEAT,
            GLOBAL.FOODTYPE.VEGGIE,
            GLOBAL.FOODTYPE.INSECT,
            GLOBAL.FOODTYPE.SEEDS,
            GLOBAL.FOODTYPE.GENERIC,
            GLOBAL.FOODTYPE.ORIONNUTRI,
			GLOBAL.FOODTYPE.ORIONUPBLASTER,
			GLOBAL.FOODTYPE.ORIONUPPOW,
			GLOBAL.FOODTYPE.ORIONUPSTUN,
			GLOBAL.FOODTYPE.ORIONUPHEALTH,
			GLOBAL.FOODTYPE.ORIONUPHUNGER,
			GLOBAL.FOODTYPE.ORIONUPSANITY,
			GLOBAL.FOODTYPE.ORIONUPSPEED,
        },
    }
	
	GLOBAL.FOODGROUP.ORIONUSABLE = 
    {
        name = "ORIONUSABLE",
        types =
        {
			GLOBAL.FOODTYPE.ELEMENTAL,
            GLOBAL.FOODTYPE.ORIONNUTRI,
			GLOBAL.FOODTYPE.ORIONUPBLASTER,
			GLOBAL.FOODTYPE.ORIONUPPOW,
			GLOBAL.FOODTYPE.ORIONUPSTUN,
			GLOBAL.FOODTYPE.ORIONUPHEALTH,
			GLOBAL.FOODTYPE.ORIONUPHUNGER,
			GLOBAL.FOODTYPE.ORIONUPSANITY,
			GLOBAL.FOODTYPE.ORIONUPSPEED,
        },
    }
	
	
--Declare Tunings
	GLOBAL.TUNING.ORION = {}

--General Tunings their values
	GLOBAL.TUNING.ORION.BATTERYSTACKSIZE = TUNING.STACK_SIZE_SMALLITEM
	GLOBAL.TUNING.ORION.BATTERYLIFE = TUNING.PERISH_SUPERFAST
	
--Keys to activate the various powers
	GLOBAL.TUNING.ORION.BLASTERCYCLEFIREMODEKEY = GetModConfigData("key-cycle") or 93
	GLOBAL.TUNING.ORION.BLASTERCYCLEFIREMODEREVERSEKEY = GetModConfigData("key-cycle-reverse") or 91
	
--Recipes
	--Batteries
	AddRecipe("item_battery", {GLOBAL.Ingredient("heatrock", 1), GLOBAL.Ingredient("transistor", 4)}, GLOBAL.RECIPETABS.REFINE, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "orioncraftingtag", "images/inventoryimages/item_battery.xml", "item_battery.tex" )
	AddRecipe("item_battery_charged", {GLOBAL.Ingredient("item_battery", 1, "images/inventoryimages/item_battery.xml"), GLOBAL.Ingredient("torch", 1)}, GLOBAL.RECIPETABS.REFINE, GLOBAL.TECH.NONE, nil, nil, nil, nil, "orioncraftingtag", "images/inventoryimages/item_battery_charged.xml", "item_battery_charged.tex" )
	--Nutri-bar
	AddRecipe("item_nutribar", {GLOBAL.Ingredient("rocks", 2), GLOBAL.Ingredient("goldnugget", 1)}, GLOBAL.RECIPETABS.REFINE, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "orioncraftingtag", "images/inventoryimages/item_nutribar.xml", "item_nutribar.tex" )
	--Upgrade Kit
	AddRecipe("up_kit", {GLOBAL.Ingredient("transistor", 2), GLOBAL.Ingredient("papyrus", 2)}, GLOBAL.RECIPETABS.REFINE, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "orioncraftingtag", "images/inventoryimages/up_kit.xml", "up_kit.tex" )
	AddRecipe("up_blaster", {GLOBAL.Ingredient("up_kit", 1, "images/inventoryimages/up_kit.xml"), GLOBAL.Ingredient("redgem", 1)}, GLOBAL.RECIPETABS.REFINE, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "orioncraftingtag", "images/inventoryimages/up_blaster.xml", "up_blaster.tex" )
	AddRecipe("up_stun", {GLOBAL.Ingredient("up_kit", 1, "images/inventoryimages/up_kit.xml"), GLOBAL.Ingredient("bluegem", 1)}, GLOBAL.RECIPETABS.REFINE, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "orioncraftingtag", "images/inventoryimages/up_stun.xml", "up_stun.tex" )
	AddRecipe("up_pow", {GLOBAL.Ingredient("up_kit", 1, "images/inventoryimages/up_kit.xml"), GLOBAL.Ingredient("item_battery_charged", 2, "images/inventoryimages/item_battery_charged.xml")}, GLOBAL.RECIPETABS.REFINE, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "orioncraftingtag", "images/inventoryimages/up_pow.xml", "up_pow.tex" )
	AddRecipe("up_health", {GLOBAL.Ingredient("up_kit", 1, "images/inventoryimages/up_kit.xml"), GLOBAL.Ingredient("cutstone", 3), GLOBAL.Ingredient("cutgrass", 6)}, GLOBAL.RECIPETABS.REFINE, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "orioncraftingtag", "images/inventoryimages/up_health.xml", "up_health.tex" )
	AddRecipe("up_hunger", {GLOBAL.Ingredient("up_kit", 1, "images/inventoryimages/up_kit.xml"), GLOBAL.Ingredient("nitre", 6)}, GLOBAL.RECIPETABS.REFINE, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "orioncraftingtag", "images/inventoryimages/up_hunger.xml", "up_hunger.tex" )
	AddRecipe("up_sanity", {GLOBAL.Ingredient("up_kit", 1, "images/inventoryimages/up_kit.xml"), GLOBAL.Ingredient("nightmarefuel", 3)}, GLOBAL.RECIPETABS.REFINE, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "orioncraftingtag", "images/inventoryimages/up_sanity.xml", "up_sanity.tex" )
	AddRecipe("up_speed", {GLOBAL.Ingredient("up_kit", 1, "images/inventoryimages/up_kit.xml"), GLOBAL.Ingredient("spear", 2)}, GLOBAL.RECIPETABS.REFINE, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "orioncraftingtag", "images/inventoryimages/up_speed.xml", "up_speed.tex" )
	
	
	
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



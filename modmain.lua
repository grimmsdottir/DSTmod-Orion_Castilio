PrefabFiles = {
	"orion",
}

Assets = {
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


AddMinimapAtlas("images/map_icons/orion.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("orion", "FEMALE")


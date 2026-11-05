local RA = RotationAssist

local CLASS_KEYS = {
	[1] = "WARRIOR", [2] = "PALADIN", [3] = "HUNTER", [4] = "ROGUE", [5] = "PRIEST",
	[6] = "DEATHKNIGHT", [7] = "SHAMAN", [8] = "MAGE", [9] = "WARLOCK", [11] = "DRUID",
}

-- A character's classes in the order they were picked.
RA:SetClassProvider(function()
	local classes = {}
	local count = CMCGetClassCount and CMCGetClassCount() or 0
	for i = 1, count do
		local id = CMCGetClassAt(i)
		classes[#classes + 1] = (CMCGetClassKey and CMCGetClassKey(id)) or CLASS_KEYS[id]
	end
	return classes
end)

RA:SetSpecNameProvider(function(group)
	return GetCustomGameDataString and GetCustomGameDataString(21, group) or nil
end)

-- The same names Synastria Build Suite shows.
RA:AddClassNames({
	Champion = { "WARRIOR", "PALADIN" }, Soldier = { "WARRIOR", "HUNTER" }, Blademaster = { "WARRIOR", "ROGUE" },
	Crusader = { "WARRIOR", "PRIEST" }, Butcher = { "WARRIOR", "DEATHKNIGHT" }, Ravager = { "WARRIOR", "SHAMAN" },
	Battlemage = { "WARRIOR", "MAGE" }, Vanquisher = { "WARRIOR", "WARLOCK" }, Barbarian = { "WARRIOR", "DRUID" },
	Avenger = { "PALADIN", "HUNTER" }, Agent = { "PALADIN", "ROGUE" }, Martyr = { "PALADIN", "PRIEST" },
	Enforcer = { "PALADIN", "DEATHKNIGHT" }, Sentinel = { "PALADIN", "SHAMAN" }, Inquisitor = { "PALADIN", "MAGE" },
	Warden = { "PALADIN", "WARLOCK" }, Guardian = { "PALADIN", "DRUID" },
	Scout = { "HUNTER", "ROGUE" }, Seer = { "HUNTER", "PRIEST" }, Slayer = { "HUNTER", "DEATHKNIGHT" },
	Tempest = { "HUNTER", "SHAMAN" }, Arcanist = { "HUNTER", "MAGE" }, Trickster = { "HUNTER", "WARLOCK" },
	Ranger = { "HUNTER", "DRUID" },
	Herald = { "ROGUE", "PRIEST" }, Assassin = { "ROGUE", "DEATHKNIGHT" }, Ninja = { "ROGUE", "SHAMAN" },
	Spellblade = { "ROGUE", "MAGE" }, Voidstalker = { "ROGUE", "WARLOCK" }, Spy = { "ROGUE", "DRUID" },
	Wraith = { "PRIEST", "DEATHKNIGHT" }, Oracle = { "PRIEST", "SHAMAN" }, Mystic = { "PRIEST", "MAGE" },
	Siren = { "PRIEST", "WARLOCK" }, Empath = { "PRIEST", "DRUID" },
	Summoner = { "DEATHKNIGHT", "SHAMAN" }, Lich = { "DEATHKNIGHT", "MAGE" }, Necromancer = { "DEATHKNIGHT", "WARLOCK" },
	Dreadweaver = { "DEATHKNIGHT", "DRUID" },
	Elementalist = { "SHAMAN", "MAGE" }, Harbinger = { "SHAMAN", "WARLOCK" }, Sage = { "SHAMAN", "DRUID" },
	Sorcerer = { "MAGE", "WARLOCK" }, Conjurer = { "MAGE", "DRUID" },
	Witch = { "WARLOCK", "DRUID" },
})

RA:AddRuneCosts({
	["Mark of Frost"] = { frost = 1 },
})

local FairCurses = RegisterMod("Fair Curses", 1)

--local CURSE_IDS_TO_NAMES =
--{
--	[LevelCurse.CURSE_NONE]				= "None",
--	[LevelCurse.CURSE_OF_DARKNESS]		= "Curse of Darkness",
--	[LevelCurse.CURSE_OF_LABYRINTH]		= "Curse of Labyrinth",
--	[LevelCurse.CURSE_OF_THE_LOST]		= "Curse of the Lost",
--	[LevelCurse.CURSE_OF_THE_UNKNOWN]	= "Curse of the Unknown",
--	[LevelCurse.CURSE_OF_THE_CURSED]	= "Curse of the Cursed",
--	[LevelCurse.CURSE_OF_MAZE]			= "Curse of Maze",
--	[LevelCurse.CURSE_OF_BLIND]			= "Curse of Blind",
--	[LevelCurse.CURSE_OF_GIANT]			= "Curse of Giant"
--}

local NORMAL_STAGES = -- dicts defining stages based on LevelStage & StageType
{
	-- Floor 1 & 2
	Basement_1			= { LevelStage.STAGE1_1, StageType.STAGETYPE_ORIGINAL },
	Basement_2			= { LevelStage.STAGE1_2, StageType.STAGETYPE_ORIGINAL },

	Cellar_1			= { LevelStage.STAGE1_1, StageType.STAGETYPE_WOTL },
	Cellar_2			= { LevelStage.STAGE1_2, StageType.STAGETYPE_WOTL },

	BurningBasement_1	= { LevelStage.STAGE1_1, StageType.STAGETYPE_AFTERBIRTH },
	BurningBasement_2	= { LevelStage.STAGE1_2, StageType.STAGETYPE_AFTERBIRTH },

	Downpour_1			= { LevelStage.STAGE1_1, StageType.STAGETYPE_REPENTANCE },
	Downpour_2			= { LevelStage.STAGE1_2, StageType.STAGETYPE_REPENTANCE },

	Dross_1				= { LevelStage.STAGE1_1, StageType.STAGETYPE_REPENTANCE_B },
	Dross_2				= { LevelStage.STAGE1_2, StageType.STAGETYPE_REPENTANCE_B },

	-- Floor 3 & 4
	Caves_1				= { LevelStage.STAGE2_1, StageType.STAGETYPE_ORIGINAL },
	Caves_2				= { LevelStage.STAGE2_2, StageType.STAGETYPE_ORIGINAL },

	Catacombs_1			= { LevelStage.STAGE2_1, StageType.STAGETYPE_WOTL },
	Catacombs_2			= { LevelStage.STAGE2_2, StageType.STAGETYPE_WOTL },

	FloodedCaves_1		= { LevelStage.STAGE2_1, StageType.STAGETYPE_AFTERBIRTH },
	FloodedCaves_2		= { LevelStage.STAGE2_2, StageType.STAGETYPE_AFTERBIRTH },

	Mines_1				= { LevelStage.STAGE2_1, StageType.STAGETYPE_REPENTANCE },
	Mines_2				= { LevelStage.STAGE2_2, StageType.STAGETYPE_REPENTANCE },

	Ashpit_1			= { LevelStage.STAGE2_1, StageType.STAGETYPE_REPENTANCE_B },
	Ashpit_2			= { LevelStage.STAGE2_2, StageType.STAGETYPE_REPENTANCE_B },

	-- Floor 5 & 6
	Depths_1			= { LevelStage.STAGE3_1, StageType.STAGETYPE_ORIGINAL },
	Depths_2			= { LevelStage.STAGE3_2, StageType.STAGETYPE_ORIGINAL },

	Necropolis_1		= { LevelStage.STAGE3_1, StageType.STAGETYPE_WOTL },
	Necropolis_2		= { LevelStage.STAGE3_2, StageType.STAGETYPE_WOTL },

	DankDepths_1		= { LevelStage.STAGE3_1, StageType.STAGETYPE_AFTERBIRTH },
	DankDepths_2		= { LevelStage.STAGE3_2, StageType.STAGETYPE_AFTERBIRTH },

	Mausoleum_1			= { LevelStage.STAGE3_1, StageType.STAGETYPE_REPENTANCE },
	Mausoleum_2			= { LevelStage.STAGE3_2, StageType.STAGETYPE_REPENTANCE },

	Gehenna_1			= { LevelStage.STAGE3_1, StageType.STAGETYPE_REPENTANCE_B },
	Gehenna_2			= { LevelStage.STAGE3_2, StageType.STAGETYPE_REPENTANCE_B },

	-- Floor 7 & 8
	Womb_1				= { LevelStage.STAGE4_2, StageType.STAGETYPE_ORIGINAL },
	Womb_2				= { LevelStage.STAGE4_2, StageType.STAGETYPE_ORIGINAL },

	Utero_1				= { LevelStage.STAGE4_2, StageType.STAGETYPE_WOTL },
	Utero_2				= { LevelStage.STAGE4_2, StageType.STAGETYPE_WOTL },

	ScarredWomb_1		= { LevelStage.STAGE4_2, StageType.STAGETYPE_AFTERBIRTH },
	ScarredWomb_2		= { LevelStage.STAGE4_2, StageType.STAGETYPE_AFTERBIRTH },

	Corpse_1			= { LevelStage.STAGE4_2, StageType.STAGETYPE_REPENTANCE },
	Corpse_2			= { LevelStage.STAGE4_2, StageType.STAGETYPE_REPENTANCE },

	-- Floor 9
	BlueWomb			= { LevelStage.STAGE4_3, StageType.STAGETYPE_ORIGINAL },

	-- Floor 10
	Sheol				= { LevelStage.STAGE5, StageType.STAGETYPE_ORIGINAL },
	Cathedral			= { LevelStage.STAGE5, StageType.STAGETYPE_WOTL },

	-- Floor 11
	DarkRoom			= { LevelStage.STAGE6, StageType.STAGETYPE_ORIGINAL },
	Chest				= { LevelStage.STAGE6, StageType.STAGETYPE_WOTL },

	-- Floor 12
	TheVoid				= { LevelStage.STAGE7, StageType.STAGETYPE_ORIGINAL },

	-- Floor 13
	Home				= { LevelStage.STAGE8, StageType.STAGETYPE_ORIGINAL },
	HomeDogma			= { LevelStage.STAGE8, StageType.STAGETYPE_WOTL }
}

local RemoveCursesFromStages =
{
	[LevelCurse.CURSE_OF_DARKNESS] = { NORMAL_STAGES.FloodedCaves_1, NORMAL_STAGES.FloodedCaves_2, NORMAL_STAGES.Depths_1, NORMAL_STAGES.Depths_2, NORMAL_STAGES.Necropolis_1, NORMAL_STAGES.Necropolis_2, NORMAL_STAGES.DankDepths_1, NORMAL_STAGES.DankDepths_2, NORMAL_STAGES.Downpour_1, NORMAL_STAGES.Downpour_2, NORMAL_STAGES.Dross_1, NORMAL_STAGES.Dross_2, NORMAL_STAGES.Mausoleum_1, NORMAL_STAGES.Mausoleum_2, NORMAL_STAGES.Gehenna_1, NORMAL_STAGES.Gehenna_2, NORMAL_STAGES.Sheol, NORMAL_STAGES.DarkRoom },
	[LevelCurse.CURSE_OF_THE_LOST] = { NORMAL_STAGES.TheVoid }
}

---@param level Level
local function GetStageAndType(level)
	return { level:GetStage(), level:GetStageType() }
end

---@param level Level
---@param tableOfLevelStageAndStageType table
local function CompareStage(level, tableOfLevelStageAndStageType)
	local levelTable = GetStageAndType(level)

	return levelTable[1] == tableOfLevelStageAndStageType[1] and levelTable[2] == tableOfLevelStageAndStageType[2]
end

function FairCurses:OnNewFloor()
	local level = Game():GetLevel()
	local bitMask = level:GetCurses() -- enum LevelCurse

	for curseMask, stagesTable in pairs(RemoveCursesFromStages) do
		for _,stageTable in pairs(stagesTable) do
			if CompareStage(level, stageTable) then
				--print("[DEBUG] curseMask = " .. curseMask .. " | bitMask = " .. bitMask)
				if curseMask & bitMask == curseMask then
					--print("[DEBUG] Removing " .. CURSE_IDS_TO_NAMES[curseMask])
					Game():GetLevel():RemoveCurses(curseMask)
				end
			end
		end
	end
end

---@param isContinued boolean
function FairCurses:OnGameStart(isContinued)
	if isContinued then -- if an existing run was continued, do the check for the curse
		FairCurses:OnNewFloor()
	end
end

FairCurses:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, FairCurses.OnNewFloor)
FairCurses:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, FairCurses.OnGameStart)
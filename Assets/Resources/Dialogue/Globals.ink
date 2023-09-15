//QuestState Enum
CONST REQUIREMENTS_NOT_MET = 0
CONST CAN_START = 1
CONST IN_PROGRESS = 2
CONST CAN_FINISH = 3
CONST FINISHED = 4
CONST DECLINED = 5

// Variables
VAR playerRole = "" 
// Quests markers
VAR checkObelisksQuest = CAN_START

// External functions
EXTERNAL StartQuest(marker)
EXTERNAL FinishQuest(marker)
EXTERNAL IsQuestFinished(marker)


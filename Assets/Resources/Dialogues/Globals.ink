//QuestState Enum
CONST REQUIREMENTS_NOT_MET = 0
CONST CAN_START = 1
CONST IN_PROGRESS = 2
CONST CAN_FINISH = 3
CONST FINISHED = 4
CONST DECLINED = 5

// External functions
EXTERNAL SwitchTerrain(marker)
EXTERNAL ActivateGeniusLoci()
EXTERNAL SwitchScene()

// Variables
VAR 00_PostInitialDialogue = false
VAR 00_PostTutorial = false
VAR 00_PostHowTo = false
VAR 00_WhoAreYou = ""
VAR 00_HowOften = ""
VAR 01_DecisionInProgress = false
VAR 01_bIsDecisionMade = false
VAR 01_Decision = ""
VAR 02_DecisionInProgress = false
VAR 02_bIsDecisionMade = false
VAR 02_Decision = ""
VAR 03_DecisionInProgress = false
VAR 03_bIsDecisionMade = false
VAR 03_Decision = ""
VAR 04_DecisionInProgress = false
VAR 04_bIsDecisionMade = false
VAR 04_Decision = ""
VAR 05_DecisionInProgress = false
VAR 05_bIsDecisionMade = false
VAR 05_Decision = ""
VAR 06_DecisionInProgress = false
VAR 06_bIsDecisionMade = false
VAR 06_Decision = ""
VAR 07_DecisionInProgress = false
VAR 07_bIsDecisionMade = false
VAR 07_Decision = ""
VAR 08_DecisionInProgress = false
VAR 08_bIsDecisionMade = false
VAR 08_Decision = ""
VAR 09_DecisionInProgress = false
VAR 09_bIsDecisionMade = false
VAR 09_Decision = ""
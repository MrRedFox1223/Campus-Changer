INCLUDE Globals.ink

{06_DecisionInProgress == true: -> TimeForDecision}
{06_bIsDecisionMade == true: -> DecisionRevisit}
{06_bIsDecisionMade == false: -> BeginQuest}


== BeginQuest

What do you think about this place? #portrait:GeniusLoci

    + [I like it.]
    And I don't! -> StoryStep_01
    + [I don't like it.]
    Me neither. -> StoryStep_01
    + [I have no opinion.]
    I don't like it. -> StoryStep_01

== StoryStep_01

These paths between the lawns are too narrow. The lawns are fenced off and inaccessible. To add to this, there are those ugly waste containers in the middle.

    + [You have to take out the trash somewhere.]
    But that doesn't mean that it has to be lying on top! -> StoryStep_02
    + [The waste containers could be removed from here.]
    My thoughts exactly! -> StoryStep_02
    
== StoryStep_02

Meanwhile, there's a completely new idea for this place. There's been a proposal to build a new building here for restaurant-related purposes.

    + [Great! A café would be a wonderful idea!]
    That's a possibility, but not the only one. -> InitialMindMadeUp
    + [Great! A cafeteria would be a wonderful idea!]
    That's a possibility, but not the only one. -> InitialMindMadeUp
    + [Just a neatly looking garbage enclosure would suffice.]
    Not everyone would agree with that opinion. -> InitialMindMadeUp
    + [Nah! Let's leave everything as it is... the old way!]
    Many people would prefer a different solution. -> InitialMindMadeUp
    
== InitialMindMadeUp

It's best if you talk to the people around you. It will only take a few moments.
    + [No, thank you, I have my own opinion.]
    ~ 06_DecisionInProgress = true
    Alright. ->TimeForDecision
    + [Alright, I'll talk to them.]
    ~ 06_DecisionInProgress = true
    -> END

== TimeForDecision

What's your decision regarding the café? #portrait:GeniusLoci
    
VAR marker = 0
    
    + [Yes, let's have a café.]
    ~ 06_Decision = "kawiarnia"
    ~ marker = 1
    + [Instead of a café, let's create a cafeteria.]
    ~ 06_Decision = "stołówka"
    ~ marker = 2
    + [Let's not build anything, except for a tidy place for the waste containers.]
    ~ 06_Decision = "altana"
    ~ marker = 3
    + [Let's leave everything as it is.]
    ~ 06_Decision = "bez zmian"
    ~ marker = 0
    + [I still don't know.]
    -> END
    
- So be it!

~ 06_DecisionInProgress = false
~ 06_bIsDecisionMade = true
~ SwitchTerrain(marker)
~ AddToCompletedQuests()

Great! We've got it! Let's move on!! -> END

== DecisionRevisit
Thank you for taking care of this place! #portrait:GeniusLoci
-> END


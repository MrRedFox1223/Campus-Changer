INCLUDE Globals.ink

{03_DecisionInProgress == true: -> TimeForDecision}
{03_bIsDecisionMade == true: -> DecisionRevisit}
{03_bIsDecisionMade == false: -> BeginQuest}

== BeginQuest

Hello! Do you know what this building is? #portrait:GeniusLoci

    + [That's the Chemistry building.]
        Well done! 
        -> StoryStep_01
    + [That's the Faculty of Transport.]
       The Transport department is next door, this is the Chemistry building.
        -> StoryStep_01
    + [This is the Main Building.]
       Umm, not quite. Good thing it's not an exam! We're standing next to the Chemistry building.
        -> StoryStep_01

== StoryStep_01

This time the disagreement is not over the building or the courtyard, but over the gate. 

    + [No wonder. It looks terribly gloomy.]
        And here lies the problem. Some people would like to have it permanently opened.
        -> StoryStep_02
    + [A gate is just a gate. How can somebody argue about a gate?]
        That's quite simple, some would like it opened, others would like it closed. 
        -> StoryStep_02

== StoryStep_02

    + [Definitely should be opened.]
        ->InitialMindMadeUp
    + [Definitely should be closed.] 
        ->InitialMindMadeUp
    + [What are the arguments in this case?]
        ->InitialUndecided

== InitialMindMadeUp

Maybe we should first try to listen to what others have to say. You're not interested in the reasons behind this gate-related outrage? 

    + [No. My mind is made up on the gate issue.]
        ~ 03_DecisionInProgress = true
        So, without further ado, let's proceed. -> TimeForDecision
    + [Well, maybe so.]
        Excellent, I can't wait to share this! 
        -> InitialUndecided

== InitialUndecided
Near the gate, you'll find a lady in a wheelchair who would like to have the gate opened completely, and a new mother living across from the Campus, who would like to leave the small gate opened. 
A University employee standing nearby would like to have everything closed.


    ->InitialSendoff

== InitialSendoff

Come back to me once you're done talking. I'm awaiting your decision.
~ 03_DecisionInProgress = true
-> END

== TimeForDecision

What's your verdict? #portrait:GeniusLoci

VAR marker = 0

    + [Let's open the gate. Better yet, let's dismantle the gate.]
    ~ 03_Decision = "otworzyć"
    ~ marker = 1
    + [Let's leave the gate closed and the small gate opened.]
    ~ 03_Decision = "furtka"
    ~ marker = 2
    + [Let's close everything!]
    ~ 03_Decision = "zamknąć"
    ~ marker = 3
    + [I still don't know.]
    -> END

- So be it!

~ 03_DecisionInProgress = false
~ 03_bIsDecisionMade = true
~ SwitchTerrain(marker)
~ AddToCompletedQuests()

Thank you! You did a great job! Meanwhile, other matters are still waiting for us. So let's go!
-> END

== DecisionRevisit

Thank you for taking care of this place! #portrait:GeniusLoci
-> END


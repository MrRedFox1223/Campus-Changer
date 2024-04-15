INCLUDE Globals.ink

{08_DecisionInProgress == true: -> TimeForDecision}
{08_bIsDecisionMade == true: -> DecisionRevisit}
{08_bIsDecisionMade == false: -> BeginQuest}

== BeginQuest

We are at the western gate of the Campus. As you can see, there is a lot of space here. #portrait:GeniusLoci

    + [Lawns...]
    ->StoryStep_01
    + [Sidwalks...]
    ->StoryStep_01
    + [Parking...]
    ->StoryStep_01

== StoryStep_01

A bit of everything. The decision is about the parking lots. The question today is: should we add parking spaces, remove parking spaces, or just leave them as they are?

    + [Add!]
    ->InitialMindMadeUp
    + [Remove!]
    ->InitialMindMadeUp
    + [Leave!]
    ->InitialMindMadeUp
    + [Let's listen to the arguments.]
    ->InitialUndecided

== InitialMindMadeUp

It's possible, but this is the subject of heated debate. Some people say that we should ban cars from Campus. Others believe that cars need more space. 

    + [I have a strong opinion on this as well!]
    ~ 08_DecisionInProgress = true
    Okay then... -> TimeForDecision
    + [I'll talk to them.]
    -> InitialSendoff

== InitialUndecided

If you want to find out why cars should disappear from Campus, talk to the Student. If you want to find out why there should be more space for cars, talk to the Lady from the dean's office. 
You'll find both of them standing next to the monument.
 
->InitialSendoff

== InitialSendoff

Come back to me once you're done talking. I'm awaiting your decision.
~ 08_DecisionInProgress = true
-> END

== TimeForDecision

What do we do with this place? #portrait:GeniusLoci

VAR marker = 0



    + [We need to add parking spaces at the expense of lawns.]
    ~ 08_Decision = "więcej parkingu"
    ~ marker = 1
    + [We need to leave everything as it is.]
    ~ 08_Decision = "bez zmian"
    ~ marker = 0
    + [We need to remove all the parking spaces and replace them with greenery.]
    ~ 08_Decision = "zieleń"
    ~ marker = 2
    
- So be it!

~ 08_DecisionInProgress = false
~ 08_bIsDecisionMade = true
~ SwitchTerrain(marker)
~ AddToCompletedQuests()

Excellent! Yet another decision behind you. Let's move on, however. See you soon! -> END

== DecisionRevisit
Thank you for taking care of this place! #portrait:GeniusLoci
-> END

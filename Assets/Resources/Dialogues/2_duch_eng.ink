INCLUDE Globals.ink

{02_DecisionInProgress == true: -> TimeForDecision}
{02_bIsDecisionMade == true: -> DecisionRevisit}
{02_bIsDecisionMade == false: -> BeginQuest}


== BeginQuest

We are in the courtyard between the Mechanics and the Faculty of Building Services buildings. #portrait:GeniusLoci

    + [The perfect place for a garden.] -> InitialMindMadeUp
    + [The perfect place for an open-air gallery.] -> InitialMindMadeUp
    + [The perfect place for a parking lot.] -> InitialMindMadeUp
    + [The perfect place to grab a bite to eat.] -> InitialMindMadeUp
    + [I'd like to find out what can be done with this place.] -> InitialUndecided
    

== InitialMindMadeUp

Not everyone agrees with that, so please, talk to them. When you approach them, they'll tell you how they see this part of the Central Campus and present their arguments.
    

    * [I'm not interested in their arguments. I know this place and I already know everything.]
        ~ 02_DecisionInProgress = true
        Okay. -> TimeForDecision
    * [Alright, I'll talk to them.]
        -> InitialSendoff

== InitialUndecided

In that case, there are some interesting conversations ahead of you. An exchange Student wants to create a small food corner here, like an outdoor eatery. 
A Lady living on campus suggests having a green space here. The Guard says a parking lot would be better. And then there's the Doctor who dreams of an open-air gallery.


    * [That's my cue then!]
        -> InitialSendoff

== InitialSendoff

Come back to me when you're done talking. I'm awaiting your decision.
~ 02_DecisionInProgress = true
-> END

== TimeForDecision

What's your decision? There are several options: the greenery, a food corner, a parking lot, and a gallery. #portrait:GeniusLoci

VAR marker = 0

    + [Let's keep the greenery.]
    ~ 02_Decision = "zieleń"
    ~ marker = 1
    + [Let's create a food corner.]
    ~ 02_Decision = "gastronomia"
    ~ marker = 2
    + [Let's create a parking lot.]
    ~ 02_Decision = "parking"
    ~ marker = 3
    + [Let's have a gallery.]
    ~ 02_Decision = "galeria"
    ~ marker = 4
    + [I still don't know.]
    ->END
    
- So be it!

~ 02_DecisionInProgress = false
~ 02_bIsDecisionMade = true
~ SwitchTerrain(marker)
~ AddToCompletedQuests()

Thank you for such a prompt decision! Let's bid this courtyard goodbye and move on.

-> END

== DecisionRevisit

Thank you for taking care of this place! #portrait:GeniusLoci
-> END

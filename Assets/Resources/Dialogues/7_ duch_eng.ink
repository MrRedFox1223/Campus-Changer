INCLUDE Globals.ink

{07_DecisionInProgress == true: -> TimeForDecision}
{07_bIsDecisionMade == true: -> DecisionRevisit}
{07_bIsDecisionMade == false: -> BeginQuest}

== BeginQuest

Welcome to the forgotten corner of the Campus! #portrait:GeniusLoci

    + [But there is a gate here, many people pass through...]
    
- Really? And how many of them look into the sentry building?

    + [Sentry… what?]
    
- There's a small building next to the gate. It's neglected and nonfunctioning. It's practically begging to be put to use!

    + [A sentry building is a type of guardhouse. Let's make it a place for the campus security.]
    -> InitialMindMadeUp
    + [A place frequented by passersby is an ideal spot for a small pub.]
    -> InitialMindMadeUp
    + [A building right by the gate is a perfect place for a living lab!]
    -> InitialMindMadeUp
    + [I wonder what ideas other people have.]
    -> InitialUndecided


== InitialMindMadeUp

That's one of the suggested ideas, but there are also others. You can learn more about them: just to talk to the people standing by the gate.
    
    +[No need, I already know what I want to do.]
    ~ 07_DecisionInProgress = true
    Alright. -> TimeForDecision
    + [Okay, I'll talk to them.]
    -> InitialSendoff


== InitialUndecided

The Professor dreams of a living lab. A Lady working in the nearby dean's office thought of turning it into the headquarters for campus security, while the Guard suggests a small pub.

    * [I'll talk to them.]
    ->InitialSendoff


== InitialSendoff

Come back to me once you've found out everything.
~ 07_DecisionInProgress = true
-> END

== TimeForDecision

What's your decision about the sentry building? #portrait:GeniusLoci

VAR marker = 0

    + [A pub.]
    ~ 07_Decision = "knajpka"
    ~ marker = 1
    + [A living lab.]
    ~ 07_Decision = "living lab"
    ~ marker = 2
    + [A guardhouse.]
    ~ 07_Decision = "stróżówka"
    ~ marker = 3
    + [None of these ideas are good, let's leave it as it is.]
    ~ 07_Decision = "nic"
    ~ marker = 0
    + [I still don't know.]
    -> END
    
- So be it!
~ 07_DecisionInProgress = false
~ 07_bIsDecisionMade = true
~ SwitchTerrain(marker)
~ AddToCompletedQuests()

Thank you for your help! There are still a few more issues for you to resolve. ->END
   
== DecisionRevisit
Thank you for taking care of this place! #portrait:GeniusLoci
-> END

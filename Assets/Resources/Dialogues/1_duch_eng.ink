INCLUDE Globals.ink

{01_DecisionInProgress == true: -> TimeForDecision}
{01_bIsDecisionMade == true: -> DecisionRevisit}
{01_bIsDecisionMade == false: -> BeginQuest}

== BeginQuest

Welcome back! A beautiful chimney, isn't it? #portrait:GeniusLoci

    * [Seems a bit old-fashioned.]
    * [A good landmark, visible from afar.]
 
    - That's true!
    
This place is important for the University of Technology's Campus. Since a lot of people pass through here, we're considering its development. As you can see, now there's a road frequented by cars. The competing concept suggests dedicating this area exclusively to pedestrians.


    * [What?! No way! Leave it as is!]
        -> InitialMindMadeUp
    * [I agree, there should be a sidewalk here.]
        -> InitialMindMadeUp
    * [I think I need to learn more to decide.]
        -> InitialUndecided
    
== InitialMindMadeUp

Not everyone shares this view, so I'll ask you to talk to them. When you approach them, they'll put forward their arguments.

    * [I'm not interested in their arguments. I know this place and I already know everything.]
        ~ 01_DecisionInProgress = true
        Okay. -> TimeForDecision
    * [Alright, I'll talk to them.]
        ->InitialSendoff
 
== InitialUndecided

I'm glad you have an open mind. There's room for everyone on the Campus! In that case, please talk to the Student who comes here every Tuesday for a two-hour break between classes. The other person is a lady who works in administration and drives to the Main Building.

    * [Sure, I'll talk to them.]
        ->InitialSendoff
        
== InitialSendoff

Great! The exchange shouldn't take more than 5 minutes. Come back to me when you're done.
~ 01_DecisionInProgress = true
-> END

== TimeForDecision

What have you decided? Do we keep the traffic? Or do we replace the road with a sidewalk? #portrait:GeniusLoci

VAR marker = 0

    * [Road!]
        ~ 01_Decision = "jezdnia"
        ~ marker = 1
    * [Sidewalk!]
        ~ 01_Decision = "chodnik"
        ~ marker = 2
    * [I still don't know.]
        -> END
    
    - So be it!

~ 01_DecisionInProgress = false
~ 01_bIsDecisionMade = true
~ SwitchTerrain(marker)
~ AddToCompletedQuests()

You should bear in mind that your decision greatly affects the Campus around us. Good luck!

-> END

    
== DecisionRevisit

Thank you for taking care of this place! #portrait:GeniusLoci
-> END

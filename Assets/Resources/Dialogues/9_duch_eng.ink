INCLUDE Globals.ink

{09_DecisionInProgress == true: -> TimeForDecision}
{09_bIsDecisionMade == true: -> DecisionRevisit}
{09_bIsDecisionMade == false: -> BeginQuest}


== BeginQuest

Just take a look at this industrial courtyard. #portrait:GeniusLoci

    * [It looks as if there was a factory nearby.]
We are between the Faculty of Power and Aeronautical Engineering and the Faculty of Electrical Engineering, so the industrial vibe is rather fitting. 
However, there's an idea to give this place a makeover. -> StoryStep_01
    * [It looks as if there was a burger joint around the corner.]
Apparently, others have come up with the same association, because a similar idea for utilizing this space has emerged.
 -> StoryStep_01
    
== StoryStep_01

Well, we could invite some food trucks here.
-> FirstQuestionLoop

== FirstQuestionLoop

    + [What is a food truck?]
    -> Question_01
    +[ How would they get in?]
    -> Question_02
    + [I like the idea.]
    -> InitialMindMadeUp
    + [I don't like the idea.]
    -> InitialMindMadeUp
    + [I'd like to hear more arguments.]
    -> InitialUndecided
    
== Question_01

A food truck is like a mini-restaurant on wheels. Some might say it's mobile fast food. Nowadays, food trucks can serve really amazing food.
They don't take up much space and can be in a different place each day, so there's a variety of dishes from around the world available every day.
-> FirstQuestionLoop

== Question_02

Through the gate on Nowowiejska Street, next to the tram stop.
-> FirstQuestionLoop

== InitialMindMadeUp

Would you like to hear what others think?

    + [I don't think they can convince me.]
    ~09_DecisionInProgress = true
    Then let's not put this off. -> TimeForDecision
    + [Good idea.]
    -> InitialSendoff


== InitialUndecided
In short: the Guard thinks it's a bad idea, while the Children living on Campus think it's a good idea. You can find all of them here, in the yard.
 
-> InitialSendoff

== InitialSendoff

Come back to me once you've finished talking.
~ 09_DecisionInProgress = true
->END
    
== TimeForDecision

Let's make it quick! Food trucks: yes or no? #portrait:GeniusLoci

VAR marker = 0

    + [Yes!]
    ~09_Decision = "food truck"
    ~ marker = 1
   Let's go for food trucks!
   
    + [No!]
    ~09_Decision = "zaplecze"
    ~ marker = 2
    So everything stays as the same.
    
    + [I don't know.]
Ask the people around you, maybe they can help you decide.
    -> InitialSendoff
    
 - Terrific! Another task behind you. Take care!
 
 ~09_DecisionInProgress = false
 ~09_bIsDecisionMade = true
 ~ SwitchTerrain(marker)
 ~ AddToCompletedQuests()
 
 -> END
    
== DecisionRevisit
Thank you for taking care of this place! #portrait:GeniusLoci
-> END


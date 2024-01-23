INCLUDE Globals.ink

{03_bIsDecisionMade == true: -> DecisionRevisit}
{03_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
I'm afraid I've run out of dialogue. #portrait:Mama
-> END

== BeginQuest

Good morning, young one! #portrait:Mama

    + [Good morning. I've come to talk about the gate.]
    A small thing, but it brings me joy. But I know that the views are divided.
    ->MainArgumentNode
    
    + [Well, not that young, really.]
    Oh, true, there's someone even younger here. How may I help you?
    ->MainArgumentNode
    
== MainArgumentNode

    + [Why is it important for the gate to remain here?]
    -> Question_01
    + [Isn't using the small gate convenient?]
    -> Question_04
    + [Wouldn't it be better without the gate?]
    -> Question_02
    + [Maybe it should be completely closed?]
    -> Question_03
    + [I have no more questions.]
    -> END
    
== Question_01

Take a look, please. It's quiet, safe, there are no loiterers around. It's an ideal place for pedestrians. It could do with adding a bench or two... Ah, and making a flower bed. 
->MainArgumentNode

== Question_02

If we remove the gate, it won't be long before cars start parking here. It's enough that I have to be on my guard everywhere else.
->MainArgumentNode

== Question_03

Then I wouldn't be able to come in here with the stroller, would I? 
->MainArgumentNode

== Question_04

Not really, but I manage, so I think it can stay.
->MainArgumentNode

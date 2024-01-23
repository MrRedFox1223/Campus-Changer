INCLUDE Globals.ink

{05_bIsDecisionMade == true: -> DecisionRevisit}
{05_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
I'm afraid I've run out of dialogue. #portrait:Rowerzysta
-> END

== BeginQuest
Good morning. I'm the Ghost's assistant and I plan to build a stage here. An outdoor one, of course! #portrait:Rowerzysta
-> MainDiscussionNode

== MainDiscussionNode

    + [What would this stage be used for?]
    -> Question_01
    + [Won't it generate too much noise?]
    -> Question_02
    + [Why this location specifically?]
    -> Question_03
    + [I don't have any more questions for now.]
    -> END
    
== Question_01
For a variety of performances. For example, one could organize a small concert, a public speaking or a stand-up comedy event, or even, hmm… a competition. 
Truly, there are many opportunities to use a stage, which is just crying out to be built here.

->MainDiscussionNode

== Question_02

It's true that such events can be loud, but we are surrounded by business premises. 
It goes without saying that everything would happen outside of working hours, otherwise students and employees wouldn't be able to come.

->MainDiscussionNode

== Question_03
This place has the ideal dimensions! It's perfect for an event involving dozens or hundreds of people. We don't want to compete with the National Stadium. We also don't want to cut down the trees.

->MainDiscussionNode

    -> END

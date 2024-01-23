INCLUDE Globals.ink

{06_bIsDecisionMade == true: -> DecisionRevisit}
{06_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
I'm afraid I've run out of dialogue. #portrait:Student
-> END

== BeginQuest

Please don't listen to the doctor, a cafeteria would definitely be better! #portrait:Student
->MainDiscussionNode

== MainDiscussionNode

    + [Why a cafeteria specifically?]
    -> Question_01
    + [What's wrong with a café?]
    -> Question_02
    + [Why can't there be a cafeteria in another place?]
    -> Question_03
    + [There are also ideas for food trucks, food corners, gardens, and things like that.]
    -> Question_04
    + [I don't have any more questions.]
    -> END

== Question_01

Eating on the go gets boring very quickly. One would just like to sit down and eat something decent, not fast food.
->MainDiscussionNode

== Question_02

We are in the city center. There are plenty of cafés. If I wanted to invite someone for a coffee, I would never invite them to the university!

->MainDiscussionNode

== Question_03

Yes, and what a perfect solution for the wintertime...
->MainDiscussionNode

== Question_04

Ah! These are nothing else but just whims! I would like to eat healthily, in a pleasant and civilized environment, and at a low price. The nearby spots don't really offer options like that.

->MainDiscussionNode

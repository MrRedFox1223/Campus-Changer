INCLUDE Globals.ink

{07_bIsDecisionMade == true: -> DecisionRevisit}
{07_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
I'm afraid I've run out of dialogue. #portrait:Strażnik
-> END

== BeginQuest

Good morning. #portrait:Strażnik
    + [Good morning. I'm here about the sentry building.]

    - If it's about that small, neglected building, then I would see a small pub in there.
    
    ->MainDiscussionNode
    
    
== MainDiscussionNode

    + [What benefits will such a place bring?]
    -> Question_01
    + [Won't this mean more work for the guards?]
    -> Question_02
    + [There is also a proposal to have a living lab there.]
    -> Question_03
    + [Or would you rather have the place for the Campus Security?]
    -> Question_04
    + [I have no more questions.]
    -> END

== Question_01
A lot of people want to have a place like a pub. I'd prefer it here, where it's easy to keep under control, as it's close to the gate.
-> MainDiscussionNode

== Question_02
On the contrary, we have easy access here.
-> MainDiscussionNode

== Question_03
I'm a big fan of science, but it seems to me that laboratories should be set up within the faculty areas, so that they're closer to the scientists.
-> MainDiscussionNode

== Question_04
It's always nice to get something, but then my job would be everywhere except for here.
-> MainDiscussionNode

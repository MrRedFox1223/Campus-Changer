INCLUDE Globals.ink

{08_bIsDecisionMade == true: -> DecisionRevisit}
{08_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
I'm afraid I've run out of dialogue. #portrait:PaniZAdministracji
-> END

== BeginQuest

How may I help? #portrait:PaniZAdministracji

    + [I would like to ask about the parking.]
    
    - Yes! We must stop this madness! The parking needs to be expanded! Enough with the overcrowding!
    -> MainDiscussionNode
    
== MainDiscussionNode

    + [How will a larger parking improve the university's Campus?]
    -> Question_01
    + [What about ecology and traffic jams?]
    -> Question_02
    + [Aren't other commuting options, such as public transport, sufficient?]
    -> Question_03
    + [I have no more questions.]
    -> END
    
== Question_01
Of course! Everyone will be able to get to work however they want to do it!
-> MainDiscussionNode
      
== Question_02
These are not the University's problems. It's the government that should promote electric cars, and the city that should make the roads wider.
-> MainDiscussionNode

== Question_03
I can't stand public transport! Only by car can I really get where I want and when I want!
-> MainDiscussionNode

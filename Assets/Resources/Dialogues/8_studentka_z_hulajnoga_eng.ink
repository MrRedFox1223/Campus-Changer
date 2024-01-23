INCLUDE Globals.ink

{08_bIsDecisionMade == true: -> DecisionRevisit}
{08_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
I'm afraid I've run out of dialogue. #portrait:Hulajnoga
-> END

== BeginQuest

How may I help? #portrait:Hulajnoga

    + [I've heard that you have a strong opinion about the parking in this place.]
    
    - Yes, definitely! We must stop this madness! The parking needs to be removed! We need greenery and lawns instead of cars! The city is for people, not for cars!
    
    -> MainDiscussionNode
    
== MainDiscussionNode

    + [Why do you think the Campus will be better without the parking?]
    -> Question_01
    + [What about people who commute to work by car?]
    -> Question_02
    + [What about people with disabilities?]
    -> Question_03
    + [I have no more questions.]
    -> END
    
== Question_01

There are many advantages to lighter traffic: it's quieter and safer, and it reduces air pollution. Moreover, people are more likely to spend time outdoors, and new activities naturally emerge in the spaces people traverse.

-> MainDiscussionNode
    
== Question_02

We are in the city center! We have buses! Trams! The subway system! You can use a bike or a scooter! And the more people use public transport, the easier it is to convince the city authorities to introduce new options.

-> MainDiscussionNode

== Question_03
I am under no illusion that parking will entirely disappear from the Campus. There will always be parking for guests. There could be parking spaces for people with disabilities under the buildings or in designated areas.
-> MainDiscussionNode

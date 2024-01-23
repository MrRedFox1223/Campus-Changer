INCLUDE Globals.ink

{05_bIsDecisionMade == true: -> DecisionRevisit}
{05_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
I'm afraid I've run out of dialogue. #portrait:PaniZPieskiem
-> END

== BeginQuest

Good morning. I'm the Ghost's Assistant. Together with my tail-wagging colleagues, we plan to transform this alley. #portrait:PaniZPieskiem
-> MainDiscussionNode

== MainDiscussionNode

    + [What changes do you have in mind?]
    -> Question_01
    + [How is this better than the current arrangement?]
    -> Question_04
    + [I don't have any more questions for now.]
    -> END
    
== Question_01
Firstly: along the entire length, instead of a road, I see a flat sidewalk with low curbs made of eco-friendly materials. Cars will only be allowed to enter in exceptional cases.
Secondly: at each fork, there ate nice looking signposts directing to particular buildings.
Thirdly: I see benches, waste containers, a bicycle parking.
Fourthly: some new lighting. This is an excellent opportunity to experiment with solutions from the realms of IoT or urban labs aimed at improving the lives of city residents.
 
    + [Is this another change that's adverse against cars?]
    -> Question_02
    + [Who will benefit from this?]
    -> Question_03
    
== Question_02
It's true that cars would not be allowed on this route, apart from exceptional cases. But that doesn't mean they can't be elsewhere.
Even if we want to keep the parking spaces, it's worth making this particular spot pedestrian-only.

-> MainDiscussionNode

== Question_03
Everyone! A very large portion of the Campus users move along this route or its significant part. Meanwhile, the Campus lacks cohesive signage.
If you don't know which building the Chemistry department is, you won't find it quickly.

->MainDiscussionNode

== Question_04
Firstly, thanks to the lighting and signage, finding one's way would be easy.
Secondly, thanks to the signposts, everyone would know where to go next.
Thirdly, everyone would feel safer, as they would not be pushed onto the current narrow and uneven sidewalks.

-> MainDiscussionNode


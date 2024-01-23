INCLUDE Globals.ink

{01_bIsDecisionMade == true: -> DecisionRevisit}
{01_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
I'm afraid I've run out of dialogue. #portrait:Student
-> END

== BeginQuest

Hello! You are a player, right? #portrait:Student

    + [How do you know?]
        ->FirstEncounter
    + [Not at all, I'm a student, just like you.]
        ->FirstEncounter
    
== Explanation
    + [The Ghost dwelling in this place told me that you want to create a sidewalk here.]
    
Yes. It means a lot to me. 
I come here every week when I have a free period. I miss having a place to sit. That's why I thought a sidewalk would be a good solution. 
One with low curbs, so that people in wheelchairs could easily get onto it, and not an uneven one, because I've tripped over this one more than once. 

Ah! And, naturally, some benches would be great so that there would be a place to rest. 

-> MainArgumentNode

== FirstEncounter
There's nothing to be ashamed of, I'm also a player in another game.
    ->Explanation

== MainArgumentNode

    + [Why do you want to sit exactly in this spot?]
        -> Question_01
    + [What will others gain from that?]
        -> Question_02
    + [What about people who want to get to their parking spots?]
        -> Question_03
    + [Why don't you want a road here?]
        -> Question_04
    + [I have no more questions.]
        -> END
        
== Question_01
Everything is close by for me here. Besides, it's easy to set up a meeting under the chimney as it can be seen from afar. You just say "Let's meet under the chimney," and everyone instantly knows what you're talking about!

-> MainArgumentNode

== Question_02
A lot of people pass through here. It would be great if the sidewalk wasn't uneven, and the curbs weren't an obstacle for people with disabilities or for the elderly. 
Anyone can set up a meeting here. It would be possible to organize some cool event in this place, or just sit enjoying the sunshine, instead of being in the shade of the trees. 

-> MainArgumentNode

== Question_03

You can reach both parking lots from the side of the road. There's no need to drive through the Campus.
-> MainArgumentNode

== Question_04

I would like it here to be peaceful and quiet, and for people to be able to have a conversation while sitting on one of the many benches available.
-> MainArgumentNode



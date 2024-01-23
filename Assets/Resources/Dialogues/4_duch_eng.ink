INCLUDE Globals.ink

{04_DecisionInProgress == true: -> TimeForDecision}
{04_bIsDecisionMade == true: -> DecisionRevisit}
{04_bIsDecisionMade == false: -> BeginQuest}


== BeginQuest

UuuuuuUUuuuUuuu! #portrait:GeniusLoci

    * [Why are you "uuuuing" me?]
    - Because it feels ominous. This place looks...
    
    + [...dingy.]
    Bluntly put, somewhat rightly so. ->StoryStep_01
    + [...industrial.]
    Diplomatically put! ->StoryStep_01
    + [...like a place where someone might assault me after dark.]
    Oh, the horror! UuuuuuUUUuuu! ->StoryStep_01
    + [...like it's ready for an exciting transformation.]
    Ha! You've read my mind. ->StoryStep_01
    
== StoryStep_01
But let's go straight to the matter at hand. This time we won't be talking to other people. This time everything will stay between us.

    -> StoryStep_02
    
== StoryStep_02

As you may see, for now, there's nothing here except for two buildings close to each other, and one of them looks abandoned. But there are four ideas for what to do with this place.
    
Here are the four ideas. First: refurbish the facade and leave the rest as is. Second: introduce greenery. 
Third: create a green space to relax between classes or activities. Fourth: set up some sort of a utility area.

    ->MainDebateNode
    
==MainDebateNode

    + [Tell me about refurbishing the facade.]
    ->Option_01
    + [Tell me about the greenery.]
    ->Option_02
    + [Tell me about the garden.]
    ->Option_03
    + [Tell me about the utility area.]
    ->Option_04
    + [I want to make a decision now.]
    ->TimeForDecision
    + [I haven't formed an opinion yet.]
    ->InitialSendoff

== Option_01

It's simple: a nice design, a lot of paint, and voila! It's instantly nicer. Besides that, everything else remains as it is.
->MainDebateNode

== Option_02

How about some greenery? Trees, shrubbery. Maybe a flower bed? That would be pleasing to the eye. Cars wouldn't drive through here. They would enter through the gate on Koszykowa Street.
->MainDebateNode

== Option_03
Just imagine this: we remove the pavement and make a lawn. We plant trees and bushes, maybe create a space for team games. 
After all, that's also a place where we can learn teamwork :) A few deckchairs or loungers, maybe some hammocks. An informal space to relax during breaks between classes or activities.
->MainDebateNode

== Option_04
Since this place is already ugly, no one would complain if we moved dumpsters and other unappealing things in here. This place can't lose any more value, and it will be nicer elsewhere.
->MainDebateNode

== TimeForDecision

What do we do with this place? #portrait:GeniusLoci

VAR marker = 0

    + [Refurbish the facade.]
    ~ 04_Decision = "elewacja"
    ~ marker = 1
    + [A green space.]
    ~ 04_Decision = "zieleń"
    ~ marker = 2
    + [A casual garden.]
    ~ 04_Decision = "ogród"
    ~ marker = 3
    + [A utility area.]
    ~ 04_Decision = "zaplecze"
    ~ marker = 4
    + [Can you tell me what each idea looks like?]
        Of course!
        -> MainDebateNode
    + [I haven't decided yet.]
    ->END
    
- So be it!

~ 04_DecisionInProgress = false
~ 04_bIsDecisionMade = true
~ SwitchTerrain(marker)
~ AddToCompletedQuests()

Thank you. Your decision is very important to me. I must admit, you're doing great. Bravo! Let's move on! -> END

==InitialSendoff
Come back to me once you've made a decision.
~ 04_DecisionInProgress = true
-> END

== DecisionRevisit

Thank you for taking care of this place! #portrait:GeniusLoci
-> END

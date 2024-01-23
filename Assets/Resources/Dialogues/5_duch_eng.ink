INCLUDE Globals.ink

{05_DecisionInProgress == true: -> TimeForDecision}
{05_bIsDecisionMade == true: -> DecisionRevisit}
{05_bIsDecisionMade == false: -> BeginQuest}


== BeginQuest

This time around, I have something bigger for you. #portrait:GeniusLoci

    * [Will this require running around the Campus?]
    Just a bit. ->StoryStep_01
    * [Will this involve resolving moral dilemmas?]
    Dillemas - yes! Moral ones - never! ->StoryStep_01
    * [Will this require passing agility tests?]
    Not at all! ->StoryStep_01

== StoryStep_01

There are three interesting projects, but we only have a budget for one and we have to choose. All three concern the central part of the Campus of the Warsaw University of Technology.

The first project concerns the fountain next to which we are standing right now. This historic fountain is located right in the middle of the Campus, serving as an excellent landmark.

During the day, a lot of people hang out here. It's also a significant piece of this place's history: you can find the fountain in pre-war photographs.

The other two projects concern an outdoor stage and one of the several main traffic routes on the Campus of the Warsaw University of Technology.
    -> MainDecisionNode

== MainDecisionNode

    + [Tell me more about the fountain project.]
    -> Option_01
    + [Tell me about the outdoor stage.]
    -> Option_02
    + [Tell me about the alley.]
    -> Option_03
    + [I have no more questions for now.]
    -> END
    + [I have no questions, but I know what to do.]
    ~05_DecisionInProgress = true
    -> TimeForDecision
    
== Option_01
The fountain project is not about changing the fountain itself, but everything around it, that is installing more comfortable benches, replacing the sidewalk with a more even and eco-friendly one or totally ripping it up.

We would hang garlands with lights between the trees to add some ambiance to the evenings spent here.
->MainDecisionNode

== Option_02

In the outdoor or summer stage project, events requiring amplification could regularly take place on Campus. And these wouldn't necessarily need to be concerts.
    
If you need more details, ask my assistant. A bicycle is his distinctive feature. You will find him where the stage is supposed to be built.

Turn towards the Physics building and bypass it, keeping it to your left. The place for the stage is just around the corner.
->MainDecisionNode

== Option_03 

The alley is just as interesting, if not more. But you have to judge for yourself! 

When I say an alley I mean the route from the 3rd Company of the "Golski" Battalion monument to the gate on the Koszykowa Street side. 
It's right next to the Chemistry, the Faculty of Mathematics and Information Science (MiNI), and the Transport buildings.

The idea is to transform this traffic route into one of the two main axes of the Central Campus, so that it's easier to navigate the Campus. For details, ask my assistants, who are standing nearby.

How will you recognize them? Well, two of them can wag their tails!

-> MainDecisionNode

== QuestRevisit
Welcome back! As a reminder: we are choosing between renovating the fountain, setting up a music stage, or improving the alley.
By alley, I mean the traffic route from the Golski monument to the gate on the Koszykowa Street side.

-> MainDecisionNode

== TimeForDecision
Alright! I understand that you're ready. So, please, make a decision! #portrait:GeniusLoci

VAR marker = 0

    + [Let's revamp the fountain's surroundings.]
    ~ 05_Decision = "fontanna"
    ~ marker = 1
    + [Let's build a stage.]
    ~ 05_Decision = "scena"
    ~ marker = 2
    + [Let's set up an alley.]
    ~ 05_Decision = "pasaż"
    ~ marker = 3
    + [I still don't know what to do.]
    -> END
    
- So be it!

~ 05_DecisionInProgress = false
~ 05_bIsDecisionMade = true
~ SwitchTerrain(marker)
~ AddToCompletedQuests()

Thank you! You make your decisions very efficiently! Thanks to you, the Campus has a chance to change quickly. ->END

== DecisionRevisit
Thank you for taking care of this place! #portrait:GeniusLoci
-> END

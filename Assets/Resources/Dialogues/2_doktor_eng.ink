INCLUDE Globals.ink

{02_bIsDecisionMade == true: -> DecisionRevisit}
{02_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
I'm afraid I've run out of dialogue. #portrait:Doktor
-> END

== BeginQuest

May we talk about the future of this courtyard for a moment? #portrait:Doktor

    + [This is precisely why I'm here.]
- Just imagine! An interactive outdoor exhibition. Anyone can come up and experience firsthand what we do in here! Everything presented in an accessible way, without using any jargon.
    
    -> MainArgumentNode
    
== MainArgumentNode

    + [Why should the gallery be located here?]
        -> Question_01
    + [What will other Campus users gain from that?]
        -> Question_02
    + [There has been an idea to make a parking lot here instead of a gallery.]
        -> Question_03
    + [There has been a proposal to set up a food corner here.]
        -> Question_04
    + [It's also possible to leave it as a green space.]
        -> Question_05
    + [I have no more questions.]
        -> END
    
== Question_01
This place is perfectly located! On one hand, it's secluded, and on the other, it's almost in the very center of the heavily utilized Campus area that bustles with life on a daily basis.
    ->MainArgumentNode
    
== Question_02

The gallery would feature works made by people from various departments of the University, popularizing their research or project involvement. 
An open-air gallery would become a fixture of the Warsaw University of Technology's Campus, and might eventually become a popular spot. Everyone passing by could have a look.
    ->MainArgumentNode

== Question_03
We should reduce car traffic on the Campus. If parking lots, then on its outskirts.
    ->MainArgumentNode

== Question_04
This kind of place should be located closer to the center of the Campus, in the immediate vicinity of pedestrian paths. We are out of the way here. 
    ->MainArgumentNode

== Question_05
There is also space for green areas in other parts of the Campus. There's a large square right behind us. 
It's great to have some green spaces but it cannot displace other functions that a university campus must fulfill. 
    ->MainArgumentNode

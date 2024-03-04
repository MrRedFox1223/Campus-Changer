INCLUDE Globals.ink

{04_DecisionInProgress == true: -> TimeForDecision}
{04_bIsDecisionMade == true: -> DecisionRevisit}
{04_bIsDecisionMade == false: -> BeginQuest}


== BeginQuest

UuuuuuUUuuuUuuu! #portrait:GeniusLoci

    * [Czemu na mnie „uuuuczysz”?]
    - Bo powiało grozą. To miejsce wygląda...
    
    + [...obskurnie.]
    Dosadnie powiedziane, ale nie bez racji. ->StoryStep_01
    + [...industrialnie.]
    Dyplomatycznie ujęte! ->StoryStep_01
    + [...jakby miał mnie ktoś napaść po zmroku.]
    O zgrozo! UuuuuuUUUuuu! ->StoryStep_01
    + [...jakby było gotowe na fascynującą przemianę.]
    Ha! Czytasz mi w myślach. ->StoryStep_01
    
== StoryStep_01
Ale do rzeczy. Tym razem nie będziemy rozmawiać z innymi osobami. Tym razem wszystko zostanie między nami.

    -> StoryStep_02
    
== StoryStep_02

Jak widzisz, na razie nic tu nie ma, poza dwoma budynkami, które stoją blisko siebie, a jeden z nich wygląda na opuszczony. Ale są aż cztery pomysły na to miejsce.
	
Oto cztery pomysły. Pierwszy: odświeżyć elewację i zostawić resztę tak, jak jest. Drugi: wprowadzić zieleń. Trzeci: urządzić miejsce pełne zieleni służące odpoczynkowi między zajęciami. Czwarty: urządzić zaplecze, takie trochę gospodarcze.
    ->MainDebateNode
    
==MainDebateNode

    + [Opowiedz mi o odświeżeniu elewacji.]
    ->Option_01
    + [Opowiedz mi o zieleni.]
    ->Option_02
    + [Opowiedz mi o ogrodzie.]
    ->Option_03
    + [Opowiedz mi o zapleczu.]
    ->Option_04
    + [Chcę już podjąć decyzję.]
    ->TimeForDecision
    + [Na razie nie mam zdania.]
    ->InitialSendoff

== Option_01

To proste: ładny projekt, dużo farby i już, robi się przyjemniej. Poza tym wszystko po staremu.
->MainDebateNode

== Option_02

Co powiesz na nieco zieleni? Drzewa, krzewy. A może też kwietnik? Cokolwiek co cieszyłoby oko. Samochody nie jeździłyby tędy. Wjeżdżałyby bramą od strony ulicy Koszykowej. 
->MainDebateNode

== Option_03
Wyobraź to sobie! Zdzieramy nawierzchnię i robimy trawnik. Sadzimy drzewa i krzewy, a może robimy jakąś przestrzeń do gier zespołowych. 
W końcu, tam też można się uczyć pracy w zespole :) Kilka leżaków, a może też hamaków. 
Taka nieformalna przestrzeń do odpoczynku w trakcie przerw między zajęciami.
->MainDebateNode


== Option_04

Skoro i tak jest tu brzydko, to nikt się nie obrazi, jeśli wylądują tu śmietniki i tym podobne, mało atrakcyjnie wyglądające elementy przestrzeni. To miejsce już nie straci, a gdzie indziej będzie ładniej.
->MainDebateNode


== TimeForDecision

Co robimy z tym miejscem? #portrait:GeniusLoci

VAR marker = 0

    + [Odświeżenie elewacji.]
    ~ 04_Decision = "elewacja"
    ~ marker = 1
    + [Zieloną przestrzeń.]
    ~ 04_Decision = "zieleń"
    ~ marker = 2
    + [Ogród o nieformalnym charakterze.]
    ~ 04_Decision = "ogród"
    ~ marker = 3
    + [Zaplecze gospodarcze.]
    ~ 04_Decision = "zaplecze"
    ~ marker = 4
    + [Możesz mi opowiedzieć, jak wygląda każdy pomysł?]
        Oczywiście!
        -> MainDebateNode
    + [Jeszcze nie wiem.]
    ->END
    
- A więc niech tak się stanie.

~ 04_DecisionInProgress = false
~ 04_bIsDecisionMade = true
~ SwitchTerrain(marker)
~ AddToCompletedQuests()

Dziękuję. Twoja decyzja jest dla bardzo ważna. Muszę przyznać, że doskonale sobie radzisz. Brawo! Chodźmy dalej!  -> END


==InitialSendoff
Wróć do mnie, gdy podejmiesz decyzję.
~ 04_DecisionInProgress = true
-> END


== DecisionRevisit

Dziękuję, że zająłeś się tym miejscem! #portrait:GeniusLoci
-> END

INCLUDE Globals.ink

{06_DecisionInProgress == true: -> TimeForDecision}
{06_bIsDecisionMade == true: -> DecisionRevisit}
{06_bIsDecisionMade == false: -> BeginQuest}


== BeginQuest

Co myślisz o tym miejscu? #portrait:GeniusLoci

    + [Podoba mi się.]
    A mi się nie podoba. -> StoryStep_01
    + [Nie podoba mi się.]
    Mi też. -> StoryStep_01
    + [Nie mam zdania.]
    Mi się nie podoba. -> StoryStep_01

== StoryStep_01

Te ścieżki pomiędzy trawnikami są za wąskie. Trawniki są ogrodzone i niedostępne. A do tego pośrodku stoją te paskudne śmietniki.

    + [Gdzieś trzeba przecież wynosić śmieci.]
    Ale nie muszą leżeć na wierzchu! -> StoryStep_02
    + [Śmietniki można by stąd zabrać.]
    No właśnie! -> StoryStep_02

    
== StoryStep_02

Tymczasem jest na to miejsce zupełnie nowy pomysł. Powstała propozycja, żeby postawić tu nowy budynek i przeznaczyć go na cele gastronomiczne.

    + [Super! Kawiarnia to świetny pomysł!]
    To jedna z możliwości, ale nie jedyna. -> InitialMindMadeUp
    + [Super! Stołówka to świetny pomysł!]
    To jedna z możliwości, ale nie jedyna. -> InitialMindMadeUp
    + [Wystarczy estetycznie wyglądająca altana śmietnikowa.]
    Nie każdy zgodzi się z tym zdaniem. -> InitialMindMadeUp
    + [E tam! Zostawmy tak jak jest… po staremu!]
    Sporo osób wolałoby inne rozwiązanie. -> InitialMindMadeUp
    
== InitialMindMadeUp

Najlepiej jeśli porozmawiasz z ludźmi wokół. To zajmie tylko parę chwil.
    + [Nie, dziękuję, mam już swoje zdanie.]
    ~ 06_DecisionInProgress = true
    W porządku. ->TimeForDecision
    + [Dobrze, porozmawiam.]
    ~ 06_DecisionInProgress = true
    -> END

== TimeForDecision

Jaka jest Twoja decyzja w sprawie kawiarni? #portrait:GeniusLoci
    
VAR marker = 0
    
    + [Tak, zróbmy kawiarnię]
    ~ 06_Decision = "kawiarnia"
    ~ marker = 1
    + [Zamiast kawiarni zróbmy stołówkę.]
    ~ 06_Decision = "stołówka"
    ~ marker = 2
    + [Nic nie budujmy, poza schludnym pomieszczeniem na śmietniki.]
    ~ 06_Decision = "altana"
    ~ marker = 3
    + [Zostawmy wszystko, jak jest.]
    ~ 06_Decision = "bez zmian"
    ~ marker = 0
    + [Jeszcze nie wiem.]
    -> END
    
- A więc niech tak się stanie.

~ 06_DecisionInProgress = false
~ 06_bIsDecisionMade = true
~ SwitchTerrain(marker)

Świetnie! Mamy to! Idziemy dalej! -> END

== DecisionRevisit
Dziękuję, że zająłeś się tym miejscem! #portrait:GeniusLoci
-> END


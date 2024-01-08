INCLUDE Globals.ink

{03_bIsDecisionMade == true: -> DecisionRevisit}
{03_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
Obawiam się, że skończyły mi się kwestie dialogowe. #portrait:Mama
-> END

== BeginQuest

Dzień dobry, młody człowieku. #portrait:Mama

    + [Dzień dobry. Przychodzę w sprawie bramy.]
    Mała rzecz, a cieszy. Ale wiem, że zdania są podzielone.
    ->MainArgumentNode
    
    + [No z tą młodością, to bez przesady.]
    Prawda. Mamy tu kogoś młodszego. W czym mogę pomóc?
    ->MainArgumentNode
    
== MainArgumentNode

    + [Czemu to jest ważne, by brama została?]
    -> Question_01
    + [Czy korzystanie z furtki nie jest wygodne?]
    -> Question_04
    + [Czy nie byłoby lepiej bez bramy?]
    -> Question_02
    + [A może całkiem zamknąć?]
    -> Question_03
    + [Nie mam więcej pytań.]
    -> END

    
== Question_01

Proszę spojrzeć. Tu jest cicho, bezpiecznie i nikt się nie kręci. Idealna przestrzeń dla pieszych. Można by jeszcze dostawić ławeczkę albo dwie… ach i zrobić kwietnik. 
->MainArgumentNode

== Question_02

Jeśli usuniemy bramę, zaczną tu za moment parkować samochody. Wystarczy, że w każdym innym miejscu muszę mieć oczy dookoła głowy.
->MainArgumentNode

== Question_03

Wtedy nie będę tu mogła wjechać z wózkiem, prawda?
->MainArgumentNode

== Question_04

Nie do końca, ale radzę sobie, więc myślę, że może zostać.
->MainArgumentNode

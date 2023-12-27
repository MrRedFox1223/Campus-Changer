INCLUDE Globals.ink

{05_bIsDecisionMade == true: -> DecisionRevisit}
{05_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
Obawiam się, że skończyły mi się kwestie dialogowe. #portrait:PaniZPieskiem
-> END

== BeginQuest

Dzień dobry. Jestem pomocniczką Ducha Miejsca. Razem z moimi merdającymi kolegami planuję reorganizację tego pasażu. #portrait:PaniZPieskiem
-> MainDiscussionNode

== MainDiscussionNode

    + [Jakie zmiany masz na myśli?]
    -> Question_01
    + [W czym to jest lepsze od obecnego układu?]
    -> Question_04
    + Na razie nie mam więcej pytań.
    -> END
    
== Question_01
Po pierwsze: na całej długości, zamiast jezdni, równy chodnik z niskimi krawężnikami wykonany z przyjaznego naturze materiału. Samochody będą mogły tu wjechać w drodze wyjątku. 
Po drugie: na każdym rozwidleniu ładne drogowskazy do poszczególnych budynków. 
Po trzecie: ławki, śmietniki, rowerowe parkingi. 
Po czwarte: nowe oświetlenie. To doskonałe miejsce, aby móc poeksperymentować z rozwiązaniami z pogranicza IoT czy urban labs mających na celu polepszenie życia mieszkańców miast.

    + [Czy to kolejna zmiana uderzająca w samochody?]
    -> Question_02
    + [Komu to się przyda?]
    -> Question_03
    
== Question_02

To prawda, że samochody nie miałyby wstępu na ten szlak, chyba że w wyjątkowych przypadkach. Ale to nie znaczy, że nie może ich być gdzie indziej. 
Nawet jeśli chcemy zostawić miejsca parkingowe, to warto, żeby akurat tutaj było miejsce tylko dla pieszych.
-> MainDiscussionNode

== Question_03

Wszystkim! Bardzo duża część użytkowników Kampusu porusza się po tej trasie lub po jej znacznym odcinku. Tymczasem w Kampusie nie ma spójnego oznakowania. 
Jeśli nie wiesz, który to Gmach Chemii, to tak szybko do niego nie trafisz.
->MainDiscussionNode

== Question_04

Po pierwsze, dzięki oświetleniu i oznakowaniu łatwo byłoby trafić. 
Po drugie, dzięki drogowskazom każdy by wiedział, gdzie iść dalej. 
Po trzecie, wszyscy czuliby się bezpieczniej, ponieważ nie byliby zepchnięci na obecne wąskie i powybijane chodniki.
-> MainDiscussionNode


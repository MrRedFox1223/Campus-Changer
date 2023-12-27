INCLUDE Globals.ink

{09_DecisionInProgress == true: -> TimeForDecision}
{09_bIsDecisionMade == true: -> DecisionRevisit}
{09_bIsDecisionMade == false: -> BeginQuest}


== BeginQuest

Popatrz tylko na to industrialne podwórze.

    * [Wygląda jakby obok była fabryka.]
Jesteśmy między Wydziałem Mechaniki, Energetyki i Lotnictwa a Wydziałem Elektrycznym. Industrialny klimat tu pasuje. 
Ale jest pomysł, żeby ta przestrzeń zyskała nową odsłonę. -> StoryStep_01
    * [Wygląda jakby za rogiem była burgerownia.]
Najwyraźniej inne osoby miały podobne skojarzenie, ponieważ pojawił się podobny pomysł na zagospodarowanie tego miejsca. -> StoryStep_01
    
== StoryStep_01

Otóż można by tu zaprosić food trucki.
-> FirstQuestionLoop

== FirstQuestionLoop

    + [Co to jest food truck?]
    -> Question_01
    +[ Którędy by wjeżdżały?]
    -> Question_02
    + [Podoba mi się.]
    -> InitialMindMadeUp
    + [Nie podoba mi się.]
    -> InitialMindMadeUp
    + [Chętnie posłucham argumentów.]
    -> InitialUndecided
    
== Question_01

Ciężarówka z jedzeniem. Mini-restauracja na kółkach. Niektórzy by powiedzieli, że mobilny fast food. Aktualnie może serwować naprawdę niesamowite jedzenie. 
Zajmuje przy tym mało miejsca i do tego każdego dnia może być gdzie indziej, więc codziennie jest inny wybór potraw z całego świata.
-> FirstQuestionLoop

== Question_02

Bramą przy Nowowiejskiej, obok przystanku tramwajowego.
-> FirstQuestionLoop

== InitialMindMadeUp

A może chcesz dowiedzieć się, co myślą inni?

    + [Nie sądzę, że mogą mnie przekonać.]
    ~09_DecisionInProgress = true
    W takim razie nie zwlekajmy. -> TimeForDecision
    + [Dobry pomysł.]
    -> InitialSendoff


== InitialUndecided
    
W skrócie. Strażnik uważa, że to zły pomysł, a mieszkające na terenie kampusu dzieci, że dobry. Wszystkich znajdziesz tu, na podwórku. 
-> InitialSendoff

== InitialSendoff

Wróć do mnie, gdy skończysz rozmowy.
~ 09_DecisionInProgress = true
->END
    
== TimeForDecision

Krótka piłka: food trucki tak czy food trucki nie?

    + [Tak]
    ~09_Decision = "food truck"
   Stawiamy food trucki!
    + [Nie]
    ~09_Decision = "zaplecze"
    Czyli wszystko zostaje po staremu.
    + [Nie wiem]
    Popytaj ludzi wokół, może oni pomogą Ci wybrać.
    -> InitialSendoff
 - Fantastycznie! Kolejne zadanie rozwiązane. Trzymaj się!
 ~09_DecisionInProgress = false
 ~09_bIsDecisionMade = true
 -> END
    
== DecisionRevisit
Dzięki, że zająłeś się tym miejscem!
-> END


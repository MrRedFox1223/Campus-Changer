INCLUDE Globals.ink

{07_DecisionInProgress == true: -> TimeForDecision}
{07_bIsDecisionMade == true: -> DecisionRevisit}
{07_bIsDecisionMade == false: -> BeginQuest}

== BeginQuest

Witamy w zapomnianym zakątku Kampusu!

    + [Ale tu jest brama, dużo ludzi tędy przechodzi...]
    
- Tak? A ilu z nich zagląda do kordegardy?

    + [Korde… co?]
    
- Obok bramy stoi niewielki budynek. Jest zaniedbany i nieużywany. Aż prosi się, żeby go zagospodarować!

    + [Kordegarda to rodzaj stróżówki. Zróbmy tu miejsce dla straży akademickiej.]
    -> InitialMindMadeUp
    + [Miejsce, przez które przechodzi dużo osób, jest idealnym miejscem na małą knajpkę.]
    -> InitialMindMadeUp
    + [Budynek przy samej bramie to dobre miejsce na living lab!]
    -> InitialMindMadeUp
    + [Ciekawe, jakie pomysły mają inni.]
    -> InitialUndecided


== InitialMindMadeUp

To jeden ze zgłoszonych pomysłów. Ale są też inne. Możesz się dowiedzieć o nich więcej. Musisz tylko porozmawiasz z osobami stojącymi przy bramie. 
    
    +[ Nie ma potrzeby, już wiem co chcę zrobić.]
    ~ 07_DecisionInProgress = true
    W porządku -> TimeForDecision
    + [Dobrze, porozmawiam.]
    -> InitialSendoff


== InitialUndecided

Profesor marzy o living labie. Pani pracujaca w pobliskim dziekanacie wymyśliła, że można tu urządzić siedzibę straży akademickiej. Ale za to strażnik proponuje małą knajpkę.

    * [Porozmawiam z nimi.]
    ->InitialSendoff


== InitialSendoff

Wróć do mnie, gdy wszystkiego się dowiesz.
~ 07_DecisionInProgress = true
-> END

== TimeForDecision

Jaka jest twoja decyzja w sprawie kordegardy?

    + [Knajpka.]
    ~ 07_Decision = "knajpka"
    + [Living lab.]
    ~ 07_Decision = "living lab"
    + [Stróżówka.]
    ~ 07_Decision = "stróżówka"
    + [Żaden z tych pomysłów nie jest dobry, zostawmy jak jest.]
    ~ 07_Decision = "nic"
    + [Jeszcze nie wiem.]
    -> END
    
- A więc niech tak się stanie.
~ 07_DecisionInProgress = false
~ 07_bIsDecisionMade = true

Dziękuję za pomoc! Przed Tobą jeszcze kilka spraw do rozwikłania. ->END
   
== DecisionRevisit
Dzięki, że zająłeś się tym miejscem!
-> END

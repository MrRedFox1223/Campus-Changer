INCLUDE Globals.ink

{07_DecisionInProgress == true: -> TimeForDecision}
{07_bIsDecisionMade == true: -> DecisionRevisit}
{07_bIsDecisionMade == false: -> BeginQuest}

== BeginQuest

Witamy w zapomnianym zakątku kampusu! #portrait:GeniusLoci

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

Profesor marzy o living labie. Pani pracująca w pobliskim dziekanacie wymyśliła, że można tu urządzić siedzibę straży akademickiej, zaś strażnik proponuje małą knajpkę.

    * [Porozmawiam z nimi.]
    ->InitialSendoff


== InitialSendoff

Wróć do mnie, gdy wszystkiego się dowiesz.
~ 07_DecisionInProgress = true
-> END

== TimeForDecision

Jaka jest twoja decyzja w sprawie kordegardy? #portrait:GeniusLoci

VAR marker = 0

    + [Knajpka.]
    ~ 07_Decision = "knajpka"
    ~ marker = 1
    + [Living lab.]
    ~ 07_Decision = "living lab"
    ~ marker = 2
    + [Stróżówka.]
    ~ 07_Decision = "stróżówka"
    ~ marker = 3
    + [Żaden z tych pomysłów nie jest dobry, zostawmy jak jest.]
    ~ 07_Decision = "nic"
    ~ marker = 0
    + [Jeszcze nie wiem.]
    -> END
    
- A więc niech tak się stanie.
~ 07_DecisionInProgress = false
~ 07_bIsDecisionMade = true
~ SwitchTerrain(marker)
~ AddToCompletedQuests()

Dziękuję za pomoc! Przed Tobą jeszcze kilka spraw do rozwikłania. ->END
   
== DecisionRevisit
Dziękuję, że zająłeś się tym miejscem! #portrait:GeniusLoci
-> END

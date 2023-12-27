INCLUDE Globals.ink

{02_DecisionInProgress == true: -> TimeForDecision}
{02_bIsDecisionMade == true: -> DecisionRevisit}
{02_bIsDecisionMade == false: -> BeginQuest}


== BeginQuest

Jesteśmy na dziedzińcu pomiędzy Gmachem Mechaniki a gmachem Wydziału Instalacji Budowlanych.

    + [Idealne miejsce na ogród.] -> InitialMindMadeUp
    + [Idealne miejsce na galerię plenerową.] -> InitialMindMadeUp
    + [Idealne miejsce na parking.] -> InitialMindMadeUp
    + [Idealne miejsce, żeby coś przekąsić.] -> InitialMindMadeUp
    + [Chętnie się dowiem, co można zrobić z tym miejscem.] -> InitialUndecided
    

== InitialMindMadeUp
    
Nie wszyscysię z tym zgadzają.
Dlatego proszę, porozmawiaj z nimi. Kiedy do nich podejdziesz opowiedzą Ci jak wyobrażają sobie tę część Kampusu Centralnego i przedstawią swoje argumenty.

    * [Nie interesują mnie ich argumenty. Znam to miejsce i już wszystko wiem.]
        ~ 02_DecisionInProgress = true
        W porządku. -> TimeForDecision
    * [Dobrze, porozmawiam z nimi.]
        -> InitialSendoff

== InitialUndecided

W takim razie przed Tobą kilka ciekawych rozmów. Student z wymiany zagranicznej chciałby zbudować tu niewielką przestrzeń z jedzenim. Taką knajpkę na świeżym powietrzu. Pani mieszkająca na terenie kampusu proponuje, aby znalazła się tu zieleń. Strażnik zaś mówi, że lepszy byłby parking. I jeszcze Pan doktor. Jemu marzy się galeria plenerowa.

    * [W takim na mnie już pora.]
        -> InitialSendoff

== InitialSendoff

Przywołaj mnie, gdy skończysz rozmowy. Czekam na Twoją decyzję.
~ 02_DecisionInProgress = true
-> END

== TimeForDecision

Jaka jest Twoja decyzja? Mamy kilka możliwości: zieleń, gastronomia, parking i galeria.

    + [Zostawmy zieleń.]
    ~ 02_Decision = "zieleń"
    + [Zróbmy zakątek z gastronomią.]
    ~ 02_Decision = "gastronomia"
    + [Zróbmy parking.]
    ~ 02_Decision = "parking"
    + [Urządźmy galerię.]
    ~ 02_Decision = "galeria"
    + [Jeszcze nie wiem.]
    ->END
    
- A więc niech tak się stanie.

~ 02_DecisionInProgress = false
~ 02_bIsDecisionMade = true

Dziękuję, że tak szybko podjąłeś swoją decyzję! Pożegnajmy się z tym dziedzińcem i ruszajmy dalej.  -> END

== DecisionRevisit

Dzięki, że zająłeś się tym miejscem!
-> END

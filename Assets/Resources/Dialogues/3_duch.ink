INCLUDE Globals.ink

{03_DecisionInProgress == true: -> TimeForDecision}
{03_bIsDecisionMade == true: -> DecisionRevisit}
{03_bIsDecisionMade == false: -> BeginQuest}

== BeginQuest

Cześć! Wiesz co to za budynek? #portrait:GeniusLoci

    + [To jest Gmach Chemii.]
        Brawo! 
        -> StoryStep_01
    + [To jest Wydział Transportu.]
        Transport jest obok, to jest Chemia. 
        -> StoryStep_01
    + [To jest Gmach Główny.]
        Yyy, niezupełnie. Dobrze, że tego nie ma na kolokwium. Stoimy obok Gmachu Chemii. 
        -> StoryStep_01

== StoryStep_01

Tym razem spór dotyczy nie budynku i nie podwórka, tylko bramy.
    + [Nic dziwnego. Strasznie ponura.]
        I w tym właśnie problem. Część osób chciałaby ją otworzyć na stałe. 
        -> StoryStep_02
    + [Brama jak brama. Jak można się pokłócić o bramę?]
        To proste, jednym pasowałoby ją otworzyć, a innym zamknąć. 
        -> StoryStep_02

== StoryStep_02

    + [Zdecydowanie należy otworzyć.]
        ->InitialMindMadeUp
    + [Zdecydowanie należy zamknąć.] 
        ->InitialMindMadeUp
    + [Jakie są w tej sprawie argumenty?]
        ->InitialUndecided

== InitialMindMadeUp

Spróbujmy może najpierw posłuchać, co inni mają do powiedzenia. Nie interesuje Cię, jak to się stało, że kogoś bulwersuje brama?

    + [Nie. Mam wyrobione zdanie na temat bram.]
        ~ 03_DecisionInProgress = true
        Zatem nie zwlekajmy. -> TimeForDecision
    + [No może faktycznie.]
        Dokonale, nie mogę się doczekać, żeby się tym podzielić. 
        -> InitialUndecided

== InitialUndecided

Nieopodal bramy znajdziesz panią poruszającą się na wózku, która chciałaby bramę całkiem otworzyć, i świeżo upieczoną mamę mieszkającą na przeciwko kampusu, która chciałaby zostawić otwartą furtkę. 
Obok stoi jeden z pracowników Politechniki, który chciałby, żeby wszystko pozamykać.

    ->InitialSendoff

== InitialSendoff

Przywołaj mnie, gdy skończysz rozmowy. Czekam na Twoją decyzję.
~ 03_DecisionInProgress = true
-> END

== TimeForDecision

Jaki jest Twój werdykt? #portrait:GeniusLoci

    + [Otwórzmy bramę. A najlepiej rozmontujmy.]
    ~ 03_Decision = "otworzyć"
    ~ SwitchTerrain(1)
    + [Zostawmy zamkniętą bramę i otwartą furtkę.]
    ~ 03_Decision = "furtka"
    ~ SwitchTerrain(2)
    + [Zamknijmy wszystko!]
    ~ 03_Decision = "zamknąć"
    ~ SwitchTerrain(3)
    + [Jeszcze nie wiem.]
    -> END

- A więc niech tak się stanie.

~ 03_DecisionInProgress = false
~ 03_bIsDecisionMade = true

Dziękuję! Świetnie sobie poradziłeś! Tymczasem jednak czekają na nas inne sprawy. Zatem ruszamy! -> END

== DecisionRevisit

Dziękuję, że zająłeś się tym miejscem! #portrait:GeniusLoci
-> END


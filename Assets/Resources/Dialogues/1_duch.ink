INCLUDE Globals.ink

{01_DecisionInProgress == true: -> TimeForDecision}
{01_bIsDecisionMade == true: -> DecisionRevisit}
{01_bIsDecisionMade == false: -> BeginQuest}

== BeginQuest

Witaj ponownie. Piękny komin, prawda? #portrait:GeniusLoci

    * [Taki trochę staromodny.]
    * [Dobry punkt orientacyjny, widać go z daleka.]
 
    - To prawda!
    
To miejsce jest ważne dla politechnicznego kampusu. Przechodzi tędy mnóstwo ludzi.
Dlatego zastanawiamy się, jak je zagospodarować.
Jak widzisz, teraz jest tu ulica, po której jeżdżą samochody.
Konkurencyjna koncepcja mówi, żeby oddać to miejsce pieszym.

    * [Co?! Mowy nie ma! Zostawić jak jest!]
        -> InitialMindMadeUp
    * [Dobrze mówią, tu powinien być chodnik.]
        -> InitialMindMadeUp
    * [Chyba muszę dowiedzieć się więcej, żeby zdecydować.]
        -> InitialUndecided
    
== InitialMindMadeUp

Nie wszyscy podzielają tę opinię.
Dlatego poproszę Cię o porozmawianie z nimi.
Kiedy do nich podejdziesz, przedstawią Ci swoje argumenty.

    * [Nie interesują mnie ich argumenty. Znam to miejsce i już wszystko wiem.]
        ~ 01_DecisionInProgress = true
        W porządku. -> TimeForDecision
    * [Dobrze, porozmawiam z nimi.]
        ->InitialSendoff
 
== InitialUndecided

Cieszę się, że masz otwartą głowę. W kampusie musimy pomieścić się wszyscy!
W takim razie poproszę Cię o porozmawianie ze studentem, który tu przychodzi co wtorek na dwugodzinne okienko.
Drugą osobą jest pani pracująca w administracji, która prawie codziennie dojeżdża do Gmachu Głównego samochodem.

    * [Jasne, porozmawiam z nimi.]
        ->InitialSendoff
        
== InitialSendoff

Świetnie! Rozmowy powinny zająć Ci nie więcej niż 5 minut! Przywołaj mnie, gdy skończysz. 
~ 01_DecisionInProgress = true
-> END

== TimeForDecision

Jaka jest Twoja decyzja? Czy pozostawiamy ruch uliczny? A może zastępujemy jezdnię chodnikiem? #portrait:GeniusLoci

VAR marker = 0

    * [Jezdnia!]
        ~ 01_Decision = "jezdnia"
        ~ marker = 1
    * [Chodnik!]
        ~ 01_Decision = "chodnik"
        ~ marker = 2
    * [Jeszcze nie wiem.]
        -> END
    
    - A więc niech tak się stanie.

~ 01_DecisionInProgress = false
~ 01_bIsDecisionMade = true
~ SwitchTerrain(marker)

Musisz wiedzieć, że Twoja decyzja ma duży wpływ na otaczający nas kampus. Powodzenia! 

-> END

    
== DecisionRevisit

Dziękuję, że zająłeś się tym miejscem! #portrait:GeniusLoci
-> END

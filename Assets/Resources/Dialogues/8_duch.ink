INCLUDE Globals.ink

{08_DecisionInProgress == true: -> TimeForDecision}
{08_bIsDecisionMade == true: -> DecisionRevisit}
{08_bIsDecisionMade == false: -> BeginQuest}


== BeginQuest

Jesteśmy przy zachodniej bramie Kampusu. Jak widzisz, jest tu dużo miejsca. #portrait:GeniusLoci

    + [Trawniki...]
    ->StoryStep_01
    + [Chodniki...]
    ->StoryStep_01
    + [Parking...]
    ->StoryStep_01

== StoryStep_01

Wszystko po trochu. Decyzja dotyczy parkingów. Pytanie na dzisiaj: czy dodać miejsca parkingowe, czy usunąć, czy może zostawić tak jak są?

    + [Dodać!]
    ->InitialMindMadeUp
    + [Usunąć!]
    ->InitialMindMadeUp
    + [Zostawić!]
    ->InitialMindMadeUp
    + [Posłuchajmy argumentów.]
    ->InitialUndecided

== InitialMindMadeUp

Można tak zrobić, ale to jest przedmiotem burzliwej debaty. Część osób mówi, że trzeba wyrzucić samochody z Kampusu. Inne uważają, że trzeba im zrobić więcej miejsca.

    + [Ja też mam na ten temat mocne zdanie!]
    ~ 08_DecisionInProgress = true
    W takim razie... -> TimeForDecision
    + [Porozmawiam z nimi.]
    -> InitialSendoff

== InitialUndecided

Porozmawiaj ze studentem, jeśli chcesz dowiedzieć się, czemu samochody powinny zniknąć, i z panią z dziekanatu, żeby się dowiedzieć, czemu należy zrobić im więcej miejsca. Oboje stoją przy pomniku. 
->InitialSendoff

== InitialSendoff

Przywołaj mnie, gdy skończysz rozmowy. Czekam na Twoją decyzję.
~ 08_DecisionInProgress = true
-> END

== TimeForDecision

Co robimy z tym miejscem? #portrait:GeniusLoci

    + [Dodajemy miejsca parkingowe kosztem trawników.]
    ~ 08_Decision = "więcej parkingu"
    ~ SwitchTerrain(1)
    + [Zostawiamy wszystko jak jest.]
    ~ 08_Decision = "bez zmian"
    ~ SwitchTerrain(0)
    + [Przenosimy miejsca parkingowe bliżej bramy.]
    ~ 08_Decision = "przeprowadzka"
    ~ SwitchTerrain(2)
    + [Usuwamy połowę miejsc parkingowych, która jest dalej od bramy.]
    ~ 08_Decision = "mniej parkingu"
    ~ SwitchTerrain(3)
    + [Usuwamy wszystkie miejsca parkingowe i zastępujemy je zielenią.]
    ~ 08_Decision = "bez parkingu"
    ~ SwitchTerrain(4)
    
- A więc niech tak się stanie.

~ 08_DecisionInProgress = false
~ 08_bIsDecisionMade = true

Doskonale! Kolejna decyzja za Tobą. Idźmy jednak dalej. Do zobaczenia niebawem! -> END

== DecisionRevisit
Dziękuję, że zająłeś się tym miejscem! #portrait:GeniusLoci
-> END

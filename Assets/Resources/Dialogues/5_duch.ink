INCLUDE Globals.ink

{05_DecisionInProgress == true: -> TimeForDecision}
{05_bIsDecisionMade == true: -> DecisionRevisit}
{05_bIsDecisionMade == false: -> BeginQuest}


== BeginQuest

Tym razem mam dla ciebie coś większego.

    * [Czy to będzie wymagało biegania po Kampusie?]
    Tylko trochę. ->StoryStep_01
    * [Czy to będzie wymagało rozstrzygania dylematów moralnych?]
    Dylematów - tak. Moralnych - nie. ->StoryStep_01
    * [Czy to będzie wymagało zaliczenia testów zręcznościowych?]
    Ani trochę! ->StoryStep_01

== StoryStep_01

Chodzi o to, że mamy trzy ciekawe projekty, ale budżet mamy tylko na jeden i musimy wybrać. Wszystkie trzy dotyczą centralnej części Kampusu PW. 

Pierwszy projekt dotyczy fontanny, przy której właśnie stoimy. Zabytkowa fontanna znajduje się w samym środku Kampusu stanowiąc doskonały punkt orientacyjny. 

W ciągu dnia przesiaduje tu sporo ludzi. To też kawał historii tego miejsca. Można odnaleźć ją na przedwojennych fotografiach. 

Pozostałe dwa projekty dotyczą sceny plenerowej oraz jednego z kilku głównych ciągów komunikacyjnych na terenie Kampusu Politechniki. 
    -> MainDecisionNode

== MainDecisionNode

    + [Opowiedz mi więcej o projekcie fontanny.]
    -> Option_01
    + [Opowiedz mi o scenie plenerowej.]
    -> Option_02
    + [Opowiedz mi o pasażu.]
    -> Option_03
    + [Na razie nie mam więcej pytań.]
    -> END
    + [Nie mam pytań, ale wiem, co zrobić.]
    ~05_DecisionInProgress = true
    -> TimeForDecision
    
== Option_01
W projekcie fontanny chodzi o to, żeby nie zmieniać samej fontanny, tylko wszystko wokół niej. Stawiamy wygodniejsze ławki. Wymieniamy chodnik na bardziej równy i ekologiczny lub totalnie go zrywamy. 

Między drzewami rozwieszamy girlandy z lampkami, żeby wieczorem miejsce to mogło zostać nazwane “klimatycznym”.
->MainDecisionNode

== Option_02

Projekt sceny plenerowej czy też letniej przewiduje, że na terenie kampusu mogłyby regularnie odbywać się wydarzenia wymagające nagłośnienienia. I niekoniecznie muszą to być koncerty. 
    
O więcej szczegółów zapytaj mojego pomocnika. Znak rozpoznawczy - rower. Znajdziesz go tam, gdzie ma powstać scena. 

Odwróć się w stronę Gmachu Fizyki i omiń go, mając go po swojej lewej. Miejsce na scenę jest tuż za rogiem.
->MainDecisionNode

== Option_03

Z pasażem jest równie ciekawie, jeśli nie bardziej. Jednak to sam musisz ocenić! Pasażem nazywam trasę biegnącą od pomnika Golskiego do bramy od strony ulicy Koszykowej, tuż obok Gmachu Chemii, MiNI i Transportu.

Chodzi o to, żeby zmienić ten ciąg komunikacyjny w jedną z dwóch głównych osi Kampusu Centralnego ułatwiający poruszanie się po nim. O szczegóły zapytaj moich pomocników, którzy stoją tuż niopodal. 

Jak ich rozpoznasz? Dwóch z nich merda ogonami.

-> MainDecisionNode

== QuestRevisit
Witaj ponownie! Dla przypomnienia: wybieramy między renowacją fontanny, postawieniem sceny muzycznej i ulepszeniami pasażu.

Przez pasaż rozumiem ciąg komunikacyjny biegnący pomiedzy pomnikiem Golskiego a bramą od strony ulicy Koszykowej.

-> MainDecisionNode

== TimeForDecision
W porządku! Jesteś gotów, jak rozumiem. Zatem podejmij decyzję.

    + [Zróbmy nowy wystrój fontanny.]
    ~ 05_Decision = "fontanna"
    + [Zbudujmy scenę.]
    ~ 05_Decision = "scena"
    + [Urządźmy pasaż.]
    ~ 05_Decision = "pasaż"
    + [Jeszcze nie wiem, co zrobić.]
    -> END
    
- A więc niech tak się stanie.

~ 05_DecisionInProgress = false
~ 05_bIsDecisionMade = true

Dziękuję! Podejmujesz swoje decyzje niezwykle sprawnie! Dzięki Tobie Kampus ma szansę szybko się  zmienić. ->END

== DecisionRevisit
Dzięki, że zająłeś się tym miejscem!
-> END

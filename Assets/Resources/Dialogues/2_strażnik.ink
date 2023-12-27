INCLUDE Globals.ink

{02_bIsDecisionMade == true: -> DecisionRevisit}
{02_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
Obawiam się, że skończyły mi się kwestie dialogowe. #portrait:Strażnik
-> END

== BeginQuest

Dzień dobry, czy mogę w czymś pomóc? #portrait:Strażnik
    * [Dziękuję, wszystko w porządku. Jest pan strażnikiem?]
    - Tak.
    * [Powiedziano mi, że chciałby pan urządzić tu parking.]
    - Tak.
    -> MainArgumentNode
    
== MainArgumentNode
    + [Dlaczego parking powinien być właśnie tutaj?]
        -> Question_01
    + [Co będą z tego mieć inni?]
        -> Question_02
    + [Pani mieszkająca na terenie kampusu proponuje pozostawić tu zieleń.]
        -> Question_03
    + [Student, który niedawno przyjechał tu na wymianę chciałby tu urządzić małą gastronomię.]
        -> Question_04
    + [Zdaniem młodego doktora można tu zrobić galerię prac.]
        -> Question_05
    + [Nie mam więcej pytań.]
        -> END
        
== Question_01
I tak tu nikt nie zagląda. Mogą stać.
    ->MainArgumentNode
    
== Question_02
Można zlikwidować parking w innym miejscu.
    ->MainArgumentNode
    
== Question_03
Oj, taka zieleń! Trzeba o nią dbać, bo inaczej chaszczami wszystko zarośnie i aż przykro będzie patrzeć. Szkoda marnować takie miejsce.
    ->MainArgumentNode
    
== Question_04
Tu wszędzie dookoła jest gastronomia. Po co więcej? Niech poznaje miasto! 
    ->MainArgumentNode
    
== Question_05
Spadnie deszcz i wszystko popsuje. Takie rzeczy to w środku, a nie w plenerze.
    ->MainArgumentNode

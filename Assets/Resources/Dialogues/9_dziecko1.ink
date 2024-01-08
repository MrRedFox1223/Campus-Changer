INCLUDE Globals.ink

{09_bIsDecisionMade == true: -> DecisionRevisit}
{09_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
Obawiam się, że skończyły mi się kwestie dialogowe. #portrait:DzieckoGirl
-> END

== BeginQuest

Dzień dobry! #portrait:DzieckoGirl
    + [Dzień dobry! Czy mogę zadać kilka pytań o food trucki?]
    - Pewnie! Dawaj!
    ->MainDiscussionNode
    
== MainDiscussionNode

    + [Dlaczego tak Ci się podoba?]
    -> Question_01
    + [Czy nie szkoda tracić miejsc parkingowych?]
    -> Question_02
    + [Czy warto ożywiać takie zakamarki?]
    -> Question_03
    + [Nie ma więcej pytań.]
    -> END
    
== Question_01
Wyobraź to sobie. Każdego dnia inne jedzenie z food trucka. Taki mini zlot. To przewaga nad stołówką czy kawiarnią. 

Jednego dnia burgery, innego ramen, lody, pizza. Dużo ludzi. Może to otworzyłoby kampus na okolicznych mieszkańców. 
->MainDiscussionNode

== Question_02
Raaaany! Pytanie, które możesz zadać praktycznie w każdym miejscu tego kampusu. Wszędzie są parkingi. Mnóstwo jest samochodów. W ciągu dnia trzeba bardzo uważać. 
A tutaj właściwie nic się nie dzieje. Nic tu nie ma. Dlaczego więc, nie możemy tutaj mieć takiego super zagłębia z jedzeniem.
->MainDiscussionNode

== Question_03
Oczywiście! Tu jest cicho, ale też ponuro. No po prostu wieje n u d ą! Wszyscy na tym zyskają, jeśli wreszcie będzie się tu coś działo. 
->MainDiscussionNode

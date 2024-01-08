INCLUDE Globals.ink

{06_bIsDecisionMade == true: -> DecisionRevisit}
{06_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
Obawiam się, że skończyły mi się kwestie dialogowe. #portrait:StarszaPani
-> END

== BeginQuest
Dzień dobry. Słyszałam, że chcesz porozmawiać o tej całej kawiarni. #portrait:StarszaPani

    + [To prawda.]
    
Nie podoba mi się ten pomysł. Ale za to chciałabym, żeby ktoś tu wreszcie porządnie posprzątał!
-> MainDiscussionNode


== MainDiscussionNode

    + [Co jest nie tak z kawiarnią lub stołówką?]
    -> Question_01
    + [Co ma Pani na myśli, mówiąc o sprzątaniu?]
    -> Question_02
    + [Czy obecnie istniejące rozwiązanie nie jest dobre dla uczelni?]
    -> Question_03
    + [Nie mam więcej pytań.]
    -> END
    
== Question_01
Ten budynek obok nas jest budynkiem mieszkalnym. Ale to jest nie tak, że ja tu mieszkam i dlatego nie chcę kawiarni. Chciałabym natomiast mieć ciszę i spokój po południu, a w takich miejscach zawsze się hałasuje.
->MainDiscussionNode

== Question_02
Proszę spojrzeć na te śmietniki. Stoją tak na wierzchu i wokół jest bałagan. Przydałaby się ładna altanka, która pomieści ten cały bajzel. 
->MainDiscussionNode

== Question_03
Uczelnia działa zupełnie dobrze, a mieszkańcy kampusu też mają swoje potrzeby. Musimy znaleźć kompromis.
->MainDiscussionNode 

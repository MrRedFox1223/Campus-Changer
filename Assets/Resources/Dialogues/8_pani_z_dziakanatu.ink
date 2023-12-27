INCLUDE Globals.ink

W czym mogę pomóc?

    + Chcę zapytać o parking!
    
    - Tak! Musimy skończyć z tym szaleństwem! Parking trzeba rozbudować! Wystarczy już tego ścisku!
    
== MainDiscussionNode

    + W jaki sposób większy parking ulepszy politechniczny Kampus?
    -> Question_01
    + A co z ekologią i miejskimi korkami?
    -> Question_02
    + Czy nie wystarczą inne opcje dojazdowe, takie jak transport zbiorowy?
    -> Question_03
    + Nie mam więcej pytań.
    -> END
    
== Question_01

Oczywiście! Każdy będzie mógł dojechać do pracy tak, jak chce!
-> MainDiscussionNode
      
== Question_02
To nie są problemy Politechniki. Państwo powinno promować samochody elektryczne, a miasto poszerzać drogi.
-> MainDiscussionNode
== Question_03

Nie znoszę transportu zbiorowego! Tylko samochodem mogę tak naprawdę dojechać tam, gdzie chcę i kiedy chcę!
-> MainDiscussionNode

//INCLUDE Globals.ink

//{checkObelisksQuest == FINISHED: -> Finished}

//~ IsQuestFinished("checkObelisksQuest")
//{checkObelisksQuest == CAN_FINISH: -> CompleteQuest}

//{checkObelisksQuest == IN_PROGRESS: -> InProgress}
//{checkObelisksQuest == DECLINED: -> GetQuest}

//{playerRole == "": -> GoAway | -> Call } 

== GoAway ==
 Go away! I'm trying to not be seen here! #portrait:PaniZAdministracji
-> END

== Call ==
So it's true! You are a //{playerRole}. #portrait:PaniZAdministracji
Listen. My name's Mr Yellow and I need your help. 
-> Obelisks

== Obelisks ==
Did you saw those obelisks behind you?
    +[Yes, I saw them. You know what they are?]
        ->SawObelisks
    +[Obelisks? What obelisks?]
        -> DidntSawObelisks
    +[Hold up! Who are you again?]
        -> WhoAreYou

== DidntSawObelisks ==
Like I said. They are behind you. Three white pillary thingis. Hard to miss.
-> SawObelisks

== WhoAreYou ==
They call me Mr Yellow and I'm a member of T.E.S.T.
    +[And that stands for?]
        ->TEST

== TEST ==
You are the curious one, are you... ? 
Maybe another time. There are more important things that need to be done right now.
-> SawObelisks

== SawObelisks ==
//Listen. I heard that {playerRole}S can activate those obelisks and so it happens that I need them activated.
-> GetQuest

== GetQuest
 Can you activate all of them for me?
    +[I guess]
        -> Agree
    +[Not realy]
        -> Disagree

== Agree ==
Great! I will wait here until you activate all three of them. Good luck!
//~ StartQuest("checkObelisksQuest")
-> END

== Disagree
Well... I will wait here if you change your mind.
//~ checkObelisksQuest = DECLINED
-> END

== InProgress
Did you activated all of them? By YOURSELF? 
If one of them was already active that doesn't count. 
You need to deactivate and activate it again.
-> END

== CompleteQuest ==
You did it! You really did it! Thank you my friend. You did a great service to T.E.S.T. 
//~ FinishQuest("checkObelisksQuest")
-> END

== Finished ==
T.E.S.T. thanks you for your service!
-> END
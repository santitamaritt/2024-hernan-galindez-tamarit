Class {
	#name : #Reverse,
	#superclass : #Instant,
	#category : #'IngSoft2-Model'
}

{ #category : #operations }
Reverse >> applyFrom: aSpaceship target: otherSpaceshipName blockToApplyLastEffect: block [
    | reversed |
    reversed := players reversed.

    players removeAll.
    reversed do: [:each | players add: each ].

]

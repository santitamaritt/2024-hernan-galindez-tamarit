Class {
	#name : #Skip,
	#superclass : #Instant,
	#category : #'IngSoft2-Model'
}

{ #category : #operations }
Skip >> applyFrom: aSpaceship target: otherSpaceshipName blockToApplyLastEffect: block [

	| index nextIndex nextPlayer |
	index := players indexOf: aSpaceship.
	nextIndex := index = players size
		             ifTrue: [ 1 ]
		             ifFalse: [ index + 1 ].
	nextPlayer := players at: nextIndex.
	nextPlayer lostATurn
]

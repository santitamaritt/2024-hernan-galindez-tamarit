Class {
	#name : #Double,
	#superclass : #Instant,
	#category : #'IngSoft2-Model'
}

{ #category : #operations }
Double >> applyFrom: aSpaceship target: otherSpaceshipName blockToApplyLastEffect: block [

	| ship |
	ship := (aSpaceship isKindOf: String)
		        ifTrue: [
			        players
				        detect: [ :p | p name = aSpaceship ]
				        ifNone: [
				        Error signal: 'Spaceship not found: ' , aSpaceship ] ]
		        ifFalse: [
			        (aSpaceship isKindOf: Spaceship)
				        ifTrue: [ aSpaceship ]
				        ifFalse: [
				        Error signal: 'Argument must be a spaceship or a name' ] ].
	ship giveExtraTurn
]

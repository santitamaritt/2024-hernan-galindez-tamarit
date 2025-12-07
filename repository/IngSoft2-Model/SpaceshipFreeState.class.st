Class {
	#name : #SpaceshipFreeState,
	#superclass : #SpaceshipState,
	#category : #'IngSoft2-Model'
}

{ #category : #testing }
SpaceshipFreeState >> applyCard: aCard to: aSpaceship [
    aSpaceship deck appliedCard: aCard.
]

{ #category : #testing }
SpaceshipFreeState >> applyPenaltyTo: aSpaceship in: aGameboard [
    aGameboard moveToStart: aSpaceship.
    aSpaceship currentFuel: aSpaceship maxCapacity.
    aSpaceship lostTurns: 2.
    "aSpaceship state: SpaceshipJailedState new."
]

{ #category : #testing }
SpaceshipFreeState >> canPlay: aSpaceship [
    ^ aSpaceship lostTurns = 0.

]

{ #category : #testing }
SpaceshipFreeState >> consumeExtraTurnOf: aSpaceship [
    aSpaceship extraTurn: false.
]

{ #category : #testing }
SpaceshipFreeState >> giveExtraTurnTo: aSpaceship [
    aSpaceship extraTurn: true.
]

{ #category : #testing }
SpaceshipFreeState >> hasExtraTurn: aSpaceship [
    ^ aSpaceship extraTurn.
]

{ #category : #testing }
SpaceshipFreeState >> isFree [
    ^ true
]

{ #category : #testing }
SpaceshipFreeState >> lostATurn: aSpaceship [
   aSpaceship lostTurns: aSpaceship lostTurns - 1.
]

{ #category : #testing }
SpaceshipFreeState >> moveSpaceship: aSpaceship amount: anAmount in: aGameboard [
    | squaresToMove |
    squaresToMove := anAmount + aSpaceship diceAdjustment.

    aSpaceship useAllyFuelIfNecessary: squaresToMove in: aGameboard.

    aSpaceship currentFuel > squaresToMove abs
        ifTrue: [
            aSpaceship changeCurrentFuelBy: squaresToMove abs.
            aGameboard move: aSpaceship with: squaresToMove ]
        ifFalse: [
            self applyPenaltyTo: aSpaceship in: aGameboard ].
]

{ #category : #testing }
SpaceshipFreeState >> needsToThrow: aSpaceship expected: expectedNumber [
    aSpaceship needsToThrow: expectedNumber.
]

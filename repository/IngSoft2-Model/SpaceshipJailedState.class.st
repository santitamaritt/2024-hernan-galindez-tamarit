Class {
	#name : #SpaceshipJailedState,
	#superclass : #SpaceshipState,
	#category : #'IngSoft2-Model'
}

{ #category : #testing }
SpaceshipJailedState >> applyCard: aCard to: aSpaceship [
    "Mientras está jailed, no recibe cartas"
]

{ #category : #testing }
SpaceshipJailedState >> applyPenaltyTo: aSpaceship in: aGameboard [
    "Ya está penalizado"
]

{ #category : #testing }
SpaceshipJailedState >> canExitJail: roll in: aGameboard [
    ^ roll = aGameboard maxDiceValue.

]

{ #category : #testing }
SpaceshipJailedState >> canPlay: aSpaceship [
    ^ true.
]

{ #category : #testing }
SpaceshipJailedState >> consumeExtraTurnOf: aSpaceship [
    "No aplica"
]

{ #category : #testing }
SpaceshipJailedState >> giveExtraTurnTo: aSpaceship [
    "Ignorar powerups mientras está jailed"
]

{ #category : #testing }
SpaceshipJailedState >> hasExtraTurn: aSpaceship [
    ^ false.
]

{ #category : #testing }
SpaceshipJailedState >> isJailed [
    ^ true

]

{ #category : #testing }
SpaceshipJailedState >> lostATurn: aSpaceship [
    "Sigue jailed"
]

{ #category : #testing }
SpaceshipJailedState >> moveSpaceship: aSpaceship amount: anAmount in: aGameboard [

	(self canExitJail: anAmount in: aGameboard) ifTrue: [
		aSpaceship releaseFromJail.
		^ aSpaceship state moveSpaceship: aSpaceship amount: anAmount in: aGameboard ].

	^ self
]

{ #category : #testing }
SpaceshipJailedState >> moveSpaceshipWithoutFuel: aSpaceship amount: anAmount in: aGameboard [

	^ self
]

{ #category : #testing }
SpaceshipJailedState >> needsToThrow: aSpaceship expected: expectedNumber [
    "Ignorar mientras esté jailed"
    ^ self.
]

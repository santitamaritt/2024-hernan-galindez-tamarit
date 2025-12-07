Class {
	#name : #SpaceshipState,
	#superclass : #Object,
	#instVars : [
		'spaceship'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
SpaceshipState class >> for: aSpaceship [
    ^ self new initializeFor: aSpaceship; yourself.

]

{ #category : #testing }
SpaceshipState class >> isAbstract [

	^ self == SpaceshipState
]

{ #category : #testing }
SpaceshipState >> applyCard: aCard to: aSpaceship [
    self subclassResponsibility.
]

{ #category : #testing }
SpaceshipState >> applyPenaltyTo: aSpaceship in: aGameboard [
    self subclassResponsibility.

]

{ #category : #testing }
SpaceshipState >> canPlay: aSpaceship [
    self subclassResponsibility.
]

{ #category : #testing }
SpaceshipState >> consumeExtraTurnOf: aSpaceship [
    self subclassResponsibility.
]

{ #category : #testing }
SpaceshipState >> giveExtraTurnTo: aSpaceship [
    self subclassResponsibility.
]

{ #category : #testing }
SpaceshipState >> hasExtraTurn: aSpaceship [
    self subclassResponsibility.
]

{ #category : #initialization }
SpaceshipState >> initializeFor: aSpaceship [
    spaceship := aSpaceship.

]

{ #category : #testing }
SpaceshipState >> isFree [
    ^ false
]

{ #category : #testing }
SpaceshipState >> isJailed [
    ^ false
]

{ #category : #testing }
SpaceshipState >> lostATurn: aSpaceship [
    self subclassResponsibility.
]

{ #category : #testing }
SpaceshipState >> moveSpaceship: aSpaceship amount: anAmount in: aGameboard [
    self subclassResponsibility.
]

{ #category : #testing }
SpaceshipState >> needsToThrow: aSpaceship expected: expectedNumber [
    self subclassResponsibility.
]

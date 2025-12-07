Class {
	#name : #Spaceship,
	#superclass : #Object,
	#instVars : [
		'state',
		'name',
		'currentFuel',
		'maxCapacity',
		'needsToThrow',
		'lostTurns',
		'diceAdjustment',
		'ally',
		'deck',
		'extraTurn'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Spaceship class >> withName: aName withFuel: fuelCapacity [

	^ self new initializeWithName: aName withFuel: fuelCapacity
]

{ #category : #initialization }
Spaceship >> ally [
    ^ ally
]

{ #category : #accessing }
Spaceship >> allyWith: aSpaceship [

	ally := aSpaceship
]

{ #category : #setting }
Spaceship >> applyCard: aCard [
    state applyCard: aCard to: self.
]

{ #category : #setting }
Spaceship >> applyPenaltyIn: aGameboard [
    state applyPenaltyTo: self in: aGameboard.
]

{ #category : #setting }
Spaceship >> canPlay [
    ^ state canPlay: self.
]

{ #category : #setting }
Spaceship >> changeCurrentFuelBy: anAmount [

	currentFuel := currentFuel - anAmount
]

{ #category : #accessing }
Spaceship >> changeFuelCapacityBy: anAmount [

	maxCapacity := maxCapacity + anAmount.
	currentFuel := maxCapacity min: currentFuel
]

{ #category : #setting }
Spaceship >> changeTotalThrowBy: aNumber [

	diceAdjustment := diceAdjustment + aNumber.
]

{ #category : #setting }
Spaceship >> consumeExtraTurn [
    state consumeExtraTurnOf: self.
]

{ #category : #initialization }
Spaceship >> currentFuel [
    ^ currentFuel
]

{ #category : #initialization }
Spaceship >> currentFuel: aNumber [
    currentFuel := aNumber.
]

{ #category : #initialization }
Spaceship >> deck [
    ^ deck
]

{ #category : #initialization }
Spaceship >> diceAdjustment [
    ^ diceAdjustment
]

{ #category : #initialization }
Spaceship >> extraTurn [
    ^ extraTurn
]

{ #category : #setting }
Spaceship >> extraTurn: aBoolean [
	extraTurn := aBoolean
]

{ #category : #setting }
Spaceship >> giveCard: aCard [

	deck addCard: aCard copy
]

{ #category : #setting }
Spaceship >> giveExtraTurn [
    state giveExtraTurnTo: self.
]

{ #category : #initialization }
Spaceship >> goToJail [
    state := SpaceshipJailedState for: self.

]

{ #category : #setting }
Spaceship >> hasExtraTurn [
    ^ state hasExtraTurn: self.
]

{ #category : #initialization }
Spaceship >> initializeWithName: aName withFuel: fuelCapacity [

	name := aName.
	currentFuel := fuelCapacity.
	maxCapacity := fuelCapacity.
	needsToThrow := 0.
	lostTurns := 0.
	diceAdjustment := 0.
	ally := NullSpaceship new.
	deck := Deck with: #(  ) asOrderedCollection.
	extraTurn := false.
	state := SpaceshipFreeState for: self.
]

{ #category : #initialization }
Spaceship >> isFree [
    ^ state isFree
]

{ #category : #setting }
Spaceship >> isJailed [
    ^ state isJailed
]

{ #category : #setting }
Spaceship >> lostATurn [
    state lostATurn: self.
]

{ #category : #initialization }
Spaceship >> lostTurns [
    ^ lostTurns
]

{ #category : #setting }
Spaceship >> lostTurns: aNumber [
    lostTurns := aNumber.

]

{ #category : #initialization }
Spaceship >> maxCapacity [
    ^ maxCapacity
]

{ #category : #setting }
Spaceship >> move: anAmount in: aGameboard [
    state moveSpaceship: self amount: anAmount in: aGameboard.
]

{ #category : #accessing }
Spaceship >> moveWithoutFuel: anAmount in: aGameboard [
    state moveSpaceshipWithoutFuel: self amount: anAmount in: aGameboard.
]

{ #category : #initialization }
Spaceship >> name [
    ^ name
]

{ #category : #initialization }
Spaceship >> needsToThrow [
    ^ needsToThrow
]

{ #category : #setting }
Spaceship >> needsToThrow: aNumber [
    needsToThrow := aNumber.
]

{ #category : #accessing }
Spaceship >> playWith: anAmountOfSquares in: aGameboard [

	anAmountOfSquares abs < needsToThrow ifTrue: [ ^ self ].
	needsToThrow := 0.
	self move: anAmountOfSquares in: aGameboard
]

{ #category : #setting }
Spaceship >> refuel [

	currentFuel := maxCapacity
]

{ #category : #initialization }
Spaceship >> releaseFromJail [
    state := SpaceshipFreeState for: self.

]

{ #category : #setting }
Spaceship >> removeEffect: cardToBeRemoved [
	^ (deck removeCardEffect: cardToBeRemoved ) 
]

{ #category : #initialization }
Spaceship >> state [
    ^ state
]

{ #category : #accessing }
Spaceship >> takeFuel: anAmountOfFuel [

	anAmountOfFuel > currentFuel ifTrue: [ ^ 0 ].

	currentFuel := currentFuel - anAmountOfFuel.

	^ anAmountOfFuel
]

{ #category : #accessing }
Spaceship >> useAllyFuelIfNecessary: squaresToMove in: gameboard [

	| allyFuel |
	currentFuel <= squaresToMove abs ifFalse: [ ^ self ].

	allyFuel := ally takeFuel: squaresToMove - currentFuel + 1.

	currentFuel := currentFuel + allyFuel.

	currentFuel <= squaresToMove abs ifTrue: [
		ally applyPenaltyIn: gameboard ]
]

{ #category : #accessing }
Spaceship >> useCard: aCard [
	^ deck removeCard: aCard
	
]

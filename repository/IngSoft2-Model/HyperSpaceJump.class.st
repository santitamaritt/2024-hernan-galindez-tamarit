Class {
	#name : #HyperSpaceJump,
	#superclass : #Square,
	#category : #'IngSoft2-Model'
}

{ #category : #'add/remove' }
HyperSpaceJump >> applyEffectTo: aSpaceship in: aGameboard [
    aSpaceship moveWithoutFuel: 4 in: aGameboard.
]

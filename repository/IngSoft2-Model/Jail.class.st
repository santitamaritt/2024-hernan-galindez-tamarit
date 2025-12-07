Class {
	#name : #Jail,
	#superclass : #Square,
	#category : #'IngSoft2-Model'
}

{ #category : #'add/remove' }
Jail >> applyEffectTo: aSpaceship in: aGameboard [
    aSpaceship goToJail.

]

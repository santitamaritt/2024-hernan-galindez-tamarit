"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestIngSoft2Model,
	#superclass : #PackageManifest,
	#category : #'IngSoft2-Model-Manifest'
}

{ #category : #'code-critics' }
ManifestIngSoft2Model class >> ruleCollectionProtocolRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Reverse #applyFrom:target:blockToApplyLastEffect: #false)) #'2025-12-05T16:20:56.983-03:00') )
]

{ #category : #'code-critics' }
ManifestIngSoft2Model class >> ruleExcessiveArgumentsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Gameboard #initializeWithNumberOfSquares:withSpaceships:withParsecs:withDice:withGenerator:withCards: #false)) #'2025-12-07T02:18:20.168-03:00') #(#(#RGMethodDefinition #(#SpaceshipGame #initializeWithPlayers:withGameboardLength:withDice:withLaps:withParsecs:withSquareGenerator:withRewards:withCards: #false)) #'2025-12-07T02:51:39.437-03:00') )
]

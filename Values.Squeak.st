'From VisualWorks®, 8.3 of 28. Juli 2017 on 27. Februar 2022 at 07:47:03'!

"Created 27. Februar 2022 um 07:47:03 by Squeak Transform(1.4.0.2,chaider)"
PackageManifest subclass: #ManifestValues
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Values'!

!ManifestValues commentStamp: 'chaider 27/5/21 17:52' prior: 0!
Values are simple immutable literal objects.

Runtime support for Values.

Defines the root class Value and provides
- printing instances
- equality
- an example.

Specifies the responsibilities of subclasses to define the #localSpecification!

!ManifestValues methodsFor: 'Package properties' stamp: 'chaider 27/5/21 17:52'!

notice
	^'The MIT License

Copyright © 2009-2018 Christian Haider

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.'!

parcelName
	^'Values'!

storeVersion
	^'3.0.0.2'!

 !Object
	subclass: #Value
	instanceVariableNames: ''
	classVariableNames: 'NamedValuesRegistry'
	poolDictionaries: ''
	category: 'Values'!

Value comment:
'Value is the abstract root object of values (literal objects).
All Value classes which have subclasses are considered abstract. Only leaf classes can have instances!!
Literal objects are created immutable with constructors.
The instance variables are object constants.

Subclasses must implement the following messages:
	class specification
		localSpecification'!

Value
	subclass: #Printvalue
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Values'!

Printvalue comment:
'A Printvalue holds a representation of a Value to be printed.
It consists of
	- classname 	<String>										properly resolved against a target class (#name or #fullName)
	- arguments 	<SequenceableCollection of: Printargument>		the list of arguments with constructor variable name and a Printvalue

Printvalues are created when printing the source for a Value in the first pass. The second pass takes the Printvalue and produces a nicely indented soure string for the value.'!

Printvalue
	subclass: #ValuePrintvalue
	instanceVariableNames: 'classname arguments'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Values'!

ValuePrintvalue comment:
'ValuePrintvalue holds the data to print a Value.

Instance Variables:
	arguments	<SequenceableCollection of: (Printargument | EmptyArgument)>	the arguments
	classname	<String>														the namespace aware name of the class

'!

Object
	subclass: #Emitter
	instanceVariableNames: 'printer stream level'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Values'!

Emitter comment:
'Emitter outputs a Printvalue as formatted source code to a stream.
Subclasses write source or text.
This implements the second pass of the source generation for Values.

Instance Variables
	printer	<ValuePrinter>					the printer to resolve namespace names
	level	<Integer>						the indention level
	stream	<WriteStream | TextStream>		the output stream
'!

Emitter
	subclass: #TextEmitter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Values'!

TextEmitter comment:
'TextEmitter outputs a descriptive text.'!

TextEmitter
	subclass: #TextBlockemitter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Values'!

TextBlockemitter comment:
'TextBlockEmitter emits text as indented block'!

Emitter
	subclass: #SourceEmitter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Values'!

SourceEmitter comment:
'SourceEmitter outputs source code.'!

SourceEmitter
	subclass: #Lineemitter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Values'!

Lineemitter comment:
'Emits source as one line'!

Printvalue
	subclass: #ArrayPrintvalue
	instanceVariableNames: 'arguments'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Values'!

ArrayPrintvalue comment:
'ArrayPrintvalue is a special Printvalue for sequentiable collections of Values'!

SourceEmitter
	subclass: #Blockemitter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Values'!

Blockemitter comment:
'Emits source as indented block'!

TextEmitter
	subclass: #TextLineemitter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Values'!

TextLineemitter comment:
'TextLineEmitter emits text as one line'!

Dictionary
	variableSubclass: #Valuemap
	instanceVariableNames: 'order'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Values'!

Valuemap comment:
'A Valuemap is an ordered dictionary preserving the order in which entries are added.

Instances are also used as ordered volatile dictionary, not just as value.

In VisualWorks, Valuemap is subclassed from Dictionary to inherit the dictionary API.

Instance Variables:
	order	<SequenceableCollection of: Object>		the ordered keys


The class used to be named OrderedDictionary, but was renamed for dialect compatibility with Pharo, which has a class named OrderedDictionary with different semantics.'!

Value
	subclass: #Printargument
	instanceVariableNames: 'name value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Values'!

Printargument comment:
'A Printargument holds the data to print one instance variable (constant) and its value.

	- name 	<String> 		the name of the argument
	- value 	<Printvalue>	the print value of the value

With Printvalue it represents the source for a Value'!

Printargument
	subclass: #DictionaryPrintargument
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Values'!

DictionaryPrintargument comment:
'DictionaryPrintargument holds the Printvalues for key and value of an entry in a dictionary.
Both key and value can be Values'!

Printvalue
	subclass: #LiteralPrintvalue
	instanceVariableNames: 'string'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Values'!

LiteralPrintvalue comment:
'LiteralPrintvalue is a Printvalue for literals.

Instance Variables:
	string	<String>	the representation as a string'!

Printvalue
	subclass: #DictionaryPrintvalue
	instanceVariableNames: 'arguments isOrdered'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Values'!

DictionaryPrintvalue comment:
'DictionaryPrintvalue is used for printing Dictionaries

Instance Variables:
	arguments	<SequenceableCollection of DictionaryPrintargument>	the Printarguments for each entry'!

Object
	subclass: #ValuePrinter
	instanceVariableNames: 'target'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Values'!

ValuePrinter comment:
'ValuePrinter creates the source for a Value.
For each level, a new ValuePrinter is created.

Instance Variables:
	target	<Value class>	defines the scoping for the created source - how class names are printed
	level	<Integer>		the indent level
	stream	<WriteStream>	a writestream passed around to collect the sources

'!

!ArrayPrintvalue class methodsFor: 'instance creation' stamp: 'chaider 27/5/21 17:52'!

arguments: argumentsArray
	| inst |
	inst := self new.
	inst initializeArguments: argumentsArray.
	^inst! !

!ArrayPrintvalue class methodsFor: 'specification' stamp: 'chaider 27/5/21 17:52'!

localSpecification
	<sequence: #arguments>! !

!ArrayPrintvalue methodsFor: 'accessing' stamp: 'chaider 27/5/21 17:52'!

arguments
	"<Array>"

	^arguments ifNil: [#()]!

sourceWith: emitter
	emitter emitArraySourceFor: self arguments! !

!ArrayPrintvalue methodsFor: 'initialize-release' stamp: 'chaider 27/5/21 17:52'!

initializeArguments: argumentsArray
	(argumentsArray notNil and: [
	argumentsArray notEmpty]) ifTrue: [
			arguments := (Array withAll: argumentsArray) beImmutable].
	self beImmutable! !

!ArrayPrintvalue methodsFor: 'printing' stamp: 'chaider 27/5/21 17:52'!

printvalueWith: printer
	| args |
	args := OrderedCollection new.
	args add: (printer array: 'arguments' value: self arguments).
	^printer printvalue: self arguments: args! !

!ArrayPrintvalue methodsFor: 'testing' stamp: 'chaider 27/5/21 17:52'!

isLine
	^self arguments size = 1 or: [
	self arguments size < 5 and: [
	self arguments allSatisfy: [:arg | arg isSimple]]]! !

!Blockemitter methodsFor: 'initialize-release' stamp: 'chaider 27/5/21 17:52'!

initializePrinter: aPrinter stream: aWriteStream level: anInteger
	printer := aPrinter.
	stream := aWriteStream.
	level := anInteger + 1! !

!Blockemitter methodsFor: 'writing' stamp: 'chaider 27/5/21 17:52'!

emitSeparator
	self stream cr.
	self level + 1 timesRepeat: [self stream tab]! !

!DictionaryPrintargument class methodsFor: 'specification' stamp: 'chaider 27/5/21 17:52'!

localSpecification
	<constant: #name class: #{Printvalue}>
	<constant: #value class: #{Printvalue}>! !

!DictionaryPrintvalue class methodsFor: 'instance creation' stamp: 'chaider 27/5/21 17:52'!

arguments: argumentsArray isOrdered: isOrderedBoolean
	| inst |
	inst := self new.
	inst initializeArguments: argumentsArray isOrdered: isOrderedBoolean.
	^inst! !

!DictionaryPrintvalue class methodsFor: 'instance creation optional' stamp: 'chaider 27/5/21 17:52'!

arguments: argumentsArray
	^self arguments: argumentsArray isOrdered: nil!

isOrdered: isOrderedBoolean
	^self arguments: nil isOrdered: isOrderedBoolean! !

!DictionaryPrintvalue class methodsFor: 'specification' stamp: 'chaider 27/5/21 17:52'!

localSpecification
	<sequence: #arguments>
	<optional: #isOrdered class: #{Boolean} default: 'false'>! !

!DictionaryPrintvalue methodsFor: 'accessing' stamp: 'chaider 27/5/21 17:52'!

arguments
	"<Array>"

	^arguments ifNil: [#()]!

isOrdered
	"<Boolean>"

	^isOrdered ifNil: [false]!

sourceWith: emitter
	self isEmpty ifTrue: [
		^emitter emit: self targetClassname , ' new'].
	emitter emitDictionarySourceFor: self!

targetClass
	^self isOrdered
		ifTrue: [Valuemap]
		ifFalse: [Dictionary]!

targetClassname
	^self targetClass name asString! !

!DictionaryPrintvalue methodsFor: 'initialize-release' stamp: 'chaider 27/5/21 17:52'!

initializeArguments: argumentsArray isOrdered: isOrderedBoolean
	(argumentsArray notNil and: [
	argumentsArray notEmpty]) ifTrue: [
			arguments := (Array withAll: argumentsArray) beImmutable].
	(isOrderedBoolean notNil and: [
	self isOrdered ~= isOrderedBoolean]) ifTrue: [
			isOrdered := isOrderedBoolean].
	self beImmutable! !

!DictionaryPrintvalue methodsFor: 'printing' stamp: 'chaider 27/5/21 17:52'!

printvalueWith: printer
	| args |
	args := OrderedCollection new.
	args add: (printer array: 'arguments' value: self arguments).
	args add: (printer optional: 'isOrdered' value: isOrdered).
	^printer printvalue: self arguments: args! !

!DictionaryPrintvalue methodsFor: 'testing' stamp: 'chaider 27/5/21 17:52'!

isEmpty
	^self arguments isEmpty!

isLine
	^self isEmpty! !

!Emitter class methodsFor: 'instance creation' stamp: 'chaider 27/5/21 17:52'!

for: aPrinter
	| inst |
	inst := self new.
	inst initializePrinter: aPrinter stream: nil level: -1.
	^inst!

for: aPrinter on: aWriteStream at: anInteger
	| inst |
	inst := self new.
	inst initializePrinter: aPrinter stream: aWriteStream level: anInteger.
	^inst! !

!Emitter methodsFor: 'accessing' stamp: 'chaider 27/5/21 17:52'!

emitterClassFor: printvalue
	"<Emitter class>"

	^self subclassResponsibility!

emitterFor: printvalue
	"<Emitter>"

	^(self emitterClassFor: printvalue) for: self printer on: self stream at: self level!

level
	"<Integer>
	the indent level"

	^level ifNil: [0]!

printer
	"<ValuePrinter>"

	^printer!

stream
	"<WriteStream | TextStream>
	the output stream"

	^stream ifNil: [stream := self streamClass on: (String new: 100)]!

streamClass
	"<WriteStream class | TextStream class>"

	^self subclassResponsibility! !

!Emitter methodsFor: 'initialize-release' stamp: 'chaider 27/5/21 17:52'!

initializePrinter: aPrinter stream: aWriteStream level: anInteger
	printer := aPrinter.
	stream := aWriteStream.
	level := anInteger! !

!Emitter methodsFor: 'writing' stamp: 'chaider 27/5/21 17:52'!

emit: aString
	self stream nextPutAll: aString!

emitArgument: aPrintargument
	self emit: aPrintargument name , ': '.
	aPrintargument value sourceFor: self!

emitArraySourceFor: anArray
	self inBracketsDo: [
		anArray size > 4
			ifTrue: [self emitLongCollection: anArray]
			ifFalse: [
			self emitSmallCollection: anArray]]!

emitClass: aString
	self emit: aString!

emitDictionarySourceFor: aDictionaryPrintvalue
	self inBracketsDo: [
		aDictionaryPrintvalue arguments size > 4
			ifTrue: [
			self emitLongDictionary: aDictionaryPrintvalue]
			ifFalse: [
			self emitSmallDictionary: aDictionaryPrintvalue]]!

emitEmpty: aValuePrintvalue
	"write the constructor for an empty instance"

	self emitClass: aValuePrintvalue classname.
	self emit: ' new'!

emitLongCollection: aSequenceableCollection
	self emit: '(', (OrderedCollection nameRelativeTo: self printer target) , ' new: ' , aSequenceableCollection size printString, ')'.
	aSequenceableCollection do: [:value |
		self emitSeparator.
		self emit: 'add: '.
		value sourceFor: self.
		self stream nextPut: $;].
	self emitSeparator.
	self emit: 'yourself'!

emitLongDictionary: aDictionaryPrintvalue
	self emit: '(', (aDictionaryPrintvalue targetClass nameRelativeTo: self printer target), ' new: ' , aDictionaryPrintvalue arguments size printString, ')'.
	aDictionaryPrintvalue arguments do: [:argument |
		self emitSeparator.
		self emit: 'add: '.
		argument name sourceFor: self.
		self emit: ' -> '.
		argument value sourceFor: self.
		self stream nextPut: $;].
	self emitSeparator.
	self emit: 'yourself'!

emitSeparator
	self subclassResponsibility!

emitSmallCollection: aSequenceableCollection
	self emit: (Array nameRelativeTo: self printer target).
	aSequenceableCollection do: [:value |
		self emitSeparator.
		self emit: 'with: '.
		value sourceFor: self]!

emitSmallDictionary: aDictionaryPrintvalue
	self emit: (aDictionaryPrintvalue targetClass nameRelativeTo: self printer target).
	aDictionaryPrintvalue arguments do: [:argument |
		self emitSeparator.
		self emit: 'with: '.
		argument name sourceFor: self.
		self emit: ' -> '.
		argument value sourceFor: self]!

emitValue: aString
	self emit: aString!

inBracketsDo: aZeroArgumentBlock
	self stream nextPut: $(.
	aZeroArgumentBlock ensure: [self stream nextPut: $)]! !

!Lineemitter methodsFor: 'writing' stamp: 'chaider 27/5/21 17:52'!

emitSeparator
	self stream space! !

!LiteralPrintvalue class methodsFor: 'instance creation' stamp: 'chaider 27/5/21 17:52'!

string: stringString
	| inst |
	inst := self new.
	inst initializeString: stringString.
	^inst! !

!LiteralPrintvalue class methodsFor: 'specification' stamp: 'chaider 27/5/21 17:52'!

localSpecification
	<constant: #string class: #{String}>! !

!LiteralPrintvalue methodsFor: 'accessing' stamp: 'chaider 27/5/21 17:52'!

sourceWith: emitter
	emitter emitValue: self string!

string
	"<String>"

	^string! !

!LiteralPrintvalue methodsFor: 'initialize-release' stamp: 'chaider 27/5/21 17:52'!

initializeString: stringString
	string := stringString.
	self beImmutable! !

!LiteralPrintvalue methodsFor: 'printing' stamp: 'chaider 27/5/21 17:52'!

printvalueWith: printer
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'string' value: self string).
	^printer printvalue: self arguments: args! !

!LiteralPrintvalue methodsFor: 'testing' stamp: 'chaider 27/5/21 17:52'!

isLine
	^true!

isSimple
	^(self string first = $() not! !

!Printargument class methodsFor: 'instance creation' stamp: 'chaider 27/5/21 17:52'!

name: nameString value: valuePrintvalue
	| inst |
	inst := self new.
	inst initializeName: nameString value: valuePrintvalue.
	^inst! !

!Printargument class methodsFor: 'specification' stamp: 'chaider 27/5/21 17:52'!

localSpecification
	<constant: #name class: #{String}>
	<constant: #value class: #{Printvalue}>! !

!Printargument methodsFor: 'accessing' stamp: 'chaider 27/5/21 17:52'!

name
	"<String>"

	^name!

sourceWith: emitter
	emitter emitArgument: self!

value
	"<Printvalue>"

	^value! !

!Printargument methodsFor: 'initialize-release' stamp: 'chaider 27/5/21 17:52'!

initializeName: nameString value: valuePrintvalue
	name := nameString.
	value := valuePrintvalue.
	self beImmutable! !

!Printargument methodsFor: 'printing' stamp: 'chaider 27/5/21 17:52'!

printvalueWith: printer
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'name' value: self name).
	args add: (printer constant: 'value' value: self value).
	^printer printvalue: self arguments: args! !

!Printargument methodsFor: 'testing' stamp: 'chaider 27/5/21 17:52'!

isSimple
	^self value isSimple! !

!Printvalue methodsFor: 'accessing' stamp: 'chaider 27/5/21 17:52'!

description
	"<Text>"

	| emitter |
	emitter := self textemitterClass new.
	self sourceWith: emitter.
	^emitter stream contents!

emitterClass
	"<SourceEmitter class>"

	^self isLine
		ifTrue: [Lineemitter]
		ifFalse: [Blockemitter]!

sourceFor: outerEmitter
	"<String>"

	^self sourceWith: (outerEmitter emitterFor: self)!

sourceWith: emitter
	"write yourself with the emitter"

	^self subclassResponsibility!

sourceWithPrinter: aPrinter
	"<String>"

	| emitter |
	emitter := self emitterClass for: aPrinter.
	self sourceWith: emitter.
	^emitter stream contents!

textemitterClass
	"<SourceEmitter class>"

	^self isLine
		ifTrue: [TextLineemitter]
		ifFalse: [TextBlockemitter]! !

!Printvalue methodsFor: 'testing' stamp: 'chaider 27/5/21 17:52'!

isLine
	^false!

isSimple
	"does it have to be printed in brackets?
	only literals are simple"

	^false! !

!SourceEmitter methodsFor: 'accessing' stamp: 'chaider 27/5/21 17:52'!

emitterClassFor: printvalue
	^printvalue isLine
		ifTrue: [Lineemitter]
		ifFalse: [Blockemitter]!

streamClass
	^WriteStream! !

!TextBlockemitter methodsFor: 'initialize-release' stamp: 'chaider 27/5/21 17:52'!

initializePrinter: aPrinter stream: aWriteStream level: anInteger
	printer := aPrinter.
	stream := aWriteStream.
	level := anInteger + 1! !

!TextBlockemitter methodsFor: 'writing' stamp: 'chaider 27/5/21 17:52'!

emitSeparator
	self stream cr.
	self level + 1 timesRepeat: [self stream tab]!

inBracketsDo: aZeroArgumentBlock
	aZeroArgumentBlock value! !

!TextEmitter methodsFor: 'accessing' stamp: 'chaider 27/5/21 17:52'!

emitterClassFor: printvalue
	^printvalue isLine
		ifTrue: [TextLineemitter]
		ifFalse: [TextBlockemitter]!

streamClass
	^TextStream! !

!TextEmitter methodsFor: 'writing' stamp: 'chaider 27/5/21 17:52'!

emitArraySourceFor: anArray
	self emitSmallCollection: anArray!

emitBold: aString
	self stream nextPutAllText: aString asText allBold!

emitClass: aString
	self emitBold: aString!

emitDictionarySourceFor: aDictionaryPrintvalue
	self emitSmallDictionary: aDictionaryPrintvalue!

emitSmallCollection: aSequenceableCollection
	aSequenceableCollection do: [:value |
		self emitSeparator.
		value sourceFor: self]!

emitSmallDictionary: aDictionaryPrintvalue
	aDictionaryPrintvalue arguments do: [:argument |
		self emitSeparator.
		argument name sourceFor: self.
		self emit: ': '.
		argument value sourceFor: self]!

emitValue: aString
	self emitBold: aString! !

!TextLineemitter methodsFor: 'writing' stamp: 'chaider 27/5/21 17:52'!

emitSeparator
	self stream space! !

!Value class methodsFor: 'class initialization' stamp: 'chaider 27/5/21 17:52'!

obsolete
	self allInstancesDo: #beMutable.
	super obsolete! !

!Value class methodsFor: 'initialize-release' stamp: 'chaider 27/5/21 17:52'!

primeRuntime
	"reset and load all class variables to fill the caches to avoid lazy initialization at runtime.
	This should be executed when deploying after all application fonts and extensions are loaded"
	"self primeRuntime"

	self resetNamedValuesRegistry.
	Object namesByValues!

resetNamedValuesRegistry
	"self resetNamedValuesRegistry"

	NamedValuesRegistry := nil! !

!Value class methodsFor: 'named values' stamp: 'chaider 27/5/21 17:52'!

namedValuesAt: aClass
	"<Dictionary key: Value value: Symbol>
	the named instances of aClass"

	^self namedValuesRegistry at: aClass ifAbsent: [Dictionary new]!

namedValuesAt: aClass ifAbsentPut: aBlock
	"<Dictionary key: Value value: Symbol>
	the named instances of aClass"

	^self namedValuesRegistry at: aClass ifAbsentPut: aBlock!

namedValuesRegistry
	"<Dictionary key: Class value: (Dictionary key: Value value: Symbol)>
	the named instances of classes.
	This is a light weight implementation to hold all named instances of all classes, instead of storing them with the class"
	
	^NamedValuesRegistry ifNil: [NamedValuesRegistry := Dictionary new]! !

!Value class methodsFor: 'pragmas' stamp: 'chaider 27/5/21 17:52'!

specificationPragmas
	<pragmas: #class>
	^#(
		#constant:class:
		#constant:class:comment:
		
		#optional:class:default:
		#optional:class:default:comment:
		
		#sequence:
		#sequence:comment:
		
		#map:
		#map:comment:
	)! !

!Value methodsFor: 'comparing' stamp: 'chaider 27/5/21 17:52'!

= anObject
	"all instvars must be equal"

	^self isEqualValue: anObject!

hash
	^(1 to: self class instSize) inject: 0 into: [:hash :i | hash bitXor: (self instVarAt: i) hash]!

isEqualValue: anObject
	self == anObject ifTrue: [
		^true].
	self class = anObject class ifFalse: [
		^false].
	1 to: self class instSize do: [:i |
		((self instVarAt: i) isEqualValue: (anObject instVarAt: i)) ifFalse: [
			^false]].
	^true! !

!Value methodsFor: 'copying' stamp: 'chaider 27/5/21 17:52'!

postCopy
	super postCopy.
	self beImmutable! !

!Value methodsFor: 'marshaling' stamp: 'chaider 27/5/21 17:52'!

passMode
	"for OpenTalk StSt (Smalltalk to Smalltalk)"

	^#value! !

!Value methodsFor: 'printing' stamp: 'chaider 27/5/21 17:52'!

printOn: stream
	stream nextPutAll: self asSource!

printvalueWith: printer
	^printer printvalue: self arguments: #()! !

!Value methodsFor: 'testing' stamp: 'chaider 27/5/21 17:52'!

isEmpty
	^self = self class new!

notEmpty
	^self isEmpty not! !

!Valuemap methodsFor: 'accessing' stamp: 'chaider 27/5/21 17:52'!

atIndex: index
	"<Association>"

	^self associationAt: (self order at: index)!

first
	"<Association>"

	^self associationAt: self order first!

indexOf: aKey
	"<Integer>"

	^self order indexOf: aKey!

keys
	"<SequenceableCollection of: Object>"

	^self order copy!

last
	"<Association>"

	^self associationAt: self order last!

order
	"<SequenceableCollection of: Object>
	the order of the keys"

	^order ifNil: [order := OrderedCollection new]! !

!Valuemap methodsFor: 'comparing' stamp: 'chaider 27/5/21 17:52'!

= otherOrderedDictionary
	^self class == otherOrderedDictionary class and: [
	self size = otherOrderedDictionary size and: [
	(1 to: self size) allSatisfy: [:i |
		(self atIndex: i) = (otherOrderedDictionary atIndex: i)]]]!

hash
	^(1 to: self size) inject: self class hash into: [:hash :index |
		| assoc |
		assoc := self atIndex: index.
		hash bitXor: (assoc key hash bitXor: assoc value hash)]! !

!Valuemap methodsFor: 'copying' stamp: 'chaider 27/5/21 17:52'!

copyWith: anAssociation 
	"Answer a copy of the receiver with anAssociation added"

	| copy |
	copy := self copy.
	copy add: anAssociation.
	^copy!

copyWithAll: aDictionary
	"Answer a copy of the receiver with all associations from aDictionary added"

	| copy |
	copy := self copy.
	copy addAll: aDictionary.
	^copy!

postCopy

	super postCopy.
	order := self order copy! !

!Valuemap methodsFor: 'dictionary enumerating' stamp: 'chaider 27/5/21 17:52'!

associationsDo: aBlock
	"Note: do not use the keys to access anything.
	This method is used by #changeCapacityTo: and #rehash where key access is not working"

	| assocs |
	assocs := Array new: self order size.
	super associationsDo: [:assoc | assocs at: (self order indexOf: assoc key) put: assoc].
	assocs do: aBlock! !

!Valuemap methodsFor: 'dictionary removing' stamp: 'chaider 27/5/21 17:52'!

removeKey: key ifAbsent: aBlock 

	| index element |
	index := self findKey: key ifAbsent: nil.  "avoid full block"
	index isNil ifTrue: [^aBlock value].
	element := self basicAt: index.
	self order remove: element key.
	self basicAt: index put: nil.
	tally := tally - 1.
	self fixCollisionsFrom: index.
	^element value! !

!Valuemap methodsFor: 'enumerating' stamp: 'chaider 27/5/21 17:52'!

collect: oneArgumentBlock
	| newCollection |
	newCollection := self species new: self size.
	self keysAndValuesDo: [:eachKey :eachValue | 
		newCollection at: eachKey put: (oneArgumentBlock value: eachValue)].
	^newCollection!

do: oneArgumentBlock
	self order do: [:key |
		oneArgumentBlock value: (self at: key)]!

keysAndValuesDo: oneArgumentBlock
	self order do: [:key |
		oneArgumentBlock value: key value: (self at: key)]! !

!Valuemap methodsFor: 'printing' stamp: 'chaider 27/5/21 17:52'!

keysForPrinting
	^self keys!

printvalueWith: printer
	^DictionaryPrintvalue arguments: (self printargumentsWith: printer) isOrdered: true! !

!Valuemap methodsFor: 'private' stamp: 'chaider 27/5/21 17:52'!

atNewIndex: index put: anAssociation
	self basicAt: index put: anAssociation.
	tally := tally + 1.
	self order addLast: anAssociation key.
	self fullCheck!

noCheckAdd: anAssociation
	super noCheckAdd: anAssociation.
	self order addLast: anAssociation key!

setTally
	super setTally.
	order := nil! !

!ValuePrinter class methodsFor: 'instance creation' stamp: 'chaider 27/5/21 17:52'!

newFor: targetClass
	| inst |
	inst := self new.
	inst initializeTarget: targetClass.
	^inst! !

!ValuePrinter methodsFor: 'accessing' stamp: 'chaider 27/5/21 17:52'!

array: selectorname value: object
	"<Printargument | nil>"

	object isEmpty ifTrue: [
		^nil].
	^Printargument name: selectorname value: (object printvalueWith: self)!

classnameOf: value
	^value class nameRelativeTo: self target!

constant: selectorname value: object
	"<Printargument>"

	^Printargument name: selectorname value: (object printvalueWith: self)!

dictionary: selectorname value: object
	"<Printargument | nil>"

	object isEmpty ifTrue: [
		^nil].
	^Printargument name: selectorname value: (object printvalueWith: self)!

optional: selectorname value: object
	"<Printargument | nil>"

	^object ifNotNil: [
		Printargument name: selectorname value: (object printvalueWith: self)]!

printvalue: aValue arguments: arguments
	aValue class new = aValue ifTrue: [
		^ValuePrintvalue classname: (self classnameOf: aValue)].
	^ValuePrintvalue
		classname: (self classnameOf: aValue)
		arguments: (arguments select: [:arg |
			arg notNil])!

target
	"<Value class>
	the class for which the object is printed.
	Takes the visibility of classes into account for short class name generation"

	^target! !

!ValuePrinter methodsFor: 'initialize-release' stamp: 'chaider 27/5/21 17:52'!

initializeTarget: targetClass
	target := targetClass! !

!ValuePrintvalue class methodsFor: 'instance creation' stamp: 'chaider 27/5/21 17:52'!

classname: classnameString arguments: argumentsArray
	| inst |
	inst := self new.
	inst initializeClassname: classnameString arguments: argumentsArray.
	^inst! !

!ValuePrintvalue class methodsFor: 'instance creation optional' stamp: 'chaider 27/5/21 17:52'!

classname: classnameString
	^self classname: classnameString arguments: nil! !

!ValuePrintvalue class methodsFor: 'specification' stamp: 'chaider 27/5/21 17:52'!

localSpecification
	<constant: #classname class: #{String}>
	<sequence: #arguments>! !

!ValuePrintvalue methodsFor: 'accessing' stamp: 'chaider 27/5/21 17:52'!

arguments
	"<Array>"

	^arguments ifNil: [#()]!

classname
	"<String>"

	^classname!

sourceWith: emitter
	self arguments isEmpty ifTrue: [
		^emitter emitEmpty: self].
	emitter inBracketsDo: [
		emitter emitClass: self classname.
		self arguments do: [:arg |
			emitter emitSeparator.
			emitter emitArgument: arg]]! !

!ValuePrintvalue methodsFor: 'initialize-release' stamp: 'chaider 27/5/21 17:52'!

initializeClassname: classnameString arguments: argumentsArray
	classname := classnameString.
	(argumentsArray notNil and: [
	argumentsArray notEmpty]) ifTrue: [
			arguments := (Array withAll: argumentsArray) beImmutable].
	self beImmutable! !

!ValuePrintvalue methodsFor: 'printing' stamp: 'chaider 27/5/21 17:52'!

printvalueWith: printer
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'classname' value: self classname).
	args add: (printer array: 'arguments' value: self arguments).
	^printer printvalue: self arguments: args! !

!ValuePrintvalue methodsFor: 'testing' stamp: 'chaider 27/5/21 17:52'!

isLine
	self arguments size = 1 ifTrue: [
		^self arguments first value isLine].
	^self arguments size < 5 and: [
	self arguments allSatisfy: [:arg | arg isSimple]]! !

!Class methodsFor: '*Values-accessing' stamp: 'chaider 27/5/21 17:52'!

nameRelativeTo: targetClass
	"<String>"
	"self nameRelativeTo: Object"

	| ref |
	(targetClass isInScope: self) ifTrue: [
		^self name asString].
	ref := self fullyQualifiedReference.
	ref environmentName ifNil: [ref := self fullyQualifiedReferenceFrom: Root].
	^ref asString! !

!Class methodsFor: '*Values-testing' stamp: 'chaider 27/5/21 17:52'!

isInScope: aClass
	"<Boolean>
	true if aClass is visible by the receiver - aClass can be used in the source without namespace qualifier.
	false when aClass cannot be seen by the receiver - use the fullName"

	| variableDefinition |
	variableDefinition := (NameScope forClass: self) variableAt: aClass name from: nil.
	^variableDefinition notNil and: [
	variableDefinition binding value == aClass]! !

!ColorValue class methodsFor: '*Values-instance creation' stamp: 'chaider 27/5/21 17:52'!

fromByte: anInteger
	^self fromBytes: (ByteArray new: 3 withAll: anInteger)!

fromBytes: threeBytes
	^self fromBytesRed: threeBytes first green: (threeBytes at: 2) blue: threeBytes last!

fromBytesRed: redByte green: greenByte blue: blueByte
	| scale |
	scale := ColorValue scalingValue.
	^ColorValue
		scaledRed: redByte * scale // 255
		scaledGreen: greenByte * scale // 255
		scaledBlue: blueByte * scale // 255! !

!ColorValue class methodsFor: '*Values-named values' stamp: 'chaider 27/5/21 17:52'!

namedValueNames
	"The selection is the common set of color names with identical colors in VW and Squeak/Pharo
	The colors are all variations of min and max of the 3 components"
	"self namesByValues"
	
	^#(#black #white
	#red #green #blue
	#cyan #magenta #yellow)! !

!ColorValue methodsFor: '*Values-converting' stamp: 'chaider 27/5/21 17:52'!

asByteArray
	^ByteArray
		with: (self scaledRed bitShift: -5)
		with: (self scaledGreen bitShift: -5)
		with: (self scaledBlue bitShift: -5)!

asGrayValue
	"<Number>
	between 0.0 (Black) and 1.0 (White) suitable for PDF DeviceGray"

	^self brightness!

rgbIndex
	"<Integer>
	Three 8 bit RGB numbers interpreted as number for ordering"

	^self asByteArray inject: 0 into: [:num :byte | (num bitShift: 8) + byte]! !

!ColorValue methodsFor: '*Values-printing' stamp: 'chaider 27/5/21 17:52'!

printvalueWith: printer
	| args |
	(self class nameOrNilFor: self) ifNotNil: [:symbol |
		^LiteralPrintvalue string: (printer classnameOf: self) , ' ' , symbol asString].
	args := OrderedCollection new.
	args add: (printer constant: 'fromBytesRed' value: (self red * 255) rounded).
	args add: (printer constant: 'green' value: (self green * 255) rounded).
	args add: (printer constant: 'blue' value: (self blue * 255) rounded).
	^printer printvalue: self arguments: args! !

!ColorValue methodsFor: '*Values-testing' stamp: 'chaider 27/5/21 17:52'!

isEmpty
	^self scaledRed isNil and: [
	self scaledGreen isNil and: [
	self scaledBlue isNil]]! !

!Date class methodsFor: '*Values-instance creation' stamp: 'chaider 27/5/21 17:52'!

d: dayInteger m: monthInteger y: yearInteger
	^self newDay: dayInteger monthNumber: monthInteger year: yearInteger! !

!Date methodsFor: '*Values-printing' stamp: 'chaider 27/5/21 17:52'!

printvalueWith: printer
	| wst |
	wst := WriteStream on: (String new: 25).
	wst
		nextPut: $(;
		nextPutAll: (printer classnameOf: self);
		nextPutAll: ' d: ';
		nextPutAll: self dayOfMonth printString;
		nextPutAll: ' m: ';
		nextPutAll: self monthIndex printString;
		nextPutAll: ' y: ';
		nextPutAll: self year printString;
		nextPut: $).
	^LiteralPrintvalue string: wst contents! !

!Dictionary methodsFor: '*Values-dictionary testing' stamp: 'chaider 27/5/21 17:52'!

isEqualValue: anObject
	^self contentsEquals: anObject! !

!Dictionary methodsFor: '*Values-printing' stamp: 'chaider 27/5/21 17:52'!

keysForPrinting
	^[self keys asSortedCollection] on: Error do: [:ex | ex return: self keys]!

printargumentsWith: printer
	| args |
	args := OrderedCollection new.
	self keysForPrinting do: [:key |
		args add: (DictionaryPrintargument
			name: (key printvalueWith: printer)
			value: ((self at: key) printvalueWith: printer))].
	^args!

printvalueWith: printer
	^DictionaryPrintvalue arguments: (self printargumentsWith: printer)! !

!Duration class methodsFor: '*Values-instance creation' stamp: 'chaider 27/5/21 17:52'!

nanoseconds: aNumber
	^aNumber nanoseconds! !

!Duration methodsFor: '*Values-printing' stamp: 'chaider 27/5/21 17:52'!

printvalueWith: printer
	| wst |
	wst := WriteStream on: (String new: 25).
	wst
		nextPut: $(;
		nextPutAll: (printer classnameOf: self);
		nextPutAll: ' nanoseconds: ';
		nextPutAll: self asNanoseconds printString;
		nextPut: $).
	^LiteralPrintvalue string: wst contents! !

!GeneralBindingReference methodsFor: '*Values-testing' stamp: 'chaider 27/5/21 17:52'!

isEqualValue: aQualifiedName
	^self class == aQualifiedName class and: [
	path = aQualifiedName path]! !

!Object class methodsFor: '*Values-named values' stamp: 'chaider 27/5/21 17:52'!

namedValueNames
	"<Array of: Symbol>
	names to print for special known values"
	
	^#()!

nameOrNilFor: aValue
	"<Symbol | nil>"

	^self namesByValues at: aValue ifAbsent: [nil]!

namesByValues
	"<Dictionary key: Value value: Symbol>"

	^Value namedValuesAt: self ifAbsentPut: [self newNamesByValues]!

newNamesByValues
	"<Dictionary key: Value value: Symbol>"

	| dict |
	dict := Valuemap new: self namedValueNames size.
	self namedValueNames do: [:symbol | dict at: (self perform: symbol) put: symbol].
	^dict! !

!Object methodsFor: '*Values-comparing' stamp: 'chaider 27/5/21 17:52'!

isEqualValue: anObject
	^self = anObject! !

!Object methodsFor: '*Values-printing' stamp: 'chaider 27/5/21 17:52'!

asDescription
	"<Text>
	produces a text equivalent to the soure with bold leaf values"

	^self asDescriptionFor: self class!

asDescriptionFor: targetClass
	"<Text>
	produces a text equivalent to the source"

	| printer printvalue |
	printer := ValuePrinter newFor: targetClass.
	printvalue := self printvalueWith: printer.
	^printvalue description!

asSource
	"<String>
	produces a string which can be evaluated in the context of the receiver class to an object equivalent to the receiver"

	^self asSourceFor: self class!

asSourceFor: targetClass
	"<String>
	produces a string which can be evaluated in the context of targetClass to an object equivalent to the receiver"

	| printer printvalue |
	printer := ValuePrinter newFor: targetClass.
	printvalue := self printvalueWith: printer.
	^printvalue sourceWithPrinter: printer!

printvalueWith: printer
	^LiteralPrintvalue string: self storeString! !

!Point methodsFor: '*Values-printing' stamp: 'chaider 27/5/21 17:52'!

printvalueWith: printer
	| string |
	string := (self x asSourceFor: printer target) , ' @ ' , (self y asSourceFor: printer target).
	^LiteralPrintvalue string: string! !

!Rectangle methodsFor: '*Values-printing' stamp: 'chaider 27/5/21 17:52'!

printvalueWith: printer
	| wst |
	wst := WriteStream on: (String new: 25).
	wst
		nextPut: $(;
		nextPutAll: (self origin asSourceFor: printer target);
		nextPutAll: ' corner: ';
		nextPutAll: (self corner asSourceFor: printer target);
		nextPut: $).
	^LiteralPrintvalue string: wst contents! !

!SequenceableCollection methodsFor: '*Values-printing' stamp: 'chaider 27/5/21 17:52'!

printvalueWith: printer
	self isLiteral ifTrue: [
		^LiteralPrintvalue string: self storeString].
	^ArrayPrintvalue arguments: (self collect: [:item | item printvalueWith: printer])! !

!Time class methodsFor: '*Values-instance creation' stamp: 'chaider 27/5/21 17:52'!

h: hoursInteger
	^self h: hoursInteger m: 0 s: 0!

h: hoursInteger m: minutesInteger
	^self h: hoursInteger m: minutesInteger s: 0!

h: hoursInteger m: minutesInteger s: secondsInteger
	| inst |
	inst := self new.
	inst hours: hoursInteger minutes: minutesInteger seconds: secondsInteger.
	^inst!

zero
	^self h: 0! !

!Time methodsFor: '*Values-printing' stamp: 'chaider 27/5/21 17:52'!

printvalueWith: printer
	| wst |
	wst := WriteStream on: (String new: 25).
	(self hours isZero and: [
	self minutes isZero and: [
	self seconds isZero]]) ifTrue: [
			wst
				nextPutAll: (printer classnameOf: self);
				nextPutAll: ' zero'.
			^LiteralPrintvalue string: wst contents].
	wst
		nextPut: $(;
		nextPutAll: (printer classnameOf: self);
		nextPutAll: ' h: ';
		nextPutAll: self hours printString.
	(self minutes isZero and: [
	self seconds isZero]) ifTrue: [
			wst nextPut: $).
			^LiteralPrintvalue string: wst contents].
	wst
		nextPutAll: ' m: ';
		nextPutAll: self minutes printString.
	self seconds isZero ifTrue: [
		wst nextPut: $).
		^LiteralPrintvalue string: wst contents].
	wst
		nextPutAll: ' s: ';
		nextPutAll: self seconds printString;
		nextPut: $).
	^LiteralPrintvalue string: wst contents! !

!Timestamp class methodsFor: '*Values-instance creation' stamp: 'chaider 27/5/21 17:52'!

d: dayInteger m: monthInteger y: yearInteger
	^self d: dayInteger m: monthInteger y: yearInteger h: 0 m: 0 s: 0!

d: dayInteger m: monthInteger y: yearInteger h: hoursInteger
	^self d: dayInteger m: monthInteger y: yearInteger h: hoursInteger m: 0 s: 0!

d: dayInteger m: monthInteger y: yearInteger h: hoursInteger m: minutesInteger
	^self d: dayInteger m: monthInteger y: yearInteger h: hoursInteger m: minutesInteger s: 0!

d: dayInteger m: monthInteger y: yearInteger h: hoursInteger m: minutesInteger s: secondsInteger
	| date time |
	date := Date d: dayInteger m: monthInteger y: yearInteger.
	time := Time h: hoursInteger m: minutesInteger s: secondsInteger.
	^self fromDate: date andTime: time! !

!Timestamp methodsFor: '*Values-printing' stamp: 'chaider 27/5/21 17:52'!

printvalueWith: printer
	| wst |
	wst := WriteStream on: (String new: 50).
	wst
		nextPut: $(;
		nextPutAll: (printer classnameOf: self);
		nextPutAll: ' d: ';
		nextPutAll: self dayOfMonth printString;
		nextPutAll: ' m: ';
		nextPutAll: self month printString;
		nextPutAll: ' y: ';
		nextPutAll: self year printString.
	(self hour isZero and: [
	self minute isZero and: [
	self second isZero]]) ifTrue: [
			wst nextPut: $).
			^LiteralPrintvalue string: wst contents].
	wst
		nextPutAll: ' h: ';
		nextPutAll: self hour printString.
	(self minute isZero and: [
	self second isZero]) ifTrue: [
			wst nextPut: $).
			^LiteralPrintvalue string: wst contents].
	wst
		nextPutAll: ' m: ';
		nextPutAll: self minute printString.
	self second isZero ifTrue: [
		wst nextPut: $).
		^LiteralPrintvalue string: wst contents].
	wst
		nextPutAll: ' s: ';
		nextPutAll: self second printString;
		nextPut: $).
	^LiteralPrintvalue string: wst contents! !


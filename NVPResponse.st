Iliad.ILObject subclass: NVPResponse [
    | fields |

    <category: 'PayPal'>

    NVPResponse class >> fromString: aString [
	<category: 'instance creation'>
	^self new
	    parseFields: aString;
	    yourself
    ]

    fields [
	<category: 'accessing'>
	^fields ifNil: [fields := Dictionary new]
    ]

    fieldAt: aString [
	<category: 'accessing'>
	^self fields at: aString ifAbsent: [nil]
    ]

    ack [
	<category: 'accessing'>
	^self fieldAt: 'ACK'
    ]

    token  [
	<category: 'accessing'>
	^self fieldAt: 'TOKEN'
    ]

    version [
	<category: 'accessing'>
	^self fieldAt: 'VERSION'
    ]

    build [
	<category: 'accessing'>
	^self fieldAt: 'BUILD'
    ]

    correlationId [
	<category: 'accessing'>
	^self fieldAt: 'CORRELATIONID'
    ]

    parseFields: aString [
	"Adapted from Iliad.ILUrl>>parseParameters"

	<category: 'private'>
	| input string index |
	input := (self decodePercent: aString) readStream.
	[input atEnd] whileFalse: 
		[string := input upTo: $&.
		index := string indexOf: $=.
		index > 0 
		    ifFalse: [self fields at: string put: nil]
		    ifTrue: [
			self fields 
			    at: (string copyFrom: 1 to: index - 1)
			    put: (string copyFrom: index + 1 to: string size)]].
    ]

    decodePercent: aString [
	"percent decodes the given String"

	<category: 'decoding'>
	| input output char |
	input := aString readStream.
	output := WriteStream on: (String new: aString size).
	[input atEnd] whileFalse: 
	    [char := input next.
	    output nextPut: (char = $+ 
		ifTrue: [Character space]
		ifFalse: [char = $% 
		    ifTrue: [
			Character value: input next asUppercase digitValue * 16 
			    + input next asUppercase digitValue]
		    ifFalse: [char]])].
	^output contents
    ]
]

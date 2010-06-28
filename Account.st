Iliad.ILObject subclass: Account [
    | user password signature |

    <category: 'PayPal'>
    <comment: nil>

    user [
	<category: 'accessing'>
	^user ifNil: ['']
    ]

    user: aString [
	<category: 'accessing'>
	user := aString
    ]

    password [
	<category: 'accessing'>
	^password ifNil: ['']
    ]

    password: aString [
	<category: 'accessing'>
	password := aString
    ]

    signature [
	<category: 'accessing'>
	^signature ifNil: ['']
    ]

    signature: aString [
	<category: 'accessing'>
	signature := aString
    ]
]

Iliad.ILObject subclass: Payer [
    | email id status firstName lastName business address |

    <category: 'PayPal'>

    email [
	<category: 'accessing'>
	^email
    ]

    email: aString [
	<category: 'accessing'>
	email := aString
    ]

    id [
	<category: 'accessing'>
	^id
    ]

    id: aString [
	<category: 'accessing'>
	id := aString
    ]

    status [
	<category: 'accessing'>
	^status
    ]

    status: aString [
	<category: 'accessing'>
	status := aString
    ]

    business [
	<category: 'accessing'>
	^business
    ]

    business: aString [
	<category: 'accessing'>
	business := aString
    ]

    firstName: aString [
	<category: 'accessing'>
	firstName := aString
    ]

    firstName [
	<category: 'accessing'>
	^firstName
    ]

    lastName: aString [
	<category: 'accessing'>
	lastName := aString
    ]

    lastName [
	<category: 'accessing'>
	^lastName
    ]

    address [
	<category: 'accessing'>
	^address ifNil: [address := Address new]
    ]

    address: anAddress [
	<category: 'accessing'>
	address := anAddress
    ]

    parseFields: aDictionary [
	<category: 'parsing'>
	self id: (aDictionary at: 'PAYERID' ifAbsent: [nil]).
	self email: (aDictionary at: 'EMAIL' ifAbsent: [nil]).
	self status: (aDictionary at: 'STATUS' ifAbsent: [nil]).
	self firstName: (aDictionary at: 'FIRSTNAME' ifAbsent: [nil]).
	self lastName: (aDictionary at: 'LASTNAME' ifAbsent: [nil]).
	self business: (aDictionary at: 'business' ifAbsent: [nil]).
	self address parseFields: aDictionary
    ]
]

Iliad.ILObject subclass: Address [
    | country name street city state countryCode countryName zip id status |

    country [
	<category: 'accessing'>
	^country
    ]

    country: aString [
	<category: 'accessing'>
	country := aString
    ]

    name [
	<category: 'accessing'>
	^name
    ]

    name: aString [
	<category: 'accessing'>
	name := aString
    ]

    state [
	<category: 'accessing'>
	^state
    ]

    state: aString [
	<category: 'accessing'>
	state := aString
    ]

    countryCode [
	<category: 'accessing'>
	^countryCode
    ]

    countryCode: aString [
	<category: 'accessing'>
	countryCode := aString
    ]

    countryName [
	<category: 'accessing'>
	^countryName
    ]

    countryName: aString [
	<category: 'accessing'>
	countryName := aString
    ]

    street: aString [
	<category: 'accessing'>
	street := aString
    ]

    street [
	<category: 'accessing'>
	^street
    ]
    
    city: aString [
	<category: 'accessing'>
	city := aString
    ]


    city [
	<category: 'accessing'>
	^city
    ]

    zip [
	<category: 'accessing'>
	^zip
    ]

    zip: aString [
	<category: 'accessing'>
	zip := aString
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

    parseFields: aDictionary [
	<category: 'parsing'>
	self country: (aDictionary at: 'COUNTRYCODE' ifAbsent: [nil]).
	self street: (aDictionary at: 'SHIPTOSTREET' ifAbsent: [nil]).
	self city: (aDictionary at: 'SHIPTOCITY' ifAbsent: [nil]).
	self state: (aDictionary at: 'SHIPTOSTATE' ifAbsent: [nil]).
	self countryCode: (aDictionary at: 'SHIPTOCOUNTRYCODE' ifAbsent: [nil]).
	self countryName: (aDictionary at: 'SHIPTOCOUNTRYNAME' ifAbsent: [nil]).
	self zip: (aDictionary at: 'SHIPTOZIP' ifAbsent: [nil]).
	self id: (aDictionary at: 'ADDRESSID' ifAbsent: [nil]).
	self status: (aDictionary at: 'ADDRESSSTATUS' ifAbsent: [nil]).
    ]
]

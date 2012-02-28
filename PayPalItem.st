Object subclass: PayPalItem [
    | amount taxAmount quantity name |

    <category: 'PayPal'> 

    name [
	<category: 'accessing'>
	^name ifNil: ['']
    ]

    name: aString [
	<category: 'accessing'>
	name := aString
    ]

    amount [
	<category: 'accessing'>
	^amount ifNil: [amount := 0]
    ]

    taxAmount [
	<category: 'accessing'>
	^taxAmount ifNil: [taxAmount := 0]
    ]

    taxAmount: aNumber [
	<category: 'accessing'>
	taxAmount := aNumber
    ]

    amount: aNumber [
	<category: 'accessing'>
	amount := aNumber
    ]

    quantity [
	<category: 'accessing'>
	^quantity ifNil: [quantity := 0]
    ]

    quantity: anInteger [
	<category: 'accessing'>
	quantity := anInteger
    ]
]

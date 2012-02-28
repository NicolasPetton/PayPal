Object subclass: PayPalItem [
    | amount quantity |

    <category: 'PayPal'> 

    amount [
	<category: 'accessing'>
	^amount ifNil: [amount := 0]
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

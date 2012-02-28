Iliad.ILObject subclass: NVPRequest [
    | transaction |

    <category: 'PayPal'>
    <comment: 'I am the implementation of an abstract NVP Request for the NVP API'>

    method [
	<category: 'accessing'>
	self subclassResponsibility
    ]

    transaction [
	<category: 'accessing'>
	^transaction
    ]

    transaction: aTransaction [
	<category: 'accessing'>
	transaction := aTransaction
    ]

    account [
	<category: 'accessing'>
	^self transaction account
    ]

    requestUrl [
	<category: 'accessing'>
	| url |
	url := Iliad.ILUrl absolute: self transaction baseUrl.
	url
	    addParameter: 'user' value: self account user;
	    addParameter: 'pwd' value: self account password;
	    addParameter: 'signature' value: self account signature;
	    addParameter: 'version' value: self transaction version;
	    addParameter: 'paymentaction' value: self transaction paymentAction;
	    addParameter: 'amt' value: self transaction amount;
	    addParameter: 'subtotal' value: self transaction subtotal;
	    addParameter: 'shipping' value: self transaction shipping;
	    addParameter: 'tax' value: self transaction tax;
	    addParameter: 'currencycode' value: self transaction currency;
	    addParameter: 'method' value: self method.
	self transaction paypalItems do: [:each |
	    url addParameter: ('L_NUMBER', ((self transaction paypalItems indexOf: each) - 1) printString) value: (self transaction paypalItems indexOf: each).
	    url addParameter: ('L_NAME', ((self transaction paypalItems indexOf: each) - 1) printString) value: (each name). 
	    url addParameter: ('L_AMT', ((self transaction paypalItems indexOf: each) - 1) printString) value: (each amount printString).
	    url addParameter: ('L_TAXAMT', ((self transaction paypalItems indexOf: each) - 1) printString) value: (each taxAmount printString).
	    url addParameter: ('L_QTY', ((self transaction paypalItems indexOf: each) - 1) printString) value: (each quantity printString)].
	^url
    ]
]

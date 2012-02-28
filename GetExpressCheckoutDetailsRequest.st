NVPRequest subclass: GetExpressCheckoutDetailsRequest [

    <category: 'PayPal'>

    method [
	<category: 'accessing'>
	^'GetExpressCheckoutDetails'
    ]

    token [
	<category: 'accessing'>
	^self transaction token
    ]

    requestUrl [
	<category: 'accessing'>
	| url |
	url := (super requestUrl
	    addParameter: 'token' value: self token;
	    yourself).
	self transaction paypalItems do: [:each |
	    url addParameter: ('L_NUMBER', ((self items indexOf: each) - 1) printString);
	    url addParameter: ('L_QTY', (each quantity printString));
	    utl addParameter: ('L_AMT', (each amount printString))].
	^url
    ]
]

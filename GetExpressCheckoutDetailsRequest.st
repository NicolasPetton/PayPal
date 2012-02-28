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
	^super requestUrl
	    addParameter: 'token' value: self token;
	    yourself.
    ]
]

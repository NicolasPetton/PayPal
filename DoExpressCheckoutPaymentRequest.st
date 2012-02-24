NVPRequest subclass: DoExpressCheckoutPaymentRequest [

    <category: 'PayPal'>

    method [
	<category: 'accessing'>
	^'DoExpressCheckoutPayment'
    ]

    payer [
	<category: 'accessing'>
	^self transaction payer
    ]

    token [
	<category: 'accessing'>
	^self transaction token
    ]

    requestUrl [
	<category: 'accessing'>
	^super requestUrl
	    addParameter: 'payerid' value: self payer id;
	    addParameter: 'token' value: self token;
	    addParameter: 'desc' value: self transaction description;
	    yourself
    ]
]

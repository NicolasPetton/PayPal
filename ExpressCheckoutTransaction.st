Transaction subclass: ExpressCheckoutTransaction [
    | version token |
    
    <category: 'PayPal'>
    <comment: 'I use exclusively the NVP API'>

    defaultVersion [
	<category: 'defaults'>
	^'58.0'
    ]

    token [
	<category: 'accessing'>
	^token
    ]

    token: aString [
	<category: 'accessing'>
	token := aString
    ]

    version [
	<category: 'accessing'>
	^version ifNil: [self defaultVersion]
    ]

    version: aString [
	<category: 'accessing'>
	version := aString
    ]

    setExpressCheckoutRequest [
	<category: 'accessing'>
	^SetExpressCheckoutRequest new
	    transaction: self;
	    yourself
    ]

    getExpressCheckoutDetailsRequest [
	<category: 'accessing'>
	^GetExpressCheckoutDetailsRequest new
	    transaction: self;
	    yourself
    ]  

    doExpressCheckoutPaymentRequest [
	<category: 'accessing'>
	^DoExpressCheckoutPaymentRequest new
	    transaction: self;
	    yourself
    ]

    paypalRedirectUrl [
	<category: 'accessing'>
	^'https://www.', self hostName, '/cgi-bin/webscr?cmd=_express-checkout&useraction=commit&token=', (self token ifNil: [''])
    ]

    processTransaction [
	<category: 'transaction'>
	| response |
	self payer: Payer new.
	response := self responseForCommand: (self commandForRequest: self getExpressCheckoutDetailsRequest).
	self payer parseFields: response fields.
	response := self responseForCommand: (self commandForRequest: self doExpressCheckoutPaymentRequest).
	self answer: response
    ]

    contents [
	<category: 'building'>
	| response |
	response := self responseForCommand: (self commandForRequest: self setExpressCheckoutRequest).
	token := response token.
	super contents
    ]
]

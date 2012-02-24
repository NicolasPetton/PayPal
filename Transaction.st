Iliad.ILWidget subclass: Transaction [
    | currency amount account paymentAction payer sandbox successUrl description |

    <category: 'PayPal'>

    Transaction class [
	
	sandboxUrl [
	    <category: 'accessing'>
	    ^'https://api-3t.', self sandboxHostName, '/nvp'
	]

	liveUrl [
	    <category: 'accessing'>
	    ^'https://api-3t.', self liveHostName ,'/nvp'
	]

	sandboxHostName [
	    <category: 'accessing'>
	    ^'sandbox.paypal.com'
	]

	liveHostName [
	    <category: 'accessing'>
	    ^'paypal.com'
	]
    ]

    defaultCurrency [
	<category: 'defaults'>
	^'USD'
    ]

    defaultPaymentAction [
	<category: 'defaults'>
	^'Sale'
    ]

    beSandbox [
	<category: 'accessing'>
	sandbox := true
    ]

    beLive [
	<category: 'accessing'>
	sandbox := false
    ]

    baseUrl [
	<category: 'accessing'>
	self isLive ifTrue: [^self class liveUrl].
	^self class sandboxUrl
    ]

    hostName [
	<category: 'accessing'>
	self isLive ifTrue: [^self class liveHostName].
	^self class sandboxHostName
    ]

    currency [
	<category: 'accessing'>
	^currency ifNil: [self defaultCurrency]
    ]

    currency: aString [
	<category: 'accessing'>
	currency := aString
    ]

    description [
	<category: 'accessing'>
	description ifNil: ['']
    ]

    description: aString [
	<category: 'accessing'>
	description := aString
    ]

    amount [
	<category: 'accessing'>
	^amount ifNil: [0]
    ]

    amount: aNumber [
	<category: 'accessing'>
	amount := aNumber
    ]

    paymentAction [
	<category: 'accessing'>
	^paymentAction ifNil: [self defaultPaymentAction]
    ]

    paymentAction: aString [
	<category: 'accessing'>
	paymentAction := aString
    ]

    payer [
	<category: 'accessing'>
	^payer
    ]

    payer: aPayer [
	<category: 'accessing'>
	payer := aPayer
    ]
    
    account: anAccount [
	<category: 'accessing'>
	account := anAccount
    ]

    account [
	<category: 'accessing'>
	^account
    ]

    paypalRedirectUrl [
	<category: 'accessing'>
	self subclassResponsibility
    ]

    processTransaction [
	<category: 'transaction'>
	self subclassResponsibility
    ]

    returnUrl [
	<category: 'accessing'>
	^self urlBuilder urlForAction: (self session
	    registerActionFor: [self processTransaction])
    ]

    cancelUrl [
	<category: 'accessing'>
	^self urlBuilder urlForAction: (self session 
	    registerActionFor: [self answer: nil])
    ]

    commandForRequest: aRequest [
	<category: 'requests'>
	^'curl "', aRequest requestUrl asString, '"'
    ]

    responseForCommand: aString [
	<category: 'requests'>
	| response pipe |
	pipe := FileStream popen: aString dir: FileStream read.
	response := NVPResponse fromString: pipe contents.
	pipe close.
	^response
    ]
    
    contents [
	<category: 'building'>
	self application redirectTo: self paypalRedirectUrl
    ]

    isLive [
	<category: 'testing'>
	^self isSandbox not
    ]

    isSandbox [
	<category: 'testing'>
	^sandbox ifNil: [false]
    ]

]

Iliad.ILWidget subclass: Transaction [
    | currency amount subtotal tax shipping account paymentAction payer sandbox successUrl description paypalItems |

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

    paypalItems [
	<category: 'accessing'>
	^paypalItems ifNil: [paypalItems := OrderedCollection new]
    ]

    paypalItems: aCollection [
	<category: 'accessing'>
	paypalItems := aCollection
    ]

    addPayPalItem: aPayPalItem [
	<category: 'accessing'>
	self paypalItems add: aPayPalItem
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
	^description ifNil: ['']
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

    shipping [
	<category: 'accessing'>
	^shipping ifNil: [0]
    ]

    shipping: aNumber [
	<category: 'accessing'>
	shipping := aNumber
    ]

    tax [
	<category: 'accessing'>
	^tax ifNil: [0]
    ]

    tax: aNumber [
	<category: 'accessing'>
	tax := aNumber
    ]

    subtotal [
	<category: 'accessing'>
	^subtotal ifNil: [self amount - (self tax + self shipping)]
    ]

    subtotal: aNumber [
	<category: 'accessing'>
	subtotal := aNumber
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
	| url |
	url := aRequest requestUrl asString.
	(self cleanUrl: url) printNl.
	^'curl "', (self cleanUrl: url) , '"'
    ]

    cleanUrl: aString [
	<category: 'converting'>
	| res |
	res := aString copyReplaceAll: '%20' with: '+'.
	res := res copyReplaceAll: '%28' with: '('.
	res := res copyReplaceAll: '%29' with: ')'.
	^res
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

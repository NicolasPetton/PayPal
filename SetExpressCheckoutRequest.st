NVPRequest subclass: SetExpressCheckoutRequest [
    
    <category: 'PayPal'>

    method [
	<category: 'accessing'>
	^'SetExpressCheckout'
    ]

    requestUrl [
	<category: 'accessing'>
	| url |
	url := super requestUrl.
	url
	    addParameter: 'cancelurl' 
	    value: self transaction cancelUrl asString.
	url 
	    addParameter: 'returnurl' 
	    value: self transaction returnUrl asString.
	^url
    ]
]

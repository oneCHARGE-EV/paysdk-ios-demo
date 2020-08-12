# Octopus Pay

## Initialization Step: 

* Add LSApplicationQueriesSchemes in info .plist file 

```
<key>LSApplicationQueriesSchemes</key>
<array>
	<string>octopus</string>
</array>
```

* Initialize PayData

```
paySDK.paymentDetails = PayData(channelType: PayChannel.DIRECT,
				envType: EnvType.SANDBOX,
				amount: 0.1,
				payGate: PayGate.PAYDOLLAR,
				currCode: currencyCode.HKD,
				payType: payType.NORMAL_PAYMENT,
				orderRef: "2018102409220001",
				payMethod: "OCTOPUS",
				lang: Language.ENGLISH,
				merchantId: "1",
        			resultpage: "F",
				extraData : [:])
                                
paySDK.process()

```



# AliPay

## Initialization Step: 

* Add URL Type in info .plist file 

![image](https://user-images.githubusercontent.com/57220911/79874665-475a6c80-8406-11ea-9023-91ea84b50dac.png)

* In AppDelegate file add

var paySDK = PaySDKClass.shared


func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
			paySDK.processOrder(url: url)
			returntrue
}


```

paySDK.paymentDetails = PayData(channelType: PayChannel.DIRECT,
				envType: EnvType.SANDBOX,
				amount: "10",
				payGate: PayGate.PAYDOLLAR,
				currCode:currencyCode.HKD,
				payType: payType.NORMAL_PAYMENT,
				orderRef: "560200353Ref",
				payMethod: "ALIPAYHKAPP",
				lang: Language.ENGLISH, 
				merchantId: "560200353",
				remark: "test",
				payRef: "",
				extraData : [:])

paySDK.process();

```


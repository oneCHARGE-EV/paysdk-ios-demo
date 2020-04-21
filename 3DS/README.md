

# 3DS2.0 Payment

```
paySDK.paymentDetails = PayData(channelType: PayChannel.DIRECT,
envType: EnvType.SANDBOX,
amount : “10”,
payGate: PayGate.PAYDOLLAR,
currCode: currencyCode.HKD,
payType: payType.NORMAL_PAYMENT,
orderRef: "2018102409220001”,
payMethod: "THREEDS2",
lang: Language.ENGLISH,
merchantId: "1",
remark: "",
extraData :[:])

paySDK.paymentDetails.cardDetails = CardDetails(
cardHolderName: “abcabc”,
cardNo: "4918914107195011”,
expMonth: “11”,
expYear: “2011”,
securityCode: “123”)
var threeDSParams = ThreeDSParams()
threeDSParams.threeDSCustomerEmail = "example@example.com"
hreeDSParams.threeDSDeliveryEmail = "example1@example.com"
paySDK.paymentDetails.threeDSParams = threeDSParams
paySDK.process();

```


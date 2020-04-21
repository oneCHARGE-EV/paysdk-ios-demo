

# Member Pay

## New Member -

```
paySDK.cardDetails = CardDetails(cardHolderName: “firstcard”,
cardNo: "4012000000020086”,
expMonth: “07”,
expYear: “2030”,
securityCode: “123”)

paySDK.paymentDetails = PayData(channelType: PayChannel.DIRECT,
envType: EnvType.SANDBOX,
amount :“1”,
payGate: PayGate.PAYDOLLAR,
currCode: currencyCode.HKD,
payType: payType.NORMAL_PAYMENT,
orderRef: "2018102409220001”,
payMethod: "VISA",
lang: Language.ENGLISH,
merchantId: "88146271",
remark: "",
secureMethod: SecureMethod.NONE,
secureHashSecret: "",

extraData: ["addNewMember": true,
"memberPay_service": "T",
"memberPay_memberId": "Member01",
"memberPay_token":""]

extraData :[])

paySDK.process()

```


## Old Member -

```
paySDK.cardDetails = CardDetails(cardHolderName: “firstcard”,
cardNo: "4012000000020086”,
expMonth: “07”,
expYear: “2030”,
securityCode: “123”)

paySDK.paymentDetails = PayData(channelType: PayChannel.DIRECT,
envType: EnvType.SANDBOX,
amount :“1”,
payGate: PayGate.PAYDOLLAR,
currCode: currencyCode.HKD,
payType: payType.NORMAL_PAYMENT,
orderRef: "2018102409220001”,
payMethod: "VISA",
lang: Language.ENGLISH,
merchantId: "88146271",
remark: "",
secureMethod: SecureMethod.NONE,
secureHashSecret: "",

extraData: ["addNewMember": false,
"memberPay_service": "T",
"memberPay_memberId": "Member01",
"token":"8de18f7b17fabe5bb682e792e319c0e411b528f5892622"]


extraData :[])

paySDK.process()

```


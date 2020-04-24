

# Direct Payment

```
paySDK.cardDetails = CardDetails(cardHolderName: “first card”,
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
                                addNewMember: false,
                                extraData :[])

paySDK.process()
```
<img width="223" alt="image" src="https://user-images.githubusercontent.com/57219862/80222729-e7153600-8664-11ea-93b6-82d7e2bdf318.png">

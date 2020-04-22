


# Promo Pay

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
                                addNewMember: false,

                                extraData :  extraData: ["promotion ": "T",
                                                         "promotionCode ": "TEST1",
                                                         "promotionRuleCode " : " TESTR25",
                                                         "promotionOriginalAmt ":""])

paySDK.process()


```




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
                                            "memberPay_token":""])

paySDK.process()

```

<img width="243" alt="image" src="https://user-images.githubusercontent.com/57219862/80246803-a7614500-868a-11ea-8563-f912d1696ec3.png">


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
                                            "token":"8de18f7b17fabe5bb682e792e319c0e411b528f5892622"])

paySDK.process()

```

<img width="248" alt="image" src="https://user-images.githubusercontent.com/57219862/80247989-b1844300-868c-11ea-9088-e3872811ee09.png">

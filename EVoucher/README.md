
# EVoucher

```
extraData = ["eVoucher": "T",
             "eVClassCode": "0001"]
```

```
paySDK.paymentDetails = PayData(channelType : PayChannel.WEBVIEW,
                                envType : EnvType.SANDBOX,
                                amount :"1"
                                payGate : PayGate.PAYDOLLAR,
                                currCode : currencyCode.HKD,
                                payType : payType.NORMAL_PAYMENT,
                                orderRef : “2018102409220001”,
                                payMethod : "CC",
                                lang : Language.ENGLISH,
                                merchantId : "88144121",
                                remark : "",
                                payRef: "",
                                extraData: extraData)

                
paySDK.process();

```

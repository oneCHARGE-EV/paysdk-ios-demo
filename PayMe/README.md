# PayMe

### Initialize PayData
* Swift Code
```
paySDK.paymentDetails = PayData(channelType: PayChannel.DIRECT,
                                envType: EnvType.SANDBOX,
                                amount: 0.1,
                                payGate: PayGate.PAYDOLLAR,
                                currCode: currencyCode.HKD,
                                payType: payType.NORMAL_PAYMENT,
                                orderRef: String(format: "%.0f", NSDate().timeIntervalSince1970 * 1000),
                                payMethod: "PayMe",
                                lang: Language.ENGLISH,
                                merchantId: "1",
                                remark: "test",
                                extraData : [:])

paysdk.paymentDetails.callBackParam = CallBackParam(successUrl: "xxx://abc//success",
                                                    cancelUrl: "xxx://abc//cancelled",
                                                    errorUrl: "xxx://abc//error",
                                                    failUrl: "xxx://abc//fail")
                                                    
paySDK.process()

```
* Objective C Code

```
paySDK.paymentDetails = [[PayData alloc] initWithChannelType: PayChannelDIRECT
                                         envType: EnvTypeSANDBOX 
                                         amount: @"2.0" 
                                         payGate: PayGatePAYDOLLAR 
                                         currCode: CurrencyCodeHKD 
                                         payType: payTypeNORMAL_PAYMENT 
                                         orderRef: orderRef 
                                         payMethod: @"PayMe" 
                                         lang: LanguageENGLISH 
                                         merchantId: 1 
                                         remark: @"test" 
                                         extraData: nil];
                                         
<<<<<<< HEAD
paySDK.paymentDetails.callBackParam = [[CallBackParam alloc] initWithsuccessUrl: @"xxx://abc//success",                                                               cancelUrl: @"xxx://abc//cancelled",
                                                             errorUrl: @"xxx://abc//error",
                                                             failUrl: @"xxx://abc//fail"];
=======
paySDK.paymentDetails.callBackParam = [[CallBackParam alloc] initWithsuccessUrl: @"xxx://abc//success"
                                                             cancelUrl: @"xxx://abc//cancelled",
                                                             errorUrl : @"xxx://abc//success",
                                                             failUrl : @"xxx://abc//cancelled"];
>>>>>>> 0f3f27f88a398d9974ac59259bdfd1cb5744db9b

[paySDK process];
```


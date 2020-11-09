# Octopus Pay

## Initialization Step: 

* Add LSApplicationQueriesSchemes in info .plist file 

```
<key>LSApplicationQueriesSchemes</key>
<array>
	<string>octopus</string>
</array>
```

### Initialize PayData
* Swift Code
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
* Objective C Code
```
NSDictionary *dic =@{@"eVoucher": @"T",
                     @"eVClassCode": @"0001"};
                     
extraData = [[NSMutableDictionary alloc] initWithDictionary: dic];
```
```
paySDK.paymentDetails = [[PayData alloc] initWithChannelType: PayChannelWEBVIEW                                                            envType: EnvTypeSANDBOX 
                                         amount: @"2.0" 
                                         payGate: PayGatePAYDOLLAR 
                                         currCode: CurrencyCodeHKD 
                                         payType: payTypeNORMAL_PAYMENT 
                                         orderRef: orderRef 
                                         payMethod: @"OCTOPUS" 
                                         lang: LanguageENGLISH 
                                         merchantId: merchantId 
                                         remark: @"" 
                                         payRef: @"" 
                                         resultpage: "@F" 
                                         extraData: nil];

[paySDK process];
```


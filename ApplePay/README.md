# Apple Pay

## Initialization Step: 

 1. Add framework to the App
  	`PassKit.framework`

 2. In Xcode , Under “Capabilities”, turn on Apple Pay, and ensure that you have selected the correct merchant ID
    (If you don’t see yours, try tapping the + and enter the name of your merchant ID).
    
    <img width="451" alt="ApplePay1" src="https://user-images.githubusercontent.com/57219862/86749288-c00eb380-c05a-11ea-83f2-55e7f011547a.png">

3. Add merchant ID in app entitlements file

    <img width="451" alt="ApplePay2" src="https://user-images.githubusercontent.com/57219862/86733970-41604900-c04f-11ea-9f8f-99887444e894.png">


### Set the Apple Pay button:
   Set the button type and button style for the button as
   

    btnApplePay.setApplePayButton(btnType: ApplePayButtonType.Buy, btnStyle: ApplePayButtonStyle.Black, view : self.view)
    

* Swift Code
```
paySDK.paymentDetails = PayData(channelType: PayChannel.DIRECT,
                                envType: EnvType.SANDBOX,
                                amount: "10",
                                payGate: PayGate.PAYDOLLAR,
                                currCode:currencyCode.HKD,
                                payType: payType.NORMAL_PAYMENT,
                                orderRef: "560200353Ref",
                                payMethod: "APPLEPAY",
                                lang: Language.ENGLISH, 
                                merchantId: "560200353",
                                remark: "test",
                                payRef: "",
                                resultpage: "F",
                                extraData : ["apple_countryCode" : "US",
                                             "apple_currencyCode" : "USD",
                                             "apple_billingContactEmail" : "abc@gmail.com",
                                             "apple_billingContactPhone" : "1234567890",
                                             "apple_billingContactGivenName" : "ABC",
                                             "apple_billingContactFamilyName" : "XYZ",
                                             "apple_requiredBillingAddressFields" : "",
                                             "apple_merchant_name" : "AsiapayDemo"])

paySDK.process();
```

*Objective C Code
```
NSDictionary *arr = @{@"apple_countryCode" : @"US",
                      @"apple_currencyCode" : @"USD",
                      @"apple_billingContactEmail" : @"abc@gmail.com",
                      @"apple_billingContactPhone" : @"1234567890",
                      @"apple_billingContactGivenName" : @"ABC",
                      @"apple_billingContactFamilyName" : @"XYZ",
                      @"apple_requiredBillingAddressFields" : @"",
                      "apple_merchant_name" : @"Asiapay"};
                      
paySDK.paymentDetails = [[PayData alloc] initWithChannelType: PayChannelDIRECT
                                         envType: EnvTypeSANDBOX
                                         amount: @"1"
                                         payGate: PayGatePAYDOLLAR
                                         currCode: CurrencyCodeHKD
                                         payType: payTypeNORMAL_PAYMENT
                                         orderRef: [NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970] * 1000000000]
                                         payMethod: @"APPLEPAY"
                                         lang: LanguageENGLISH
                                         merchantId: @"1"
                                         remark: @"test"
                                         payRef: @""
                                         resultpage: resultPage
                                         extraData: arr];

[paySDK process];
```

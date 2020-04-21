
## PaySDK -   
##### iOS SDK which seamlessly integrate PayDollar Payment Gateway

### Overview

##### AsiaPay offers comprehensive and flexible payment services and solutions.Via our state-of the-art secure multi-currency, multi-lingual and multi-channel processing platform, we offer payment acceptance flexibility for Direct Merchant Account or Master Account offerings, with options for credit card and direct debit acceptance, whether online, MOTO or call centre and popular mobile wallets.

### How it works
#### The cardholder inputs their bank account/card details on the PayDollar Checkout form in order to pay for a product/service.The transaction amount is routed via the card networks to PayDollar's acquiring banking partners. Once PayDollar receives the amount, it is settled to your bank account after fees deduction.

### Get Started

1. [PaySdk Configuration](#paysdk-configuration)
2. [Add Security Key](#add-security-key)
3. [Initialize PaySdk](#initialize-paysdk)
4. [Initialize Payload](#initialize-payload)
5. [Collect Payment Result](#collect-payment-result)

### PaySdk Configuration

*  Requirements
Swift Version: 4.0 and above
iOS Version: 11.0 and above


* Download the latest sdk from https://github.com/asiapay-lib/paysdk-ios-lib

* AddPaySDK.framework file into your project by adding the dependencies in Build Phases / Link Binary With Libraries :
add the “AP_PaySDK” framework 

* Or use CocoaPods. CocoaPods is a dependency manager for Cocoa projects. For usage and installation instructions, visit https://guides.cocoapods.org/using/using-cocoapods.html for more detail. To integrate PaySDK into your Xcode project using CocoaPods, specify it in your Podfile:
pod ‘AP_PaySDK’

* Import sdk into the class
 import AP_PaySDK
 NOTE - Due to the limitation of App Transport Security(ATS) on http in iOS9.0, we need to add exception for paydollar.com, pesopay.com, siampay.com, alipay.com, alipayobjects.com in info.list

```
<key>NSAppTransportSecurity</key>
<dict>
<key>NSExceptionDomains</key>
<dict>
<key>paydollar.com</key>
<dict>
<key>NSIncludesSubdomains</key>
<true/>
<key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
<true/>
<key>NSTemporaryExceptionMinimumTLSVersion</key>
<string>TLSv1.0</string>
<key>NSTemporaryExceptionRequiresForwardSecrecy</key>
<false/>
</dict>
<key>xecure3d.com</key>
<dict>
<key>NSIncludesSubdomains</key>
<true/>
<key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
<true/>
<key>NSTemporaryExceptionMinimumTLSVersion</key>
<string>TLSv1.0</string>
<key>NSTemporaryExceptionRequiresForwardSecrecy</key>
<false/>
</dict>
<key>pesopay.com</key>
<dict>
<key>NSIncludesSubdomains</key>
<true/>
<key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
<true/>
<key>NSTemporaryExceptionMinimumTLSVersion</key>
<string>TLSv1.0</string>
<key>NSTemporaryExceptionRequiresForwardSecrecy</key>
<false/>
</dict>
<key>siampay.com</key>
<dict>
<key>NSIncludesSubdomains</key>
<true/>
<key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
<true/>
<key>NSTemporaryExceptionMinimumTLSVersion</key>
<string>TLSv1.0</string>
<key>NSTemporaryExceptionRequiresForwardSecrecy</key>
<false/>
</dict>
<key>alipay.com</key>
<dict>
<key>NSIncludesSubdomains</key>
<true/>
<key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
<true/>
<key>NSTemporaryExceptionMinimumTLSVersion</key>
<string>TLSv1.0</string>
<key>NSTemporaryExceptionRequiresForwardSecrecy</key>
<false/>
</dict>
<key>alipayobjects.com</key>
<dict>
<key>NSIncludesSubdomains</key>
<true/>
<key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
<true/>
<key>NSTemporaryExceptionMinimumTLSVersion</key>
<string>TLSv1.0</string>
<key>NSTemporaryExceptionRequiresForwardSecrecy</key>
<false/>
</dict>
</dict>
</dict>
```
Also Merchant can disable ATS by 

```
<key>NSAppTransportSecurity</key>
<dict>
<key>NSAllowsArbitraryLoads</key><true/>
</dict>

```


### Add Security Key

Create the paysdk.plist file in the app with the following attributes      
    
RSA Public Key(SDK_RSA_Publickey) :- Here you need to specify the RSA Public Key without header and Merchant_ID(optional)
e.g
![image](https://user-images.githubusercontent.com/57220911/79866991-4112c300-83fb-11ea-82e9-4bf8a5575565.png)

### Initialize PaySdk

* Add implementation of PaySDK protocol –
class ViewController: UIViewController , PaySDKDelegate

* Instantiate PaySDK class with context.
 var paySDK=PaySDKClass.shared

* Set paySDK delegate
paySDK.delegate = self


### Initialize Payload


* Use following payment options.
 
Payment Option | Example
--- | --- 
Direct Payment | [Direct Payment](https://github.com/asiapay-lib/paysdk-ios-demo/blob/master/DirectPay/README.md)
Webview Payment | [Webview Payment](https://github.com/asiapay-lib/paysdk-ios-demo/blob/master/Webview/README.md)
Add 3DS  | [3DS](https://github.com/asiapay-lib/paysdk-ios-demo/blob/master/3DS/README.md)
AliPay  | [AliPay](https://github.com/asiapay-lib/paysdk-ios-demo/blob/master/AliPay/README.md)
Member Pay | [Member Pay](https://github.com/asiapay-lib/paysdk-ios-demo/blob/master/MemberPay/README.md)
Installment Pay | [Installmet Pay](https://github.com/asiapay-lib/paysdk-ios-demo/blob/master/InstallmentPay/README.md)
Schedule Pay | [Schedule Pay](https://github.com/asiapay-lib/paysdk-ios-demo/blob/master/SchedulePay/README.md)
Promo Pay | [Promo Pay](https://github.com/asiapay-lib/paysdk-ios-demo/blob/master/PromoPay/README.md)





### Collect Payment Result

```
             funcpaymentResult(result: PayResult) {
              }
```

### Support
Asiapay is a tech company. All our engineers handle support too. You can write to us at asiapay.com/support and expect a response from the devs responsible for the Android SDK.

### License
MIT Licensed. LICENSE file added to repo.




//
//  ViewController.m
//  DemoApp-Objc
//
//  Created by Vaibhav on 05/03/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

#import <AP_PaySDK/AP_PaySDK-Swift.h>
@import AP_PaySDK;

#import "ViewController.h"

@interface ViewController () <PaySDKDelegate> {
    PaySDK *paySDK;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    paySDK = [PaySDK shared];
    [paySDK setDelegate: self];
    [paySDK setUseSDKProgressScreen: YES];
    // Do any additional setup after loading the view.
}


- (IBAction) pay: (id)sender {
    paySDK.paymentDetails = [[PayData alloc] initWithChannelType: PayChannelDIRECT
                                                         envType: EnvTypeSANDBOX
                                                          amount: @"1"
                                                         payGate: PayGatePAYDOLLAR
                                                        currCode: CurrencyCodeHKD
                                                         payType: payTypeNORMAL_PAYMENT
                                                        orderRef: @"12345678901234"
                                                       payMethod: @"VISA"
                                                            lang: LanguageENGLISH
                                                      merchantId: @"123456"
                                                          remark: @"REMARK"
                                                       extraData: nil];
    
    paySDK.paymentDetails.cardDetails = [[CardDetails alloc] initWithCardHolderName: @"abc abc"
                                                                             cardNo: @"12345678901234"
                                                                           expMonth: @"12"
                                                                            expYear: @"2022"
                                                                       securityCode: @"123"];
    [paySDK process];
    
}


- (void)paymentResultWithResult:(PayResult * _Nonnull)result {
    
}


@end

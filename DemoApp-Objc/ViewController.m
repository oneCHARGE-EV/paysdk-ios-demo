//
//  ViewController.m
//  DemoApp-Objc
//
//  Created by Vaibhav on 11/12/19.
//  Copyright © 2019 Vaibhav. All rights reserved.
//

#import "ViewController.h"
#import <AP_PaySDK/AP_PaySDK.h>
#import <AP_PaySDK/AP_PaySDK-Swift.h>
#import <Eureka/Eureka-umbrella.h>
//#import <Eureka/Eureka.h>
@import AP_PaySDK;
//@import Eureka;
//import AP_PaySDK
//import Eureka


@interface ViewController () <PaySDKDelegate> {
    PaySDK *paySDK;
    NSString *memberPayToken;
    PayGate *bb;
    CurrencyCode *bb1;
    BOOL isRamdom;
    
}
//var paySDK = PaySDK.shared
//var form1 : Form?
//var memberPayToken = ""
//var bb : PayGate?
//var bb1 : CurrencyCode?
//var isRamdom : Bool = false

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    paySDK = [PaySDK shared];
    UiCustomization *customization = [[UiCustomization alloc] init];
    
    
    ButtonCustomization *submitButtonCustomization = [[ButtonCustomization alloc] init:@"Courier" :@"#FF0000" :15 :@"#d3d3d3" :4];
    ButtonCustomization *resendButtonCustomization = [[ButtonCustomization alloc] init:@"Courier" :@"#FF0000" :15 :@"#d3d3d3" :4];
    ButtonCustomization *cancelButtonCustomization = [[ButtonCustomization alloc] init:@"Courier" :@"#FF0000" :15 :@"#d3d3d3" :4];
    ButtonCustomization *nextButtonCustomization = [[ButtonCustomization alloc] init:@"Courier" :@"#FF0000" :15 :@"#d3d3d3" :4];
    ButtonCustomization *continueButtonCustomization = [[ButtonCustomization alloc] init:@"Courier" :@"#FF0000" :15 :@"#d3d3d3" :4];
    
    LabelCustomization *labelCustomization = [[LabelCustomization alloc] init:@"Courier" :@"#FF0000" :14 :@"#FF0000":@"Courier" :20];
    TextBoxCustomization *textBoxCustomization = [[TextBoxCustomization alloc] init:@"Courier" :@"FF0000" :14 :4 :@"FF0000" :4];
    ToolbarCustomization *toolbarCustomization = [[ToolbarCustomization alloc] init:@"Courier" :@"#FFFFFF" :20 :@"#000000" :@"Payment Page"];
    NSError *err;
    [customization setLabelCustomization:labelCustomization error:&err];
    [customization setButtonCustomization:submitButtonCustomization : PaySDKButtonTypeSUBMIT error:&err];
    [customization setButtonCustomization:resendButtonCustomization : PaySDKButtonTypeRESEND error:&err];
    [customization setButtonCustomization:cancelButtonCustomization : PaySDKButtonTypeCANCEL error:&err];
    [customization setButtonCustomization:nextButtonCustomization : PaySDKButtonTypeNEXT error:&err];
    [customization setButtonCustomization:continueButtonCustomization : PaySDKButtonTypeCONTINUE error:&err];
    
    [customization setLabelCustomization:labelCustomization error:&err];
    [customization setTextBoxCustomization:textBoxCustomization error:&err];
    [customization setToolbarCustomization:toolbarCustomization error:&err];
    [paySDK setUiCustomization:customization];
    paySDK.delegate = self;
    paySDK.isBioMetricRequired = YES;
   // [paySDK setPublicKeyWithStr:@"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArvxLT052VCC+QgQzh3SHuwMtD6qW4FG0pC8BLumsqZPZ6vV3cRx3np44sSbA5lllXtbIzodvc9T2sYdLQDpFG3I7IdhxE4XG05xSOQCeht7uz+s8DMlYJJjzJV2hBNEdNtjFkA2JYoxoBzsjIBTj4kTwFSZBVZCfq6HvuOGpKjzqsHkQXlXya5xzIBLjYduc5RBnuyHIeeQiSsuI2leg+RmQsUt84ykmrpTEpoPID0/vBwtHIilpUCGz88vwgN5SHTRTqG5naGjLR59pebYauKPuKRx7GYqGMbaXi8JYN7UdsipW9qCXY1b27Lq9ESVpbIgp85nLY66ISsKcmpheIwIDAQAB"];
    bb1 = CurrencyCodeRMB;
    // Do any additional setup after loading the view.
}


@end

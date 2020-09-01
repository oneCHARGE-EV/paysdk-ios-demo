//
//  ViewController.m
//  DemoApp-Objc
//
//  Created by Asiapay on 11/12/19.
//  Copyright © 2019 Asiapay. All rights reserved.
//

#import "ViewController.h"
#import <AP_PaySDK/AP_PaySDK.h>
#import <AP_PaySDK/AP_PaySDK-Swift.h>
#import <Eureka/Eureka-umbrella.h>
@import AP_PaySDK;



@interface ViewController () <PaySDKDelegate> {
    PaySDK *paySDK;
    NSString *memberPayToken;
    PayGate *bb;
    CurrencyCode *bb1;
    BOOL isRamdom;
    UIActivityIndicatorView *activityView;
}
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
    
    NSString *merchantID = @"";
    
    paySDK.paymentDetails = [[PayData alloc] initWithChannelType:PayChannelWEBVIEW envType:EnvTypeSANDBOX amount:@"1.0" payGate:PayGatePAYDOLLAR currCode:CurrencyCodeHKD payType:payTypeNORMAL_PAYMENT orderRef:@"12345678" payMethod:@"CC" lang:LanguageENGLISH merchantId: merchantID remark:@"" payRef:@"" resultpage:@"" extraData:nil];

    [paySDK process];
}

-(void)paymentResultWithResult:(PayResult * _Nonnull)result {
    NSLog(@"%@", result.errMsg);
    NSLog(@"%@", result.successCode);
    NSLog(@"%@", result.maskedCardNo);
    NSLog(@"%@", result.ref);
    NSLog(@"%@", result.transactionTime);
    NSLog(@"%@", result.cardHolder);
}

- (void)showProgress {
//    loadView.startLoad()
}


- (void)hideProgress {
//    loadView.stopLoad()
}





@end

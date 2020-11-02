//
//  ViewController.m
//  ProObjc
//
//  Created by Priyanka  on 11/12/19.
//  Copyright © 2019 Asiapay. All rights reserved.
//

#import "ViewController.h"
#import <AP_PaySDK/AP_PaySDK.h>
#import <AP_PaySDK/AP_PaySDK-Swift.h>
#import "IQKeyboardManager.h"
@import AP_PaySDK;


@interface ViewController () <PaySDKDelegate, UITextFieldDelegate, UITextViewDelegate> {
    PaySDK *paySDK;
    NSString *memberPayToken;
    PayGate *bb;
    CurrencyCode *bb1;
    BOOL isRamdom;
    UIActivityIndicatorView *activityView;
    NSString *merchantId;
    NSString *resultPage;
    NSMutableDictionary *extraData;
    IBOutlet UITextField *mIdText;
    IBOutlet UITextField *cardNoText;
    IBOutlet UITextField *expMonthText;
    IBOutlet UITextField *expYearText;
    IBOutlet UITextField *securityCodeText;
    IBOutlet UITextField *amountText;
    IBOutlet UITextView *payResultTextvW;
    NSTimeInterval timeInSeconds;
    NSString *orderRef;
}

@end


@implementation ViewController {
    IQKeyboardReturnKeyHandler *returnKeyHandler;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    paySDK = [PaySDK shared];
    
    returnKeyHandler = [[IQKeyboardReturnKeyHandler alloc] initWithViewController:self];
    
    orderRef = [NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970] * 1000000000];
    
    [[IQKeyboardManager sharedManager] setToolbarManageBehaviour:IQAutoToolbarByPosition];
    
    UiCustomization *customization = [[UiCustomization alloc] init];
    
    ButtonCustomization *submitButtonCustomization = [[ButtonCustomization alloc] init:@"Courier" :@"#FF0000" :15 :@"#d3d3d3" :4];
    ButtonCustomization *resendButtonCustomization = [[ButtonCustomization alloc] init:@"Courier" :@"#FF0000" :15 :@"#d3d3d3" :4];
    ButtonCustomization *cancelButtonCustomization = [[ButtonCustomization alloc] init:@"Courier" :@"#FF0000" :15 :@"#d3d3d3" :4];
    ButtonCustomization *nextButtonCustomization = [[ButtonCustomization alloc] init:@"Courier" :@"#FF0000" :15 :@"#d3d3d3" :4];
    ButtonCustomization *continueButtonCustomization = [[ButtonCustomization alloc] init:@"Courier" :@"#FF0000" :15 :@"#d3d3d3" :4];
    
    LabelCustomization *labelCustomization = [[LabelCustomization alloc] init:@"Courier" :@"#FF0000" :14 :@"#FF0000":@"Courier" :20];
    TextBoxCustomization *textBoxCustomization = [[TextBoxCustomization alloc] init:@"Courier" :@"FF0000" :14 :4 :@"FF0000" :4];
    // ToolbarCustomization *toolbarCustomization = [[ToolbarCustomization alloc] init:@"Courier" :@"#FFFFFF" :20 :@"#000000" :@"Payment Page"];
    NSError *err;
    [customization setLabelCustomization:labelCustomization error:&err];
    [customization setButtonCustomization:submitButtonCustomization : PaySDKButtonTypeSUBMIT error:&err];
    [customization setButtonCustomization:resendButtonCustomization : PaySDKButtonTypeRESEND error:&err];
    [customization setButtonCustomization:cancelButtonCustomization : PaySDKButtonTypeCANCEL error:&err];
    [customization setButtonCustomization:nextButtonCustomization : PaySDKButtonTypeNEXT error:&err];
    [customization setButtonCustomization:continueButtonCustomization : PaySDKButtonTypeCONTINUE error:&err];
    
    [customization setLabelCustomization:labelCustomization error:&err];
    [customization setTextBoxCustomization:textBoxCustomization error:&err];
    //[customization setToolbarCustomization:toolbarCustomization error:&err];
    [paySDK setUiCustomization:customization];
    
    paySDK.delegate = self;
    paySDK.isBioMetricRequired = YES;
    merchantId = mIdText.text;
    
}


- (IBAction)FPSClick:(id)sender{
    NSDictionary *dic = @{@"fpsQueryUrl" : @"https://fps.paydollar.com/api/fpsQrUrl?encrypted="};
    extraData = [[NSMutableDictionary alloc] initWithDictionary: dic];
    
    paySDK.paymentDetails = [[PayData alloc] initWithChannelType:PayChannelDIRECT envType:EnvTypeSANDBOX amount:@"0.1" payGate:PayGatePAYDOLLAR currCode:CurrencyCodeHKD payType:payTypeNORMAL_PAYMENT orderRef:orderRef payMethod:@"FPS" lang:LanguageENGLISH merchantId: merchantId remark:@"" payRef:@"" resultpage:resultPage extraData:extraData];
    
    [paySDK process];
}


-(void)paymentResultWithResult:(PayResult * _Nonnull)result {
    NSString *resultString = [NSString stringWithFormat:@"amount - %@ \nsuccessCode - %@ \nmaskedCardNo - %@ \nauthId - %@ \ncardHolder - %@ \ncurrencyCode - %@ \nerrMsg - %@ \nord - %@ \npayRef - %@ \nprc - %@ \nref - %@ \nsrc - %@ \ntransactionTime - %@ \ndescriptionStr - %@", result.amount,result.successCode,result.maskedCardNo,result.authId,result.cardHolder,result.currencyCode,result.errMsg,result.ord,result.payRef,result.prc,result.ref,result.src,result.transactionTime,result.descriptionStr];
    payResultTextvW.text = resultString;
    
    NSLog(@"%@", result.errMsg);
    NSLog(@"%@", result.successCode);
    NSLog(@"%@", result.maskedCardNo);
    NSLog(@"%@", result.ref);
    NSLog(@"%@", result.transactionTime);
    NSLog(@"%@", result.cardHolder);
}

- (void)showProgress {
    
}


- (void)hideProgress {
   
}

- (void)payMethodOptionsWithMethod:(PaymentOptionsDetail * _Nonnull)method {
    NSLog(@"%@", method);
}


- (void)transQueryResultsWithResult:(TransQueryResults * _Nonnull)result {
    NSLog(@"%@", result);
}



#pragma mark - textField Delegate

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == mIdText) {
        
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    
}


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == mIdText) {
       
    }
    
    return YES;
}

#pragma mark - textView Delegate
-(void)textViewDidBeginEditing:(UITextView *)textView {
    BOOL isResignedFirstResponder = [self resignFirstResponder];
    
    if (isResignedFirstResponder == YES )
    {
       
    }
}
/**     doneAction. Resigning current textField. */
-(void)doneAction:(IQBarButtonItem*)barButton
{
    
    BOOL isResignedFirstResponder = [self resignFirstResponder];
    
    if (isResignedFirstResponder == YES && barButton.invocation)
    {
        [barButton.invocation invoke];
    }
}


@end




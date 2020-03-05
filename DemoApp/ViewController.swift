//
//  ViewController.swift
//  DemoApp
//
//  Created by Vaibhav on 05/03/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import UIKit
import AP_PaySDK

class ViewController: UIViewController {
    
    let paySDK = PaySDK.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paySDK.delegate = self
        paySDK.useSDKProgressScreen = true
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pay(_ sender: Any?) {
        paySDK.paymentDetails = PayData(channelType: .DIRECT,
                                        envType: .SANDBOX,
                                        amount : "10",
                                        payGate: .PAYDOLLAR,
                                        currCode: .HKD,
                                        payType: .NORMAL_PAYMENT,
                                        orderRef: "abcde12345",
                                        payMethod: "VISA",
                                        lang: .ENGLISH,
                                        merchantId: "1",
                                        remark: "",
                                        extraData :[:])
        paySDK.paymentDetails.cardDetails = CardDetails(cardHolderName: "abc abc",
                                                        cardNo: "1234567890123456",
                                                        expMonth: "12",
                                                        expYear: "2022",
                                                        securityCode: "123")
        paySDK.process()
        
    }
}


extension ViewController: PaySDKDelegate {
    func paymentResult(result: PayResult) {
        
    }
}

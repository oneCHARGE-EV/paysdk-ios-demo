//
//  ViewController.swift
//  ProSwift
//
//  Created by Asiapay on 11/12/19.
//  Copyright © 2019 Asiapay. All rights reserved.
//

import UIKit
import AP_PaySDK
import Eureka
import NVActivityIndicatorView


class ViewController: FormViewController {
    var paySDK = PaySDK.shared
    var form1 : Form?
    var memberPayToken = ""
    var payGateForPG : PayGate?
    var currCode : CurrencyCode?
    var isUIRamdom : Bool =     false
    var isLoaderRamdom : Bool = false
    var VASService : String = ""
    let loadview = LoadingView()
    var VASData : [String : Any]?
    var threeDSParams : ThreeDSParams?
    var payref: String = ""
    var resultPage: String = "F"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SDK Version: \(paySDK.getSDKVersion())")
        let customization = UiCustomization()
        
        let submitButtonCustomization = ButtonCustomization("Courier", "#FF0000", 15, "#d3d3d3", 4)
        let resendButtonCustomization = ButtonCustomization("Courier", "#FF0000", 15, "#d3d3d3", 4)
        let cancelButtonCustomization = ButtonCustomization("Courier", "#FF0000", 15, "#d3d3d3", 4)
        let nextButtonCustomization = ButtonCustomization("Courier", "#FF0000", 15, "#d3d3d3", 4)
        let continueButtonCustomization = ButtonCustomization("Courier", "#FF0000", 15, "#d3d3d3", 4)
        let labelCustomization = LabelCustomization("Courier", "FF0000", 14, "FF0000", "Courier", 20)
        let textboxCustomization = TextBoxCustomization("Courier", "#FF0000", 14, 5, "#d3d3d3", 4)
        let toolBarCustomization = ToolbarCustomization("Courier", "#FFFFFF", 20, "#000000", "")
        
        try! customization.setButtonCustomization(submitButtonCustomization, .SUBMIT)
        try! customization.setButtonCustomization(resendButtonCustomization, .RESEND)
        try! customization.setButtonCustomization(cancelButtonCustomization, .CANCEL)
        try! customization.setButtonCustomization(nextButtonCustomization, .NEXT)
        try! customization.setButtonCustomization(continueButtonCustomization, .CONTINUE)
        try! customization.setLabelCustomization(labelCustomization)
        try! customization.setTextBoxCustomization(textboxCustomization)
        try! customization.setToolbarCustomization(toolBarCustomization)
        paySDK.uiCustomization = customization
        paySDK.delegate = self
        paySDK.isBioMetricRequired = false
        paySDK.useSDKProgressScreen = true
        let serialGroup = DispatchGroup()
        //self.paySDK.setPublicKey(str: "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArvxLT052VCC+QgQzh3SHuwMtD6qW4FG0pC8BLumsqZPZ6vV3cRx3np44sSbA5lllXtbIzodvc9T2sYdLQDpFG3I7IdhxE4XG05xSOQCeht7uz+s8DMlYJJjzJV2hBNEdNtjFkA2JYoxoBzsjIBTj4kTwFSZBVZCfq6HvuOGpKjzqsHkQXlXya5xzIBLjYduc5RBnuyHIeeQiSsuI2leg+RmQsUt84ykmrpTEpoPID0/vBwtHIilpUCGz88vwgN5SHTRTqG5naGjLR59pebYauKPuKRx7GYqGMbaXi8JYN7UdsipW9qCXY1b27Lq9ESVpbIgp85nLY66ISsKcmpheIwIDAQAB")
        self.currCode = CurrencyCode.HKD
        form1 =  form +++ Section("payment details")
            <<< SegmentedRow<String>() { row in
                row.options = ["PAYDOLLAR","PESOPAY","SIAMPAY"]
                row.value = "PAYDOLLAR"
            }
            <<< TextRow() { row in
                row.title = "merchant id"
                row.placeholder = "Enter text here"
                row.value = "88618350"
            }
            <<< TextRow() { row in
                row.title = "orderRef"
                row.placeholder = "Enter text here"
            }
            <<< PhoneRow() {
                $0.title = "card number"
                $0.placeholder = "And numbers here"
                $0.value = "4012000000020084"
                $0.value = "4012000000020086"
            }
            <<< TextRow() { row in
                row.title = "card holder"
                row.placeholder = "Enter text here"
                row.value = "first last"
            }
            <<< PhoneRow() {
                $0.title = "exp month"
                $0.placeholder = "And numbers here"
                $0.value = "07"
            }
            <<< PhoneRow() {
                $0.title = "exp year"
                $0.placeholder = "And numbers here"
                $0.value = "2030"
            }
            <<< PhoneRow() {
                $0.title = "amount"
                $0.placeholder = "And numbers here"
                $0.value = "1"
            }
            <<< PasswordRow() {
                $0.title = "security code"
                $0.placeholder = "And numbers here"
                $0.value = "123"
            }
            <<< PickerInputRow<String>("Picker Input Row1") {
                $0.title = "Currency"
                $0.options = ["HKD","RMB","USD","SGD","CNY","YEN","JPY","TWD","AUD","EUR","GBP","CAD","MOP","PHP","THB","IDR","BND","MYR","BRL","INR","TRY","ZAR","VND","LKR","KWD","NZD"]
                $0.value = $0.options.first
                
            }.onChange({ (str) in
                switch str.value {
                case "HKD" :   self.currCode = CurrencyCode.HKD
                case "USD" :   self.currCode = CurrencyCode.USD
                case "SGD" :   self.currCode = CurrencyCode.SGD
                case "RMB" , "CNY" :   self.currCode = CurrencyCode.RMB
                case "YEN" , "JPY" :   self.currCode = CurrencyCode.JPY
                case "TWD" :   self.currCode = CurrencyCode.TWD
                case "AUD" :   self.currCode = CurrencyCode.AUD
                case "EUR" :   self.currCode = CurrencyCode.EUR
                case "GBP" :   self.currCode = CurrencyCode.GBP
                case "CAD" :   self.currCode = CurrencyCode.CAD
                case "MOP" :   self.currCode = CurrencyCode.MOP
                case "PHP" :   self.currCode = CurrencyCode.PHP
                case "THB" :   self.currCode = CurrencyCode.THB
                case "IDR" :   self.currCode = CurrencyCode.IDR
                case "BND" :   self.currCode = CurrencyCode.BND
                case "MYR" :   self.currCode = CurrencyCode.MYR
                case "BRL" :   self.currCode = CurrencyCode.BRL
                case "INR" :   self.currCode = CurrencyCode.INR
                case "TRY" :   self.currCode = CurrencyCode.TRY
                case "ZAR" :   self.currCode = CurrencyCode.ZAR
                case "VND" :   self.currCode = CurrencyCode.VND
                case "LKR" :   self.currCode = CurrencyCode.LKR
                case "KWD" :   self.currCode = CurrencyCode.KWD
                case "NZD" :   self.currCode = CurrencyCode.NZD
                case .none:    self.currCode = CurrencyCode.HKD
                    
                case .some(_): break
                    
                }
            })
            <<< SegmentedRow<String>() { row in
                row.options = ["BioMetric","Non-BioMetric"]
                row.value = "Non-BioMetric"
            }
            <<< TextAreaRow() { row in
                row.value = ""
                row.disabled = true
            }
            <<< ButtonRow() { (row: ButtonRow) in
                row.title = "FPS"
                }.onCellSelection({ (str, row) in
                    self.processFPS(sender: "FPS")
                })
        serialGroup.notify(queue: DispatchQueue.main) {

           print("All Groups request completed.....")

        }
        print("1: ",form1?.allSections[0][1].title as? String)
        print("2: ",form1?.allSections[0][2].title as? String)
        print("3: ",form1?.allSections[0][3].title as? String)
        print("4: ",form1?.allSections[0][4].title as? String)
        print("5: ",form1?.allSections[0][5].title as? String)
        print("6: ",form1?.allSections[0][6].title as? String)
        print("7: ",form1?.allSections[0][7].title as? String)
        print("8: ",form1?.allSections[0][8].title as? String)
        print("9: ",form1?.allSections[0][9].title as? String)
        print("10: ",form1?.allSections[0][10].title as? String)
        print("11: ",form1?.allSections[0][11].title as? String)
    }
    
    
    func toJson(result: PayResult) -> String {
        let dic = [
            "amount":result.amount,
            "successCode":result.successCode,
            "maskedCardNo":result.maskedCardNo,
            "authId":result.authId,
            "cardHolder":result.cardHolder,
            "currencyCode":result.currencyCode,
            "errMsg":result.errMsg,
            "ord":result.ord,
            "payRef":result.payRef,
            "prc":result.prc,
            "ref":result.ref,
            "src":result.src,
            "transactionTime":result.transactionTime,
            "descriptionStr":result.descriptionStr
        ]
        let jsonData = try! JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
        let jsonStr = String(data: jsonData, encoding: String.Encoding.utf8)!
        return jsonStr
    }
    
    func toQueryJson(result: TransQueryResults) -> String {
        if result.detail != nil {
        let dic = [
            "amount":result.detail?[0].amt,
            "successCode":result.detail?[0].successcode,
            "ipCountry":result.detail![0].ipCountry,
            "authId":result.detail![0].authId,
            "cardIssuingCountry":result.detail![0].cardIssuingCountry,
            "currencyCode":result.detail![0].cur,
            "errMsg":result.detail![0].errMsg,
            "ord":result.detail![0].ord,
            "payRef":result.detail![0].payRef,
            "prc":result.detail![0].prc,
            "ref":result.detail![0].ref,
            "src":result.detail![0].src,
            "transactionTime":result.detail![0].txTime,
            "descriptionStr":result.detail![0].description
        ]
        let jsonData = try! JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
        let jsonStr = String(data: jsonData, encoding: String.Encoding.utf8)!
            return jsonStr
        }
        return ""
    }
    
    func toPayMethodJson(result: PaymentOptionsDetail) -> String {
        let dic = [
            "card":result.methods.card[0],
            "netbanking":result.methods.netbanking[0],
            "other": result.methods.other[0]
        ]
        let jsonData = try! JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
        let jsonStr = String(data: jsonData, encoding: String.Encoding.utf8)!
        return jsonStr
    }
    
    
    
    @IBAction func  processFPS(sender: String) {
        var extraData = getValues()
        if sender == "FPS" {
            extraData = ["fpsQueryUrl" : "https://fps.paydollar.com/api/fpsQrUrl?encrypted="]
        } else {
            extraData = [:]
        }
        paySDK.paymentDetails = PayData(channelType: PayChannel.DIRECT,
                                        envType: EnvType.PRODUCTION,
                                        amount : (form1?.allSections[0][7].baseValue as? String) ?? "",
                                        payGate: payGateForPG!,
                                        currCode: currCode!,
                                        payType: payType.NORMAL_PAYMENT,
                                        orderRef: (form1?.allSections[0][2].baseValue as? String) ?? "",
                                        payMethod: sender,
                                        lang: Language.ENGLISH,
                                        merchantId: (form1?.allSections[0][1].baseValue as? String) ?? "",
                                        remark: "",
                                        payRef: "",
                                        resultpage: resultPage,
                                        extraData :  extraData)

        paySDK.process()
    }
    
    
    func getValues() -> [String: Any] {
        if isUIRamdom == true {
            let customization = UiCustomization()
            let family = UIFont.familyNames.randomElement()
            let fontName = UIFont.fontNames(forFamilyName: family!).randomElement()
            let colorArr = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"]
            let color1 = "#" + colorArr.randomElement()! + colorArr.randomElement()! + colorArr.randomElement()! + colorArr.randomElement()! + colorArr.randomElement()! + colorArr.randomElement()!
            let color2 = "#" + colorArr.randomElement()! + colorArr.randomElement()! + colorArr.randomElement()! + colorArr.randomElement()! + colorArr.randomElement()! + colorArr.randomElement()!
            let intNum1 = Int.random(in: 8 ..< 17)
            let intNum2 = Int.random(in: 3 ..< 8)
            let intNum3 = Int.random(in: 17 ..< 25)
            
            do {
                let submitButtonCustomization =     ButtonCustomization(fontName!, color1, intNum1, color2, intNum2)
                let resendButtonCustomization =     ButtonCustomization(fontName!, color1, intNum1, color2, intNum2)
                let cancelButtonCustomization =     ButtonCustomization(fontName!, color1, intNum1, color2, intNum2)
                let nextButtonCustomization =       ButtonCustomization(fontName!, color1, intNum1, color2, intNum2)
                let continueButtonCustomization =   ButtonCustomization(fontName!, color1, intNum1, color2, intNum2)
                let labelCustomization =            LabelCustomization.init(fontName!, color1, intNum1, color2, fontName!, intNum3)
                let textboxCustomization =          TextBoxCustomization(fontName!, color1, intNum1, intNum2, color2, intNum2)
                let toolBarCustomization =          ToolbarCustomization(fontName!, color1, intNum3, color2, "Secure Checkout")
                
                try customization.setButtonCustomization(submitButtonCustomization, .SUBMIT)
                try customization.setButtonCustomization(resendButtonCustomization, .RESEND)
                try customization.setButtonCustomization(cancelButtonCustomization, .CANCEL)
                try customization.setButtonCustomization(nextButtonCustomization, .NEXT)
                try customization.setButtonCustomization(continueButtonCustomization, .CONTINUE)
                try customization.setLabelCustomization(labelCustomization)
                try customization.setTextBoxCustomization(textboxCustomization)
                try customization.setToolbarCustomization(toolBarCustomization)
            } catch _ {
                
            }
            paySDK.uiCustomization = customization
        }
        
        let aa = form1?.allSections[0][11] as! TextAreaRow
        aa.value = ""
        aa.reload()
        let aa1 = form1?.allSections[0][2] as! TextRow
        aa1.value = String(format: "%.0f", NSDate().timeIntervalSince1970 * 1000)
        aa1.reload()
        var extraData = [String: Any]()
        if self.VASService == "Installment Pay" || self.VASService == "Schedule Pay" || self.VASService == "Promo Pay" || self.VASService == "New Member Pay" || self.VASService == "Old Member Pay" {
            extraData = VASData!
        } else if self.VASService == "EVoucher" {
            extraData = VASData!
        }
        else if  self.VASService == "TRANS QUERY" {
            extraData = VASData!
        }

        switch (form1?.allSections[0][0].baseValue as? String) ?? "" {
        case "PAYDOLLAR": payGateForPG = PayGate.PAYDOLLAR
            break
        case "PESOPAY": payGateForPG = PayGate.PESOPAY
            break
        case "SIAMPAY": payGateForPG = PayGate.SIAMPAY
            break
        default: payGateForPG = PayGate.PAYDOLLAR
            break
        }
        switch (form1?.allSections[0][10].baseValue as? String) ?? "" {
        //"BioMetric","Non-BioMetric"
        case "BioMetric": paySDK.isBioMetricRequired = true
        //bb = PayGate.PAYDOLLAR
            break
        case "Non-BioMetric": paySDK.isBioMetricRequired = false
        //bb = PayGate.PESOPAY
            break
        default: paySDK.isBioMetricRequired = false
        //bb = PayGate.PAYDOLLAR
            break
        }
        return extraData
    }
    
    @IBAction func merchantLoaderUsage(_ sender: UIBarButtonItem) {
        isLoaderRamdom = !isLoaderRamdom
        if isLoaderRamdom == false {
            sender.title = "Merchant Loader : OFF"
            paySDK.useSDKProgressScreen = true
        } else {
            sender.title = "Merchant Loader : ON"
            paySDK.useSDKProgressScreen = false
        }
    }
}


extension ViewController : PaySDKDelegate {
    func transQueryResults(result: TransQueryResults) {
        print(self.toQueryJson(result: result))
        let aa = form1?.allSections[0][11] as! TextAreaRow
        aa.value = self.toQueryJson(result: result)
        aa.reload()
    }
    
    func payMethodOptions(method: PaymentOptionsDetail) {
        print(self.toPayMethodJson(result: method))
        let aa = form1?.allSections[0][11] as! TextAreaRow
        aa.value = self.toPayMethodJson(result: method)
        aa.reload()
    }
    
    
    func paymentResult(result: PayResult) {
        print(self.toJson(result: result))
        let aa = form1?.allSections[0][11] as! TextAreaRow
        aa.value = self.toJson(result: result)
        aa.reload()
    }
    
    func showProgress() {
        loadview.startLoad()
    }
    
    
    func hideProgress() {
        loadview.stopLoad()
    }
    
    
    
    func setMerchantInfoImg() -> UIImage? {
        return #imageLiteral(resourceName: "img.png")
    }
    
    func setMerchantInfoScreen() -> UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: classForCoder))
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        return viewController
    }
    
    func setMerchantInfo() -> String? {
        return "https://m.alibaba.com"
    }
}


class LoadingView: UIViewController ,NVActivityIndicatorViewable {
    
    func startLoad() {
        let size = CGSize(width: self.view.frame.width/5, height: self.view.frame.width/5)
        let arr = [NVActivityIndicatorType.ballPulse, NVActivityIndicatorType.ballGridPulse, NVActivityIndicatorType.ballClipRotate, NVActivityIndicatorType.squareSpin, NVActivityIndicatorType.ballClipRotatePulse, NVActivityIndicatorType.ballClipRotateMultiple, NVActivityIndicatorType.ballPulseRise, NVActivityIndicatorType.ballRotate, NVActivityIndicatorType.cubeTransition, NVActivityIndicatorType.ballZigZag, NVActivityIndicatorType.ballZigZagDeflect, NVActivityIndicatorType.ballTrianglePath, NVActivityIndicatorType.ballScale, NVActivityIndicatorType.lineScale, NVActivityIndicatorType.lineScaleParty, NVActivityIndicatorType.ballScaleMultiple, NVActivityIndicatorType.ballPulseSync, NVActivityIndicatorType.ballBeat, NVActivityIndicatorType.ballDoubleBounce, NVActivityIndicatorType.lineScalePulseOut, NVActivityIndicatorType.lineScalePulseOutRapid, NVActivityIndicatorType.ballScaleRipple, NVActivityIndicatorType.ballScaleRippleMultiple, NVActivityIndicatorType.ballSpinFadeLoader, NVActivityIndicatorType.lineSpinFadeLoader, NVActivityIndicatorType.triangleSkewSpin, NVActivityIndicatorType.pacman, NVActivityIndicatorType.semiCircleSpin, NVActivityIndicatorType.ballRotateChase, NVActivityIndicatorType.orbit, NVActivityIndicatorType.audioEqualizer, NVActivityIndicatorType.circleStrokeSpin]
        startAnimating(size, message: "",messageFont: nil,type: arr.randomElement())
    }
    
    
    func stopLoad() {
        stopAnimating()
    }
}


class ViewController2: UIViewController {
    override func viewDidLoad() {
        
    }
}



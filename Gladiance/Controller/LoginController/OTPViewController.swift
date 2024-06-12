//
//  OTPViewController.swift
//  Gladiance
//
//  Created by D2019PRO on 25/04/24.
//

import Foundation
import SwiftUI

class OTPViewController:UIViewController, UITextFieldDelegate {
    
    @IBOutlet var otpFields: [UITextField]!
    
    @IBOutlet weak var verifyBtn: UIButton!
    @IBOutlet weak var resendOTPbtn: UIButton!
    var otp = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer!.delegate = self;

        buttonSetup()
        // Assign delegates to text fields
        for field in otpFields {
            field.delegate = self
            field.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        }
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let maxLength = 1
        if let text = textField.text, text.count > maxLength {
            textField.text = String(text.prefix(maxLength))
        }
        
        // Move to the next text field or submit OTP when all fields are filled
        if let index = otpFields.firstIndex(of: textField), index < otpFields.count - 1 {
            otpFields[index + 1].becomeFirstResponder()
        } else {
            // All OTP fields are filled, submit OTP for verification
            submitOTP()
        }
    }
    
    func submitOTP() {
        otp = ""
        
        for field in otpFields {
            if let text = field.text {
                otp += text
            }
        }
        print("Submitted OTP: \(otp)")
        // Here you can perform the verification logic
    }
    
    
    @IBAction func resendotpbtnClicked(_ sender: Any) {
    }
    
    @IBAction func verifyBtnClicked(_ sender: Any) {
        if otp == "1234"{
            
            if let secondVC = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
                present(secondVC, animated: true, completion: nil)
            }
        }else{
            otp = ""
            clearAllTextFieldsAndFocusOnFirst()
            showAlert(message: "OTP did not match.")
            
        }
    }
    
    func buttonSetup(){
        let attString: NSMutableAttributedString = NSMutableAttributedString(string: "haven't recieved the code? Resend here")
        attString.setColorForText(textToFind: "haven't recieved the code?", withColor: UIColor.white)
        attString.setColorForText(textToFind: " Resend here", withColor: UIColor(named: "FontRedColor")!)
        attString.addAttribute(.font, value: UIFont.systemFont(ofSize: 12), range: NSRange(location: 0, length: attString.length))
        resendOTPbtn.setAttributedTitle(attString, for: .normal)
        
        
    }
   
    
    
    func clearAllTextFieldsAndFocusOnFirst() {
        for subview in otpFields {
            subview.text = ""
        }
        otpFields[0].becomeFirstResponder()
        
    }
    
}

//
//  signupViewController.swift
//  Gladiance
//
//  Created by D2019PRO on 25/04/24.
//

import Foundation
import SwiftUI

class signupViewController:UIViewController{
    
    @IBOutlet weak var btnSignin: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnAgreement: UIButton!
    override func viewDidLoad() {
        
        buttonSetup()
    }
    @IBAction func signInbtnClicked(_ sender: Any) {
        print("Sign in button clicked")
        dismiss(animated: true)
    }
    @IBAction func sendOTPClicked(_ sender: Any) {
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "OTPViewController") as? OTPViewController {
            present(secondVC, animated: true, completion: nil)
        }
    }
    func buttonSetup(){
        let attString: NSMutableAttributedString = NSMutableAttributedString(string: "I agree Privacy Policy & User Agreemnet")
        attString.setColorForText(textToFind: "I agree", withColor: UIColor.white)
        attString.setColorForText(textToFind: "Privacy Policy", withColor: UIColor(named: "FontRedColor")!)
        attString.setColorForText(textToFind: "&", withColor: UIColor.white)
        attString.setColorForText(textToFind: "User Agreemnet",withColor: UIColor(named: "FontRedColor")!)
        attString.addAttribute(.font, value: UIFont.systemFont(ofSize: 12), range: NSRange(location: 0, length: attString.length))
        btnAgreement.setAttributedTitle(attString, for: .normal)
        
        let attString1: NSMutableAttributedString = NSMutableAttributedString(string: "Already have an account? Login")
        attString1.setColorForText(textToFind: "Already have an account?", withColor: UIColor.white)
        attString1.setColorForText(textToFind: "Login", withColor: UIColor(named: "FontRedColor")!)
        attString1.addAttribute(.font, value: UIFont.systemFont(ofSize: 12), range: NSRange(location: 0, length: attString1.length))
        btnSignin.setAttributedTitle(attString1, for: .normal)
    }
}




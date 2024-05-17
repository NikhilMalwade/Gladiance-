//
//  LoginViewController.swift
//  Gladiance
//
//  Created by D2019PRO on 23/04/24.
//

import Foundation
import UIKit

class LoginViewController:UIViewController{
    
    @IBOutlet weak var pswdTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    
    @IBOutlet weak var googleBtn: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnForgotPswd: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnAgreement: UIButton!
  

    override func viewDidLoad() {
        buttonSetup()
        hideKeyboardWhenTappedAround()

    }
    func ApiCall(){
        ApiCaller.shared.loginApi(username: emailTxtField.text!, password: pswdTxtField.text!) { [self] (result, error) in
            if let result = result
            {
                print("success: \(result)")
                print(result["LoginToken"]!)
                DispatchQueue.main.async {
                    let vc = self.storyboard!.instantiateViewController(withIdentifier: "DemoViewController") as! DemoViewController
                    self.navigationController?.pushViewController(vc, animated:  true)

                }
            }
            else if let error = error {
                print("error: \(error.localizedDescription)")
            }
        }
    }
    
    
    
    @IBAction func googlebtnClicked(_ sender: Any) {
        if let url = URL(string: "https://www.google.com") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func signUpBtnClicked(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let secondVC = storyboard.instantiateViewController(withIdentifier: "signupViewController") as? signupViewController {
            present(secondVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func loginBtnClicked(_ sender: Any) {
        guard let username = emailTxtField.text, !username.isEmpty else {
            showAlert(message: "Please enter a username.")
            return
        }
        
        guard let password = pswdTxtField.text, !password.isEmpty else {
            showAlert(message: "Please enter a password.")
            return
        }
        ApiCall()


    }
    
    
    func buttonSetup(){
        let attString: NSMutableAttributedString = NSMutableAttributedString(string: "I agree Privacy Policy & User Agreemnet")
        attString.setColorForText(textToFind: "I agree", withColor: UIColor.white)
        attString.setColorForText(textToFind: "Privacy Policy", withColor: UIColor(named: "FontRedColor")!)
        attString.setColorForText(textToFind: "&", withColor: UIColor.white)
        attString.setColorForText(textToFind: "User Agreemnet",withColor: UIColor(named: "FontRedColor")!)
        attString.addAttribute(.font, value: UIFont.systemFont(ofSize: 12), range: NSRange(location: 0, length: attString.length))
        btnAgreement.setAttributedTitle(attString, for: .normal)
        
        let attString1: NSMutableAttributedString = NSMutableAttributedString(string: "Don't have an account? Sign Up")
        attString1.setColorForText(textToFind: "Don't have an account?", withColor: UIColor.white)
        attString1.setColorForText(textToFind: "Sign Up", withColor: UIColor(named: "FontRedColor")!)
        attString1.addAttribute(.font, value: UIFont.systemFont(ofSize: 12), range: NSRange(location: 0, length: attString1.length))
        btnSignUp.setAttributedTitle(attString1, for: .normal)
    }
}


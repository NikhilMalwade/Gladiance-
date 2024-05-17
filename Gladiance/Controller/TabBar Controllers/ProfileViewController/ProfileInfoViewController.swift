//
//  ProfileInfoViewController.swift
//  Gladiance
//
//  Created by Nikhil Malwade on 06/05/24.
//

import UIKit

class ProfileInfoViewController: UIViewController {

    @IBOutlet weak var shView: UIView!
    @IBOutlet weak var shView1: UIView!
    @IBOutlet weak var shView2: UIView!
    @IBOutlet weak var shView3: UIView!
    @IBOutlet weak var shView4: UIView!
    @IBOutlet weak var shView5: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Setup()
        // Do any additional setup after loading the view.
    }
    
    func Setup(){
        setRoundCornerToView(mnView: shView, radius: 15)
        setRoundCornerToView(mnView: shView1, radius: 10)
        setRoundCornerToView(mnView: shView2, radius: 10)
        setRoundCornerToView(mnView: shView3, radius: 10)
        setRoundCornerToView(mnView: shView4, radius: 10)
        setRoundCornerToView(mnView: shView5, radius: 10)
    }
    
    
    @IBAction func btnAction(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            let vc = storyboard?.instantiateViewController(identifier: "ChangePasswordViewController") as! ChangePasswordViewController
            navigationController?.pushViewController(vc, animated: true)
            print("Change Password clicked")
        case 1:
            print("Invite User clicked")
        case 2:
            let vc = storyboard?.instantiateViewController(identifier: "JoinUserViewController") as! JoinUserViewController
            navigationController?.pushViewController(vc, animated: true)
            print("Join user clicked")
        default:
            print("Logout")
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

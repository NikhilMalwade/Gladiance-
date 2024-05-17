//
//  ProfileHomeViewController.swift
//  Gladiance
//
//  Created by Nikhil Malwade on 02/05/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var shView: UIView!
    @IBOutlet weak var shView1: UIView!
    @IBOutlet weak var shView2: UIView!
    @IBOutlet weak var shView3: UIView!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhoneNo: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Setup()
        // Do any additional setup after loading the view.
    }
    
    func Setup(){
        setRoundCornerToView(mnView: shView, radius: 5)
        setRoundCornerToView(mnView: shView1, radius: 15)
        setRoundCornerToView(mnView: shView2, radius: 5)
        setRoundCornerToView(mnView: shView3, radius: 15)

    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            let vc = storyboard?.instantiateViewController(identifier: "ProfileInfoViewController") as! ProfileInfoViewController
            navigationController?.pushViewController(vc, animated: true)
            print("view More clicked")
        case 1:
            print("Create Project clicked")
        case 2:
            print("Automation clicked")
        case 3:
            print("Add Device clicked")
        case 4:
            print("Subscription clicked")
        case 5:
            print("3rd party clicked")
        case 6:
            print("help clicked")
        case 7:
            print("about us clicked")
        default:
            print("Setting")
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

//
//  PrivacyViewController.swift
//  Gladiance
//
//  Created by Nikhil Malwade on 02/05/24.
//

import UIKit

class PrivacyViewController: UIViewController {
    
    
    @IBOutlet weak var shview: UIView!
    @IBOutlet weak var btnName: UIButton!
    @IBOutlet weak var lblDNDActivate: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = " "

        setRoundCornerToView(mnView: shview, radius: 15)
        lblDNDActivate.text = "DND DEACTIVATED"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func PrivacySwitch(_ sender: Any) {
        if (sender as AnyObject).selectedSegmentIndex == 0 {
            lblDNDActivate.text = "DND DEACTIVATED"
        }else{
            lblDNDActivate.text = "DND ACTIVATED"
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

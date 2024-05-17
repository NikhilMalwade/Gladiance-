//
//  JoinUserViewController.swift
//  Gladiance
//
//  Created by Nikhil Malwade on 06/05/24.
//

import UIKit

class JoinUserViewController: UIViewController {
    @IBOutlet weak var shView: UIView!
    @IBOutlet weak var shView1: UIView!
    @IBOutlet weak var shView2: UIView!
    @IBOutlet weak var shView3: UIView!

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

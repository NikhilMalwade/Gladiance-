//
//  FanViewController.swift
//  Gladiance
//
//  Created by Nikhil Malwade on 17/05/24.
//

import UIKit

class FanViewController: UIViewController {

    
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var shMinusView: UIView!
    @IBOutlet weak var shPlusView: UIView!

    var min: Double = 0.0
    var max = 0.0

    @IBOutlet weak var lblCount: UILabel!
    let progressView1 = CircularProgressView(frame: CGRect(x: 0, y: 0, width: 200, height: 200), lineWidth: 15, rounded: false)
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupView()
        self.navigationController?.interactivePopGestureRecognizer!.delegate = self;

    }
    
    func SetupView(){
        lblCount.text = "\(0)"

        setRoundCornerToView(mnView: shMinusView, radius: shMinusView.frame.size.width/2)
        setRoundCornerToView(mnView: shPlusView, radius: shPlusView.frame.size.width/2)

        progressView1.progressColor = hexStringToUIColor(hex: "FE8E51")
        progressView1.trackColor = .white
        progressView.addSubview(progressView1)
        progressView1.progress = min
    }
    
    func lblControl(){
        if min == 0{
            lblCount.text = "\(0)"
        }else if min == 0.2{
            lblCount.text = "\(1)"
        }else if min == 0.4{
            lblCount.text = "\(2)"
        }else if min == 0.6{
            lblCount.text = "\(3)"
        }else if min == 0.8{
            lblCount.text = "\(4)"
        }else {
            lblCount.text = "\(5)"
        }
    }
  
    @IBAction func FanSwitch(_ sender: Any) {
    }
    
    @IBAction func btnFanControll(_ sender: UIButton) {
       
        switch sender.tag {
         
        case 0:
            if min != 0.0{
                progressView1.progress = (min - 0.2)
                min = (min - 0.2).rounded(toPlaces: 3)
                lblControl()
            }else{
                min = 0.0
                lblCount.text = "\(0)"
                lblControl()
            }
            print(min)
        default:
            if min != 1.0{
                progressView1.progress = (min + 0.2)
                min = (min + 0.2).rounded(toPlaces: 3)
                lblControl()
            }else{
                min = 1.0
                lblCount.text = "\(5)"
                lblControl()
            }
            print(min)


        }
    }
}

//
//  CoveViewController.swift
//  Gladiance
//
//  Created by Nikhil Malwade on 31/05/24.
//

import UIKit

class CoveViewController: UIViewController {

    
    @IBOutlet weak var imgLights: UIImageView!
    
    @IBOutlet weak var lblDimmer: UILabel!
    
    var switchOn = Bool()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = false        
        self.navigationController?.interactivePopGestureRecognizer!.delegate = self;

    }
    
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0{
            switchOn = false
            print("off")
        }else{
            switchOn = true
            print("on")
        }
    }
    
    
    @IBAction func sliderDimmer(_ sender: UISlider) {

            let sliderValue = Int(sender.value)
        lblDimmer.text = "\(sliderValue)"
            
            if 0 ... 24 ~= sliderValue{
                print("0-24")
                imgLights.image = nil
            }else if 25 ... 49 ~= sliderValue {
                print("25-49")
                imgLights.image = UIImage(named: "Group 604")

            }else if 50 ... 74 ~= sliderValue {
                print("50-74")
                imgLights.image = UIImage(named: "Group 604-1")

            }else{
                imgLights.image = UIImage(named: "Group 604-2")

                print("75-100")
            }


    }
    


}

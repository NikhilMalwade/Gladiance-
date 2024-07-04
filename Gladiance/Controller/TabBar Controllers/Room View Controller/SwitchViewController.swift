//
//  SwitchViewController.swift
//  Gladiance
//
//  Created by Nikhil Malwade on 12/06/24.
//

import UIKit

class SwitchViewController: UIViewController {

    
    @IBOutlet weak var homeCollectionView: UICollectionView!

    var selected = false
    
    var gAAProjectSpaceTypePlannedDeviceName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeCollectionView.register(UINib(nibName: "HomeTabCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeTabCollectionViewCell")
        self.navigationController?.isNavigationBarHidden = false

        
        // Do any additional setup after loading the view.
        
    }
   

}
extension SwitchViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeTabCollectionViewCell", for: indexPath) as! HomeTabCollectionViewCell
        cell.shView.backgroundColor = GreyColour
        cell.lblTabName.text = gAAProjectSpaceTypePlannedDeviceName
        if selected {
            cell.shView.backgroundColor = .orange
        }
        else{
            cell.shView.backgroundColor = GreyColour

        }
        
        
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == homeCollectionView  {
            
            let screenWidth = homeCollectionView.bounds.width - 15
            let scaleFactor = (screenWidth / 2)
            
            return CGSize(width: scaleFactor, height: scaleFactor)
        }
        return CGSize(width: homeCollectionView.frame.width, height: homeCollectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("")
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeTabCollectionViewCell", for: indexPath) as! HomeTabCollectionViewCell
        homeCollectionView.reloadData()

        if selected{
            selected = false
        }else
        {
            selected = true
        }
    }
    
}


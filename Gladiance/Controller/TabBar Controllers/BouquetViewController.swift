//
//  BouquetViewController.swift
//  Gladiance
//
//  Created by Nikhil Malwade on 02/05/24.
//

import UIKit

class BouquetViewController: UIViewController {
    
    @IBOutlet weak var shview: UIView!
    @IBOutlet weak var btnName: UIButton!
    @IBOutlet weak var CollectionView: UICollectionView!
    
    let arr = ["Housekeeping","Room Service","Laundry","Bill View","Feedback","Hotel Info","Promotion","Messaging","Door Camera","Emergency","Door Camera","Security"]
    var logoImage: [UIImage] = [
        UIImage(named: "home")!,
        UIImage(named: "food-service")!,
        UIImage(named: "laundry-service")!,
        UIImage(named: "bill")!,
        UIImage(named: "feedback")!,
        UIImage(named: "info")!,
        UIImage(named: "megaphone")!,
        UIImage(named: "conversation")!,
        UIImage(named: "door-camera")!,
        UIImage(named: "response")!,
        UIImage(named: "door-camera")!,
        UIImage(named: "shield")!
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tabBarController?.navigationItem.hidesBackButton = true

        setRoundCornerToView(mnView: shview, radius: 15)
        setup()
        // Do any additional setup after loading the view.
    }
    func setup(){
        CollectionView.register(UINib(nibName: "HomeTabCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeTabCollectionViewCell")
        
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

extension BouquetViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "HomeTabCollectionViewCell", for: indexPath) as! HomeTabCollectionViewCell
        cell.mnView.backgroundColor = UIColor(hexString: "#222222")
        cell.lblTabName.text = arr[indexPath.row]
        cell.img.image = logoImage[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = CollectionView.bounds.width - 15
        let scaleFactor = (screenWidth / 2)
        
        return CGSize(width: scaleFactor, height: scaleFactor)
    }
    
}

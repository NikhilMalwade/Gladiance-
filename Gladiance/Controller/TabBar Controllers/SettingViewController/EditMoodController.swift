//
//  EditMoodController.swift
//  Gladiance
//
//  Created by D2019PRO on 27/06/24.
//

import Foundation
import UIKit

class EditMoodController:UIViewController{
    
    @IBOutlet weak var editMoodCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editMoodCollectionView.register(UINib(nibName: "CheckmarkCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CheckmarkCollectionViewCell")
        
    }
}

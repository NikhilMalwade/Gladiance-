//
//  TabsCollectionViewCell.swift
//  Gladiance
//
//  Created by Nikhil Malwade on 03/05/24.
//

import UIKit

class TabsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var shView: UIView!
    @IBOutlet weak var mnView: UIView!
    
    @IBOutlet weak var lblTabName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setShadowToView(shView: shView, mnView: mnView)
        setRoundCornerToView(mnView: mnView, radius: 5)
        
    }

}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 

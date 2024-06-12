//
//  HomeTabCollectionViewCell.swift
//  Gladiance
//
//  Created by Nikhil Malwade on 03/05/24.
//

import UIKit

class HomeTabCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var shView: UIView!
    @IBOutlet weak var mnView: UIView!
    
    @IBOutlet weak var lblTabName: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
       // setShadowToView(shView: shView, mnView: mnView)
        shView.backgroundColor = GreyColour
        setRoundCornerToView(mnView: mnView, radius: 5)
        setShadowToView(shView: shView, mnView: mnView)
    }

}

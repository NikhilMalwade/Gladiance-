//
//  CheckmarkCollectionViewCell.swift
//  Gladiance
//
//  Created by D2019PRO on 27/06/24.
//

import UIKit

class CheckmarkCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var shView: UIView!
    @IBOutlet weak var mnView: UIView!
    
    @IBOutlet weak var lblTabName: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var btnChecked: Checkbox!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
       // setShadowToView(shView: shView, mnView: mnView)
        shView.backgroundColor = GreyColour
        setRoundCornerToView(mnView: mnView, radius: 5)
        setShadowToView(shView: shView, mnView: mnView)
    }

}

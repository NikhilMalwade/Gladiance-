//
//  daysOfWeekCollectionViewCell.swift
//  Gladiance
//
//  Created by D2019PRO on 19/06/24.
//

import UIKit

class daysOfWeekCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var dayslbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//                contentView.layer.cornerRadius = 10
//                contentView.layer.borderWidth = 2
//                contentView.layer.borderColor = UIColor.white.cgColor
//                contentView.layer.masksToBounds = true
        
        // Default state
                contentView.backgroundColor = .clear
                dayslbl.textColor = .white
    }
    
    override var isSelected: Bool {
            didSet {
                if isSelected {
                    contentView.backgroundColor = .white
                    dayslbl.textColor = .black
                } else {
                    contentView.backgroundColor = .clear
                    dayslbl.textColor = .white
                }
            }
        }

}

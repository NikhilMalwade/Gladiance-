//
//  daysOfWeekCollectionViewCell.swift
//  Gladiance
//
//  Created by D2019PRO on 19/06/24.
//

import UIKit

class daysOfWeekCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var dayslbl: UILabel!
    @IBOutlet weak var shView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
                contentView.backgroundColor = .clear
                dayslbl.textColor = .white
    }
    
    override var isSelected: Bool {
            didSet {
                if isSelected {
                    shView.backgroundColor = .white
                    dayslbl.textColor = .black
                } else {
                    shView.backgroundColor = .clear
                    dayslbl.textColor = .white
                }
            }
        }

}

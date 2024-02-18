//
//  AwardCell.swift
//  DelAalque
//
//  Created by Anxi on 13/2/24.
//

import UIKit

class AwardCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var background: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        background.layer.cornerRadius = 20
    }
    
}

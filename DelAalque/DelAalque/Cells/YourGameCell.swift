//
//  YourGameCell.swift
//  DelAalque
//
//  Created by Anxi on 13/2/24.
//

import UIKit

class YourGameCell: UICollectionViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var users: UILabel!
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var continueGame: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

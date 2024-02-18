//
//  IntroduceDataCell.swift
//  DelAalque
//
//  Created by Anxi on 29/11/23.
//

import UIKit

class IntroduceDataCell: UITableViewCell {
    
    @IBOutlet weak var titleData: UILabel!
    @IBOutlet weak var introduceData: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

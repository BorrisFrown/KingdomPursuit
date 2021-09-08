//
//  UPPERROOMTableViewCell.swift
//  KingdomPursuit
//
//  Created by Forrest Brown on 9/3/21.
//

import UIKit

class UPPERROOMTableViewCell: UITableViewCell {
    
    @IBOutlet var upperroom:UIImageView!
    
    static let identifier = "UPPERROOMCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "UPPERROOMTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

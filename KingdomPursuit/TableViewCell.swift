//
//  TableViewCell.swift
//  KingdomPursuit
//
//  Created by Forrest Brown on 1/27/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "speakerCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
    
    public func configure(with title: String, imageName: String){
        label.text = title
        speakerImage.image = UIImage(named: imageName)
//        speakerImage.frame: CGRect
    }
    
    @IBOutlet var speakerImage: UIImageView!
    @IBOutlet var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

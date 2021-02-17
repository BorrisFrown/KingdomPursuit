//
//  MyCollectionViewCell.swift
//  KingdomPursuit
//
//  Created by Tyler Brown on 1/1/21.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    
    static let identifier = "MyCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
//    public func configure(with image: UIImage) {
//        imageView.image = image
//    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
}

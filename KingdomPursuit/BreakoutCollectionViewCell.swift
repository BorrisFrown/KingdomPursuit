//
//  BreakoutCollectionViewCell.swift
//  KingdomPursuit
//
//  Created by Forrest Brown on 9/17/21.
//

import UIKit

class BreakoutCollectionViewCell: UICollectionViewCell {
    static let identifier = "BreakoutCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Name"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        let images = [
            UIImage(named: "Stacey Campbell"),
            UIImage(named: "Steve Backlund"),
            UIImage(named: "Tom Crandall")
        ].compactMap({ $0 })
        imageView.image = images.randomElement()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height/3)
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //imageView.image = nil
    }
}

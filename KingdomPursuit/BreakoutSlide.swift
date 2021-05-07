//
//  BreakoutSlide.swift
//  KingdomPursuit
//
//  Created by Forrest Brown on 3/19/21.
//

import UIKit

class BreakoutSlide: UIView {

    
    @IBOutlet weak var imageView: UIImageView!
    
    public func configure(with pic: UIImage, imageFrame:UIImageView, view:UIView, pageControl:UIPageControl){
        
        let frameWidth = view.frame.width / 4
        let imageWidth = view.frame.width - frameWidth
        let imageHeight = view.frame.height * 4/7
        let imageY = view.frame.height / 10
        
        imageFrame.frame = CGRect(x: 0, y: imageY, width: frameWidth, height: imageHeight)
        imageView.image = pic
        imageView.frame = CGRect(x: frameWidth, y: imageY, width: imageWidth, height: imageHeight)
        imageView.contentMode = .scaleToFill
        
        pageControl.frame = CGRect(x: 0, y: imageY + imageHeight, width: view.frame.width, height: 20)
    }
    
    //Initialize
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

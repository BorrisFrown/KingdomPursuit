//
//  PeopleViewController.swift
//  KingdomPursuit
//
//  Created by Tyler Brown on 1/7/21.
//

import UIKit

class PeopleViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        title = name.uppercased()
        
        let screenWidth = UIScreen.main.bounds.width
        let imageDimen = screenWidth / 3
        let imageXPos = 10
        let nameLabel = UILabel(frame: view.bounds)
        let descLabel = UITextView(frame: view.bounds)
        let image = UIImage(named: name)
        let imageView = UIImageView(image: image)
        
        view.addSubview(nameLabel)
//        nameLabel.backgroundColor = #colorLiteral(red: 0.9820969875, green: 1, blue: 0.6141437519, alpha: 1)
        nameLabel.frame = CGRect(x: imageDimen + 10, y: imageDimen / 4, width: UIScreen.main.bounds.width - imageDimen - 10, height: imageDimen * 2 / 3)
        nameLabel.textAlignment = .center
        nameLabel.font = nameLabel.font.withSize(26)
        nameLabel.numberOfLines = -1
        nameLabel.text = name
        
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame = CGRect(x: CGFloat(imageXPos), y: CGFloat(imageXPos), width: imageDimen, height: imageDimen)
        imageView.layer.cornerRadius = imageDimen / 8
        
        view.addSubview(descLabel)
        descLabel.isEditable = false
        descLabel.frame = CGRect(x: 10, y: 20 + imageDimen, width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height)
        descLabel.font = UIFont.systemFont(ofSize: 20)
        descLabel.textAlignment = .natural
//        descLabel.numberOfLines = -1
        descLabel.text = desc
        descLabel.sizeToFit()
        
    }
    
    private let name: String
    private let desc: String
    
    init(name: String, desc: String){
        self.name = name
        self.desc = desc
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

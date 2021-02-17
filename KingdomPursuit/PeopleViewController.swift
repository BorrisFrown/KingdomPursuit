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
        let imageXPos = screenWidth / 2 - imageDimen / 2
        
        let nameLabel = UILabel(frame: view.bounds)
        let descLabel = UILabel(frame: view.bounds)
        let image = UIImage(named: name)
        let imageView = UIImageView(image: image)
        
        view.addSubview(nameLabel)
        nameLabel.backgroundColor = #colorLiteral(red: 0.9820969875, green: 1, blue: 0.6141437519, alpha: 1)
        nameLabel.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        nameLabel.textAlignment = .center
        nameLabel.font = nameLabel.font.withSize(30)
        nameLabel.numberOfLines = -1
        nameLabel.text = name
        
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame = CGRect(x: imageXPos, y: 60, width: imageDimen, height: imageDimen)
        imageView.layer.cornerRadius = imageDimen / 4
        
        view.addSubview(descLabel)
        descLabel.frame = CGRect(x: 10, y: 70 + imageDimen, width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height)
        descLabel.font = descLabel.font.withSize(18)
        descLabel.textAlignment = .natural
        descLabel.numberOfLines = -1
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

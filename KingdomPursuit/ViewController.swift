//  ViewController.swift
//  KingdomPursuit
//
//  Created by Tyler Brown on 12/16/20.
//

import UIKit

class MainController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

class PersonView: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = name
    }
}

//
//  BreakoutSpeakersView.swift
//  KingdomPursuit
//
//  Created by Forrest Brown on 3/26/21.
//

import Foundation
import UIKit

class BreakoutSpeakersView: UIViewController, UITableViewDelegate, UITableViewDataSource{
    let speakers = ["Mary Baker",
                    "Aaron Simmons",
                    "Micah Turnbo",
                    "Rusty Gevert"]
    let descriptions = ["Mary Baker and her husband, Jim, have 3 boys and are the Senior Leaders of Zion Christian Fellowship in Powell, Ohio. The church is marked by worship, a strong presence of God, healings, miracles, several dead raisings and a passion for personal and regional transformation. Mary also serves as the Worship Arts Pastor and is known for leading people to experience His presence in worship where healing, joy, freedom, and deliverance are common in this environment.",
    "",
    "Micah is the Pastor of Prophetic Ministry at Vineyard Northwest in Cincinnati, OH. He grew up in a very prophetic family where spending time with God was a normal part of homeschooling, and then continued his education at Cincinnati Christian University and Internatizzonal House of Prayer in Kansas City, MO (IHOPKC). Micah’s mission is to encourage people to connect to the heart of God and his goal is to see friends of God encounter him in a real way so that his display of glory and power is recognized all across the earth.",
    "Rusty brings a unique blend of ministry experience, cultivated over 35 years in both domestic and international ministry settings. He loves to share the stories of what God is doing all over the world. Currently, he and his family live in Cincinnati, Ohio, where he serves and directs a prayer ministry called Kingdom Prayer Initiatives. He also serves as pastor and an elder at Northstar Community Church in Loveland Ohio, while being sought out as a pastor-at-large in the city. Rusty has a prophetic edge and continually finds God in everyday situations; these are often the substance of his ministry and the subjects of his writings.  He and his wife Jen have four children ranging from 12 to 28 yrs."]

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return speakers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        cell.configure(with: speakers[indexPath.row], imageName: speakers[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = PeopleViewController(name: speakers[indexPath.row], desc: descriptions[indexPath.row])
        present(vc, animated: true)
        }
}

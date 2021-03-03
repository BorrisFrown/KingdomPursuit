//
//  WorshipView.swift
//  KingdomPursuit
//
//  Created by Tyler Brown on 1/20/21.
//

import Foundation
import UIKit

class WorshipView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    
    func getDescForName(name:String) -> String {
        let desc: String
        if name == "Peter Mattis"{
            desc = "Peter Mattis is a pastor, worship leader and songwriter at Bethel Church in Redding, California. He directs The Worship Room, Bethel’s extended worship and prayer movement. Growing up in North Carolina, Peter began leading worship at a young age and has been singing and leading ever since. For several years, Peter worked with Jonathan and Melissa Helser, directing their heart school called the 18 Inch Journey and carries a desire to see a generation unlocked from fear and living in confidence as sons and daughters. He releases a unique, unreserved passion in worship and encounters with the kindness of the Father. Peter travels internationally, speaking, teaching, leading worship and raising up teams in the practicals of a prophetic lifestyle that changes atmospheres with the simple love and adoration of Jesus."
        } else if name == "Gable Price"{
            desc = "Midwest born and raised, Gable Price grew up on the state- line of Indiana, Ohio, and Kentucky. The son of a Worship Pastor at a Vineyard Church, Gable’s childhood was full of sorting chord sheets, watching rehearsals, and being on basketball teams with losing records. Around age 13, he told his father that his dream was to lead people into worship. He was then invited to lead worship for the first time (a Tomlin song and God’s Not Dead). At age 19, Gable followed the call of the Lord out to Northern California, and has resided there ever since. In 2018 the rock band, conveniently named Gable Price and Friends, was formed."
        } else if name == "Vineyard Northwest Worship"{
            desc = "Our worship teams at Vineyard Northwest are committed to honest, accessible, presence-centered worship. We’re honored to get to lead worship during this powerful conference, and we’re excited to get to be part of what God is doing in your life and ministry. We invite you to join us in coming before the throne—before the smiling face of the Father— and ministering to his very heart. This is a safe place to let it all hang out in lifting high the name of Jesus."
        }
        else {
            desc = "Description not found"
        }
        return desc
    }
    
    let speakers = ["Peter Mattis", "Gable Price", "Vineyard Northwest Worship"]

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
        
        let vc = PeopleViewController(name: speakers[indexPath.row], desc: getDescForName(name: speakers[indexPath.row]))
        present(vc, animated: true)
        }
    }

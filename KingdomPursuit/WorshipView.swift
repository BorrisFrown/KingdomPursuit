//
//  WorshipView.swift
//  KingdomPursuit
//
//  Created by Tyler Brown on 1/20/21.
//

import Foundation
import UIKit

class WorshipView: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet var tableView: UITableView!
    
    func getDescForName(name:String) -> String {
        let desc: String
        if name == "UPPERROOM"{
            desc = "“There is a fire in our hearts to see a move of God sweep across the globe. He is the preeminent answer to our greatest needs, and the only thing that will transform lives and cities. Our mission is to be an equipping engine for ministry to the Lord through planting local churches, events, training, funding modern-day Levites, and creating online media resources for the masses.”"
//        } else if name == "Gable Price"{
//            desc = "Midwest born and raised, Gable Price grew up on the state- line of Indiana, Ohio, and Kentucky. The son of a Worship Pastor at a Vineyard Church, Gable’s childhood was full of sorting chord sheets, watching rehearsals, and being on basketball teams with losing records. Around age 13, he told his father that his dream was to lead people into worship. He was then invited to lead worship for the first time (a Tomlin song and God’s Not Dead). At age 19, Gable followed the call of the Lord out to Northern California, and has resided there ever since. In 2018 the rock band, conveniently named Gable Price and Friends, was formed."
        } else {
            desc = "Description not found"
        }
        return desc
    }
    
    let speakers = ["UPPERROOM"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UPPERROOMTableViewCell.nib(), forCellReuseIdentifier: UPPERROOMTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return speakers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UPPERROOMTableViewCell.identifier, for: indexPath) as! UPPERROOMTableViewCell
//        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
//        cell.configure(with: speakers[indexPath.row], imageName: speakers[indexPath.row])
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

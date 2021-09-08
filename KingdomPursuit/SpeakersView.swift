//
//  SpeakersView.swift
//  KingdomPursuit
//
//  Created by Tyler Brown on 1/20/21.
//

import Foundation
import UIKit

class SpeakersView: UIViewController, UITableViewDelegate, UITableViewDataSource{
    let speakers = [
        "Tom Crandall",
        "Stacey Campbell",
        "Steve Backlund"]
    
    let descriptions = [
        "Tom Crandall is the overseer of Evangelism and the Director of Young Saints at Bethel Church in Redding, CA. He and his wife Leslie have served together in full-time ministry for over eighteen years, ten of which have been at Bethel. Tom has given his life to see a generation encounter God, step into freedom, discover their identity, and send them out as revivalists to impact their world with the Gospel. He is a regular instructor at Bethel School of Supernatural Ministry, where he trains students and leaders to impact youth, and evangelist to bring healing and salvation to a broken world with sign wonders and miracles.",
        "Stacey Campbell is a prophetic voice to this generation and has a passion to teach believers to know how to hear the voice of God through proper teaching and strong values. She is the founder of the Canadian Prophetic Council, and has helped launch prophetic roundtables in several nations. During COVID, Stacey launched a new ministry called SHILOH GLOBAL to raise up prophets to prophesy to the places of influence in society. (seewww.shilohcompany.org ). She serves as an honorary member of the Apostolic Council of Prophetic Elders, presided over by Dr. Cindy Jacobs. She and her husband, Wesley, are founders a mercy organization for children at risk called “Be A Hero (see www.beahero.org).” Stacey and her husband, Wesley, serve on the Apostolic Team of HIM (Harvest International Ministries). In addition, they are the authors of five books and the Praying the Bible CD series. They have ministered in over seventy nations, laboring to see people, cities, and nations transformed. The Campbells have five grown children and live in Santa Maria, California, where they are part of the Healing Rooms of the Santa Maria Valley.",
        "Steve Backlund is an encourager, leader developer, joy activist, and a revivalist teacher. He travels extensively throughout the world encouraging churches, leaders, and organizations into catalytic levels of hope. Steve and his wife Wendy were senior pastors for seventeen years and now reside in Redding, CA. Steve is the associate director of Bethel Leaders Network, and together with his wife is the founder of Igniting Hope Ministries. He has authored numerous books including Declarations, Igniting Faith in 40 Days, and The Culture of Empowerment."]

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

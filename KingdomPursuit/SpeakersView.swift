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
        "Van Cochrane",
        "Bob Hazlett",
        "Putty Putman",
        "Wendy Backlund",
        "Clay Harrington"]
    
    let descriptions = [
        "After pastoring cessationist churches for 15 years, God opened Van’s heart to the full ministry of the Holy Spirit in 1994. He and his wife, Laurie, eventually launched Vineyard Northwest in 2001. In 2011–2012, they began to lead the church into a renewed passion for the Holy Spirit, with a focus on presence-driven worship, healing, and prophetic ministry. Kingdom Pursuit is a product of this powerful Holy Spirit journey, as well as the next step towards fulfilling the church’s call to be a church with a Holy Spirit-empowered, regional impact. In addition, Van grew up in East Brady, Pennsylvania, north of Pittsburgh, and yes, he is a die-hard Steelers fan, somehow surviving in Bengals’ territory. It helps that Laurie is from Cincinnati. They have four children (40, 38, 36 and 29), all married, and 9 grandchildren so far. Van loves guns and shooting as a hobby. Laurie grew up on the east side of Cincinnati and loves playing tennis. They’ve been married for close to 45 years and love each other more than ever.",
        "Bob Hazlett is a proven prophetic voice. His teaching and prophetic ministry has been featured on GodTV, TBN, Daystar and Bethel TV. He is a friend to leaders and a sought-after speaker and author. Strong healing and prophetic gifts follow his ministry. Bob has a passion to empower people in the spiritual gifts, in order to fulfill their life purpose. He has traveled extensively throughout the United States and internationally. He lives in Connecticut with his wife Kimberly and two daughters, April and Abby.",
        "In the process of obtaining a Ph.D. in theoretical quantum physics, Putty ran headlong into the power and reality of the Holy Spirit during a supernatural encounter in China. He terminated a successful career in physics to pursue learning, leading and training others to move in the power of the Holy Spirit. Putty is on the Senior Leadership Team of the Vineyard Church of Central Illinois and co-leads the preaching team, as well as oversees the School of Kingdom Ministry, a supernatural training and discipleship school hosted by local churches across the country and around the world.",
        "In the process of obtaining a Ph.D. in theoretical quantum physics, Putty ran headlong into the power and reality of the Holy Spirit during a supernatural encounter in China. He terminated a successful career in physics to pursue learning, leading and training others to move in the power of the Holy Spirit. Putty is on the Senior Leadership Team of the Vineyard Church of Central Illinois and co-leads the preaching team, as well as oversees the School of Kingdom Ministry, a supernatural training and discipleship school hosted by local churches across the country and around the world.",
        "Born into a military family that traveled the world, Clay experienced an “out of the ordinary” childhood. With a Mother who was on fire for the gospel, and a disciplined Father who served in the Army—Clay was immersed in a Baptist and Pentecostal upbringing while living in Germany, Texas, Maryland, Pennsylvania and North Carolina. Despite being prophesied at an early age that Clay would preach the gospel, he turned to a life of sin. However, through many fascinating encounters of God’s grace, Clay answered the call, surrendered to Christ at the age of 30 and was led to serve as an itinerant evangelist. Clay now works as the Evangelism Pastor for the Vineyard Church in Urbana, Illinois, where he resides with his wife, Regina, and their two sets of boy-girl twins."]

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

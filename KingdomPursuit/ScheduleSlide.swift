//
//  ScheduleSlide.swift
//  KingdomPursuit
//
//  Created by Forrest Brown on 3/3/21.
//

import UIKit

class ScheduleSlide: UIView {
    
    @IBOutlet var view:UIView!
    @IBOutlet var scrollView:UIScrollView!
    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var time1:UILabel!
    @IBOutlet var time2:UILabel!
    @IBOutlet var time3:UILabel!
    @IBOutlet var time4:UILabel!
    @IBOutlet var time5:UILabel!
    @IBOutlet var time6:UILabel!
    @IBOutlet var time7:UILabel!
    @IBOutlet var time8:UILabel!
    @IBOutlet var time9:UILabel!
    @IBOutlet var time10:UILabel!
    @IBOutlet var time11:UILabel!
    @IBOutlet var time12:UILabel!
    @IBOutlet var time13:UILabel!
    @IBOutlet var time14:UILabel!
    @IBOutlet var time15:UILabel!
    @IBOutlet var event1:UILabel!
    @IBOutlet var event2:UILabel!
    @IBOutlet var event3:UILabel!
    @IBOutlet var event4:UILabel!
    @IBOutlet var event5:UILabel!
    @IBOutlet var event6:UILabel!
    @IBOutlet var event7:UILabel!
    @IBOutlet var event8:UILabel!
    @IBOutlet var event9:UILabel!
    @IBOutlet var event10:UILabel!
    @IBOutlet var event11:UILabel!
    @IBOutlet var event12:UILabel!
    @IBOutlet var event13:UILabel!
    @IBOutlet var event14:UILabel!
    @IBOutlet var event15:UILabel!
    
    public func configure(with events: Array<String>, times: Array<String>, name: String) {
        
        let timeLabels = [time1, time2, time3, time4, time5, time6, time7, time8, time9, time10, time11, time12, time13, time14, time15]
        let eventLabels = [event1, event2, event3, event4, event5, event6, event7, event8, event9, event10, event11, event12, event13, event14, event15]
        
        //Set the day title
        titleLabel.text = name
//        titleLabel.frame = CGRect(x: 20, y: 44, width: 500, height: 50)
        
        //Replace the text labels with the 'times' array
        for i in 0 ..< events.count{
            timeLabels[i]?.text = times[i]
            eventLabels[i]?.text = events[i]

            eventLabels[i]?.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)

        }
        
        //Delete any labels left after all of the times are processed.
        for i in events.count ..< timeLabels.count{
            timeLabels[i]?.removeFromSuperview()
            eventLabels[i]?.removeFromSuperview()
        }
    }
    
    // Initialization code
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

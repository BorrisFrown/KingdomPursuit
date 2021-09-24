//
//  ScheduleSlide.swift
//  KingdomPursuit
//
//  Created by Forrest Brown on 3/3/21.
//

import UIKit
class ScheduleSlide: UIView {
    
    private lazy var gradientLayerBottom: CAGradientLayer = {
        let l = CAGradientLayer()
        l.startPoint = CGPoint(x: 0.5, y: 0)
        l.endPoint = CGPoint(x: 0.5, y: 1)
        let baseColor = UIColor.init(named: "BackgroundColor")
        l.colors = [
            baseColor!.withAlphaComponent(0),
            baseColor!.withAlphaComponent(1),
        ].map{$0.cgColor}
        layer.addSublayer(l)
        return l
    }()
    
    private lazy var gradientLayerTop: CAGradientLayer = {
        let l = CAGradientLayer()
        l.startPoint = CGPoint(x: 0.5, y: 1)
        l.endPoint = CGPoint(x: 0.5, y: 0)
        let baseColor = UIColor.init(named: "BackgroundColor")
        l.colors = [
            baseColor!.withAlphaComponent(0),
            baseColor!.withAlphaComponent(1),
        ].map{$0.cgColor}
        layer.addSublayer(l)
        return l
    }()
    
    @IBOutlet var view:UIView!
//    @IBOutlet var scrollView:UIScrollView!
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
//    @IBOutlet var event1:UILabel!
//    @IBOutlet var event2:UILabel!
//    @IBOutlet var event3:UILabel!
//    @IBOutlet var event4:UILabel!
//    @IBOutlet var event5:UILabel!
//    @IBOutlet var event6:UILabel!
//    @IBOutlet var event7:UILabel!
//    @IBOutlet var event8:UILabel!
//    @IBOutlet var event9:UILabel!
//    @IBOutlet var event10:UILabel!
//    @IBOutlet var event11:UILabel!
//    @IBOutlet var event12:UILabel!
//    @IBOutlet var event13:UILabel!
//    @IBOutlet var event14:UILabel!
//    @IBOutlet var event15:UILabel!
    
    public func configure(with events: Array<String>, times: Array<String>, name: String) {
        
        var labelY = Int(20)
        
        //Set the day title
        titleLabel.text = name
        titleLabel.textAlignment = .center
        titleLabel.frame = CGRect(x: self.bounds.width / 3, y: 0, width: self.frame.width / 3, height: 35)
        titleLabel.layer.masksToBounds = true
        titleLabel.layer.cornerRadius = 5
        titleLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 24.0)
//        titleLabel.backgroundColor = UIColor.init(named: "KPRed")
        titleLabel.textColor = .white
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 35, width: self.bounds.width, height: self.bounds.height * 6 / 10))
        scrollView.showsVerticalScrollIndicator = true
        self.addSubview(scrollView)
        
        //Replace the text labels with the 'times' array
        for i in 0 ..< events.count{
            let eventHeight = Int(events[i].count / 24 + 1) * 28
            print(eventHeight)
            
            let eventLabel = UILabel()
            let timeLabel = UILabel()
            
            timeLabel.text = times[i]
            timeLabel.numberOfLines = 0
            timeLabel.frame = CGRect(x: 0, y: labelY, width: Int(self.bounds.width) * 3 / 8, height: eventHeight)
            timeLabel.textAlignment = .right
            
            eventLabel.text = events[i]
            eventLabel.numberOfLines = 0
            eventLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
            eventLabel.lineBreakMode = .byWordWrapping
            eventLabel.frame = CGRect(x: Int(self.bounds.width) / 2 - 20, y: labelY, width: Int(self.bounds.width / 2), height: eventHeight)
//            eventLabel.backgroundColor = UIColor.red
            
            labelY += eventHeight + 8
//            eventLabel.backgroundColor = UIColor.red
            scrollView.addSubview(timeLabel)
            scrollView.addSubview(eventLabel)
        }
        scrollView.contentSize = CGSize(width: scrollView.bounds.width, height: CGFloat(labelY) + 50)
        
        gradientLayerTop.frame = CGRect(x: 0, y: 35, width: Int(self.bounds.height), height: 30)
        
        gradientLayerBottom.frame = CGRect(x: 0, y: Int(self.bounds.height) * 6/10 + 6, width: Int(self.bounds.width), height: 30)
        
        let swipeLabel = UILabel(frame: CGRect(x: 0, y: Int(self.bounds.height * 6/10 + 44), width: Int(self.bounds.width) - 10, height: 20))
        swipeLabel.textAlignment = .right
        
        switch name {
        case "Thursday":
            swipeLabel.text = "Swipe Friday →"
        case "Friday":
            swipeLabel.text = "Saturday →"
        default:
            swipeLabel.text = ""
        }
        
        addSubview(swipeLabel)
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

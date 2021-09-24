//
//  ScheduleView.swift
//  KingdomPursuit
//
//  Created by Tyler Brown on 1/20/21.
//
import Foundation
import UIKit

class ScheduleView: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides:[ScheduleSlide] = [];
    let thursTimes = ["3:00pm", "6:00pm", "6:30pm"]
    let thursEvents = ["Registration opens", "Auditorium opens", "Session 1: Tom Crandall"]
    let friTimes = ["8:50am - 9:30am", "9:30am", "9:45am", "11:45am", "1:30pm", "2:45pm - 4:00pm", "4:00pm - 6:00pm", "5:30pm", "6:00pm", "6:30pm",]
    let friEvents = ["Corporate prayer in auditorium - all are welcome (doors close at 9am)","Auditorium opens","Session 2: Van Cochrane","Supernatural Lifestyle Luncheon ($25, pre-registration required)","Session 3 - Wilson Cochrane","Breakout sessions (see breakouts tab)", "Dinner Break","Atrium opens","Auditorium opens","Session 4 - UPPERROOM / Stacey Campbell"]
    let satTimes = ["8:50am - 9:30am", "9:30am", "9:45am", "12:00pm - 1:00pm", "1:00pm - 5:00pm", "1:30pm", "2:45pm - 4:00pm", "4:00pm - 6:00pm", "5:30pm", "6:00pm", "6:30pm"]
    let satEvents = ["Corporate prayer in auditorium - all are welcome (doors close at 9am)","Auditorium opens","Session 5: Steve Backlund","Lunch break","Prophecy tents (pre-registration required)","Session 6 - Luke Haselmayer","Breakout sessions (see breakouts tab)","Dinner break","Atrium opens","Auditorium opens","Session 7: UPPERROOM / Steve Backlund"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        slides = createSlides()
        setupSlideScrollView(slides: slides)
            
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        if traitCollection.userInterfaceStyle == .dark {
            pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
        }
        else {
            pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
        }
        view.bringSubviewToFront(pageControl)
    }
    
    func createSlides() -> [ScheduleSlide] {
        let slide1:ScheduleSlide = Bundle.main.loadNibNamed("ScheduleSlide", owner: self, options: nil)?.first as! ScheduleSlide
        slide1.configure(with: thursEvents, times: thursTimes, name: "Thursday")
                
        let slide2:ScheduleSlide = Bundle.main.loadNibNamed("ScheduleSlide", owner: self, options: nil)?.first as! ScheduleSlide
        slide2.configure(with: friEvents, times: friTimes, name: "Friday")
                
        let slide3:ScheduleSlide = Bundle.main.loadNibNamed("ScheduleSlide", owner: self, options: nil)?.first as! ScheduleSlide
        slide3.configure(with: satEvents, times: satTimes, name: "Saturday")
        
        return [slide1, slide2, slide3]
    }
    
    func setupSlideScrollView(slides : [ScheduleSlide]) {
            scrollView.frame = CGRect(x: 0, y: 180, width: view.frame.width, height: view.frame.height)
            scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
            scrollView.isPagingEnabled = true
            
            for i in 0 ..< slides.count {
                slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
                scrollView.addSubview(slides[i])
            }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
    }
}

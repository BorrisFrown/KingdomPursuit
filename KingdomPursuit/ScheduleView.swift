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
    let thursTimes = ["3:00pm","6:00pm","6:30pm - 9:15pm"]
    let thursEvents = ["Registration opens","Auditorium opens","Session 1: BOB HAZLETT"]
    let friTimes = ["8:00am","8:30am","9:00am - 10:45am","11:00am - 12:00pm","12:15pm - 1:30pm","1:30pm","2:00pm - 3:00pm","3:15pm - 4:15pm","4:15pm - 6:30pm","5:30pm","6:00pm","6:30pm - 9:00pm"]
    let friEvents = ["Atrium opens","Auditorium opens","Session 2: BOB HAZLETT","Session 3: VAN COCHRANE","Prophetic Panel Lunch","Atrium opens", "Breakout 1","Breakout 2","Dinner break","Atrium opens","Auditorium opens","Session 4: WENDY BACKLUND"]
    let satTimes = ["8:00am","8:30am","9:00am - 10:45am","11:00am - 12:00pm","12:00pm - 2:00pm","1:30pm","2:00pm - 3:00pm","3:15pm - 4:15pm", "4:15pm - 6:30pm", "5:30pm", "6:00pm","6:30pm - 9:00pm"]
    let satEvents = ["Atrium opens","Auditorium opens","Session 5: PUTTY PUTMAN","Session 6: CLAY HARRINGTON","Lunch break","Atrium opens","Breakout 1","Breakout 2","Dinner break","Atrium opens","Auditorium opens","Session 7: PUTTY PUTMAN"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        slides = createSlides()
        setupSlideScrollView(slides: slides)
            
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        if traitCollection.userInterfaceStyle == .dark {
            pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            pageControl.pageIndicatorTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        else {
            pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
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
            scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
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

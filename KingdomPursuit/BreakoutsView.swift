//
//  BreakoutsView.swift
//  KingdomPursuit
//
//  Created by Tyler Brown on 1/20/21.
//

import Foundation
import UIKit

class BreakoutsView: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet var imageFrame: UIImageView!
    
    
    var slides:[BreakoutSlide] = [];
    let firstPic = UIImage(named: "Breakout schedule 1")!
    let secondPic = UIImage(named: "Breakout schedule 2")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        slides = createSlides()
        setupSlideScrollView(slides: slides)
            
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        pageControl.backgroundColor = #colorLiteral(red: 0.7570065856, green: 0.7925702929, blue: 0.4755898118, alpha: 1)
        view.bringSubviewToFront(pageControl)
        view.bringSubviewToFront(imageFrame)
    }
    
    func createSlides() -> [BreakoutSlide] {
        let slide1:BreakoutSlide = Bundle.main.loadNibNamed("BreakoutSlide", owner: self, options: nil)?.first as! BreakoutSlide
        slide1.configure(with: firstPic, imageFrame: imageFrame, view: view, pageControl:pageControl)
                
        let slide2:BreakoutSlide = Bundle.main.loadNibNamed("BreakoutSlide", owner: self, options: nil)?.first as! BreakoutSlide
        slide2.configure(with: secondPic, imageFrame: imageFrame, view: view, pageControl:pageControl)
//        slide2.frame = scrollView.frame
                
        return [slide1, slide2]
    }
    
    func setupSlideScrollView(slides : [BreakoutSlide]) {
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

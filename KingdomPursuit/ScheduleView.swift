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
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        slides = createSlides()
        setupSlideScrollView(slides: slides)
            
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
    }
    
    func createSlides() -> [ScheduleSlide] {
        let slide1:ScheduleSlide = Bundle.main.loadNibNamed("ScheduleSlide", owner: self, options: nil)?.first as! ScheduleSlide
        slide1.backgroundColor = .red
                
        let slide2:ScheduleSlide = Bundle.main.loadNibNamed("ScheduleSlide", owner: self, options: nil)?.first as! ScheduleSlide
        slide2.backgroundColor = .yellow
                
        let slide3:ScheduleSlide = Bundle.main.loadNibNamed("ScheduleSlide", owner: self, options: nil)?.first as! ScheduleSlide
        slide3.backgroundColor = .blue
        
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
        
//
//        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
//
//        if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
//
//            slides[0].imageView.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
//            slides[1].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
//
//        } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
//            slides[1].imageView.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
//            slides[2].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
//
//        } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
//            slides[2].imageView.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
//            slides[3].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.75, y: percentOffset.x/0.75)
//
//        } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
//            slides[3].imageView.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
//            slides[4].imageView.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
//        }
//    }
    
//    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        setupSlideScrollView(slides: slides)
//    }
//}
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath)
//        cell.textLabel?.text = "Hello world"
//        return cell
//    }
//
//    let thursTimes = [
//        "3:00pm",
//        "6:00pm",
//        "6:30pm – 9:15pm"
//    ]
//
//    let thursEvents = [
//        "Registration opens",
//        "Auditorium opens",
//        "Session 1: BOB HAZLETT"
//    ]
//
//    var thurs: UIView!
//    var fri: UIView!
//    var sat: UIView!
//
//    private let scrollView = UIScrollView()
//
//    private let pageControl: UIPageControl = {
//        let pageControl = UIPageControl()
//        pageControl.numberOfPages = 3
//        pageControl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
//        return pageControl
//    }()
//
//    func thursDesign(tableView: UITableView)
//    {
//        thurs.backgroundColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
//
//        thurs.addSubview(tableView)
//    }
//
//    func friDesign(tableView: UITableView)
//    {
//        fri.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
//        fri.addSubview(tableView)
//    }
//
//    func satDesign(tableView: UITableView)
//    {
//        sat.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
//        sat.addSubview(tableView)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        scrollView.delegate = self
//        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
//        scrollView.backgroundColor = #colorLiteral(red: 0.6984269023, green: 1, blue: 0, alpha: 1)
//        view.addSubview(scrollView)
//        view.addSubview(pageControl)
//    }
//
//    @objc private func pageControlDidChange(_ sender: UIPageControl){
//        let current = sender.currentPage
//        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
//    }
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        pageControl.frame = CGRect(x: 0, y: view.frame.size.height - 150, width: view.frame.size.width, height: 70)
//
//        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 75)
//
//        if scrollView.subviews.count == 2 {
//            configureScrollView()
//        }
//    }
//    private func configureScrollView(){
//        scrollView.contentSize = CGSize(width: view.frame.width * 3, height: scrollView.frame.height)
//        scrollView.isPagingEnabled = true
//
//        for x in 0..<3{
//            let tableView: UITableView = {
//                let tableView = UITableView()
//                tableView.backgroundColor = #colorLiteral(red: 0.7570065856, green: 0.7925702929, blue: 0.4755898118, alpha: 1)
//                tableView.frame = view.bounds
//                tableView.dataSource = self
//                tableView.register(UITableViewCell.self, forCellReuseIdentifier: "scheduleCell")
//                return tableView
//            }()
//
//            let page = UIView(frame: CGRect(x: CGFloat(x) * view.frame.size.width, y: 0, width: view.frame.size.width, height: scrollView.frame.size.height))
//
//            if x == 0 {
//                func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//                    let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath)
//                    cell.textLabel?.text = "Yoyo"
//                    return cell
//                }
//                thurs = page
//                thursDesign(tableView: tableView)
//            }
//            if x == 1 {
//                fri = page
//                friDesign(tableView: tableView)
//            }
//            if x == 2 {
//                sat = page
//                satDesign(tableView: tableView)
//            }
//            scrollView.addSubview(page)
//        }
//    }
//}
//
//extension ScheduleView: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView:UIScrollView) {
//        pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
//    }
//}

//extension ScheduleView: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath)
//        cell.textLabel?.text = "Yoyo"
//        return cell
//    }
//}

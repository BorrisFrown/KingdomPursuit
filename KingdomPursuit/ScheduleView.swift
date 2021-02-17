//
//  ScheduleView.swift
//  KingdomPursuit
//
//  Created by Tyler Brown on 1/20/21.
//
import Foundation
import UIKit

class ScheduleView: UIViewController {
    
    let thursTimes: [String] = [
        "3:00pm",
        "6:00pm",
        "6:30pm – 9:15pm"
    ]
    
    let thursEvents: [String] = [
        "Registration opens",
        "Auditorium opens",
        "Session 1: BOB HAZLETT"
    ]
    
    var thurs: UIView!
    var fri: UIView!
    var sat: UIView!

    private let scrollView = UIScrollView()

    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        return pageControl
    }()
    
    func thursDesign(tableView: UITableView)
    {
        thurs.backgroundColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        thurs.addSubview(tableView)
    }

    func friDesign(tableView: UITableView)
    {
        fri.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        fri.addSubview(tableView)
    }
    
    func satDesign(tableView: UITableView)
    {
        sat.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        sat.addSubview(tableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
        scrollView.backgroundColor = #colorLiteral(red: 0.6984269023, green: 1, blue: 0, alpha: 1)
        view.addSubview(scrollView)
        view.addSubview(pageControl)
    }
    
    @objc private func pageControlDidChange(_ sender: UIPageControl){
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageControl.frame = CGRect(x: 0, y: view.frame.size.height - 150, width: view.frame.size.width, height: 70)
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 75)
                
        if scrollView.subviews.count == 2 {
            configureScrollView()
        }
    }
    private func configureScrollView(){
        scrollView.contentSize = CGSize(width: view.frame.width * 3, height: scrollView.frame.height)
        scrollView.isPagingEnabled = true
        
        for x in 0..<3{
            let tableView: UITableView = {
                let tableView = UITableView()
                tableView.backgroundColor = #colorLiteral(red: 0.7570065856, green: 0.7925702929, blue: 0.4755898118, alpha: 1)
                tableView.frame = view.bounds
        //            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "scheduleCell")
                return tableView
            }()
            
            let page = UIView(frame: CGRect(x: CGFloat(x) * view.frame.size.width, y: 0, width: view.frame.size.width, height: scrollView.frame.size.height))
            
            if x == 0 {
//                let tableViewCell = UITableViewCell()
//                let label = UILabel()
//                for i in 0..<thursTimes.count{
//                    label.text = thursTimes[i]
//                    tableView.addSubview(tableViewCell)
//                    tableViewCell.addSubview(label)
//                }
                thurs = page
                thursDesign(tableView: tableView)
            }
            if x == 1 {
                fri = page
                friDesign(tableView: tableView)
            }
            if x == 2 {
                sat = page
                satDesign(tableView: tableView)
            }
            scrollView.addSubview(page)
        }
    }
}

extension ScheduleView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView:UIScrollView) {
        pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
    }
}

//
//  BreakoutsView.swift
//  KingdomPursuit
//
//  Created by Tyler Brown on 1/20/21.
//

import Foundation
import UIKit

class BreakoutsView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let stackView = UIStackView(
        frame: .zero)
    
    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        return collectionView
    }()
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet var imageFrame: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(BreakoutCollectionViewCell.self, forCellWithReuseIdentifier: BreakoutCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self

        view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let stackWidth = view.bounds.width / 3
        
        stackView.frame = CGRect(x: 0, y: 0, width: stackWidth, height: view.bounds.height)
        collectionView.frame = CGRect(x: stackWidth, y: 192, width: view.frame.width - stackWidth, height: view.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BreakoutCollectionViewCell.identifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/3-3, height: view.frame.width/3-3)
    }
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("Selected section \(indexPath.section) and row \(indexPath.row)")
        
        let vc = PeopleViewController(name: "Test", desc: "Test Desc")
        present(vc, animated: true)
    }
    
    
//    func createSlides() -> [BreakoutSlide] {
//        let slide1:BreakoutSlide = Bundle.main.loadNibNamed("BreakoutSlide", owner: self, options: nil)?.first as! BreakoutSlide
//        slide1.configure(with: firstPic, imageFrame: imageFrame, view: view, pageControl:pageControl)
//
//        let slide2:BreakoutSlide = Bundle.main.loadNibNamed("BreakoutSlide", owner: self, options: nil)?.first as! BreakoutSlide
//        slide2.configure(with: secondPic, imageFrame: imageFrame, view: view, pageControl:pageControl)
//        slide2.frame = scrollView.frame
//
//        return [slide1, slide2]
//    }
    
//    func setupSlideScrollView(slides : [BreakoutSlide]) {
//            scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//            scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
//            scrollView.isPagingEnabled = true
//
//            for i in 0 ..< slides.count {
//                slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
//                scrollView.addSubview(slides[i])
//            }
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
//        pageControl.currentPage = Int(pageIndex)
//
//        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
//        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
//
//        // vertical
//        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
//        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
//
//        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
//        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
//    }

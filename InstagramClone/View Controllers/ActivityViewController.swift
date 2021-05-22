//
//  ActivityViewController.swift
//  InstagramClone
//
//  Created by Joel Alcantara burgos on 20/2/21.
//

import UIKit

class ActivityViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var segmentedControl: CustomSegmentedControl! {
        didSet {
            segmentedControl.delegate = self
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
        }
    }
    
    var currentIndex = 0
    var activitiesData: [String: [Activity]]  {
        return ["your": yourActivities, "following": followingActivities]
    }
    
    lazy var slides: [ActivityView] = {
        let followingView = Bundle.main.loadNibNamed("ActivityView", owner: nil, options: nil)?.first as! ActivityView
        
        followingView.activityData = activitiesData["following"]!
        
        let youView = Bundle.main.loadNibNamed("ActivityView", owner: nil, options: nil)?.first as! ActivityView
        youView.activityData = activitiesData["your"]!
        return [followingView, youView]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.indicatorStyle = .default
        scrollView.alwaysBounceVertical = true
        setUpSlideScrollView(slides: slides)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func setUpSlideScrollView(slides: [ActivityView]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        
        scrollView.isPagingEnabled = true
        
        for (index, activityView) in slides.enumerated() {
            activityView.frame = CGRect(x: view.frame.width * CGFloat(index), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(activityView)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        segmentedControl.updateSegmentedControlSegs(index: Int(pageIndex))
    }
}

extension ActivityViewController: ActivityDelegate {
    func scrollTo(index: Int) {
        if currentIndex == index {
            return
        }
        let pageWidth = self.scrollView.frame.width
        let slideToX = pageWidth * CGFloat(index)
        self.scrollView.scrollRectToVisible(CGRect(x: slideToX, y: 0, width: pageWidth, height: self.scrollView.frame.height), animated: false)
        currentIndex = index
    }
}

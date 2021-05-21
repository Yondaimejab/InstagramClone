//
//  NewPostPageViewController.swift
//  InstagramClone
//
//  Created by joel Alcantara on 18/5/21.
//

import UIKit

class NewPostPageViewController: UIPageViewController {
    
    var orderedViewControllers: [UIViewController] {
        NewPostPagesToShow.pagesToShow.map { newViewController(pageToShow: $0) }
    }
    
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        if let firstVC = orderedViewControllers.first {
            setViewControllers([firstVC], direction: .forward, animated: true)
        }
    }
    
    private func addNotificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(newPage(notification:)), name: NSNotification.Name("NewPage"), object: nil)
    }
    
    @objc func newPage(notification: NSNotification) {
        if let receivedObject = notification.object as? NewPostPagesToShow {
            showViewController(index: receivedObject.rawValue)
        }
    }
    
    private func newViewController(pageToShow: NewPostPagesToShow) -> UIViewController {
        return UIStoryboard(name: "NewPost", bundle: nil).instantiateViewController(identifier: pageToShow.identifier)
    }
    
    func showViewController(index: Int) {
        guard index != currentIndex else {return}
        if currentIndex > index {
            setViewControllers([orderedViewControllers[index]], direction: .reverse, animated: true)
        } else {
            setViewControllers([orderedViewControllers[index]], direction: .forward, animated: true)
        }
        currentIndex = index
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("NewPage"), object: nil)
    }
}

extension NewPostPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < orderedViewControllers.count else { return nil }
        return orderedViewControllers[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else { return nil }
        let previusIndex = viewControllerIndex - 1
        guard previusIndex >= 0 else {return nil}
        return orderedViewControllers[previusIndex]
    }
}

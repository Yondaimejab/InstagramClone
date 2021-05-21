//
//  TabBarDelegate.swift
//  InstagramClone
//
//  Created by joel Alcantara on 18/5/21.
//

import Foundation
import UIKit

class TabBarDelegate: NSObject, UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let navigationController = viewController as? UINavigationController
        navigationController?.popViewController(animated: false)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let selectedViewController =  tabBarController.selectedViewController else { return false }
        guard viewController != selectedViewController else { return false }
        guard let controllerIndex = tabBarController.viewControllers?.firstIndex(of: viewController) else { return true }
        if controllerIndex == 2 {
            let newPostStoryBoard = UIStoryboard(name: "NewPost", bundle: nil)
            let newPostVC = newPostStoryBoard.instantiateViewController(identifier: "NewPost") as! NewPostViewController
            let navigationController = UINavigationController(rootViewController: newPostVC)
            selectedViewController.present(navigationController, animated: true)
            return false
        }
        
        let navigationController = viewController.navigationController
        navigationController?.popToRootViewController(animated: true)
        return true
    }
}

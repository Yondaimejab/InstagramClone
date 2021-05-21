//
//  SceneDelegate.swift
//  InstagramClone
//
//  Created by Joel Alcantara burgos on 20/2/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        window?.rootViewController = SceneDelegate.getTabbarController()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


extension SceneDelegate {
    static func getTabbarController() -> UIViewController {
        // Home items
        let homeStoryBoard = UIStoryboard(name: "Home", bundle: Bundle.main)
        let homeViewController = homeStoryBoard.instantiateViewController(identifier: "home")

        // search items
        let searchStoryBoard = UIStoryboard(name: "Search", bundle: Bundle.main)
        let searchViewController = searchStoryBoard.instantiateViewController(identifier: "search")

        // newPost
        let newPostStoryBoard = UIStoryboard(name: "NewPost", bundle: Bundle.main)
        let newPostViewController = newPostStoryBoard.instantiateViewController(identifier: "NewPost")

        // activity
        let activityStoryBoard = UIStoryboard(name: "Activity", bundle: Bundle.main)
        let activityViewController = activityStoryBoard.instantiateViewController(withIdentifier: "activity")

        //Profile
        let profileStoryBoard = UIStoryboard(name: "Profile", bundle: Bundle.main)
        let profileViewController = profileStoryBoard.instantiateViewController(withIdentifier: "profile")

        let tabbarViewControllers: [(UIViewController, UIImage, UIImage)] = [
            (
                homeViewController,
                icon: UIImage(named: "home_tab_icon")!,
                UIImage(named: "home_selected_tab_icon")!
            ),
            (
                searchViewController,
                UIImage(named: "search_tab_icon")!,
                UIImage(named: "search_selected_tab_icon")!
            ),
            (
                newPostViewController,
                UIImage(named: "post_tab_icon")!,
                UIImage(named: "post_tab_icon")!),
            (
                activityViewController,
                UIImage(named: "more_icon")!,
                UIImage(named: "activity_selected_tab_icon")!
            ),
            (
                profileViewController,
                UIImage(named: "profile_tab_icon")!,
                UIImage(named: "profile_selected_tab_icon")!
            )
        ]

        let navigationControllers = tabbarViewControllers.map { (viewController, icon, selectedIcon) -> UINavigationController in
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.tabBarItem.image = icon
            navigationController.tabBarItem.selectedImage = selectedIcon
            return navigationController
        }

        let tabbarController = UITabBarController()
        tabbarController.viewControllers = navigationControllers
        tabbarController.tabBar.isTranslucent = false

        if let items = tabbarController.tabBar.items {
            for item in items {
                if let image = item.image {
                    item.image = image.withRenderingMode(.alwaysOriginal)
                }

                if let selectedImage = item.selectedImage {
                    item.image = selectedImage.withRenderingMode(.alwaysOriginal)
                }

                item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            }
        }

        UINavigationBar.appearance().backgroundColor = .white
        let delegate = TabBarDelegate()
        tabbarController.delegate = delegate
        return tabbarController
    }
}

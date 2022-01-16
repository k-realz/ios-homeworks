//
//  InitialViewController.swift
//  Navigation
//
//  Created by Kirill Komov on 12.01.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit
import Foundation

class InitialViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let checker = CheckTextField()

        self.setViewControllers([
            createTabBarItem(tabBarTitle: "Feed", tabBarImage: "house.fill", viewController: FeedViewController(checker: checker)),
            createTabBarItem(tabBarTitle: "Profile", tabBarImage: "person.fill", viewController: LogInViewController())
        ], animated: false)
        
            }

            func createTabBarItem(tabBarTitle: String, tabBarImage: String, viewController: UIViewController) -> UINavigationController {
                let navCont = UINavigationController(rootViewController: viewController)
                navCont.tabBarItem.title = tabBarTitle
                navCont.tabBarItem.image = UIImage(systemName: tabBarImage)
                return navCont
            }
    }

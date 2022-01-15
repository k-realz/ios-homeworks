//
//  SecondViewCoordinator.swift
//  Navigation
//
//  Created by Kirill Komov on 15.01.2022.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

class ProfileCoordinator: Coordinator {
    
    weak var parentCoordinator: AppCoordinator?
    var childCoordinator: [Coordinator] = []
    var navigationController = UINavigationController()
    var inspectorFactory = MyLoginFactory()
    var moduleFactory = ProfileModuleFactory()

    func start() {
        
    }
    
    func startPush() -> UINavigationController {
        let loginVC = LogInViewController()
        
        loginVC.loginFactory = inspectorFactory
        
        loginVC.pushProfile = { [weak self] userService, username in
            self?.showProfileVC(userService: userService, username: username)
        }
        
        navigationController.setViewControllers([loginVC], animated: false)
        
        return navigationController
    }
    
}

extension ProfileCoordinator {
    func showProfileVC(userService: UserService, username: String) {
        
        
        
        let profileVC = moduleFactory.produceProfileVC(userService: userService, userName: username)
  
        navigationController.pushViewController(profileVC, animated: true)
       
        profileVC.viewModel.pushPhotos = { [weak self] in
            self?.showPhotosVC()
        }
        
    }
    
    func showPhotosVC() {
        let photosVC = PhotosViewController()

        navigationController.pushViewController(photosVC, animated: true)
    }
}

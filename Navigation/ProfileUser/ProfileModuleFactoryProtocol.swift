//
//  ProfileModuleFactoryProtocol.swift
//  Navigation
//
//  Created by Kirill Komov on 15.01.2022.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

protocol ProfileModuleFactoryProtocol {
    
    func produceProfileVC(userService: UserService, userName: String) -> ProfileViewController
    
    func produceProfileViewModel() -> ProfileViewModel
}

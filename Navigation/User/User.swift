//
//  User.swift
//  Navigation
//
//  Created by Kirill Komov on 10.10.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

class User {
    
    let userName: String
    let userPicture: UIImage
    let userStatus: String

    init(userName: String, userPicture: UIImage, userStatus: String) {
        self.userName = userName
        self.userPicture = userPicture
        self.userStatus = userStatus
    }
}


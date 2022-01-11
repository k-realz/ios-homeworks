//
//  TestUserService.swift
//  Navigation
//
//  Created by Kirill Komov on 10.10.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

class TestUserService: UserService {
    
    let testUser = User(userName: "Test", userPicture: #imageLiteral(resourceName: "Kirill"), userStatus: "testing the test")
    
    func returnUser(userName: String) -> User? {
        
       if userName == testUser.userName {
            return testUser
        }
            return nil
    }
}

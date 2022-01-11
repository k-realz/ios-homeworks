//
//  CurrentUserService.swift
//  Navigation
//
//  Created by Kirill Komov on 10.10.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

class CurrentUserService: UserService {
    
    let someUser = User(userName: "_k_real_", userPicture: #imageLiteral(resourceName: "184527_1166184446742589_7049446128454751734_n"), userStatus: "looking for code")
    
    func returnUser(userName: String) -> User? {
        
       if userName == someUser.userName {
            return someUser
        }
            return nil
    }
}

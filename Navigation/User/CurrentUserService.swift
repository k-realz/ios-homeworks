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
    
    let someUser = User(userName: "_k_real_", userPicture: #imageLiteral(resourceName: "Снимок экрана 2021-06-20 в 11.09.08"), userStatus: "looking for tomorrow")
    
    func returnUser(userName: String) -> User? {
        
       if userName == someUser.userName {
            return someUser
        }
            return nil
    }
}

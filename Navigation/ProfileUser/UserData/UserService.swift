//
//  UserService.swift
//  Navigation
//
//  Created by Kirill Komov on 10.10.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

protocol UserService {
    
    func returnUser (userName: String) -> User?
    
}

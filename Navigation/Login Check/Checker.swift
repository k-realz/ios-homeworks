//
//  Checker.swift
//  Navigation
//
//  Created by Kirill Komov on 12.10.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

class Checker {
    
    static var instance = Checker()
    #if DEBUG
    private let login = "Test"
    #else
    private let login = "_k_real_"
    #endif
    
    
    private let password = "User1234"
    
    private init() {}
    
    func checkLoginData(enteredLogin: String, enteredPassword: String) -> Bool {
        if enteredLogin == login && enteredPassword == password {
            return true
        } else {
            return false
        }
        
    }
}

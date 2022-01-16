//
//  LoginInspector.swift
//  Navigation
//
//  Created by Kirill Komov on 26.10.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit


class LoginInspector: LoginViewControllerDelegate {
    func checkTextFields(enteredLogin: String, enteredPassword: String) -> Bool {
        
        let checker = Checker.instance.checkLoginData(enteredLogin: enteredLogin, enteredPassword: enteredPassword)
        return checker
    }
    
    
}

//
//  LoginViewControllerDelegate.swift
//  Navigation
//
//  Created by Kirill Komov on 26.10.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

protocol LoginViewControllerDelegate: AnyObject {
    func checkTextFields(enteredLogin: String, enteredPassword: String) -> Bool
}

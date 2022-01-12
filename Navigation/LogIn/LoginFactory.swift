//
//  LoginFactory.swift
//  Navigation
//
//  Created by Kirill Komov on 26.10.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

protocol LoginFactory {
    
    func produceLoginInspector() -> LoginInspector
}

class MyLoginFactory: LoginFactory {
    func produceLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
    
    
}

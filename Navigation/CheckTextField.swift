//
//  CheckTextField.swift
//  Navigation
//
//  Created by Kirill Komov on 12.01.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit


class CheckTextField {
    
    private let correctWord = "password"
    
    func check(word: String) {
        
        if word != "" {
            if word == correctWord {
                NotificationCenter.default.post(name: NSNotification.Name("Green label"), object: nil)
            } else {
                NotificationCenter.default.post(name: NSNotification.Name("Red label"), object: nil)
            }
        } else {
            NotificationCenter.default.post(name: NSNotification.Name("Transparent label"), object: nil)
        }
    }
}

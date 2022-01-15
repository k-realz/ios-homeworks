//
//  CheckTextField.swift
//  Navigation
//
//  Created by Kirill Komov on 12.01.2022.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//


import UIKit

enum CheckResult {
    case correct
    case incorrect
    case empty
}

class CheckTextField {
    
    private let correctWord = "пароль"
        
    func check(word: String, completion: (CheckResult) -> Void ) {
        if word == "" {
            completion(.empty)
        } else if word == correctWord {
            completion(.correct)
        } else {
            completion(.incorrect)
        }
    }
}

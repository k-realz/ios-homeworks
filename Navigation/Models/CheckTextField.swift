//
//  CheckTextField.swift
//  Navigation
//
//  Created by Kirill Komov on 12.01.2022.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//


import UIKit

enum CheckerError: Error {
    case incorrect
    case empty
}

class CheckTextField {
    
    private let correctWord = "пароль"
    
    func check(word: String, completion:  @escaping (Result<String, CheckerError>) -> Void  ) {
        if word == correctWord {
            completion(.success("Correct!"))
        } else if word == "" {
            completion(.failure(.empty))
        } else {
            completion(.failure(.incorrect))
        }
    }
}


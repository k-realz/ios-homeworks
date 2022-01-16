//
//  MyCustomCheckTextField.swift
//  Navigation
//
//  Created by Kirill Komov on 12.01.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

class MyCustomTextField: UITextField {
    
    init(font: UIFont, textColor: UIColor, backgroundColor: UIColor, placeholder: String) {
        super.init(frame: .zero)
        
        self.font = font
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.placeholder = placeholder
        self.autocapitalizationType = .none
        self.returnKeyType = UIReturnKeyType.done
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftViewMode = .always
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

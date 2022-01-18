//
//  LogInViewController.swift
//  Navigation
//
//  Created by Kirill Komov on 29.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
   
    var loginFactory: MyLoginFactory?
    var pushProfile: ((_ userService: UserService, _ username: String) -> Void)?
    
    private let scrollView = UIScrollView()
    
    private let logInView: UIView = {
        let logInView = UIView()
        logInView.backgroundColor = .white
        logInView.translatesAutoresizingMaskIntoConstraints = false
        return logInView
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image:#imageLiteral(resourceName: "logo"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let autorizationView: UIView = {
        let autorizationView = UIView()
        autorizationView.backgroundColor = .lightGray
        autorizationView.layer.borderWidth = 0.5
        autorizationView.layer.borderColor = UIColor.lightGray.cgColor
        autorizationView.layer.cornerRadius = 10
        autorizationView.clipsToBounds = true
        autorizationView.translatesAutoresizingMaskIntoConstraints = false
        return autorizationView
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField .frame.height))
        textField.leftViewMode = .always
        textField.tintColor = UIColor(named:"myColorSet")
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemGray6
        textField.clipsToBounds = true
        textField.placeholder = "User Name"
        textField.returnKeyType = UIReturnKeyType.done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField .frame.height))
        textField.leftViewMode = .always
        textField.tintColor = UIColor(named:"myColorSet")
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemGray6
        textField.clipsToBounds = true
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.returnKeyType = UIReturnKeyType.done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var logInButton: MyCustomButton = {
        let button = MyCustomButton(title: "Log in", titleColor: .white, backgroundColor: nil, backgroundImage: #imageLiteral(resourceName: "blue_pixel")) { [self] in
            
            #if DEBUG
            let userService = TestUserService()
            #else
            let userService = CurrentUserService()
            #endif
            
            if let username = self.nameTextField.text,
               let pswd = self.passwordTextField.text,
               let inspector = self.loginFactory?.produceLoginInspector,
               inspector().checkTextFields(login: username, password: pswd) == true {
                self.pushProfile?(userService, username)
            } else {
                self.showAlert()
            }
        }
        
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    private func showAlert() {
        let alertController = UIAlertController(title: "ERROR", message: "Username or password is invalid", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
        print("invalid name")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        setupViews()
        nameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func setupViews() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(logInView)
        logInView.addSubviews(logoImageView, autorizationView, logInButton)
        autorizationView.addSubviews(nameTextField, passwordTextField)
        
        let constraints = [
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logInView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            logInView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            logInView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            logInView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            logInView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: logInView.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: logInView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            autorizationView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            autorizationView.leadingAnchor.constraint(equalTo: logInView.leadingAnchor, constant: 16),
            autorizationView.trailingAnchor.constraint(equalTo: logInView.trailingAnchor, constant: -16),
            autorizationView.heightAnchor.constraint(equalToConstant: 100),
            
            nameTextField.topAnchor.constraint(equalTo: autorizationView.topAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: autorizationView.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: autorizationView.trailingAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 49.7),
            
            passwordTextField.bottomAnchor.constraint(equalTo: autorizationView.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: autorizationView.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: autorizationView.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 49.7),
            
            logInButton.topAnchor.constraint(equalTo: autorizationView.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: logInView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: logInView.trailingAnchor, constant: -16),
            logInButton.bottomAnchor.constraint(equalTo: logInView.bottomAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
}

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


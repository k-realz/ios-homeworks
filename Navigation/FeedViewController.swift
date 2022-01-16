//
//  ViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import StorageService
import SnapKit


final class FeedViewController: UIViewController {
    
    private lazy var showNormallyButton: UIButton = {
        let button =
            MyCustomButton(
                title: "Show Post Normally",
                titleColor: .white,
                backgroundColor: .systemGray,
                backgroundImage: nil) {
                let vc = PostViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        button.layer.cornerRadius = 6
        button.clipsToBounds = true
        return button
    }()
    
    private lazy var showModallyButton: UIButton = {
        let button = MyCustomButton(
            title: "Show Post Modally",
            titleColor: .white,
            backgroundColor: .systemGray,
            backgroundImage: nil) {
            let vc = PostViewController()
            self.navigationController?.present(vc, animated: true, completion: nil)
        }
        button.layer.cornerRadius = 6
        button.clipsToBounds = true
        return button
    }()
    
    private let checkTextField: UITextField = {
        let textField = MyCustomTextField(
            font: UIFont.systemFont(ofSize: 16),
            textColor: .black,
            backgroundColor: .white,
            placeholder: "Enter the word")
        
        return textField
    }()
    
    private lazy var checkButton: UIButton = {
        let button = MyCustomButton(
            title: "Check the word",
            titleColor: .white,
            backgroundColor: .lightGray,
            backgroundImage: nil) {
            let enteredWord = self.checkTextField.text
            self.checker.check(word: enteredWord ?? "")
        }
        button.layer.cornerRadius = 6
        button.clipsToBounds = true
        return button
    }()
    
    private let colorLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let feedStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 35
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let checker: CheckTextField
    
    init(checker: CheckTextField) {
        self.checker = checker
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        view.backgroundColor = .orange
        checkTextField.delegate = self
        setupViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeObservers()
    }
    
    func setupNotifications() {
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Green label"), object: nil, queue: .main) { (notification) in
            self.colorLabel.backgroundColor = .green
            self.colorLabel.alpha = 1
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Red label"), object: nil, queue: .main) { (notification) in
            self.colorLabel.backgroundColor = .red
            self.colorLabel.alpha = 1
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Transparent label"), object: nil, queue: .main) { (notification) in
            self.colorLabel.alpha = 0
        }
    }
    
    func removeObservers() {
        NotificationCenter.default.removeObserver(NSNotification.Name(rawValue: "Green label"))
        NotificationCenter.default.removeObserver(NSNotification.Name(rawValue: "Red label"))
        NotificationCenter.default.removeObserver(NSNotification.Name(rawValue: "Transparent label"))
    }

    
    private func setupViews() {
        
        view.addSubview(feedStackView)
        
        feedStackView.addArrangedSubview(showNormallyButton)
        feedStackView.addArrangedSubview(showModallyButton)
        feedStackView.addArrangedSubview(checkTextField)
        feedStackView.addArrangedSubview(checkButton)
        feedStackView.addArrangedSubview(colorLabel)
        
        feedStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(150)
        }
    }
}

extension FeedViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

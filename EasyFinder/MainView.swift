//
//  MainView.swift
//  EasyFinder
//
//  Created by chiawei wen on 3/4/23.
//

import Foundation
import UIKit
import SnapKit

class MainView: UIView {
    
    let searchTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray5
        textField.placeholder = "Search Name Here"
        textField.borderStyle = .line
        return textField
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Search", for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    let firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray5
        textField.placeholder = "Enter First Name Here"
        textField.borderStyle = .line
        return textField
    }()
    
    let lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray5
        textField.placeholder = "Enter Last Name Here"
        textField.borderStyle = .line
        return textField
    }()
    
    let hobbyNameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray5
        textField.placeholder = "Enter Hobby Here"
        textField.borderStyle = .line
        return textField
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Create", for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraint() {
        addSubview(searchTextField)
        addSubview(searchButton)
        addSubview(firstNameTextField)
        addSubview(lastNameTextField)
        addSubview(hobbyNameTextField)
        addSubview(addButton)
        
        searchTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(100)
            make.height.equalTo(70)
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.bottom.equalTo(searchTextField)
            make.leading.equalTo(searchTextField.snp.trailing).offset(15)
            make.trailing.equalToSuperview().inset(15)
        }
        
        firstNameTextField.snp.makeConstraints { make in
            make.top.equalTo(searchButton.snp.bottom).offset(100)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(60)
        }
        
        lastNameTextField.snp.makeConstraints { make in
            make.top.equalTo(firstNameTextField.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(60)
        }
        
        hobbyNameTextField.snp.makeConstraints { make in
            make.top.equalTo(lastNameTextField.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(60)
        }
        
        addButton.snp.makeConstraints { make in
            make.top.equalTo(hobbyNameTextField.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(150)
        }
    }
    
    func creatingUser(completion: @escaping (String, String, String) -> Void ) {
        guard let firstName = firstNameTextField.text,
              let lastName = lastNameTextField.text,
              let hobby = hobbyNameTextField.text
        else { return }
        completion(firstName, lastName, hobby)
    }
    
    func searchUser() {
        
    }
}

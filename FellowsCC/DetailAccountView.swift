//
//  DetailAccountView.swift
//  FellowsCC
//
//  Created by Matthew Huie on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailAccountView: UIView {

    lazy var profileImage: UIButton = {
        let image = UIButton()
        image.setImage(UIImage(named: "placeholder"), for: .normal)
        return image
    }()
    
    lazy var displayName: UITextField = {
        let displayName = UITextField()
        displayName.borderStyle = UITextField.BorderStyle.roundedRect
        displayName.textAlignment = .center
        displayName.placeholder = "Enter display name here"
        return displayName
    }()
    
    lazy var firstName: UITextField = {
        let firstName = UITextField()
        firstName.textAlignment = .center
        firstName.borderStyle = UITextField.BorderStyle.roundedRect
        firstName.placeholder = "Enter first name here"
        return firstName
    }()
    
    lazy var lastName: UITextField = {
        let lastName = UITextField()
        lastName.borderStyle = UITextField.BorderStyle.roundedRect
        lastName.textAlignment = .center
        lastName.placeholder = "Enter last name here"
        return lastName
    }()
    
    lazy var bioTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .lightGray
        return textView
    }()
    
    lazy var doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    lazy var cancelButton: UIButton = {
        let cbutton = UIButton()
        cbutton.setTitle("Cancel", for: .normal)
        cbutton.setTitleColor(.red, for: .normal)
        return cbutton
    }()

    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupView()
    }
}

extension DetailAccountView {
    private func setupView() {
        setupProfileImage()
        setupDisplayName()
        setupFirstName()
        setupLastName()
        setupBio()
        setupDoneButton()
        setupCancelButton()
    }
    
    private func setupProfileImage() {
        addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    private func setupDisplayName() {
        addSubview(displayName)
        displayName.translatesAutoresizingMaskIntoConstraints = false
        displayName.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 8).isActive = true
        displayName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        displayName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        displayName.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setupFirstName() {
        addSubview(firstName)
        firstName.translatesAutoresizingMaskIntoConstraints = false
        firstName.topAnchor.constraint(equalTo: displayName.bottomAnchor, constant: 8).isActive = true
        firstName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        firstName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        firstName.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setupLastName() {
        addSubview(lastName)
        lastName.translatesAutoresizingMaskIntoConstraints = false
        lastName.topAnchor.constraint(equalTo: firstName.bottomAnchor, constant: 8).isActive = true
        lastName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        lastName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        lastName.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setupBio() {
        addSubview(bioTextView)
        bioTextView.translatesAutoresizingMaskIntoConstraints = false
        bioTextView.topAnchor.constraint(equalTo: lastName.bottomAnchor, constant: 8).isActive = true
        bioTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        bioTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        bioTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func setupDoneButton() {
        addSubview(doneButton)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.topAnchor.constraint(equalTo: bioTextView.bottomAnchor, constant: 20).isActive = true
        doneButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setupCancelButton() {
        addSubview(cancelButton)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.topAnchor.constraint(equalTo: doneButton.bottomAnchor, constant: 15).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
}

//
//  AccountSettingsView.swift
//  FellowsCC
//
//  Created by Matthew Huie on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class AccountSettingsView: UIView {

    lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.black.cgColor
        image.clipsToBounds = true
        image.image = UIImage(named: "placeholder")
        return image
    }()
    
    lazy var displayName: UILabel = {
        let displayName = UILabel()
        displayName.textAlignment = .center
        return displayName
    }()
    
    lazy var fullName: UILabel = {
        let fullName = UILabel()
        fullName.textAlignment = .center
        return fullName
    }()
    
    lazy var bioTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.backgroundColor = .lightGray
        return textView
    }()
    
    lazy var editProfile: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
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

extension AccountSettingsView {
    private func setupView() {
        setupProfileImage()
        setupDisplayName()
        setupFullName()
        setupBio()
        setupEditProfile()
    
        
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
        displayName.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 15).isActive = true
        displayName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        displayName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        displayName.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setupFullName() {
        addSubview(fullName)
        fullName.translatesAutoresizingMaskIntoConstraints = false
        fullName.topAnchor.constraint(equalTo: displayName.bottomAnchor, constant: 15).isActive = true
        fullName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        fullName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        fullName.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setupBio() {
        addSubview(bioTextView)
        bioTextView.translatesAutoresizingMaskIntoConstraints = false
        bioTextView.topAnchor.constraint(equalTo: fullName.bottomAnchor, constant: 15).isActive = true
        bioTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        bioTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        bioTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupEditProfile() {
        addSubview(editProfile)
        editProfile.translatesAutoresizingMaskIntoConstraints = false
        editProfile.topAnchor.constraint(equalTo: bioTextView.bottomAnchor, constant: 20).isActive = true
        editProfile.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        editProfile.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        editProfile.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}

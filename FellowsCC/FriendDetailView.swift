//
//  FriendDetailView.swift
//  FellowsCC
//
//  Created by Jose Alarcon Chacon on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FriendDetailView: UIView {
 
    
    lazy var friendImageViewDetail: UIImageView = {
        var image = UIImageView()
        image = UIImageView()
        image.image = UIImage(named: "placeholder")
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "My name"
        label.textColor = .black
        return label
    }()
    
    lazy var bioDescriptionTextView: UILabel = {
        var bioTextView = UILabel()
        bioTextView.text = "Here we go..................."
        bioTextView.textColor = .black
        bioTextView.numberOfLines = 8
        return bioTextView
    }()
    
    lazy var payButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Pay", for: .normal)
        button.addTarget(self, action: #selector(payButtonPress), for: .touchUpInside)
        return button
    }()
    @objc func payButtonPress() {
    }
    
    lazy var requestButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Request", for: .normal)
        button.addTarget(self, action: #selector(requestButtonPress), for: .touchUpInside)
        return button
    }()
    @objc func requestButtonPress() {
        print("was press")
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        setUpViewConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        setUpViewConstraints()
    }
    private func setUpViewConstraints() {
        addSubview(friendImageViewDetail)
        addSubview(nameLabel)
        addSubview(bioDescriptionTextView)
        addSubview(payButton)
        addSubview(requestButton)
        imageConstraints()
        setnameLabelConstraints()
        bioTextViewConstraints()
        setPayButton()
        setRequestButton()
    }
    
    func imageConstraints() {
        friendImageViewDetail.translatesAutoresizingMaskIntoConstraints = false
        friendImageViewDetail.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        friendImageViewDetail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100).isActive = true
        friendImageViewDetail.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100).isActive = true
        friendImageViewDetail.widthAnchor.constraint(equalToConstant: 150).isActive = true
        friendImageViewDetail.heightAnchor.constraint(equalToConstant: 180).isActive = true
    }
    
    func setnameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 320).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    func bioTextViewConstraints() {
        bioDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        bioDescriptionTextView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 350).isActive = true
        bioDescriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        bioDescriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        bioDescriptionTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
    }
    func setPayButton() {
        payButton.translatesAutoresizingMaskIntoConstraints = false
        payButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 460).isActive = true
        payButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        payButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -250).isActive = true
    }
    func setRequestButton() {
        requestButton.translatesAutoresizingMaskIntoConstraints = false
        requestButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 460).isActive = true
        requestButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 250).isActive = true
        requestButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
    }
}

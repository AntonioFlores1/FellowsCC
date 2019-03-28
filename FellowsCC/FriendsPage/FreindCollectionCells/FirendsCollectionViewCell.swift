//
//  FirendsCollectionViewCell.swift
//  FellowsCC
//
//  Created by Pursuit on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FirendsCollectionViewCell: UICollectionViewCell {
    
    lazy var friendImageView: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "placeholder")
        image.layer.cornerRadius = image.frame.width/2
        image.clipsToBounds = true
        return image
    }()
    
    lazy var  nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var  bioLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
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
        addSubview(friendImageView)
        addSubview(nameLabel)
        addSubview(bioLabel)
        imageConstraints()
        setNameLable()
        setBioConstraints()
    }
    func imageConstraints() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        friendImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        friendImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        friendImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -300).isActive = true
        friendImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        friendImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        friendImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    func setNameLable() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: friendImageView.leadingAnchor, constant: 10).isActive = true
        nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 5).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }

    func setBioConstraints() {
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        bioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        bioLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bioLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}

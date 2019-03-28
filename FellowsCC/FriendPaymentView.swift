//
//  FriendPaymentView.swift
//  FellowsCC
//
//  Created by Pursuit on 3/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FriendPaymentView: UIView {
    
        lazy var collectionView: UICollectionView = { //
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize.init(width: 400, height: 120)
            layout.sectionInset = UIEdgeInsets.init(top: 30, left: 10, bottom: 30, right: 10)
            layout.scrollDirection = .vertical
            
            let myCV = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
            myCV.backgroundColor = .white
            
            return myCV
        }()
        
        override init(frame: CGRect) {
            super.init(frame: UIScreen.main.bounds)
            self.backgroundColor = .white
            collectionView.register(PaymentToCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
            setCollectionViewConstraints()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setCollectionViewConstraints() {
            addSubview(collectionView)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
            //collectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
            collectionView.heightAnchor.constraint(equalTo: heightAnchor, constant: -200).isActive = true
        }
}

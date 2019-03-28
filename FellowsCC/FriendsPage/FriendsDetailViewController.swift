//
//  FriendsDetailViewController.swift
//  FellowsCC
//
//  Created by Pursuit on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit



class FriendsDetailViewController: UIViewController {
    private var tapGesture: UITapGestureRecognizer!
    
    private let authservice = AppDelegate.authservice
    public var userDetail: CCUser!

    var friendDetail = FriendDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonClicked))
        view.addSubview(friendDetail)
        setuserImageUI()
        
        friendDetail.nameLabel.text = userDetail.displayName
        friendDetail.bioDescriptionTextView.text = userDetail.bio
        friendDetail.friendImageViewDetail.kf.setImage(with: URL(string: userDetail.photoURL!))
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped(gestureRecognizer:)))
        friendDetail.payButton.addGestureRecognizer(tapGesture)
        friendDetail.payButton.isUserInteractionEnabled = true
    }
    
    @objc func cancelButtonClicked(){
        dismiss(animated: true, completion: nil)
    }
    
     @objc func tapped(gestureRecognizer: UITapGestureRecognizer) {
        let paymentVC = PaymentViewController()
        let user = userDetail
        print("before")
        paymentVC.sendMoneyToPerson = user
        print("after")
        paymentVC.modalTransitionStyle = .coverVertical
        paymentVC.modalPresentationStyle = .currentContext
        let nav = UINavigationController(rootViewController: paymentVC)
        present(nav, animated: true, completion: nil)
    }
    
    private func setuserImageUI() {
        friendDetail.friendImageViewDetail.layer.cornerRadius = 50
        friendDetail.friendImageViewDetail.clipsToBounds = true
        friendDetail.friendImageViewDetail.layer.borderColor = UIColor.black.cgColor
        friendDetail.friendImageViewDetail.layer.borderWidth = 1
    }
}

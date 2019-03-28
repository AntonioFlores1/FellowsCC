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

    var friendDetail = FriendDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Info"
        view.addSubview(friendDetail)
        setuserImageUI()
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped(gestureRecognizer:)))
        friendDetail.payButton.addGestureRecognizer(tapGesture)
        friendDetail.payButton.isUserInteractionEnabled = true
    }
     @objc func tapped(gestureRecognizer: UITapGestureRecognizer) {
        print("eeeeeeeeeeee")
        let controller = UIAlertController(title: "You had choose to send money to", message: nil, preferredStyle: .alert)
        controller.addTextField { (payment) in
            payment.placeholder = "Enter amount"
            payment.keyboardType = UIKeyboardType.emailAddress
        }
        let pay = UIAlertAction(title: "Pay", style: .default) { (action) in
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        controller.addAction(pay)
        controller.addAction(cancel)
        present(controller,animated: true)
    }
    
    private func setuserImageUI() {
        friendDetail.friendImageViewDetail.layer.cornerRadius = 50
        friendDetail.friendImageViewDetail.clipsToBounds = true
        friendDetail.friendImageViewDetail.layer.borderColor = UIColor.black.cgColor
        friendDetail.friendImageViewDetail.layer.borderWidth = 1
    }
}

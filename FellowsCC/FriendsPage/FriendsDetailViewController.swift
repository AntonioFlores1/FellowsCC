//
//  FriendsDetailViewController.swift
//  FellowsCC
//
//  Created by Pursuit on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FriendsDetailViewController: UIViewController {

    var friendDetail = FriendDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Info"
        view.addSubview(friendDetail)
    }

}

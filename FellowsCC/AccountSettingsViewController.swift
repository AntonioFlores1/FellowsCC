//
//  AccountSettingsViewController.swift
//  FellowsCC
//
//  Created by Pursuit on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class AccountSettingsViewController: UIViewController {

    private var authService = AppDelegate.authservice
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func signOutPressed(_ sender: Any) {
        authService.signOutAccount()
    }
    

}


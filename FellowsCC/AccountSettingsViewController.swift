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
    let accountSettings = AccountSettingsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(accountSettings)

    }
    
    
    
    
    @IBAction func signOutPressed(_ sender: Any) {
        authService.signOutAccount()
    }
    

}


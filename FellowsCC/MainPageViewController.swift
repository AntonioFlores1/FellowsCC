//
//  MainPageViewController.swift
//  FellowsCC
//
//  Created by Pursuit on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {

    private var authService = AppDelegate.authservice
    
    override func viewDidLoad() {
        super.viewDidLoad()
authService.authserviceSignOutDelegate = self
    }
    


}
extension MainPageViewController: AuthServiceSignOutDelegate {
    func didSignOut(_ authservice: AuthService) {
        showLoginView()
    }
    func didSignOutWithError(_ authservice: AuthService, error: Error) {
        showAlert(title: "Sign Out Error" , message: error.localizedDescription)
    }
}

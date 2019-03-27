//
//  Extention+Navegation.swift
//  FellowsCC
//
//  Created by Pursuit on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

extension UIViewController {
    public func showLoginView() {
        if let _ = storyboard?.instantiateViewController(withIdentifier: "MainPageTabBarController") as? TabBarController {
            let loginViewStoryboard = UIStoryboard(name: "login", bundle: nil)
            if let loginViewController = loginViewStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
                (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = UINavigationController(rootViewController: loginViewController)
            }
        } else {
            dismiss(animated: true)
        }
    }
}

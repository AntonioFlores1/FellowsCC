//
//  AccountSettingsViewController.swift
//  FellowsCC
//
//  Created by Pursuit on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
import Kingfisher

class AccountSettingsViewController: UIViewController {

    private var authService = AppDelegate.authservice
    
    let accountSettings = AccountSettingsView()
    var userProfile: CCUser?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(accountSettings)
        navigationItem.title = "Profile"
        InitUI()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateProfile()
    }
    
    private func InitUI() {
        accountSettings.editProfile.addTarget(self, action: #selector(editProfileButtonPressed), for: .touchUpInside)
    }
    
    private func updateProfile() {
        guard let user = authService.getCurrentUser() else {
            print("no logged user")
            return
        }
        DBService.fetchUser(userId: user.uid) { [weak self] (error, user) in
            if let error = error {
                self?.showAlert(title: "Error Fetching Account", message: error.localizedDescription)
            } else if let user = user {
                self?.accountSettings.displayName.text = "@" + user.displayName
                self?.accountSettings.bioTextView.text = user.bio
                self?.accountSettings.fullName.text = user.fullName
                self?.userProfile = user
                guard let photoURL = user.photoURL, !photoURL.isEmpty else {return}
                self?.accountSettings.profileImage.kf.setImage(with: URL(string: photoURL), placeholder: UIImage(named: "placeholder"))
            }
        }
    }
    @objc func editProfileButtonPressed() {
        let detailvc = DetailAccountViewController()
        detailvc.userProfile = self.userProfile
        self.present(detailvc, animated: true, completion: nil)
    }
    
    
    @IBAction func signOutPressed(_ sender: Any) {
        authService.signOutAccount()
    }
    

}


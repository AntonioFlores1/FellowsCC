//
//  FreindPaymentToViewController.swift
//  FellowsCC
//
//  Created by Pursuit on 3/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
import Firebase
import Kingfisher

class FreindPaymentToViewController: UIViewController {
    
let searchController = UISearchController(searchResultsController: nil)
    
    let friendPaymentTo = FriendPaymentView()
    private var authservice = AppDelegate.authservice
   // private var listener: ListenerRegistration!
    
    var name = String()
    var bioDescription = String()
    
    var friendList = [CCUser](){
        didSet {
            DispatchQueue.main.async {
                self.friendPaymentTo.collectionView.reloadData()
            }
        }
    }
    
    private lazy var refresh: UIRefreshControl = {
        let refC = UIRefreshControl()
        self.friendPaymentTo.collectionView.refreshControl = refC
        return refC
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .yellow
        //navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))
        navigationItem.title = "Send money" 
   view.addSubview(friendPaymentTo)
    friendPaymentTo.collectionView.delegate = self
    friendPaymentTo.collectionView.dataSource = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Friends"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        fetchUser()
    }
    
//    @objc func cancelButtonPressed(){
//        dismiss(animated: true, completion: nil)
//    }
    
    func fetchUser() {
        DBService.firestoreDB.collection(UsersCollectionKeys.CollectionKey)
            .addSnapshotListener { (snapshot, error) in
                if let error = error {
                    self.showAlert(title: "Error getting user", message: error.localizedDescription)
                } else if let snapshot = snapshot {
                    var userInfo = [CCUser]()
                    for document in snapshot.documents {
                        let user = CCUser(dict: document.data())
                        userInfo.append(user)
                    }
                    self.friendList = userInfo
                }
        }
    }
    
    
    func searchForUser(user: String) {
        DBService.searchUser { (error, ccUser) in
            if let error = error {
                self.showAlert(title: "Error is:", message: error.localizedDescription)
            } else if let ccUser = ccUser {
                self.friendList = ccUser.filter{($0.firstName!.lowercased().contains(user.lowercased())) ||
                    (($0.displayName.lowercased().contains(user.lowercased()))) ||
                    (($0.lastName!.lowercased().contains(user.lowercased()))) ||
                    ((($0.firstName!.lowercased()+" "+$0.lastName!.lowercased()).contains(user.lowercased())))
                }
            }
        }
    }
}


extension FreindPaymentToViewController:  UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendList.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PaymentToCollectionViewCell else {return UICollectionViewCell()}
        let list = friendList[indexPath.row]
        cell.nameLabel.text = list.fullName
        cell.bioLabel.text = list.bio
        cell.friendImageView.kf.setImage(with: URL(string: list.photoURL!),placeholder:#imageLiteral(resourceName: "profilePlaceHolder") )

        //cell.friendImageView.layer.borderWidth = 1
        //cell.friendImageView.layer.masksToBounds = false
        cell.friendImageView.layer.borderColor = UIColor.blue.cgColor
        cell.friendImageView.layer.cornerRadius = cell.friendImageView.frame.height/2
        cell.setNeedsLayout()
        cell.friendImageView.clipsToBounds = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let paymentVC = PaymentViewController()
        let user = friendList[indexPath.row]
        print("before")
        paymentVC.sendMoneyToPerson = user
        print("after")
        paymentVC.modalTransitionStyle = .coverVertical
        paymentVC.modalPresentationStyle = .currentContext
        let nav = UINavigationController(rootViewController: paymentVC)
        present(nav, animated: true, completion: nil)
        
    }
}
extension FreindPaymentToViewController:  UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {

    }
}
extension FreindPaymentToViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchForUser(user: searchText)
    }
}

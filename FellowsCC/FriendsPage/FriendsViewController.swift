//
//  FriendsViewController.swift
//  FellowsCC
//
//  Created by Pursuit on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
import Kingfisher
import Firebase

class FriendsViewController: UIViewController {

    var friendView = FriendView()
    var friendDetailView = FriendDetailView()
    var friendCell = FirendsCollectionViewCell()
    var filteredCandies = [CCUser]()
    private var authservice = AppDelegate.authservice
    //private var listener: ListenerRegistration!
    
    var name = String()
    var bioDescription = String()
    
    var friendList = [CCUser]() {
        didSet {
            DispatchQueue.main.async {
                self.friendView.collectionView.reloadData()
            }
        }
    }
    private lazy var refresh: UIRefreshControl = {
        let refC = UIRefreshControl()
        self.friendView.collectionView.refreshControl = refC
        return refC
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Friends"
        self.view.backgroundColor = .black
        friendView.searchBar.delegate = self
        view.addSubview(friendView)
        friendView.collectionView.delegate = self
        friendView.collectionView.dataSource = self
        friendDetailView.nameLabel.text = name
        friendDetailView.bioDescriptionTextView.text = bioDescription
        fetchUser()
    }
    
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

extension FriendsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendList.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? FirendsCollectionViewCell else {return UICollectionViewCell()}
        let list = friendList[indexPath.row]
        cell.nameLabel.text = list.fullName
        cell.bioLabel.text = list.bio
        cell.friendImageView.layer.cornerRadius = cell.friendImageView.frame.width/2
        cell.friendImageView.kf.setImage(with: URL(string: list.photoURL!),placeholder:#imageLiteral(resourceName: "placeholder.png") )
        
        cell.friendImageView.layer.borderWidth = 1
        cell.friendImageView.layer.masksToBounds = false
        cell.friendImageView.layer.borderColor = UIColor.black.cgColor
        cell.setNeedsLayout()
        cell.friendImageView.clipsToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let friendDVC = FriendsDetailViewController()
        friendDVC.userDetail = friendList[indexPath.row]
        friendDVC.modalPresentationStyle = .overCurrentContext
        friendDVC.modalTransitionStyle = .flipHorizontal
        let nav = UINavigationController.init(rootViewController: friendDVC)
        present(nav, animated: true, completion: nil)
        
    }
}
extension FriendsViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchText = searchBar.text else {return}
        searchForUser(user: searchText)
        friendView.collectionView.reloadData()
    }
}

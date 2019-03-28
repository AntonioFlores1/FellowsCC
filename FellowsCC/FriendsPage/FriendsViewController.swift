//
//  FriendsViewController.swift
//  FellowsCC
//
//  Created by Pursuit on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {
    let searchController = UISearchController(searchResultsController: nil)

    var friendView = FriendView()
    var friendDetailView = FriendDetailView()
    var friendCell = FirendsCollectionViewCell()
    var filteredCandies = [CCUser]()
    private var authservice = AppDelegate.authservice
    
    var name = String()
    var bioDescription = String()
    
    var friendList = [CCUser]() {
        didSet {
            DispatchQueue.main.async {
                self.friendView.collectionView.reloadData()
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        navigationItem.title = "Friend List"
        view.addSubview(friendView)
        friendView.collectionView.delegate = self
        friendView.collectionView.dataSource = self
        friendDetailView.nameLabel.text = name
        friendDetailView.bioDescriptionTextView.text = bioDescription
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Friends"
        navigationItem.searchController = searchController
        definesPresentationContext = true
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
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? FirendsCollectionViewCell else {return UICollectionViewCell()}
//        let listOfUser = friendList[indexPath.row]
        print("the array is --->")
        print(friendList)
        print(indexPath.row)
//        cell.nameLabel.text = listOfUser.fullName
//        cell.bioLabel.text = listOfUser.bio
        
        
        cell.friendImageView.layer.borderWidth = 1
        cell.friendImageView.layer.masksToBounds = false
        cell.friendImageView.layer.borderColor = UIColor.black.cgColor
        cell.friendImageView.layer.cornerRadius = cell.friendImageView.frame.height/2
        cell.friendImageView.clipsToBounds = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         navigationController?.pushViewController(FriendsDetailViewController(), animated: true)
    }
}

extension FriendsViewController:  UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
extension FriendsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchForUser(user: searchText)
    }
}

//
//  FriendsViewController.swift
//  FellowsCC
//
//  Created by Pursuit on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {

    var friendView = FriendView()
    var friendDetailView = FriendDetailView()
    var friendCell = FirendsCollectionViewCell()
    var filteredCandies = [CCUser]()
    
    var name = String()
    var bioDescription = String()
    
    let searchController = UISearchController(searchResultsController: nil)
    
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
        searchController.searchBar.placeholder = "Search Candies"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}

extension FriendsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? FirendsCollectionViewCell else {return UICollectionViewCell()}
        
        
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


extension FriendsViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
    }
}

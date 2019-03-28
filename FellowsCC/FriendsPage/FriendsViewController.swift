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
    var friendCell = FirendsCollectionViewCell()
    
    var friendList = [CCUser]() {
        didSet {
            DispatchQueue.main.async {
                self.friendView.collectionView.reloadData()
            }
        }
    }

    lazy var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        navigationItem.title = "Friend List"
        view.addSubview(friendView)
        setSearchBar()
        searchBar.returnKeyType = UIReturnKeyType.done
        friendView.collectionView.delegate = self
        friendView.collectionView.dataSource = self
    }
    private func setSearchBar() {
        view.addSubview(searchBar)
        searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        searchBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        searchBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

extension FriendsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? FirendsCollectionViewCell else {return UICollectionViewCell()}
        cell.layer.cornerRadius = 30
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         navigationController?.pushViewController(FriendsDetailViewController(), animated: true)
    }
}

extension FriendsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}

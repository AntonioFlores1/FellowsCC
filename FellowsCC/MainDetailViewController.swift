//
//  MainDetailViewController.swift
//  FellowsCC
//
//  Created by Pursuit on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class MainDetailViewController: UIViewController {
    
    var table = [CCUser]()
    var newArray = ["Whole foods - $20",
                    "12% I Owe Pursuit -  $200 ",
                    "Macy's - $150",
                    "American Express Centurion Lounge - $45",
                    "MTA - $1,600",
                    "Yoga Studio - $18",]
    
    lazy var creditcardButton: UIButton = {
        let button = UIButton()
        button.imageView?.contentMode = .scaleToFill
        button.setImage(UIImage.init(named: "backOfCard"), for: .normal )
        //button.addTarget(self, action: #selector(flipCreditCard), for: .touchUpInside)
        //        button.layer.cornerRadius = button.frame.height / 2
        //        button.layer.borderWidth = 1
        //        button.layer.borderColor = UIColor.red.cgColor
        return button
    }()
    
    lazy var companyName: UILabel = {
        let company = UILabel()
        company.backgroundColor = .black
        return company
    }()

    lazy var tableView: UITableView = {
        let table = UITableView()
        
        return table
    }()
    @objc func flipCreditCard(){
        navigationController?.pushViewController(MainDetailViewController(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor.magenta.cgColor,UIColor.red.cgColor,UIColor.purple.cgColor,UIColor.blue.cgColor]
        self.view.layer.addSublayer(gradient)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.reloadData()
        constriant()
        tableViewconstriant()
        tableView.register(backTableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    @objc func cancel(){
        dismiss(animated: true, completion: nil)
    }
    
    func constriant(){
        self.view.addSubview(creditcardButton)
        self.view.addSubview(companyName)
        creditcardButton.translatesAutoresizingMaskIntoConstraints = false
        creditcardButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        creditcardButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        creditcardButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        creditcardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        creditcardButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        
        companyName.translatesAutoresizingMaskIntoConstraints = false
        companyName.leadingAnchor.constraint(equalTo: creditcardButton.leadingAnchor, constant: -1).isActive = true
        companyName.trailingAnchor.constraint(equalTo: creditcardButton.trailingAnchor, constant: -1).isActive = true
        companyName.topAnchor.constraint(equalTo: creditcardButton.topAnchor, constant: 33).isActive = true
        companyName.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
    }
    func tableViewconstriant() {
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: creditcardButton.bottomAnchor, constant: 33).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}
extension MainDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? backTableViewCell else { return UITableViewCell()}
        cell.cardInfoLabel.text = "\(newArray[indexPath.row])"
        
//        cell.cardInfoLabel.backgroundColor = .magenta
        return cell
    }
    
    
}

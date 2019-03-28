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
    
    lazy var balance: UILabel = {
        let balance = UILabel()
        balance.text = "1892.94"
        balance.font = UIFont.systemFont(ofSize: 22)
        balance.textColor = .green
        return balance
    }()
    
    lazy var companyName: UILabel = {
        let company = UILabel()
//        let gradient = CAGradientLayer()
//        gradient.frame = self.companyName.bounds
//        gradient.colors = [UIColor.magenta.cgColor,UIColor.red.cgColor,UIColor.purple.cgColor,UIColor.blue.cgColor]
//        self.view.layer.addSublayer(gradient)
        company.textColor = .white
        company.text = "Fellow"
        company.font = UIFont.systemFont(ofSize: 27)
        
        
        return company
    }()
    
    lazy var cardName: UILabel = {
        let name = UILabel()
        name.text = "Antonio Flores"
        name.textColor = .white
        name.font = UIFont.systemFont(ofSize: 14)
        return name
    }()
    
    lazy var creditcardButton: UIButton = {
        let button = UIButton()
        button.imageView?.contentMode = .scaleToFill
        button.setImage(UIImage.init(named: "defaultCreditCard"), for: .normal )
        button.addTarget(self, action: #selector(flipCreditCard), for: .touchUpInside)
//        button.layer.cornerRadius = button.frame.height / 2
//        button.layer.borderWidth = 1
//        button.layer.borderColor = UIColor.red.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // view.addSubview(requestPayment)
        //view.addSubview(recievePayment)
        view.backgroundColor = .white
authService.authserviceSignOutDelegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "send"), style: .done, target: self, action: #selector(sendMoney))
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(image:
            UIImage.init(named: "request"), style: .plain, target: self, action: #selector(recieveMoney))
        
        constriant()
       
    }
    
    @objc func flipCreditCard(){
        navigationController?.pushViewController(DetailAccountViewController(), animated: true)
    }
    
    @objc func sendMoney(){
    navigationController?.pushViewController(PaymentViewController(), animated: true)
    }
    
    @objc func recieveMoney(){
    navigationController?.pushViewController(RequestViewController(), animated: true)

    }
    func constriant(){
        self.view.addSubview(creditcardButton)
        creditcardButton.translatesAutoresizingMaskIntoConstraints = false
        creditcardButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        creditcardButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        creditcardButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        creditcardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        creditcardButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        
        self.view.addSubview(cardName)
        cardName.translatesAutoresizingMaskIntoConstraints = false
        cardName.bottomAnchor.constraint(equalTo: creditcardButton.bottomAnchor, constant: -33).isActive = true
        cardName.leadingAnchor.constraint(equalTo: creditcardButton.leadingAnchor, constant: 11).isActive = true
        
        self.view.addSubview(balance)
        balance.translatesAutoresizingMaskIntoConstraints = false
        balance.topAnchor.constraint(equalTo: creditcardButton.topAnchor, constant: 33).isActive = true
        balance.trailingAnchor.constraint(equalTo: creditcardButton.trailingAnchor, constant: -22).isActive = true
        
        self.view.addSubview(companyName)
        companyName.translatesAutoresizingMaskIntoConstraints = false
        companyName.topAnchor.constraint(equalTo: creditcardButton.topAnchor, constant: 33).isActive = true
        companyName.leadingAnchor.constraint(equalTo: creditcardButton.leadingAnchor, constant: 11).isActive = true
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

//
//  FinalPaymentViewController.swift
//  FellowsCC
//
//  Created by Pursuit on 3/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FinalPaymentViewController: UIViewController {

    lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Hola this is me"
        label.textAlignment = .center
        label.backgroundColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        constraint()
    }
    

    func constraint(){
        view.addSubview(amountLabel)
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        amountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        amountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        amountLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        
    }

}

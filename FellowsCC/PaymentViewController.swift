//
//  PaymentViewController.swift
//  FellowsCC
//
//  Created by Pursuit on 3/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {

    let paymentRequest = PayView()
    
    public var sendMoneyToPerson: CCUser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(paymentRequest)
        navigationItem.titleView = titleStackView
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .undo , target: self, action: #selector(cancelButton))
    }
    
    lazy var titleStackView: UIStackView = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.text = "Send amount to"
        let subtitleLabel = UILabel()
        subtitleLabel.textAlignment = .center
        subtitleLabel.text = "\(sendMoneyToPerson.displayName)"
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.axis = .vertical
        return stackView
    }()
    
    
    
    @objc func cancelButton(){
        dismiss(animated: true, completion: nil)
    }

    

}

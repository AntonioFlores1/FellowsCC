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
        titleStackView.reloadInputViews()
        navigationItem.titleView = titleStackView
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .undo , target: self, action: #selector(cancelButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Finish", style: .done, target: self, action: #selector(finalPayment))
    }
    
   @objc func finalPayment(){
    let amount = paymentRequest.numberDisplay
    
        navigationController?.pushViewController(FinalPaymentViewController(), animated: true)
    }
    
    lazy var titleStackView: UIStackView = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.text = "Send \(paymentRequest.numberDisplay.text!) to"
        let subtitleLabel = UILabel()
        subtitleLabel.textAlignment = .center
        subtitleLabel.text = "\(sendMoneyToPerson.fullName)"
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.axis = .vertical
        return stackView
    }()
    
    
    
    @objc func cancelButton(){
        dismiss(animated: true, completion: nil)
    }

    

}

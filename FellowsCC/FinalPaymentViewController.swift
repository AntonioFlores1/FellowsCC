//
//  FinalPaymentViewController.swift
//  FellowsCC
//
//  Created by Pursuit on 3/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FinalPaymentViewController: UIViewController {

    lazy var send: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Send"
        label.textAlignment = .center
        //label.backgroundColor = .black
        label.font = UIFont(name: "Arial", size: 36)
        return label
    }()
    lazy var to: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "To"
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 30)
        return label
    }()
    
    lazy var amount: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 28)
        label.textColor = .white
       // label.text = "Send"
        //label.backgroundColor = .red
        return label
    }()
    
    lazy var buttonimage:UIButton = {
    var button = UIButton()
    button.setImage(UIImage.init(named: "design"), for: .normal)
    return button
    }()
    
    lazy var done: UIButton = {
        let button = UIButton()
        button.setTitle("Send Payment", for: .normal)
        button.addTarget(self, action: #selector(finish), for: .touchUpInside )
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    lazy var ana: UIButton = {
        let button = UIButton()
//        let gradient = CAGradientLayer()
//        gradient.frame = self.ana.bounds
//        gradient.colors = [UIColor.magenta.cgColor,UIColor.red.cgColor,UIColor.purple.cgColor,UIColor.blue.cgColor]
//        button.layer.addSublayer(gradient)
        //self.view.layer.addSublayer(gradient)
        button.setTitle("Send Payment", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .red
//        button.setTitleColor(.white, for: .normal)
        return button
    }()
    @objc func finish(){
        self.showAlert(title: "Success", message: "Payment Sent")

        dismiss(animated: true) {
//            self.showAlert(title: "Success", message: "Payment Sent")
            self.dismiss(animated: true, completion: {
                FinalPaymentViewController().dismiss(animated: true)
            })

        }
       // dismiss(animated: true, completion: nil)
        //present(MainPageViewController(), animated: true, completion: nil)

        //dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.repeat,.autoreverse,.curveEaseInOut,.layoutSubviews], animations: {
            self.ana.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)

            //self.secondLayer.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
        })
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor.magenta.cgColor,UIColor.red.cgColor,UIColor.purple.cgColor,UIColor.blue.cgColor]
        self.view.layer.addSublayer(gradient)
        view.backgroundColor = .white
        constraint()
//        let gradient = CAGradientLayer()
//        gradient.frame = self.view.bounds
//        gradient.colors = [UIColor.magenta.cgColor,UIColor.red.cgColor,UIColor.purple.cgColor,UIColor.blue.cgColor]
//        self.view.layer.addSublayer(gradient)
    }
    

    func constraint(){
        view.addSubview(ana)
        view.addSubview(done)
        view.addSubview(amount)
        view.addSubview(send)
        view.addSubview(buttonimage)
        view.addSubview(to)
        send.translatesAutoresizingMaskIntoConstraints = false
        send.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        send.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        send.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        send.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        buttonimage.translatesAutoresizingMaskIntoConstraints = false
        buttonimage.topAnchor.constraint(equalTo: send.bottomAnchor, constant: 22).isActive = true
        buttonimage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -33).isActive = true
        buttonimage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        buttonimage.widthAnchor.constraint(equalToConstant: 180.0).isActive = true
        buttonimage.heightAnchor.constraint(equalToConstant: 90.0).isActive = true
        
        amount.translatesAutoresizingMaskIntoConstraints = false
        
        amount.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -33).isActive = true
        amount.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        amount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 44).isActive = true
        amount.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -44).isActive = true
        
        to.translatesAutoresizingMaskIntoConstraints = false
        to.topAnchor.constraint(equalTo: buttonimage.bottomAnchor, constant: -22).isActive = true
        //to.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        //to.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 11).isActive = true
        to.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        done.translatesAutoresizingMaskIntoConstraints = false
        done.topAnchor.constraint(equalTo: to.bottomAnchor, constant: 33).isActive = true
        done.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        //ana
        ana.translatesAutoresizingMaskIntoConstraints = false
        ana.topAnchor.constraint(equalTo: to.bottomAnchor, constant: 33).isActive = true
        ana.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        //ana.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
    }

}

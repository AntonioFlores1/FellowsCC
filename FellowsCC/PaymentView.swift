//
//  PayView.swift
//  FellowsCC
//
//  Created by Pursuit on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class PayView: UIView {

    lazy var button1: UIButton = {
        let button = UIButton()
        button.setTitle("1", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.blue.cgColor
        return button
    }()
    
    lazy var button2: UIButton = {
        let button = UIButton()
        button.setTitle("2", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        return button
    }()
    lazy var button3: UIButton = {
        let button = UIButton()
    button.setTitle("3", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.backgroundColor = .white
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame:UIScreen.main.bounds)
        self.backgroundColor = .red
        constraintsButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constraintsButton(){
        addSubview(button2)

        addSubview(button1)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 80.0).isActive = true
        //button1.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        //button1.trailingAnchor.constraint(equalTo: button2.leadingAnchor, constant: 11).isActive = true
        button1.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -11).isActive = true
        
        //addSubview(button2)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 80.0).isActive = true
        button2.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
       // button2.leadingAnchor.constraint(equalTo: button1.trailingAnchor, constant: 11).isActive = true
        button2.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -11).isActive = true
        
        addSubview(button3)
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        button3.heightAnchor.constraint(equalToConstant: 80.0).isActive = true
        button3.leadingAnchor.constraint(equalTo: button2.trailingAnchor, constant: 11).isActive = true
        button3.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -11).isActive = true
    }
    
    
    
}

//
//  PayView.swift
//  FellowsCC
//
//  Created by Pursuit on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class PayView: UIView {

    lazy var numberDisplay: UILabel = {
        var label = UILabel()
        label.backgroundColor = .white
        label.text = "0"
        label.textAlignment = .right
        label.font = UIFont(name: "Arial", size: 70)
        return label
    }()
    
    lazy var button1: UIButton = {
        let button = UIButton()
        button.setTitle("1", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.blue.cgColor
        button.tag = 1
        button.addTarget(self, action: #selector(numberPressed(button:)), for: .touchUpInside)
        return button
    }()
    
    lazy var button2: UIButton = {
        let button = UIButton()
        button.setTitle("2", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.tag = 2
        button.addTarget(self, action: #selector(numberPressed(button:)), for: .touchUpInside)
        return button
    }()
    lazy var button3: UIButton = {
        let button = UIButton()
    button.setTitle("3", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.backgroundColor = .white
    button.tag = 3
    button.addTarget(self, action: #selector(numberPressed(button:)), for: .touchUpInside)
        return button
    }()
    /////////////////////////////////////////////////////////////////////////////////////
    
    lazy var button4: UIButton = {
        let button = UIButton()
        button.setTitle("4", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.tag = 4
        button.addTarget(self, action: #selector(numberPressed(button:)), for: .touchUpInside)
        return button
    }()
    lazy var button5: UIButton = {
        let button = UIButton()
        button.setTitle("5", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.tag = 5
        button.addTarget(self, action: #selector(numberPressed(button:)), for: .touchUpInside)
        return button
    }()
    lazy var button6: UIButton = {
        let button = UIButton()
        button.setTitle("6", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.tag = 6
        button.addTarget(self, action: #selector(numberPressed(button:)), for: .touchUpInside)
        return button
    }()
    /////////////////////////////////////////////////////////////////////////////////////
    lazy var button7: UIButton = {
        let button = UIButton()
        button.setTitle("7", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.tag = 7
        button.addTarget(self, action: #selector(numberPressed(button:)), for: .touchUpInside)
        return button
    }()
    lazy var button8: UIButton = {
        let button = UIButton()
        button.setTitle("8", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.tag = 8
        button.addTarget(self, action: #selector(numberPressed(button:)), for: .touchUpInside)
        return button
    }()
    lazy var button9: UIButton = {
        let button = UIButton()
        button.setTitle("9", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.tag = 9
        button.addTarget(self, action: #selector(numberPressed(button:)), for: .touchUpInside)
        return button
    }()
    
    @objc func numberPressed(button:UIButton){
        if numberDisplay.text == "0" {
            var changeText = "$"
            let value = button.tag.description
//            changeText = numberDisplay.text!
            numberDisplay.text = "$" + value
        } else {
            if (numberDisplay.text?.contains("$"))!{
                let value = button.tag.description
                let existingText = numberDisplay.text ?? ""
                numberDisplay.text = existingText + value
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame:UIScreen.main.bounds)
        self.backgroundColor = .red
        constraintsButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constraintsButton(){
        addSubview(button9)
        addSubview(button8)
        addSubview(button7)
        addSubview(button6)
        addSubview(button5)
        addSubview(button4)
        addSubview(numberDisplay)
        addSubview(button2)
        addSubview(button3)
        addSubview(button1)
//Button1
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.widthAnchor.constraint(equalToConstant: 140.0).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 140.0).isActive = true
       ///button1.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        button1.trailingAnchor.constraint(equalTo: button2.leadingAnchor, constant: -1).isActive = true
        button1.topAnchor.constraint(equalTo: numberDisplay.bottomAnchor, constant: 0).isActive = true
        ///button1.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -11).isActive = true
//Button2
        ///addSubview(button2)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.widthAnchor.constraint(equalToConstant: 140.0).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 140.0).isActive = true
        button2.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        button2.topAnchor.constraint(equalTo: numberDisplay.bottomAnchor, constant: 0).isActive = true
       // button2.leadingAnchor.constraint(equalTo: button1.trailingAnchor, constant: 11).isActive = true
        //button2.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -11).isActive = true
//Button3
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.widthAnchor.constraint(equalToConstant: 140.0).isActive = true
        button3.heightAnchor.constraint(equalToConstant: 140.0).isActive = true
        button3.leadingAnchor.constraint(equalTo: button2.trailingAnchor, constant: 1).isActive = true
        button3.topAnchor.constraint(equalTo: numberDisplay.bottomAnchor, constant: 0).isActive = true
        //button3.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -11).isActive = true
        //NumberDiplay
        numberDisplay.translatesAutoresizingMaskIntoConstraints = false
        numberDisplay.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        numberDisplay.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        numberDisplay.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
///////////////////////////////////////////////////////////////////////////////////////////
//BUTTON4
        button4.translatesAutoresizingMaskIntoConstraints = false
        button4.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 1).isActive = true
        button4.widthAnchor.constraint(equalToConstant: 140.0).isActive = true
        button4.heightAnchor.constraint(equalToConstant: 140.0).isActive = true
//BUTTON5
        button5.translatesAutoresizingMaskIntoConstraints = false
        button5.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 1).isActive = true
        button5.widthAnchor.constraint(equalToConstant: 140.0).isActive = true
        button5.heightAnchor.constraint(equalToConstant: 140.0).isActive = true
        button5.leadingAnchor.constraint(equalTo: button4.trailingAnchor, constant: 1).isActive = true
        button5.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
//BUTTON6
        button6.translatesAutoresizingMaskIntoConstraints = false
        button6.topAnchor.constraint(equalTo: button3.bottomAnchor, constant: 1).isActive = true
        button6.widthAnchor.constraint(equalToConstant: 140.0).isActive = true
        button6.heightAnchor.constraint(equalToConstant: 140.0).isActive = true
        button6.leadingAnchor.constraint(equalTo: button5.trailingAnchor, constant: 1).isActive = true
///////////////////////////////////////////////////////////////////////////////////////////
//BUTTON7
        button7.translatesAutoresizingMaskIntoConstraints = false
        button7.topAnchor.constraint(equalTo: button4.bottomAnchor, constant: 1).isActive = true
        button7.widthAnchor.constraint(equalToConstant: 140.0).isActive = true
        button7.heightAnchor.constraint(equalToConstant: 140.0).isActive = true
//BUTTON8
        button8.translatesAutoresizingMaskIntoConstraints = false
        button8.topAnchor.constraint(equalTo: button5.bottomAnchor, constant: 1).isActive = true
        button8.widthAnchor.constraint(equalToConstant: 140.0).isActive = true
        button8.heightAnchor.constraint(equalToConstant: 140.0).isActive = true
        button8.leadingAnchor.constraint(equalTo: button7.trailingAnchor, constant: 1).isActive = true
        button8.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
//BUTTON9
        button9.translatesAutoresizingMaskIntoConstraints = false
        button9.topAnchor.constraint(equalTo: button6.bottomAnchor, constant: 1).isActive = true
        button9.widthAnchor.constraint(equalToConstant: 140.0).isActive = true
        button9.heightAnchor.constraint(equalToConstant: 140.0).isActive = true
        button9.leadingAnchor.constraint(equalTo: button8.trailingAnchor, constant: 1).isActive = true
    }
}

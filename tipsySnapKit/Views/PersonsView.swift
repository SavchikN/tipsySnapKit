//
//  PersonsView.swift
//  tipsySnapKit
//
//  Created by Nikita Savchik on 04/03/2023.
//

import UIKit
import SnapKit

class PersonsView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Persons"
        label.textColor = #colorLiteral(red: 0.1792383194, green: 0.2248822749, blue: 0.2836511731, alpha: 1)
        label.font = UIFont(name: "Avenir Next", size: 14)
        return label
    }()
    
    let counterLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = #colorLiteral(red: 0.1792383194, green: 0.2248822749, blue: 0.2836511731, alpha: 1)
        label.font = UIFont(name: "Avenir Next Bold", size: 48)
        label.textAlignment = .center
        return label
    }()
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.tintColor = #colorLiteral(red: 0.3764705882, green: 0.4196078431, blue: 0.4901960784, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 60)
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.tintColor = #colorLiteral(red: 0.3764705882, green: 0.4196078431, blue: 0.4901960784, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 60)
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var counter = 1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func plusButtonTapped() {
        counter += 1
        counterLabel.text = "\(counter)"
        minusButton.isEnabled = true
    }
    
    @objc func minusButtonTapped() {
        counter -= 1
        counterLabel.text = "\(counter)"
        
        if counter == 1 {
            minusButton.isEnabled = false
        }
    }
    
    func setupViews() {
        addSubview(titleLabel)
        addSubview(backgroundView)
        addSubview(counterLabel)
        addSubview(plusButton)
        addSubview(minusButton)
    }
}

extension PersonsView {
    private func setConstrains() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top).inset(0)
            make.leading.equalTo(snp.leading).inset(5)
        }
        
        backgroundView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-2)
            make.leading.equalTo(snp.leading).inset(0)
            make.trailing.equalTo(snp.trailing).inset(0)
            make.height.equalTo(100)
        }
        
        minusButton.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.snp.top).inset(0)
            make.leading.equalTo(backgroundView.snp.leading).inset(0)
            make.height.equalTo(backgroundView.snp.height)
            make.width.equalTo(80)
        }
        
        plusButton.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.snp.top).inset(0)
            make.trailing.equalTo(backgroundView.snp.trailing).inset(0)
            make.height.equalTo(backgroundView.snp.height)
            make.width.equalTo(80)
        }
        
        counterLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backgroundView.snp.centerY)
            make.leading.equalTo(minusButton.snp.trailing).inset(10)
            make.trailing.equalTo(plusButton.snp.leading).inset(-10)
        }
    }
}

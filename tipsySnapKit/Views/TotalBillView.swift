//
//  TotalBillView.swift
//  tipsySnapKit
//
//  Created by Nikita Savchik on 03/03/2023.
//

import UIKit
import SnapKit

class TotalBillView: UIView {
    let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Total Bill"
        title.textColor = #colorLiteral(red: 0.1792383194, green: 0.2248822749, blue: 0.2836511731, alpha: 1)
        title.font = UIFont(name: "Avenir Next", size: 14)
        return title
    }()
    
    let sumTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .decimalPad
        textField.textColor = #colorLiteral(red: 0.1792383194, green: 0.2248822749, blue: 0.2836511731, alpha: 1)
        textField.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        textField.tintColor = #colorLiteral(red: 0.5647058824, green: 0.1529411765, blue: 0.7450980392, alpha: 1)
        textField.font = UIFont(name: "Avenir Next Bold", size: 48)
        textField.layer.cornerRadius = 10
        textField.textAlignment = .center
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(titleLabel)
        addSubview(sumTextField)
    }
}

extension TotalBillView {
    private func setConstrains() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top).inset(0)
            make.leading.equalTo(snp.leading).inset(5)
        }
        
        sumTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-2)
            make.leading.equalTo(snp.leading).inset(0)
            make.trailing.equalTo(snp.trailing).inset(0)
            make.height.equalTo(100)
        }
    }
}

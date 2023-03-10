//
//  TipsCollectionViewCell.swift
//  tipsySnapKit
//
//  Created by Nikita Savchik on 04/03/2023.
//

import UIKit
import SnapKit

class TipsCollectionViewCell: UICollectionViewCell {
    let procentLabel: UILabel = {
        let label = UILabel()
        label.text = "10%"
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.1792383194, green: 0.2248822749, blue: 0.2836511731, alpha: 1)
        label.font = UIFont(name: "Avenir Next", size: 24)
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 3
                layer.borderColor = #colorLiteral(red: 0.5647058824, green: 0.1529411765, blue: 0.7450980392, alpha: 1)
                procentLabel.font = UIFont(name: "Avenir Next Bold", size: 28)
            } else {
                layer.borderWidth = 0
                procentLabel.font = UIFont(name: "Avenir Next", size: 24)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9490196078, blue: 0.9411764706, alpha: 1)
        layer.cornerRadius = 10
        
        addSubview(procentLabel)
    }
}

extension TipsCollectionViewCell {
    private func setConstrains() {
        procentLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(2)
            make.centerY.equalTo(snp.centerY)
        }
    }
}

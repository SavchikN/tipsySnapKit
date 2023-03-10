//
//  DescriptionView.swift
//  tipsySnapKit
//
//  Created by Nikita Savchik on 08/03/2023.
//

import UIKit
import SnapKit

class DescriptionView: UIView {
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "For payment:"
        title.textColor = .black
        title.font = UIFont(name: "Avenir Next", size: 20)
        title.textAlignment = .center
        return title
    }()
    
    lazy var descriptionLabel: UILabel = {
        let description = UILabel()
        description.text = "1488"
        description.font = UIFont(name: "Avenir Next Bold", size: 40)
        description.textColor = .black
        return description
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }
}

extension DescriptionView {
    private func setConstrains() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top).inset(0)
            make.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-15)
            make.centerX.equalToSuperview()
        }
    }
}

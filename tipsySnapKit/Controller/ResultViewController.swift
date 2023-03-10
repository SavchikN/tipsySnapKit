//
//  ResultViewController.swift
//  tipsySnapKit
//
//  Created by Nikita Savchik on 05/03/2023.
//

import UIKit
import SnapKit

class ResultViewController: UIViewController {
    
// MARK: - Outlets
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Total Bill"
        title.textColor = .black
        title.font = UIFont(name: "Avenir Next Bold", size: 40)
        return title
    }()
    
    let descriptionLabel: UILabel = {
        let title = UILabel()
        title.text = "per person!"
        title.textColor = .black
        title.font = UIFont(name: "Avenir Next", size: 26)
        return title
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "img")
        return image
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 20)
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0.5647058824, green: 0.1529411765, blue: 0.7450980392, alpha: 1)
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        return button
    }()
    
// MARK: - Init Views
    
    let descriptionView = DescriptionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstrains()
        cancelButtonTapped()
    }
    
// MARK: - Methods
    
    
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(descriptionView)
        view.addSubview(cancelButton)
        view.addSubview(descriptionLabel)
    }
    
    @objc func cancelButtonTapped() {
        dismiss(animated: true)
    }
}

// MARK: - Constrains

extension ResultViewController {
    private func setConstrains() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(15)
            make.centerX.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-10)
            make.centerX.equalToSuperview()
            make.height.equalTo(view.snp.width).multipliedBy(0.5)
            make.width.equalTo(view.snp.width).multipliedBy(0.5)
        }
        
        descriptionView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(-50)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(100)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionView.snp.bottom).inset(-10)
            make.centerX.equalToSuperview()
        }
        
        cancelButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(15)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }
    }
}


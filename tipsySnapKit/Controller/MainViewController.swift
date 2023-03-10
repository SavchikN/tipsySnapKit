//
//  MainViewController.swift
//  tipsySnapKit
//
//  Created by Nikita Savchik on 01/03/2023.
//

import SnapKit
import UIKit

class MainViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Total Bill"
        label.font = UIFont(name: "Avenir Next Bold", size: 40)
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "imageView")
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter the invoice amount and click \"Calculate\""
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 15)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate", for: .normal)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.5647058824, green: 0.1529411765, blue: 0.7450980392, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 20)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let totalBillView = TotalBillView()
    let personsView = PersonsView()
    let tipsView = TipsView()
    let resultVC = ResultViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        calculateButtonTapped()
    }
    
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.9764706492, green: 0.9764706492, blue: 0.9764706492, alpha: 1)
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(descriptionLabel)
        view.addSubview(calculateButton)
        view.addSubview(totalBillView)
        view.addSubview(personsView)
        view.addSubview(tipsView)
    }
    
    @objc func calculateButtonTapped() {
        if totalBillView.sumTextField.text == "" {
            showAlert(title: "Oops!", message: "TextField is empty")
        }
        
        guard let totalBill = totalBillView.sumTextField.text,
              let totalBillInt = Int(totalBill) else { return }
        let sum = totalBillInt + totalBillInt * tipsView.tipsCount / 100
        let persons = personsView.counter

        let result = sum / persons
        resultVC.descriptionView.descriptionLabel.text = "\(result) zl"
        
        present(resultVC, animated: true)
    }
    
}

extension MainViewController {
    private func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(10)
            make.centerX.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-10)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.snp.width).multipliedBy(0.5)
            make.height.equalTo(view.snp.width).multipliedBy(0.5)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(-10)
            make.centerX.equalToSuperview()
        }
        
        totalBillView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).inset(-5)
            make.height.equalTo(130)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        personsView.snp.makeConstraints { make in
            make.top.equalTo(totalBillView.snp.bottom).inset(-5)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(130)
        }
        
        tipsView.snp.makeConstraints { make in
            make.top.equalTo(personsView.snp.bottom).inset(-5)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(130)
        }
        
        calculateButton.snp.makeConstraints { make in
            make.top.equalTo(tipsView.snp.bottom).inset(0)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }
    }
}

extension MainViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.totalBillView.sumTextField.text = ""
            self.personsView.counter = 1
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}



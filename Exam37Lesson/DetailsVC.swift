//
//  DetailsVC.swift
//  Exam37Lesson
//
//  Created by user on 24.11.2024.
//
import UIKit

class DetailsVC: UIViewController {
    private let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.backgroundColor = .white
        setupLabel()
        setupLayout()
        
    }
    
    func configure(model: Model?) {
        label.text = model?.category
    }
}


extension DetailsVC {
    private func setupLabel() {
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
    }
    
    private func setupLayout() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

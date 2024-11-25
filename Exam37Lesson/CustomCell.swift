//
//  CustomCell.swift
//  Exam37Lesson
//
//  Created by user on 16.11.2024.
//

import UIKit

class CustomCell: UITableViewCell {
    
    private let horizontalScrollView = HorizontalScrollView()
    private let label = UILabel()
    
    var action: ((String) -> ())?
    
    private let scrollView = UIScrollView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String? ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure (models: Model) {
        //for model in models {
        label.text = models.category
       // }
        horizontalScrollView.configure(with: models)
    }
}



private extension CustomCell {
    func setup() {
        backgroundColor = .systemCyan
        contentView.addSubview(label)
        contentView.addSubview(horizontalScrollView)
        setupLayout()
    }
}



private extension CustomCell {
    func setupLayout() {
        horizontalScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            label.heightAnchor.constraint(equalToConstant: 50),
            
            horizontalScrollView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            horizontalScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            horizontalScrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            horizontalScrollView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}


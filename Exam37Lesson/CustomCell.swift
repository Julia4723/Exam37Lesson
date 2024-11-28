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
    
    
    private var param: Param?
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
        label.text = models.category
        horizontalScrollView.configure(with: models.param)
    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("нажатие в CustomCell")
        action?(param?.id ?? "")
        
    }
}



private extension CustomCell {
    func setup() {
        backgroundColor = .systemGray6
        contentView.addSubview(label)
        contentView.addSubview(horizontalScrollView)
        setupLabel()
        setupLayout()
    }
    
    func setupLabel() {
        label.font = .systemFont(ofSize: 20, weight: .medium)
    }
}



private extension CustomCell {
    func setupLayout() {
        horizontalScrollView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            label.heightAnchor.constraint(equalToConstant: 30),
            
            horizontalScrollView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            horizontalScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            horizontalScrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            horizontalScrollView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
}


//
//  CustomView.swift
//  Exam37Lesson
//
//  Created by user on 16.11.2024.
//

import UIKit

class CustomView : UIView {
    
    var action: ((String) -> ())?
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let priceLabel = UILabel()
    private let image = UIImageView()
    
    private var model: Param?
    
    init(model: Param) {
        super.init(frame: .zero)
        self.model = model
        setup(models: model)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        action?(model?.description ?? "")
    }
    
    func configure(with model: Param) {
        
        titleLabel.text = model.description
        descriptionLabel.text = model.description
        priceLabel.text = model.price
        image.image = UIImage(named: model.imageName)
    }
}


private extension CustomView {
    
    func setup(models: Param) {
        widthAnchor.constraint(equalToConstant: 200).isActive = true
        heightAnchor.constraint(equalToConstant: 200).isActive = true
        backgroundColor = .systemBlue
        
        titleLabel.text = models.description
        descriptionLabel.text = models.description
        priceLabel.text = models.price
        image.image = UIImage(named: models.imageName)
        
        addSubviews()
        
        setupTitleLabel()
        setupDescriptionLabel()
        setupPriceLabel()
        setupImage()
        setupLayout()
    }
    
    func addSubviews() {
        [titleLabel, descriptionLabel, priceLabel, image].forEach { view in
            addSubview(view)
        }
    }
    
    func setupTitleLabel() {
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.textColor = .black
    }
    
    func setupDescriptionLabel() {
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .black
    }
    
    func setupPriceLabel() {
        priceLabel.font = .systemFont(ofSize: 20)
        priceLabel.textColor = .black
    }
    
    func setupImage() {
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        image.contentMode = .scaleAspectFill
    }
    
}


private extension CustomView {
    func setupLayout() {
        [titleLabel, descriptionLabel, priceLabel, image].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            image.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: -8),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
        ])
    }
}

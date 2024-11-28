//
//  CustomView.swift
//  Exam37Lesson
//
//  Created by user on 16.11.2024.
//

import UIKit

class CustomView : UIView {
    
    var action: ((String) -> ())?
    
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let priceLabel = UILabel()
    private let image = UIImageView()
    
    private var param: Param?
   
    
    init(param: Param) {
        super.init(frame: .zero)
        self.param = param
        setup(param: param)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("нажатие в CustomView: \(param?.id)")
        action?(param?.id ?? "")
        
    }
    
    func configure(with params: Param) {
        nameLabel.text = params.title
        descriptionLabel.text = params.description
        priceLabel.text = params.price
        image.image = UIImage(named: params.imageName)
    }
}


private extension CustomView {
    
    func setup(param: Param) {
        widthAnchor.constraint(equalToConstant: 270).isActive = true
        heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        backgroundColor = .white
  
        addSubviews()
        
        setupTitleLabel()
        setupView()
        setupDescriptionLabel()
        setupPriceLabel()
        setupImage()
        setupLayout()
    }
    
    func addSubviews() {
        [nameLabel, descriptionLabel, priceLabel, image].forEach { view in
            addSubview(view)
        }
    }
    
    func setupView() {
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 8
    }
    
    func setupTitleLabel() {
        nameLabel.font = .boldSystemFont(ofSize: 20)
        nameLabel.textColor = .black
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
        [nameLabel, descriptionLabel, priceLabel, image].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            image.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            
            nameLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            descriptionLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
        ])
    }
}

//
//  HorizontalScrollView.swift
//  Exam37Lesson
//
//  Created by user on 16.11.2024.
//

import UIKit

class HorizontalScrollView: UIView {
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    
    var action: ((String) -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupScrollView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with models: Model) {
    //for model in models {
        let view = CustomView(models: models)
            view.action = tapView
            stackView.addArrangedSubview(view)
        //}
    }
    private func tapView(_ title: String) {
        action?(title)
    }
}


//MARK: - Settings
private extension HorizontalScrollView {
    
    func setupView() {
        
        scrollView.addSubview(stackView) //добавляем стек на скролл
        addSubview(scrollView) //добавляем на вью скролл
        
        setupStackView()
    }
    
    func setupStackView() {
        stackView.axis = .horizontal //устанавливаем выравнивание контента по горизонтали
        stackView.spacing = 10
    }
}

private extension HorizontalScrollView {
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
        ])
    }
}

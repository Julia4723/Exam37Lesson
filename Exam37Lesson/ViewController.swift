//
//  ViewController.swift
//  Exam37Lesson
//
//  Created by user on 16.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    var dataManager: IDataManager!
    
    private let celIdentifier = "CellIdentifier"
    private let horizontalScrollView = HorizontalScrollView()
    
    private let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        horizontalScrollView.configure(with: dataManager.getModel())
        horizontalScrollView.action = presentDetailsVC
        view.addSubview(horizontalScrollView)
        view.addSubview(tableView)
        setupLayout()
        tableView.register(CustomCell.self, forCellReuseIdentifier: celIdentifier)
    }
    
    private func presentDetailsVC(title: String) {
        guard let model = getModels(title: title) else {return}
        let detailsVC = DetailsVC()
        detailsVC.configure(model: model)
        present(detailsVC, animated: true)
    }
    
    private func getModels(title: String) -> Model? {
        for model in dataManager.getModel() {
            print(model.category)
            if model.category == title {
                return model
            }
        }
        
        return nil
    }
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataManager.getModel().count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: celIdentifier, for: indexPath) as? CustomCell else { return UITableViewCell()}
        
        let modelElement = dataManager.getModel()[indexPath.row]
        
        cell.configure(models: modelElement)
        return cell
    }
}


extension ViewController {
    private func setupLayout() {
        
        horizontalScrollView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            horizontalScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            horizontalScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            horizontalScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            horizontalScrollView.heightAnchor.constraint(equalToConstant: 300),
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

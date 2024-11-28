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
    private let tableView = UITableView()
    var array = [Param]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        setupLayout()
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(CustomCell.self, forCellReuseIdentifier: celIdentifier)
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


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataManager.getModel().count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: celIdentifier, for: indexPath) as? CustomCell else { return UITableViewCell()}
        
        let modelElement = dataManager.getModel()[indexPath.row]
        
        cell.action = { id in
            if let foundItem = self.dataManager.findIndex(id) {
                let detailsVC = DetailsVC()
                detailsVC.configure(model: foundItem)
                self.present(detailsVC, animated: true)
            }
        }

        cell.selectionStyle = .none
        cell.configure(models: modelElement)
        return cell
    }
}


extension ViewController {
    private func setupLayout() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

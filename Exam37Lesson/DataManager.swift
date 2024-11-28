//
//  DataManager.swift
//  Exam37Lesson
//
//  Created by user on 16.11.2024.
//

import UIKit

protocol IDataManager {
    func getModel() -> [Model]
    func findIndex(_ item: String) -> Param?
}

class DataManager: IDataManager {
    
    private var models: [Model] = []
    
    
    
        func findIndex(_ item: String) -> Param? {
            for model in models {
                if let index = model.param.first(where: { $0.id == item }) {
                    print("элемент найден")
                    return index
                }
            }
            return nil
        }
    
}



extension DataManager {
    func getModel() -> [Model] {
        [
            Model(
                category: "One Category",
                param: [
                    Param(id: "0", title: "Milk", description: "Milk", price: "100", imageName: "Milk"),
                    Param(id: "1",title: "Bread", description: "Bread", price: "120", imageName: "Bread"),
                    Param(id: "2",title: "Eggs", description: "Eggs", price: "124", imageName: "Eggs"),
                    Param(id: "3",title: "Cheese", description: "Cheese", price: "200", imageName: "Cheese"),
                    Param(id: "2", title: "Butter", description: "Butter", price: "300", imageName: "Butter")
                ]
            ),
            Model(
                category: "Two Category",
                param: [
                    Param(id: "2", title: "Rice", description: "Rice", price: "130", imageName: "Rice"),
                    Param(id: "2", title: "Pasta", description: "Pasta", price: "130", imageName: "Pasta"),
                    Param(id: "2", title: "Tomatoes", description: "Tomatoes", price: "140", imageName: "Tomatoes"),
                ]
            ),
            Model(
                category: "Three Category",
                param: [
                    Param(id: "3", title: "Chicken", description: "Chicken", price: "300", imageName: "Chicken"),
                    Param(id: "3", title: "Beef", description: "Beef", price: "300", imageName: "Beef"),
                ]
                
            ),
        ]
    }
}

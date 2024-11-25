//
//  DataManager.swift
//  Exam37Lesson
//
//  Created by user on 16.11.2024.
//

import UIKit

protocol IDataManager {
    func getModel() -> [Model]
    
}

class DataManager: IDataManager {
    
    
    private var models: [Model] = []
    
    
    func findElement(id: Int) -> Model? {
        for element in models {
            if id == element.id {
                return element
            }
        }
        return nil
    }
}



extension DataManager {
    func getModel() -> [Model] {
        [
            Model(
                id: 0,
                category: "One",
                param: [
                    Param(title: "OneTitle", description: "OneOne", price: "433", imageName: "One"),
                    Param(title: "OneTitle", description: "hgh", price: "767", imageName: "jhjh")
                ]
            ),
            Model(
                id: 1,
                category: "Two",
                param: [Param(title: "TwoTitle", description: "TwoTwo", price: "433", imageName: "Two")]
            ),
            Model(
                id: 2,
                category: "Three",
                param: [Param(title: "ThreeTitle", description: "OneOne", price: "433", imageName: "One")]
            ),
        ]
    }
}

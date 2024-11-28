//
//  Model.swift
//  Exam37Lesson
//
//  Created by user on 16.11.2024.
//


import UIKit

struct Model {
    
    let category: String
    let param: [Param]
}


struct Param: Equatable {
    let id: String
    let title: String
    let description: String
    let price: String
    let imageName: String
}

extension Model: Equatable {}

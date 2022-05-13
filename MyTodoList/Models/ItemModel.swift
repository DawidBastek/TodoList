//
//  ItemModel.swift
//  MyTodoList
//
//  Created by Dawid Bastek on 04/05/2022.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    let username: String
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool, username: String) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.username = username
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted, username: username)
    }
}

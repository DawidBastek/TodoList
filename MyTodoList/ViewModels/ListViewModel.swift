//
//  ListViewModel.swift
//  MyTodoList
//
//  Created by Dawid Bastek on 04/05/2022.
//

import Foundation

enum TodoError: LocalizedError {
    case invalidTitle
    
    var errorDescription: String? {
        switch self {
        case .invalidTitle: return "Title cannot be empty"
        }
    }
}

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    @Published private var user: UserModel?
    
    init(user: UserModel?) {
        self.user = user
        getItems()
    }
    
    func getItems() {
        guard let user = user else { return }
        
        let userItems = DBManager.shared.getItems(for: user)
        
        switch userItems {
        case .success(let items):
            self.items = items
            
        case .failure(let error):
            print("error: \(error)")
            break
        }
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
        saveItems()
    }
    
    func addItem(title: String) {
        guard let user = user else { return }
        let newItem = ItemModel(title: title, isCompleted: false, username: user.username)
        items.append(newItem)
        saveItems()
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
        
        saveItems()
    }
    
    func saveItems() {
        guard let user = user else { return }
        DBManager.shared.saveItems(items, user: user)
    }
}

//
//  DB.swift
//  MyTodoList
//
//  Created by Kamil Matuła on 10/05/2022.
//

import Foundation

enum DBError: LocalizedError {
    case unableToSave
    case usernameTaken
    case moreThanOneThisUsername
    case userDoesntExist
    case wrongUsernameOrPassword
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .usernameTaken:                                return "Username already taken"
        case .userDoesntExist, .wrongUsernameOrPassword:    return "Wrong username or password"
        default: 	                                        return "Internal error"
        }
    }
}

enum DBModelKeys: String {
    case items = "items_list"
    case user = "users"
    case loggedUser = "loggedUser"
}

protocol DBManagerProtocol {
    func getItems(for user: UserModel) -> Result<[ItemModel], DBError>
    func saveItems(_ items: [ItemModel], user: UserModel)
    
    func saveUser(for username: String, password: String) -> Result<UserModel, DBError>
    func getUser(for username: String, password: String) -> Result<UserModel, DBError>
    
    func clearLocalDataForUITests()
    
    var loggedUser: UserModel? { get set }
}

class DBManager: DBManagerProtocol {
    
    private init() {}
    
    static var shared: DBManagerProtocol = DBManager()
    
    // MARK: - Items
    func getItems(for user: UserModel) -> Result<[ItemModel], DBError> {
        let userItems = items.filter { $0.username == user.username }
        
        return.success(userItems)
    }
    
    func saveItems(_ items: [ItemModel], user: UserModel) {
        var newItems = self.items.filter { $0.username != user.username }
        newItems.append(contentsOf: items)
        self.items = newItems
    }
    
    private var items: [ItemModel] {
        get {
            guard
                let data = UserDefaults.standard.data(forKey: DBModelKeys.items.rawValue),
                let users = try? JSONDecoder().decode([ItemModel].self, from: data)
            else { return [] }
            
            return users
        }
        set {
            if let encodedData = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(encodedData, forKey: DBModelKeys.items.rawValue)
            }
        }
    }
    
    // MARK: - Users
    func saveUser(for username: String, password: String) -> Result<UserModel, DBError> {
        guard
            !users.contains(where: { $0.username == username })
        else {
            return .failure(.usernameTaken)
        }
        
        let user = UserModel(username: username, password: password)
        // TODO: - appending instead replacing
        var newUsers = users
        newUsers.append(user)
        users = newUsers
        
        return .success(user)
    }
    
    func getUser(for username: String, password: String) -> Result<UserModel, DBError> {
        let users = users.filter { $0.username == username }
        
        guard
            users.count <= 1
        else {
            return .failure(.moreThanOneThisUsername)
        }
        
        guard
            let user = users.first
        else {
            return .failure(.userDoesntExist)
        }
        
        guard
            user.password == password
        else {
            return .failure(.wrongUsernameOrPassword)
        }
        
        return .success(user)
    }
    
    private var users: [UserModel] {
        get {
            guard
                let data = UserDefaults.standard.data(forKey: DBModelKeys.user.rawValue),
                let users = try? JSONDecoder().decode([UserModel].self, from: data)
            else { return [] }
            
            return users
        }
        set {
            if let encodedData = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(encodedData, forKey: DBModelKeys.user.rawValue)
            }
        }
    }
    
    var loggedUser: UserModel? {
        get {
            guard
                let data = UserDefaults.standard.data(forKey: DBModelKeys.loggedUser.rawValue),
                let user = try? JSONDecoder().decode(UserModel.self, from: data)
            else { return nil }
            
            return user
        }
        set {
            if let encodedData = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(encodedData, forKey: DBModelKeys.loggedUser.rawValue)
            }
        }
    }
    
    func clearLocalDataForUITests() {
        if ProcessInfo().arguments.contains("clearLocalData") {
            UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        }
    }
}

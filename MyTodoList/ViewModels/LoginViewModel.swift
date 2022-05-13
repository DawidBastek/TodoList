//
//  LoginViewModel.swift
//  MyTodoList
//
//  Created by Kamil Matuła on 10/05/2022.
//

import Foundation
import SwiftUI

enum LoginError: LocalizedError {
    case emptyUsername
    case emptyPassword
    case usernameTaken
    case invalidUsernameOrPassword
    
    var errorDescription: String? {
        switch self {
        case .emptyUsername: return "Username cannot be empty"
        case .emptyPassword: return "Password cannot be empty"
        case .usernameTaken: return "Username taken"
        case .invalidUsernameOrPassword: return "Invalid username or password"
        }
    }
}

class CurrentUser: ObservableObject {
    @Published var user: UserModel? = nil {
        didSet {
            DBManager.shared.loggedUser = user
        }
    }
    
    init() {
        if let loggedUser = DBManager.shared.loggedUser {
            user = loggedUser
        }
    }
}

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    
    func performLoginAction(completionHandler: (_ user: UserModel?, _ error: Error?) -> ()) {
        
        if username.isEmpty {
            completionHandler(nil, LoginError.emptyUsername)
            return
        }
        
        if password.isEmpty {
            completionHandler(nil, LoginError.emptyPassword)
            return
        }
        
        let saveAction = DBManager.shared.getUser(for: username, password: password)
        
        switch saveAction {
        case .success(let user):
            completionHandler(user, nil)
            
        case .failure(let error):
            completionHandler(nil, error)
        }
    }
}

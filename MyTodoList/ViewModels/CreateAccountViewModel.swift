//
//  CreateAccountViewModel.swift
//  MyTodoList
//
//  Created by Kamil Matuła on 10/05/2022.
//

import Foundation
import SwiftUI

enum CreateAccountError: LocalizedError {
    case emptyUsername
    case emptyPassword
    case passwordsNotMatching
    
    var errorDescription: String? {
        switch self {
        case .emptyUsername: return "Username cannot be empty"
        case .emptyPassword: return "Password cannot be empty"
        case .passwordsNotMatching: return "Passwords do not match"
        }
    }
}

class CreateAccountViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var repeatPassword: String = ""
    
    // TODO:- Handle alert
    @Published var passwordsDontMatch: Bool = false
    
    @StateObject var currentUser = CurrentUser()
    
    func performLoginAction(completionHandler: (_ user: UserModel?, _ error: Error?) -> ()) {
        if username.isEmpty {
            completionHandler(nil, CreateAccountError.emptyUsername)
            return
        }
        
        if password.isEmpty {
            completionHandler(nil, CreateAccountError.emptyPassword)
            return
        }
        
        if repeatPassword.isEmpty {
            completionHandler(nil, CreateAccountError.emptyPassword)
            return
        }
        
        if password != repeatPassword {
            completionHandler(nil, CreateAccountError.passwordsNotMatching)
            return
        }
        
        let saveAction = DBManager.shared.saveUser(for: username, password: password)
        
        switch saveAction {
        case .success(let user):
            completionHandler(user, nil)
            
        case .failure(let error):
            completionHandler(nil, error)
        }
    }
}

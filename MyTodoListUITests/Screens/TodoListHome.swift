//
//  TodoListHome.swift
//  MyTodoListUITests
//
//  Created by Rafal Mieczejko on 19/11/2022.
//

import XCTest

class TodoListHome: BaseScreen {
    
    private lazy var logoutButton = app.buttons["Logout"].firstMatch
    
    func logOutShouldExits() -> Bool {
        logoutButton.exists
    }
    
}

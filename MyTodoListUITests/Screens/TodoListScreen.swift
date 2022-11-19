//
//  TodoListScreen.swift
//  MyTodoListUITests
//
//  Created by Dawid Bastek on 19/11/2022.
//

import XCTest

class TodoListScreen: BaseScreen {
    private lazy var nothingTodoText = app.staticTexts[AccessibilityID.TodoList.nothingTodoText].firstMatch
    
    func isNothingTodoTextVisible() -> Bool {
        return nothingTodoText.exists
    }
}

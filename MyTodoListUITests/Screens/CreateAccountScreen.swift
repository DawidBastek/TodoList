//
//  LoginScreen.swift
//  MyTodoListUITests
//
//  Created by Dawid Bastek on 19/11/2022.
//

import XCTest

class CreateAccountScreen: BaseScreen {
    private lazy var unsernameTextField = app.textFields["usernameTextField"].firstMatch
    private lazy var passwordTextField = app.secureTextFields["passwordTextField"].firstMatch
    private lazy var repeatPasswordTextField = app.secureTextFields["repeatPasswordTextField"].firstMatch
    private lazy var createButton = app.buttons["createButton"].firstMatch
    
    @discardableResult
    func enterUsername(text: String) -> Self {
        unsernameTextField.tap()
        unsernameTextField.typeText(text)
        return self
    }
    
    @discardableResult
    func enterPassword(_ text: String) -> Self {
        passwordTextField.tap()
        passwordTextField.typeText(text)
        return self
    }
    
    @discardableResult
    func enterRepeatPassword(_ text: String) -> Self {
        repeatPasswordTextField.tap()
        repeatPasswordTextField.typeText(text)
        return self
    }
    
    @discardableResult
    func tapCreateButton() -> Self {
        createButton.tap()
        return self
    }
}

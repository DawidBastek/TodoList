//
//  CreateAccountScreen.swift
//  MyTodoListUITests
//
//  Created by Rafal Mieczejko on 19/11/2022.
//

import XCTest

class CreateAccountScreen: BaseScreen {
    
    private lazy var usernameTextField = app.textFields[AccessibilityId.CreateAccount.usernameTextField].firstMatch
    private lazy var passwordSecureTextField = app.secureTextFields[AccessibilityId.CreateAccount.passwordSecureTextField].firstMatch
    
    private lazy var repeatePasswordSecureTextField = app.secureTextFields[AccessibilityId.CreateAccount.repeatePasswordSecureTextField].firstMatch
    
    private lazy var createButton = app.buttons[AccessibilityId.CreateAccount.createButton].firstMatch
    
    @discardableResult
    func enterUsername(text: String) -> Self {
        usernameTextField.tap()
        usernameTextField.typeText(text)
        return self
    }
    
    func enterPassword(_ text: String) -> Self {
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(text)
        return self
    }
    
    func repeatPassword(text: String) -> Self {
        repeatePasswordSecureTextField.tap()
        repeatePasswordSecureTextField.typeText(text)
        return self
    }
    
    @discardableResult
    func createUser() -> Self {
        createButton.tap()
        return self
    }
    
}

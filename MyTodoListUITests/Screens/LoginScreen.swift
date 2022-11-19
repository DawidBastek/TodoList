//
//  LoginScreen.swift
//  MyTodoListUITests
//
//  Created by Dawid Bastek on 19/11/2022.
//

import XCTest

class LoginScreen: BaseScreen {
    private lazy var createAccountButton = app.buttons[AccessibilityID.Login.loginCreateAccountButton].firstMatch
    private lazy var loginButton = app.buttons[AccessibilityID.Login.loginLoginButton].firstMatch
    private lazy var loginError = app.alerts.staticTexts["Username cannot be empty"].firstMatch
    
    func tapCreateButton() {
        createAccountButton.tap()
    }
    
    func tapLoginButton() {
        loginButton.tap()
    }
    
    func loginErrorDescription() -> String {
        return loginError.label
    }

}

enum ErrorText {
    static let loginError = "Username cannot be empty"
}

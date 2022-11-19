//
//  LoginScreen.swift
//  MyTodoListUITests
//
//  Created by Rafal Mieczejko on 19/11/2022.
//

import XCTest

class LoginScreen: BaseScreen {
    
    
    // private hermetyzacja , lazy oszczedzamy miejsce w pamieci
    private lazy var createAccountButton = app.buttons[AccessibilityId.Login.createAccountButton]
    private lazy var loginButton = app.buttons["loginLoginButton"].firstMatch
    private lazy var usernameCannotBeEmpty = app.staticTexts["Username cannot be empty"].firstMatch
    
    
    func tapCreateButton() {
        createAccountButton.tap()
    }
    
    func tapLoginButton() {
        loginButton.tap()
    }
    
    func checkEmptyUserName() -> String {
        tapLoginButton()
        return usernameCannotBeEmpty.label
    }
 
}

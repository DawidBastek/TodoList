//
//  CreateUserTest.swift
//  MyTodoListUITests
//
//  Created by Dawid Bastek on 19/11/2022.
//

import XCTest

class CreateUserTest: BaseTest {
    
    func testCreateUserWithSuccess() {
        LoginScreen()
            .tapCreateButton()
        CreateAccountScreen()
            .enterUsername(text: "User")
            .enterPassword("Pass")
            .enterRepeatPassword("Pass")
            .tapCreateButton()
        XCTAssertTrue(TodoListScreen().isNothingTodoTextVisible())
        XCTAssertEqual(ErrorText.loginError, LoginScreen().loginErrorDescription())
    }
}

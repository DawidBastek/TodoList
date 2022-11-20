//
//  CreateUserTest.swift
//  MyTodoListUITests
//
//  Created by Rafal Mieczejko on 19/11/2022.
//

import XCTest

class CreateUserTest: BaseTest {
    
    //    private lazy var loginScreen = LoginScreen() to jest jednozanaczne
    
    func testCreateUserWithSuccess() {
        LoginScreen().tapCreateButton()
        CreateAccountScreen()
            .enterUsername(text: "3")
            .enterPassword("4")
            .repeatPassword(text: "5")
            .createUser()
        XCTAssertTrue(TodoListHome().logOutShouldExits(), "Logout is not displayed")
//        XCTAssertEqual("Username cannot be empty", LoginScreen().checkEmptyUserName())
    }
    
}

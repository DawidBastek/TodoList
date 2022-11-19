//
//  LoginTests.swift
//  MyTodoListUITests
//
//  Created by Dawid Bastek on 19/11/2022.
//

import XCTest

class LoginTests: BaseTest {
    func testLoginErrorIsDisplayed() {
        LoginScreen().tapLoginButton()
        XCTAssertEqual(LoginScreen().loginErrorDescription(), ErrorText.loginError)
    }
}

//
//  LoginTests.swift
//  MyTodoListUITests
//
//  Created by Dawid Bastek on 17/11/2022.
//

import XCTest

class Showcase {
    static let newText1 = "NewText1"
    let newText2 = "NewText2"
    
    var number = 10
    
    lazy var newAlert1 = "alert1"
    private lazy var newAlert2 = "alert2"
    
    func newFunctionWith(parameter1: String, parameter2: Int) {
        //body
    }
    
    func isNewButtonDisplayed() -> Bool {
        return newAlert.exists
    }
    
    enum UserData {
        static let username = "User"
        static let password = "Pass"
    }
    
    let newButton = XCUIApplication().buttons["newButtonId"]
    
    let newTextField = XCUIApplication().staticTexts["newTextFieldId"]
    
    let newSecureTextField = XCUIApplication().secureTextFields["newSecureTextFieldId"]
    
    let newStaticText = XCUIApplication().staticTexts["newStaticTextId"]
    
    let newAlert = XCUIApplication().alerts["newAlertId"]
    
    let newCell = XCUIApplication().cells["newCellId"]
    
    
    let newStaticText2 = XCUIApplication().cells.buttons.staticTexts["newStaticText2Id"].firstMatch

    
    func tapButton() {
        newButton.tap()
    }
    
    func typeText(text: String) {
        newTextField.typeText(text)
    }
    
    func scrollUp() {
        newCell.swipeUp()
    }
    
    func waitForElement(timeout: Double) -> Bool {
        return newButton.waitForExistence(timeout: timeout)
    }
}

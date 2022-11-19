//
//  BaseTest.swift
//  MyTodoListUITests
//
//  Created by Rafal Mieczejko on 19/11/2022.
//

import XCTest

// dziedziczenie : .....
class BaseTest: XCTestCase {
    
    let app = XCUIApplication()
    
    //before tests
    override func setUp() {
        app.launchArguments.append("clearLocalData")
        app.launch()
    }
    
    
}

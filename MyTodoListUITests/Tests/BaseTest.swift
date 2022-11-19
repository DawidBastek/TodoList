//
//  BaseTest.swift
//  MyTodoListUITests
//
//  Created by Dawid Bastek on 19/11/2022.
//

import XCTest

class BaseTest: XCTestCase {
    let app = XCUIApplication()
    
    override func setUp() {
        app.launchArguments.append("clearLocalData")
        app.launch()
    }
}

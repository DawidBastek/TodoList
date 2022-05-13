//
//  MyTodoListApp.swift
//  MyTodoList
//
//  Created by Dawid Bastek on 04/05/2022.
//

import SwiftUI

@main
struct MyTodoListApp: App {
    
    @StateObject var currentUser = CurrentUser()
    
    init() {
        DBManager.shared.clearLocalDataForUITests()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if currentUser.user == nil {
                    LoginView()
                } else {
                    ListView(listViewModel: ListViewModel(user: currentUser.user))
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(currentUser)
        }
    }
}

//
//  LoginView.swift
//  MyTodoList
//
//  Created by Dawid Bastek on 05/05/2022.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var loginViewModel = LoginViewModel()
    @EnvironmentObject var currentUser: CurrentUser
    
    @State private var showingSheet = false
    
    @State private var isAlertPresented = false {
        didSet {
            if isAlertPresented == false {
                alertMessage = ""
            }
        }
    }
    @State private var alertMessage: String = ""

    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                Text("My Todo List")
                    .font(.title)
                    .bold()
                TextField("Username", text: $loginViewModel.username)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black))
                    .accessibilityIdentifier(AccessibilityID.Login.loginCreateAccountButton)
                SecureField("Password", text: $loginViewModel.password)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black))
                    .accessibilityIdentifier("loginPasswordTextField")
            }
            .padding(15)
            
            VStack {
                Button(action: loginButtonPressed) {
                    Text("Log in".uppercased())
                        .bold()
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .accessibilityIdentifier(AccessibilityID.Login.loginLoginButton)
                }
                Button(action: createAccountButtonPressed) {
                    Text("Create account")
                        .bold()
                        .accessibilityIdentifier("loginCreateAccountButton")
                }
            }
            .padding(15)
            .sheet(isPresented: $showingSheet) {
                CreateAccountView()
            }
            .alert("Error", isPresented: $isAlertPresented, actions: {
                Button("OK", action: {})
            }, message: {
                Text(alertMessage)
            })
        }
    }
}

extension LoginView {
    private func loginButtonPressed() {
        loginViewModel.performLoginAction { user, error in
            if let user = user {
                currentUser.user = user
            } else if let error = error {
                isAlertPresented.toggle()
                alertMessage = error.localizedDescription
            }
        }
    }
    
    private func createAccountButtonPressed() {
        showingSheet = true
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

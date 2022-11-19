//
//  CreateAccountView.swift
//  MyTodoList
//
//  Created by Dawid Bastek on 05/05/2022.
//

import SwiftUI

struct CreateAccountView: View {
    
    @ObservedObject var createAccountViewModel = CreateAccountViewModel()
    @EnvironmentObject var currentUser: CurrentUser
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var usernameTextField = ""
    @State var passwordTextField = ""
    @State var repeatPasswordTextField = ""
    
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
                Text("Create Account")
                    .bold()
                    .font(.title)
                TextField("Username", text: $createAccountViewModel.username)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black))
                    .accessibilityIdentifier(AccessibilityID.CreateAccount.usernameTextField)
                SecureField("Password", text: $createAccountViewModel.password)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black))
                    .accessibilityIdentifier(AccessibilityID.CreateAccount.passwordTextField)
                SecureField("Repeat password", text: $createAccountViewModel.repeatPassword)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black))
                    .accessibilityIdentifier(AccessibilityID.CreateAccount.repeatPasswordTextField)
            }
            .padding(15)
            
            VStack {
                Button(action: createAccountButtonPressed) {
                    Text("Create".uppercased())
                        .bold()
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .accessibilityIdentifier(AccessibilityID.CreateAccount.createButton)
                }
                Button(action: cancelButtonPressed) {
                    Text("Cancel")
                        .bold()
                        .accessibilityIdentifier(AccessibilityID.CreateAccount.cancelButton)
                }
            }
            .padding(15)
            .alert("Error", isPresented: $isAlertPresented, actions: {
                Button("OK", action: {})
            }, message: {
                Text(alertMessage)
            })
        }
    }
}

extension CreateAccountView {
    private func createAccountButtonPressed() {
        createAccountViewModel.performLoginAction { user, error in
            if let user = user {
                currentUser.user = user
            } else if let error = error {
                isAlertPresented.toggle()
                alertMessage = error.localizedDescription
            }
        }
    }
    
    private func cancelButtonPressed() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}

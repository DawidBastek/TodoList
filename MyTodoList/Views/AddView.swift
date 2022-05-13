//
//  AddView.swift
//  MyTodoList
//
//  Created by Dawid Bastek on 04/05/2022.
//

import SwiftUI

typealias AddItemHandler = (_ text: String) -> ()

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = "Error"
    @State var alertMessage: String = ""
    @State var isAlertPresented: Bool = false
    
    private let addItemHandler: AddItemHandler
    
    init(addItemHandler: @escaping AddItemHandler) {
        self.addItemHandler = addItemHandler
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black))
                Button(action: saveButtonPressed) {
                    Text("Save".uppercased())
                        .bold()
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
            }
            .padding(15)
        }
        .navigationTitle("Add Todo")
        .alert("Error", isPresented: $isAlertPresented, actions: {
            Button("OK", action: {})
        }, message: {
            Text(alertMessage)
        })
        
    }
}

extension AddView {
    private func saveButtonPressed() {
        if textIsCorrect() {
            addItemHandler(textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    private func textIsCorrect() -> Bool {
        if textFieldText.isEmpty {
            alertMessage = TodoError.invalidTitle.errorDescription!
            isAlertPresented.toggle()
            return false
        }
        return true
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView(addItemHandler: { _ in })
        }
    }
}

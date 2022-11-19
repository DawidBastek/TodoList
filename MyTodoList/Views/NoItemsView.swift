//
//  NoItemsView.swift
//  MyTodoList
//
//  Created by Dawid Bastek on 04/05/2022.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    private let addItemHandler: AddItemHandler
    
    init(addItemHandler: @escaping AddItemHandler) {
        self.addItemHandler = addItemHandler
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Nothing todo!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .accessibilityIdentifier(AccessibilityID.TodoList.nothingTodoText)
                Text("You can start by clicking the button.")
                NavigationLink(destination: AddView(addItemHandler: addItemHandler), label: {
                    Text("Add something 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
                .padding(.horizontal, 15)
            }
            .multilineTextAlignment(.center)
            .padding(40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView(addItemHandler: { _ in })
        }
    }
}

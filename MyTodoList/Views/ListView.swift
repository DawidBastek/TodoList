//
//  ListView.swift
//  MyTodoList
//
//  Created by Dawid Bastek on 04/05/2022.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var listViewModel: ListViewModel
    @EnvironmentObject var currentUser: CurrentUser
    
    init(listViewModel: ListViewModel) {
        self.listViewModel = listViewModel
    }
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView(addItemHandler: { text in
                    listViewModel.addItem(title: text)
                })
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                NavigationLink("Add",
                    destination: AddView(addItemHandler: { text in
                        listViewModel.addItem(title: text)
                    })
                )
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Logout") {
                    currentUser.user = nil
                }
            }
        }
        .alert(listViewModel.errorMessage, isPresented: $listViewModel.showError, actions: {})
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView(listViewModel: ListViewModel(user: UserModel(username: "", password: "")))
        }
    }
}

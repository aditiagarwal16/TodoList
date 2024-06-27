//
//  ListView.swift
//  TodoList
//
//  Created by Aditi Agarwal on 28/06/24.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "this is the first title!", isCompleted: false),
        ItemModel(title: "this is the second title!",isCompleted:true),
        ItemModel(title: "this is the third!", isCompleted: false),
            ]
    var body: some View {
        List{
            ForEach(items){items in
                ListRowView(item: items)
                //ListRowView(title: items)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
}

#Preview {
    NavigationView{
        ListView()
    }
}


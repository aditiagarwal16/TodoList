//
//  ListView.swift
//  TodoList
//
//  Created by Aditi Agarwal on 28/06/24.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
   
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List{
                    ForEach(listViewModel.items){items in
                        ListRowView(item: items)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: items)
                                }
                            }
                        //ListRowView(title: items)
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }

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
    .environmentObject(ListViewModel())
}


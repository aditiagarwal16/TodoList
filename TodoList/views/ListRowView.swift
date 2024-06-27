//
//  ListRowView.swift
//  TodoList
//
//  Created by Aditi Agarwal on 28/06/24.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
//                .foregroundColor(item.isCompleted ? .green : .red)
                .foregroundStyle(Color(item.isCompleted ? .green : .red))
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}


#Preview {
    Group{
        ListRowView(item: ItemModel(title: "First item", isCompleted: false))
        ListRowView(item: ItemModel(title: "Second item", isCompleted: true))
    }
}

    

//
//  ItemModel.swift
//  TodoList
//
//  Created by Aditi Agarwal on 28/06/24.
//

import Foundation

struct ItemModel: Identifiable{
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}

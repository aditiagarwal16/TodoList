//
//  ListViewModel.swift
//  TodoList
//
//  Created by Aditi Agarwal on 03/07/24.
//

import Foundation
/*
 CRUD FUNCTIONS
 
 create
 read
 update
 delete
 */

class ListViewModel: ObservableObject{
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemskey: String = "items_list"
    init(){
        getItems()
    }
    
    func getItems(){
        guard 
            let data = UserDefaults.standard.data(forKey: itemskey) , let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }

    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id}){
            items[index] =  item.updateCompletion()
        }
    }
    func saveItems (){
        if let encodedData =  try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemskey)
        }
    }
}

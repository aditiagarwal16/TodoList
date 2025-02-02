//
//  TodoListApp.swift
//  TodoList
//
//  Created by Aditi Agarwal on 28/06/24.
//

import SwiftUI


/*
 
MVVM architecture
Model- data point
view-  ui
 viewmodel- manages models for view
 
 */

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}

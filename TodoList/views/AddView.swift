//
//  AddView.swift
//  TodoList
//
//  Created by Aditi Agarwal on 28/06/24.
//

import SwiftUI

struct AddView: View {
    
    @State var TextFieldText : String = ""
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here....", text: $TextFieldText )
                    .padding(.horizontal)
                    .frame(height: 70)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
                
                Button(action: {
                    
                }, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 70)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(16)
        }
        .navigationTitle("Add your item here 🖊️")
    }
}

#Preview {
    NavigationView{
        AddView()
    }
}

//
//  AddView.swift
//  TodoList
//
//  Created by Aditi Agarwal on 28/06/24.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var TextFieldText : String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert : Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here....", text: $TextFieldText )
                    .padding(.horizontal)
                    .frame(height: 70)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
                
                Button(action: saveButtonPress, label: {
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
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPress(){
        
        if textIsAppropriate() {
            listViewModel.addItem(title: TextFieldText)
            dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool{
        if TextFieldText.count < 3 {
            alertTitle = " Yout new todo item must be atleast 3 character long!!!!!!"
            showAlert.toggle()
            return false
        }
        
        
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView{
        AddView()
    }
    .environmentObject(ListViewModel())
}

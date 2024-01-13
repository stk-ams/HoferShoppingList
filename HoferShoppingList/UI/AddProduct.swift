//
//  AddProduct.swift
//  HoferShoppingList
//
//  Created by Metry Saad Antonius on 21.10.23.
//

import SwiftUI

struct AddProduct: View {
    @Binding var shoppingItems: [ShoppingItem]
    @AppStorage("name")   var name: String = ""
    @AppStorage("category")   var category: String = ""
    @AppStorage("amount")   var amount: Int = 1
    @AppStorage("unit") var unit: String = "Stück"
    @Environment(\.dismiss) var dismiss

    var body: some View {
        
            VStack{
                Form {
                    Section(header: Text("Product Name") ) {
                        TextField("Geben Sie Ihren Produktnamen ein", text: $name)
                        // With padding that is equivalent to your padding.
                            .padding(.vertical, 10)
                        // .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    }
                    
                    Section(header: Text("Category") ) {
                        TextField("Geben Sie die Kategorie ein", text: $category)
                        // With padding that is equivalent to your padding.
                            .padding(.vertical, 10)
                        // .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    }
                    
                    
                    Section(header: Text("Amount") ) {
                        TextField("Geben Sie die Anzahl ein", value: $amount, format: .number)
                        // With padding that is equivalent to your padding.
                            .padding(.vertical, 10)
                        // .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    }
                    
                    Section(header: Text("Unit") ) {
                        TextField("Geben Sie die Einheit ein", text: $unit)
                        // With padding that is equivalent to your padding.
                            .padding(.vertical, 10)
                        // .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    }
                    
                    
        
                    
                    
                    
                    
                    
                }
                
                Button("Create") {
                    let item = ShoppingItem(name: name, amount: amount)
                    shoppingItems.append(item)
                    Helper.writeData(shoppingItems)
                    dismiss()
                }
                
                
                
            }
           
            
            
        
    }
}


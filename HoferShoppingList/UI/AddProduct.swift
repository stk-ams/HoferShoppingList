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
    @State var category: Category = .other
    @AppStorage("amount")   var amount: Int = 1
    @AppStorage("unit") var unit: String = "kg"
    @Environment(\.dismiss) var dismiss
    
    func createItem(){
        let item = ShoppingItem(name: name, unit: unit, amount: amount, category: category)
        shoppingItems.append(item)
        Helper.writeData(shoppingItems)
        dismiss()
    }

    var body: some View {
        
            VStack{
                Form {
                    Section(header: Text("product-name") ) {
                        TextField("product-name-placeholder", text: $name)
                        
                            .padding(.vertical, 10)
                        
                    }
                    
                    
                    Section(header: Text("category-name")) {
                                    Picker("category-name-placeholder", selection: $category) {
                                        ForEach(Category.allCases, id: \.self) { category in
                                            Text(category.localized).tag(category)
                                                           }
                        }
                    }
                    
                    Section(header: Text("amount-name") ) {
                        TextField("amount-name-placeholder", value: $amount, format: .number)
                        
                            .padding(.vertical, 10)
                        
                    }
                    
                    Section(header: Text("unit-name") ) {
                        TextField("unit-name-placeholder", text: $unit)
                        
                            .padding(.vertical, 10)
                        
                    }
                    
                    
        
                    
                    
                    
                    
                    
                }
                
                Button("add-name") {
                    createItem()
                }
                
                
                
            }
           
            
            
        
    }
}


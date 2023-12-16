//
//  ContentView.swift
//  HoferShoppingList
//
//  Created by Metry Saad Antonius on 21.10.23.
//

import SwiftUI

struct ContentView: View {
    @State var shoppingItems = [
        ShoppingItem(name: "Apfel", amount: 3),
        ShoppingItem(name: "Banane", amount: 2)
        
    ]
    
    var body: some View {
        NavigationView{
            VStack{
                List()
                {
                    ForEach(shoppingItems){ item in
                        ShoppingRow(shoppingItem: item)
                    }.onDelete(perform: { indexSet in
                        removeRows(at: indexSet)
                    })
                    
                }
                .toolbar{
                    EditButton()
                }
                NavigationLink(destination: AddProduct(shoppingItems: $shoppingItems),
                                             label: { Text("Add Product") })
                
                
            }
        }
        
    }
    
    func removeRows(at offsets: IndexSet) {
        shoppingItems.remove(atOffsets: offsets)
        
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted


            let data = try encoder.encode(shoppingItems)
            print(String(data: data, encoding: .utf8)!)
           } catch {
               print("JSONSerialization error:", error)
           }
        


        print(shoppingItems)
    }
}

#Preview {
    ContentView()
}

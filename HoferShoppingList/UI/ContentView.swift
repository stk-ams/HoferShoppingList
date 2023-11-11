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
                List(shoppingItems)
                { shoppingItem in
                    ShoppingRow(shoppingItem: shoppingItem)
                }
                NavigationLink(destination: AddProduct(shoppingItems: $shoppingItems),
                                             label: { Text("Add Product") })
                
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}

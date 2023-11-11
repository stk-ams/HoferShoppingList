//
//  ShoppingRow.swift
//  HoferShoppingList
//
//  Created by Metry Saad Antonius on 21.10.23.
//

import SwiftUI


struct ShoppingRow: View {
        var shoppingItem: ShoppingItem
    
        var body: some View {
            HStack
            {
                Image(systemName: ".image")
                Text("\(shoppingItem.name)")
                Text("Anzahl \(shoppingItem.amount)").foregroundColor(Color.blue)
            }
            
             
        }
    }

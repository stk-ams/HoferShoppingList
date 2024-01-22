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
                Text("\(shoppingItem.amount)").foregroundColor(Color.blue)
                Text("\(shoppingItem.unit)")
                Text("\(shoppingItem.name)")
                
            }
            
             
        }
    }

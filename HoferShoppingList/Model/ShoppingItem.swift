//
//  ShoppingItem.swift
//  HoferShoppingList
//
//  Created by Metry Saad Antonius on 21.10.23.
//

import Foundation


struct ShoppingItem : Identifiable{
    let id = UUID()
    let name: String
    let amount: Int
    
    init(name: String, amount: Int) {
        self.name = name
        self.amount = amount
    }
    
}

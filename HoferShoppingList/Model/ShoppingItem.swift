//
//  ShoppingItem.swift
//  HoferShoppingList
//
//  Created by Metry Saad Antonius on 21.10.23.
//

import Foundation


struct ShoppingItem : Identifiable, Encodable, Decodable{
    let id = UUID()
    let name: String
    let amount: Int
}

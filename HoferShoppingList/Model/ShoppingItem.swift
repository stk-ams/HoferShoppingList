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
    let unit: String
    let amount: Int
    let category: Category
}

enum Category: String, CaseIterable, Codable {
    case fruits
    case vegetables
    case meat
    case bakery
    case beverages
    case snacks
    case frozen
    case other
    
    var localized: String {
            return NSLocalizedString(self.rawValue, comment: "")
        }
        
        static func fromLocalized(_ localizedString: String) -> Category? {
            return self.allCases.first { $0.localized == localizedString }
        }

}





//
//  Helper.swift
//  HoferShoppingList
//
//  Created by Metry Saad Antonius on 13.01.24.
//

import Foundation


class Helper{
    static func writeData(_ shoppingItems: [ShoppingItem]) -> Void {
        do{
            let fileURL = try FileManager.default
                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("shoppingItems.json")
            
            try JSONEncoder()
                .encode(shoppingItems)
                .write(to: fileURL)
        } catch{
            print("error writing data")
        }
    }
    
    static func readData() -> [ShoppingItem]{
        do{
            let fileURL = try FileManager.default
                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("shoppingItems.json")
            
            let data = try Data(contentsOf: fileURL)
            let shoppingItemsData = try JSONDecoder().decode([ShoppingItem].self, from: data)
            
            return shoppingItemsData
        } catch {
            print("error reading data")
            
            return []
        }
    }
}

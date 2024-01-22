//
//  ContentView.swift
//  HoferShoppingList
//
//  Created by Metry Saad Antonius on 21.10.23.
//

import SwiftUI

struct MyContentView: View {
    @State var shoppingItems = Helper.readData()

    var sortedShoppingItems: [ShoppingItem] {
        shoppingItems.sorted {
            guard let index1 = Category.allCases.firstIndex(of: $0.category),
                  let index2 = Category.allCases.firstIndex(of: $1.category) else {
                return false
            }
            return index1 < index2
        }
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Hofer Cart").font(.largeTitle)
                List()
                {
                    ForEach(sortedShoppingItems){ item in
                        ShoppingRow(shoppingItem: item)
                    }.onDelete(perform: { indexSet in
                        removeRows(at: indexSet)
                    })
                    
                }
                .toolbar{
                    EditButton()
                }
                NavigationLink(destination: AddProduct(shoppingItems: $shoppingItems),
                                             label: { Text("add-name") })
                
                
            }
        }
        
    }

    
    func removeRows(at offsets: IndexSet) {
        shoppingItems.remove(atOffsets: offsets)
        Helper.writeData(shoppingItems)
    }
}

#Preview {
    ContentView()
}

import XCTest
@testable import HoferShoppingList

class RemoveProductTests: XCTestCase {
    var shoppingItems: [ShoppingItem]!
    var view: MyContentView!


    override func setUp() {
        super.setUp()
        // Initialize shoppingItems with some test data
        shoppingItems = [
            ShoppingItem(name: "Apfel", unit: "kg", amount: 1, category:.fruits)
        ]
        
        // Initialize with the test data
        view = MyContentView(shoppingItems: shoppingItems)

    func testRemoveItem() {
        let initialCount = view.shoppingItems.count
        
        // Call the removeRows function
        view.removeRows(at: IndexSet(integer: 0))
        
        // Verify that item was removed
        XCTAssertEqual(view.shoppingItems.count, initialCount - 1)
    }
}
    }

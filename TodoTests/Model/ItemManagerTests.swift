//
//  ItemManagerTests.swift
//  Todo
//
//  Created by Shawn Wu on 8/09/16.
//  Copyright © 2016 Spark. All rights reserved.
//

import XCTest

class ItemManagerTests: XCTestCase {
    var sut: ItemManager!
    
    override func setUp() {
        super.setUp()
        sut = ItemManager()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testToDoCount_Initially_ShouldBeZero() {
        
        XCTAssertEqual(sut.todoCount, 0)
    }
    
    func testDoneCount_Initially_ShouldBeZero() {
        
        XCTAssertEqual(sut.doneCount, 0)
    }
    
    func testTodoCount_AfterAddingOneItem_IsOne()  {
        sut.addItem(ToDoItem(title:"a item"))
        
        XCTAssertEqual(sut.todoCount, 1)
    }
    
    func testItemAtIndex_ShouldReturnPreviouslyAddedItem()  {
        let item = ToDoItem(title: "item")
        sut.addItem(item)
        
        let returnedItem = sut.itemAtIndex(0)
        XCTAssertEqual(returnedItem.title, "item")
    }
    
    func testCheckingItem_ChangesCountOfToDoAndOfDoneItems()  {
        sut.addItem(ToDoItem(title: ""))
        sut.checkItemAtIndex(0)
        
        XCTAssertEqual(sut.todoCount, 0)
        XCTAssertEqual(sut.doneCount, 1)
    }
    
    func testCheckingItem_RemovesItFromTheToDoItemList()  {
        let firstItem = ToDoItem(title: "first")
        let secondItem = ToDoItem(title: "second")
        sut.addItem(firstItem)
        sut.addItem(secondItem)
        sut.checkItemAtIndex(0)
        
        XCTAssertEqual(sut.itemAtIndex(0).title, "second")
    }
    
    
    func testDoneItemAtIndex_ShouldReturnPreviouslyCheckedItem() {
//        let item = ToDoItem(title: "Item")
//        sut.addItem(item)
//        sut.checkItemAtIndex(0)
        

    }
}

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
    
    
    
    
    
    
    func  testTodoCount_ShouldBeZeroInitially()  {
        
        
        XCTAssertEqual(sut.todoCount, 0)
    }
    
    func testTodoCount_ShouldAddOne_AfterAddAnItem()  {
        let item = ToDoItem(title: "item")
        sut.addItem(item)
        
        XCTAssertEqual(sut.todoCount, 1 )
    }
    
    func testItemAtIndex_ShouldReturnPreviouselyAddedItem(){
        let item = ToDoItem(title: "item")
        sut.addItem(item)
        
        XCTAssertEqual(sut.itemAtIndex(0).title, item.title)
    }
    
    func testDoneCount_ShouldBeZeroInitially()  {
        

        XCTAssertEqual(sut.doneCount, 0)
    }
    
    
    func testCheckItemAtIndex_ShouldAddOneToDoneCount_minusOneToTodoCount()  {
        let item = ToDoItem(title: "item")
        sut.addItem(item)
        
        sut.checkItemAtIndex(0)
        XCTAssertEqual(sut.todoCount, 0)
        XCTAssertEqual(sut.doneCount, 1)
    }
    
    
    
    func testCheckItemAtIndex_shouldRemoveItemFromTodoItem(){
        let firstItem = ToDoItem(title: "first")
        let secondItem = ToDoItem(title: "second")
        sut.addItem(firstItem)
        sut.addItem(secondItem)
        
        sut.checkItemAtIndex(0)
        
        XCTAssertEqual(sut.itemAtIndex(0).title, secondItem.title)
        
    }
    
    func testDoneItemAtIndex_ShouldReturnPreviouslyCheckedItem()  {
        let firstItem = ToDoItem(title: "first")
        let secondItem = ToDoItem(title: "second")
        sut.addItem(firstItem)
        sut.addItem(secondItem)
        sut.checkItemAtIndex(0)
        
        let returnedItem = sut.doneItemAtIndex(0)
        XCTAssertEqual(returnedItem.title, firstItem.title)
    }
    
  
    
    
    
    
    
    
    
    
    
    
}

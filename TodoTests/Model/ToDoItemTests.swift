//
//  ToDoItemTests.swift
//  Todo
//
//  Created by Shawn Wu on 8/09/16.
//  Copyright © 2016 Spark. All rights reserved.
//

import XCTest


class ToDoItemTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func  testInit_ShouldTakeTitle() {
        let item = ToDoItem(title: "Test title")
        XCTAssertEqual(item.title, "Test title")
    }
    
    func testInit_ShouldTakeTitleAndDescription(){
        let item = ToDoItem(title: "Test title",
                         itemDescription:  "test description")
        XCTAssertEqual(item.itemDescription, "test description")
    }
    
    func testInit_ShouldSetTitleAndDescriptionAndTimestamp()  {
        let item = ToDoItem(title: "title",
                            itemDescription: "desc",
                            timeStamp: 0.0)
        XCTAssertEqual(0.0, item.timeStamp)
    }
    
    func testInit_ShouldSetTitleAndDescriptionAndTimestampAndLocationi()  {
        let location = Location(name: "Test name")
        let item = ToDoItem(title: "t",
                            itemDescription: "d",
                            timeStamp: 0,
                            location: location)
        XCTAssertEqual(item.location?.name, "Test name")
        
    }
    
    func  testEqual_ShouldBeEqual()  {
        let firstItem = ToDoItem(title: "fff")
        let secondItem = ToDoItem(title: "fff")
        
        XCTAssertEqual(firstItem, secondItem)
    }
    
    func  testEqual_whenLocationDifferes_ShouldNotEqual()  {
        let firstItem = ToDoItem(title: "item", itemDescription: nil, timeStamp: nil, location: Location(name: "location name 1"))
        let secondItem = ToDoItem(title: "item", itemDescription: nil, timeStamp: nil, location: Location(name: "location name 2"))

        XCTAssertNotEqual(firstItem, secondItem)
    }
    
    
    func testEqual_whenOneLocationIsNilAndTheOtherIsNot_ShouldNotEqual()  {
        let firstItem = ToDoItem(title: "item", itemDescription: nil, timeStamp: nil, location: Location(name: "location name 1"))
        let secondItem = ToDoItem(title: "item", itemDescription: nil, timeStamp: nil, location: nil)
        
        XCTAssertNotEqual(firstItem, secondItem)
    }
    
    func testWhenTimestampDifferes_ShouldBeNotEqual() {
        let firstItem = ToDoItem(title: "First title",
                                 itemDescription: "First description",
                                 timeStamp: 1.0)
        let secondItem = ToDoItem(title: "First title",
                                  itemDescription: "First description",
                                  timeStamp: 0.0)
        XCTAssertNotEqual(firstItem, secondItem)
    }
    
    
    func testWhenDescriptionDifferes_ShouldBeNotEqual() {
        let firstItem = ToDoItem(title: "First title",
                                 itemDescription: "First description")
        let secondItem = ToDoItem(title: "First title",
                                  itemDescription: "Second description")
        XCTAssertNotEqual(firstItem, secondItem)
    }
    
    func testWhenTitleDifferes_ShouldBeNotEqual() {
        let firstItem = ToDoItem(title: "First title")
        let secondItem = ToDoItem(title: "Second title")
        XCTAssertNotEqual(firstItem, secondItem)
    }

}

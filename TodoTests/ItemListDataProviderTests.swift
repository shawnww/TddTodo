//
//  ItemListDataProviderTests.swift
//  Todo
//
//  Created by Shawn Wu on 12/09/16.
//  Copyright © 2016 Spark. All rights reserved.
//

import XCTest

@testable import Todo

class ItemListDataProviderTests: XCTestCase {
    var sut: ItemListDataProvider!
    var tableView: UITableView!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ItemListDataProvider()
        tableView = UITableView()
        tableView.dataSource = sut
        sut.itemManager = ItemManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func  testNumberOfSections_IsTwo()  {
        let numberOfSections = tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 2)
    }
    
    func testNumberOfRowsInSection_SectionOneRowNumberShouldEqualTodoItemsCount()  {
        
        sut.itemManager?.addItem(ToDoItem(title: "a item"))
        XCTAssertEqual(tableView.numberOfRowsInSection(0), 1)
        
        sut.itemManager?.addItem(ToDoItem(title: "2nd item"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRowsInSection(0), 2)
    }
    
    func testNumberOfRowsInSection_SectionTowRowNumberShouldEqualtoDoneCount()  {
        sut.itemManager?.addItem(ToDoItem(title: "1st item"))
        sut.itemManager?.addItem(ToDoItem(title: "2nd item"))
        sut.itemManager?.addItem(ToDoItem(title: "3rd item"))
        XCTAssertEqual(tableView.numberOfRowsInSection(0), 3)
        XCTAssertEqual(tableView.numberOfRowsInSection(1), 0)
        
        sut.itemManager?.checkItemAtIndex(0)
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRowsInSection(0), 2)
        XCTAssertEqual(tableView.numberOfRowsInSection(1), 1)
    }
}

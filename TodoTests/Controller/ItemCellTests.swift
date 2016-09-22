//
//  ItemCellTests.swift
//  Todo
//
//  Created by Shawn Wu on 19/09/16.
//  Copyright © 2016 Spark. All rights reserved.
//

import XCTest

@testable import Todo

class ItemCellTests: XCTestCase {
    var tableView: UITableView!
    var dataProvider: FakeDataSource!
    var cell: ItemCell!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(
            withIdentifier: "ItemListViewController") as! ItemListViewController
        
        _ = controller.view
        
        self.tableView = controller.tableView
        self.dataProvider = FakeDataSource()
        tableView.dataSource = self.dataProvider
        cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell",for: IndexPath(row: 0, section: 0)) as! ItemCell
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testSUT_HasNameLabel() {
        
  
        XCTAssertNotNil(cell.titleLabel)
    }
    
    func testSUT_HasLocationLabel() {
        
        
        
        XCTAssertNotNil(cell.locationLabel)
    }
    
    func testSUT_HasDateLabel() {
        
        XCTAssertNotNil(cell.dateLabel)
    }
    
    func testConfigWithItem_SetTitle() {
        cell.configCellWithItem(ToDoItem(title: "First"))
        XCTAssertEqual(cell.titleLabel?.text, "First")
    }
    
    func testConfigWithItem_SetsLabelTexts() {
        
        cell.configCellWithItem(ToDoItem(title: "First", itemDescription: nil, timeStamp: 1456150025, location: Location(name: "Home")))
        
        XCTAssertEqual(cell.titleLabel.text, "First")
        XCTAssertEqual(cell.locationLabel.text, "Home")
        XCTAssertEqual(cell.dateLabel.text, "02/23/2016")
    }
    
    func testTitle_ForCheckedTasks_IsStrokeThrough() {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ItemCell",
            for: IndexPath(row: 0, section: 0)) as! ItemCell
        
        let toDoItem = ToDoItem(title: "First",
                                itemDescription: nil,
                                timeStamp: 1456150025,
                                location: Location(name: "Home"))
        
        cell.configCellWithItem(toDoItem, checked: true)
        
        let attributedString = NSAttributedString(string: "First",
                                                  attributes: [NSStrikethroughStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue])
        
        XCTAssertEqual(cell.titleLabel.attributedText, attributedString)
        XCTAssertNil(cell.locationLabel.text)
        XCTAssertNil(cell.dateLabel.text)
    }
}


extension ItemCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource {
        
        
        func  tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}

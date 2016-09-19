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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewControllerWithIdentifier(
            "ItemListViewController") as! ItemListViewController
        
        _ = controller.view
        
        self.tableView = controller.tableView
        self.dataProvider = FakeDataSource()
        tableView.dataSource = self.dataProvider
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testSUT_HasNameLabel() {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "ItemCell",
            forIndexPath: NSIndexPath(forRow: 0, inSection: 0)) as! ItemCell
        
        XCTAssertNotNil(cell.titleLabel)
    }
    
    func testSUT_HasLocationLabel() {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell",forIndexPath: NSIndexPath(forRow: 0, inSection: 0)) as! ItemCell
        
        XCTAssertNotNil(cell.locationLabel)
    }
    
    func testSUT_HasDateLabel() {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell",forIndexPath: NSIndexPath(forRow: 0, inSection: 0)) as! ItemCell
        
        XCTAssertNotNil(cell.dateLabel)
    }
}


extension ItemCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource {
        
        
        func  tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}

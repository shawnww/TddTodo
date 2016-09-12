//
//  ItemListViewControllerTests.swift
//  Todo
//
//  Created by Shawn on 11/09/16.
//  Copyright © 2016 Spark. All rights reserved.
//

import XCTest

@testable import Todo
class ItemListViewControllerTests: XCTestCase {
    var sut: ItemListViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewControllerWithIdentifier("ItemListViewController") as! ItemListViewController
        _ = sut.view
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func test_TableViewIsNotNilAfterViewDidLoad()  {
       
        
        XCTAssertNotNil(sut.tableView)
    }
    
    func testViewDidLoad_ShouldSetTableViewDataSource(){
        
        XCTAssertNotNil(sut.tableView.dataSource)
        XCTAssertTrue(sut.tableView.dataSource is ItemListDataProvider)
    }
    
    func testViewDidLoad_ShouldSetTableViewDelegate(){
        XCTAssertNotNil(sut.tableView.delegate)
        XCTAssertNotNil(sut.tableView.delegate is ItemListDataProvider)
    }
    
    func testViewDidLoad_ShouldSetDelgateAndDatasourceToTheSameObject(){
        XCTAssertEqual(sut.tableView.delegate as? ItemListDataProvider, sut.tableView.dataSource as? ItemListDataProvider)
    }
}

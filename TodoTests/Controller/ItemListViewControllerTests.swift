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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func test_TableViewIsNotNilAfterViewDidLoad()  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewControllerWithIdentifier("ItemListViewController") as! ItemListViewController
        _ = sut.view
        
        XCTAssertNotNil(sut.tableView)
    }
    
}

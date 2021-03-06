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
    var controller: ItemListViewController!
    var tableView: UITableView!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ItemListDataProvider()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        _ = controller.view
        tableView = controller.tableView
        tableView.dataSource = sut
        sut.itemManager = ItemManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func mockTableViewWithDataSource() -> MockTableView {
        let mockTableView = MockTableView(
            frame: CGRect(x: 0, y: 0, width: 320, height: 480),
            style: .plain)
        
        mockTableView.dataSource = sut
        mockTableView.register(MockItemCell.self, forCellReuseIdentifier: "ItemCell")
        return mockTableView
    }
    
    func  testNumberOfSections_IsTwo()  {
        let numberOfSections = tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 2)
    }
    
    func testNumberOfRowsInSection_SectionOneRowNumberShouldEqualTodoItemsCount()  {
        
        sut.itemManager?.addItem(ToDoItem(title: "a item"))
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        sut.itemManager?.addItem(ToDoItem(title: "2nd item"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func testNumberOfRowsInSection_SectionTowRowNumberShouldEqualtoDoneCount()  {
        sut.itemManager?.addItem(ToDoItem(title: "1st item"))
        sut.itemManager?.addItem(ToDoItem(title: "2nd item"))
        sut.itemManager?.addItem(ToDoItem(title: "3rd item"))
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 3)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 0)
        
        sut.itemManager?.checkItemAtIndex(0)
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
    }
    
    func testCellForRow_ShouldReturnItemCell()  {
        sut.itemManager?.addItem(ToDoItem(title: "a Item"))
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is ItemCell)
    }
    
    func testCellForRow_DequeuesCell() {
        let mockTableView = self.mockTableViewWithDataSource()

        
        sut.itemManager?.addItem(ToDoItem(title: "First"))
        mockTableView.reloadData()
        
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(mockTableView.cellGotDequeued)
    }
    
    func testConfigCell_GetsCalledInCellForRow() {
        let mockTableView = MockTableView()
        
        mockTableView.dataSource = sut
        mockTableView.register(MockItemCell.self, forCellReuseIdentifier: "ItemCell")
        
        let toDoItem = ToDoItem(title: "First",
                                itemDescription: "First desc")
        sut.itemManager?.addItem(toDoItem)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockItemCell
        
        XCTAssertEqual(toDoItem, cell.todoItem)
    }
    
    func testCellInSectionTwo_GetsConfiguredWithDoneItem() {
 
        let mockTableView = self.mockTableViewWithDataSource()
        
        let firstItem = ToDoItem(title: "First",
                                 itemDescription: "First description")
        sut.itemManager?.addItem(firstItem)
        
        
        let secondItem = ToDoItem(title: "Second",
                                  itemDescription: "Second description")
        sut.itemManager?.addItem(secondItem)

        sut.itemManager?.checkItemAtIndex(1)
        mockTableView.reloadData()
        
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 1)) as! MockItemCell
        
        XCTAssertEqual(cell.todoItem, secondItem)

    }
    
    func testDeletionButtonInFirstSection_ShowsTitleCheck() {
        let deleteButtonTitle = tableView.delegate?.tableView?(tableView,titleForDeleteConfirmationButtonForRowAt:IndexPath(row: 0, section: 0))
        XCTAssertEqual(deleteButtonTitle, "Check")
    }
    
    func testDataSourceAndDelegate_AreNotTheSameObject() {
        XCTAssert(tableView.dataSource is ItemListDataProvider)
        XCTAssert(tableView.delegate is ItemListDataProvider)
        XCTAssertNotEqual(tableView.dataSource as? ItemListDataProvider,
                          tableView.delegate as? ItemListDataProvider)
    }
    
    func testDeletionButtonInFirstSection_ShowsTitleUncheck() {
        let deleteButtonTitle = tableView.delegate?.tableView?(tableView,
                                                               titleForDeleteConfirmationButtonForRowAt:
            IndexPath(row: 0, section: 1))
        XCTAssertEqual(deleteButtonTitle, "Uncheck")
    }
    
    func testCheckingAnItem_ChecksItInTheItemManager() {
        sut.itemManager?.addItem(ToDoItem(title: "first"))
        
        tableView.dataSource?.tableView?(tableView,
                                         commit: .delete,
                                         forRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(sut.itemManager?.todoCount, 0)
        XCTAssertEqual(sut.itemManager?.doneCount, 1)
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
    }
    
    func testUncheckingAnItem_UnchecksItInTheItemManager() {
        sut.itemManager?.addItem(ToDoItem(title: "First"))
        sut.itemManager?.checkItemAtIndex(0)
        tableView.reloadData()
        tableView.dataSource?.tableView?(tableView,
                                         commit: .delete,
                                         forRowAt: IndexPath(row: 0, section: 1))
        XCTAssertEqual(sut.itemManager?.todoCount, 1)
        XCTAssertEqual(sut.itemManager?.doneCount, 0)
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 0)
    }
}


extension ItemListDataProviderTests {
    class MockTableView: UITableView{
            var cellGotDequeued = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellGotDequeued = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    
    class MockItemCell: ItemCell {
        
        var todoItem : ToDoItem?
        
        override func configCellWithItem(_ item: ToDoItem, checked: Bool) {
            todoItem = item
        }
    }
}

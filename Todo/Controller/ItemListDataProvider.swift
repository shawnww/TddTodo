//
//  ItemListDataProvider.swift
//  Todo
//
//  Created by Shawn Wu on 12/09/16.
//  Copyright © 2016 Spark. All rights reserved.
//

import UIKit

enum  Section: Int {
    case ToDo
    case Done
}

class ItemListDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    var itemManager: ItemManager?
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let itemManager = itemManager else {return 0}
        guard let itemSection = Section(rawValue: section) else {
            fatalError()
        }
        
        let numOfRows: Int
        
        switch itemSection {
        case .ToDo:
            numOfRows = itemManager.todoCount
        case .Done:
            numOfRows = itemManager.doneCount
        }
        return numOfRows
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}


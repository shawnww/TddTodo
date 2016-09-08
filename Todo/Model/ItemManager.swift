//
//  ItemManager.swift
//  Todo
//
//  Created by Shawn Wu on 8/09/16.
//  Copyright © 2016 Spark. All rights reserved.
//



class ItemManager {
    var todoCount: Int {
        get {
            return toDoItems.count
        }
    }
    var doneCount = 0
    
    private var toDoItems = [ToDoItem]()
    
    func addItem(item: ToDoItem)  {
        toDoItems.append(item)
    }
    
    func itemAtIndex(index: Int) -> ToDoItem {
        return toDoItems[index]
    }
    
    func checkItemAtIndex(index: Int) {
        toDoItems.removeAtIndex(index)
        doneCount += 1
    }
}

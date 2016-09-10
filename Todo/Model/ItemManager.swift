//
//  ItemManager.swift
//  Todo
//
//  Created by Shawn Wu on 8/09/16.
//  Copyright © 2016 Spark. All rights reserved.
//



class ItemManager {
    var todoCount : Int {
        return todoItems.count
    }
    var doneCount : Int {
        return doneItems.count
    }
    private var todoItems = [ToDoItem]()
    private var doneItems = [ToDoItem]()
    
    func addItem(item: ToDoItem) {
        if !todoItems.contains(item) {
            todoItems.append(item)
        }
    }
    
    func itemAtIndex(index: Int) -> ToDoItem {
        return todoItems[index]
    }
    
    func checkItemAtIndex(index: Int) {
        
        let item = todoItems.removeAtIndex(index)
        doneItems.append(item)
    }
    
    func doneItemAtIndex(index:Int) -> ToDoItem {
        
        return doneItems[index]
    }
    
    func removeAllItems() {
        todoItems.removeAll()
        doneItems.removeAll()
    }
}



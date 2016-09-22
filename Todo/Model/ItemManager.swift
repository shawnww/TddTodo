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
    fileprivate var todoItems = [ToDoItem]()
    fileprivate var doneItems = [ToDoItem]()
    
    func addItem(_ item: ToDoItem) {
        if !todoItems.contains(item) {
            todoItems.append(item)
        }
    }
    
    func itemAtIndex(_ index: Int) -> ToDoItem {
        return todoItems[index]
    }
    
    func checkItemAtIndex(_ index: Int) {
        
        let item = todoItems.remove(at: index)
        doneItems.append(item)
    }
    
    func uncheckItemAtIndex(_ index: Int) {
        let item = doneItems.remove(at: index)
        todoItems.append(item)
    }
    
    func doneItemAtIndex(_ index:Int) -> ToDoItem {
        
        return doneItems[index]
    }
    
    func removeAllItems() {
        todoItems.removeAll()
        doneItems.removeAll()
    }
}



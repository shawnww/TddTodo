//
//  ToDoItem.swift
//  Todo
//
//  Created by Shawn Wu on 8/09/16.
//  Copyright © 2016 Spark. All rights reserved.
//

struct ToDoItem: Equatable {
    let title: String
    let itemDescription: String?
    let timeStamp: Double?
    let location: Location?
    
    init(title: String, itemDescription: String? = nil, timeStamp: Double? = nil, location: Location? = nil){
        self.title = title
        self.itemDescription = itemDescription
        self.timeStamp = timeStamp
        self.location = location
    }
}



func ==(lhs: ToDoItem, rhs: ToDoItem) -> Bool {
    
    return lhs.title == rhs.title &&
        lhs.location == rhs.location &&
        lhs.timeStamp == rhs.timeStamp &&
        lhs.itemDescription == rhs.itemDescription
}



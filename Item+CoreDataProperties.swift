//
//  Item+CoreDataProperties.swift
//  ToDoList
//
//  Created by Brandon Mahoney on 9/22/17.
//  Copyright © 2017 Brandon Mahoney. All rights reserved.
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        let request = NSFetchRequest<Item>(entityName: "Item")
        request.sortDescriptors = [NSSortDescriptor(key: "text", ascending: true)]
//        return NSFetchRequest<Item>(entityName: "Item")
        return request
    }

    @NSManaged public var isCompleted: Bool
    @NSManaged public var text: String
}

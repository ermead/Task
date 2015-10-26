//
//  Task.swift
//  Task
//
//  Created by Eric Mead on 10/26/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class Task: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    convenience init (name: String, notes: String? = nil, due: NSDate? = nil, isComplete: Bool, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext){
    
    let entity = NSEntityDescription.entityForName("Task", inManagedObjectContext: context)!
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.name = name
        self.notes = notes
        self.due = due
        self.isComplete = isComplete
    
    }
}

//
//  Task.swift
//  Task
//
//  Created by Eric Mead on 10/22/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class Task : NSObject, NSCoding {
    
    var name: String
    var notes: String?
    var due: NSDate?
    var isComplete: Bool
    
    init(name: String, notes: String = "", due: NSDate = NSDate(), isComplete: Bool){
        
        self.name = name
        self.notes = notes
        self.due = due
        self.isComplete = isComplete
    }
    
    required convenience init?(coder aDecoder : NSCoder){
      
        self.init(name: "John", notes: "whatever", due: NSDate(), isComplete: true)
        
    
    }
    
    func encodeWithCoder(aCoder: NSCoder){
        
        
        
    }

    
}
    
    func == (lhs: Task, rhs: Task) -> Bool {
    
        return true
    
    }
    

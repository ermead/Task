//
//  Task.swift
//  Task
//
//  Created by Eric Mead on 10/22/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class Task : NSObject, NSCoding {
    
    static let NameKey = "name"
    static let NotesKey = "notes"
    static let DueKey = "due"
    static let IsCompleteKey = "isComplete"
    
    var name: String
    var notes: String?
    var due: NSDate?
    var isComplete: Bool

    
    init(name: String, notes: String? = nil, due: NSDate? = nil, isComplete: Bool){
       
        self.name = name
        self.notes = notes
        self.due = due
        self.isComplete = isComplete
    }
    
    required convenience init?(coder aDecoder : NSCoder){
        
        
        guard let name = aDecoder.decodeObjectForKey(Task.NameKey) as? String,
        notes = aDecoder.decodeObjectForKey(Task.NotesKey) as? String,
        due = aDecoder.decodeObjectForKey(Task.DueKey) as? NSDate,
        isComplete = aDecoder.decodeObjectForKey(Task.IsCompleteKey) as? Bool
        
            else {print("Coder Initializer failed..."); return nil }
      
        self.init(name: name, notes: notes, due: due, isComplete: isComplete)
        
    }
    
    func encodeWithCoder(aCoder: NSCoder){
        
        aCoder.encodeObject(self.name, forKey: Task.NameKey)
        aCoder.encodeObject(self.notes, forKey: Task.NotesKey)
        aCoder.encodeObject(self.due, forKey: Task.DueKey)
        aCoder.encodeObject(self.isComplete, forKey: Task.IsCompleteKey)
        
    }

    
}
    
func == (lhs: Task, rhs: Task) -> Bool {
    
        return (lhs.name == rhs.name)
}


    

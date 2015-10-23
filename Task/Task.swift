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
        isComplete = aDecoder.decodeObjectForKey(Task.IsCompleteKey) as? Bool
        
            else {print("Coder Initializer failed..."); return nil }
      
        if let due: NSDate = aDecoder.decodeObjectForKey(Task.DueKey) as? NSDate {
            self.init(name: name, notes: notes, due: due, isComplete: isComplete)
        } else {
            let nilDue: NSDate? = nil
            self.init(name: name, notes: notes, due: nilDue, isComplete: isComplete)
        }

        
        
    }
    
    func encodeWithCoder(aCoder: NSCoder){
        
        aCoder.encodeObject(self.name, forKey: Task.NameKey)
        aCoder.encodeObject(self.isComplete, forKey: Task.IsCompleteKey)

        // Optionals:
        if let notes = self.notes {
            aCoder.encodeObject(notes, forKey: Task.NotesKey)
        } else {
            // give default value
            let emptyNotes = ""
            aCoder.encodeObject(emptyNotes, forKey: Task.NotesKey)
        }
        
        aCoder.encodeObject(due, forKey: Task.DueKey)
        
        
    }

    
}
    
func == (lhs: Task, rhs: Task) -> Bool {
    
        return (lhs.name == rhs.name)
}


    

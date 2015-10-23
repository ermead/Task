//
//  TaskController.swift
//  Task
//
//  Created by Eric Mead on 10/22/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation


class TaskController {
    
    static let TaskKey = "taskKey"
    
    static let sharedController = TaskController()
    
    var tasks : [Task] = []
    
    var completedTasks : [Task] {
        
        get{
            return [] //use a filter func on tasks array, return completed tasks
        }
    
    }
    var incompleteTasks : [Task] {
        
        get{
            return [] //use a filter func on tasks array, return incomplete tasks
        }
        
    }
    
    var mockedTask: [Task] {
        
        get {
        
            return [Task(name: "Get Milk", isComplete: false), Task(name: "Pick up Dry Cleaning", isComplete: true), Task(name: "walk dog", isComplete: false), Task(name: "wash car", notes: "my lexus", due: NSDate(), isComplete: false)]
        }
    }
    
    init(){
        loadFromPersistentStorage()
        print("Initialized")
    }
    
    func addTask(task: Task){
        tasks.append(task)
        saveToPersistentStorage()
    }
    
    func removeTasks(task : Task){
        let index = tasks.indexOf(task)
        tasks.removeAtIndex(index!)
        saveToPersistentStorage()
        
    }
    
    func removeTasks(index: Int) {
        
        tasks.removeAtIndex(index)
        saveToPersistentStorage()
        
    }
    
    func saveToPersistentStorage(){
    
        NSKeyedArchiver.archiveRootObject(self.tasks, toFile: self.filePath(TaskController.TaskKey))

    }
    
    func loadFromPersistentStorage(){
        print("loading from storage")
        if let newTasks = NSKeyedUnarchiver.unarchiveObjectWithFile(self.filePath(TaskController.TaskKey)) as? [Task] {
            tasks = newTasks
        }
    }
    
    func filePath(key: String) -> String {
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
        let documentsPath: AnyObject = directorySearchResults[0]
        let entriesPath = documentsPath.stringByAppendingString("/\(key).plist")
        
        return entriesPath
    }

    
}
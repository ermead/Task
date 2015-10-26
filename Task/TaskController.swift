//
//  TaskController.swift
//  Task
//
//  Created by Eric Mead on 10/22/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation
import CoreData


class TaskController {
    
    static let TaskKey = "taskKey"
    
    static let sharedController = TaskController()
    
    var tasks : [Task] {
        
        let moc = Stack.sharedStack.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Task")
        
        do {
            if let tasks =  try moc.executeFetchRequest(fetchRequest) as? [Task] {
                return tasks
            } else {
                return []
            }
        } catch { return []}
    }
    
//    let completePredicate = NSPredicate(format: "isComplete", argumentArray: [true])
//    let incompletePredicate = NSPredicate(format: "isComplete", argumentArray: [false])
    
    
    
    var completedTasks : [Task] {
        
        get{
            var array: [Task] = []
            for task in tasks {
                if task.isComplete.boolValue {
                    array.append(task)
                }
            }
            return array //use a filter func on tasks array, return completed tasks
        }
    
    }
    var incompleteTasks : [Task] {
        
        get{
            var array: [Task] = []
            for task in tasks {
                if !task.isComplete.boolValue {
                    array.append(task)
                }
            }
            return array //use a filter func on tasks array, return incompleted tasks
        }
        
    }
    
    var mockedTask: [Task] {
        
        get {
        
            return [Task(name: "Get Milk", isComplete: false), Task(name: "Pick up Dry Cleaning", isComplete: true), Task(name: "walk dog", isComplete: false), Task(name: "wash car", notes: "my lexus", due: NSDate(), isComplete: false)]
        }
    }
    
    func addTask(task: Task){
     
        saveToPersistentStorage()
    }
    
//    func removeTasks(task : Task){
//        if let moc = task.managedObjectContext {
//            moc.deleteObject(task)
//        }
//        saveToPersistentStorage()
//        
//    }
    
    
    func removeTasks(index: Int) {
        
        
        if let moc = tasks[index].managedObjectContext {
            moc.deleteObject(tasks[index])
        } else {print("error removing!")}
        
        saveToPersistentStorage()
        
    }
    
    func saveToPersistentStorage(){
    
        let moc = Stack.sharedStack.managedObjectContext
        
        do {
            try moc.save()
        } catch { print("Error Saving")}

    }
    
    
    func filePath(key: String) -> String {
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
        let documentsPath: AnyObject = directorySearchResults[0]
        let entriesPath = documentsPath.stringByAppendingString("/\(key).plist")
        
        return entriesPath
    }

    
}
//
//  TaskController.swift
//  Task
//
//  Created by Eric Mead on 10/22/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation


class TaskController {
    
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
        tasks = mockedTask
    }
    
    func addTask(task: Task){
        tasks.append(task)
    }
    
    func removeTasks(task : Task){
        let index = tasks.indexOf(task)
        tasks.removeAtIndex(index!)
        
    }

    
}
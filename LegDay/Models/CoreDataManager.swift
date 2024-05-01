//
//  CoreDataManager.swift
//  LegDay
//
//  Created by 김승현 on 4/17/24.
//

import UIKit
import CoreData

class CoreDataManager {
    static let shared: CoreDataManager = CoreDataManager()
    
    let appDelegate: AppDelegate? = UIApplication.shared.delegate as? AppDelegate
    lazy var context = appDelegate?.persistentContainer.viewContext
    
    let modelName = "WorkoutSets"
    
    func getWorkoutData(ascending: Bool = false) -> [WorkoutSets] {
        var models: [WorkoutSets] = [WorkoutSets]()
        
        if let context = context {
            let idSort: NSSortDescriptor = NSSortDescriptor(key: "id", ascending: ascending)
            let fetchRequest: NSFetchRequest<NSManagedObject> = NSFetchRequest<NSManagedObject>(entityName: modelName)
            fetchRequest.sortDescriptors = [idSort]
            
            do {
                if let fetchResult: [WorkoutSets] = try context.fetch(fetchRequest) as? [WorkoutSets] {
                    models = fetchResult
                }
            } catch let error as NSError {
                print("getUser Error: \(error)")
            }
        }
        return models
    }
    
    func saveWorkoutData(id: Int64, title: String, workoutArray: [String], onSuccess: @escaping ((Bool) -> Void)) {
        if let context = context, let entity: NSEntityDescription = NSEntityDescription.entity(forEntityName: modelName, in: context) {
            if let workoutSet: WorkoutSets = NSManagedObject(entity: entity, insertInto: context) as? WorkoutSets {
                workoutSet.id = id
                workoutSet.title = title
                workoutSet.workoutArray = workoutArray
                
                contextSave { success in
                    onSuccess(success)
                }
            }
        }
    }
    
    func deleteWorkoutData(id: Int64, onSuccess: @escaping ((Bool) -> Void)) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = filteredRequest(id: id, modelName: modelName)
        
        do {
            if let results: [WorkoutSets] = try context?.fetch(fetchRequest) as? [WorkoutSets] {
                if results.count != 0 {
                    context?.delete(results[0])
                }
            }
        } catch let error as NSError {
            print("Could not fatch: \(error), \(error.userInfo)")
            onSuccess(false)
        }
        
        contextSave { success in
            onSuccess(success)
        }
    }
    
    func getWorkoutIDData(ascending: Bool = false) -> [WorkoutID] {
        var models: [WorkoutID] = [WorkoutID]()
        
        if let context = context {
            let idSort: NSSortDescriptor = NSSortDescriptor(key: "id", ascending: ascending)
            let fetchRequest: NSFetchRequest<NSManagedObject> = NSFetchRequest<NSManagedObject>(entityName: modelName)
            fetchRequest.sortDescriptors = [idSort]
            
            do {
                if let fetchResult: [WorkoutID] = try context.fetch(fetchRequest) as? [WorkoutID] {
                    models = fetchResult
                }
            } catch let error as NSError {
                print("getUser Error: \(error)")
            }
        }
        return models
    }
    
    func saveWorkoutIDData(id: Int64, onSuccess: @escaping ((Bool) -> Void)) {
        if let context = context, let entity: NSEntityDescription = NSEntityDescription.entity(forEntityName: "WorkoutID", in: context) {
            if let workoutSet: WorkoutID = NSManagedObject(entity: entity, insertInto: context) as? WorkoutID {
                workoutSet.workoutID = id
                
                contextSave { success in
                    onSuccess(success)
                }
            }
        }
    }
    
    func deleteWorkoutIDData(id: Int64, onSuccess: @escaping ((Bool) -> Void)) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = filteredRequest(id: id, modelName: "WorkoutID")
        
        do {
            if let results: [WorkoutID] = try context?.fetch(fetchRequest) as? [WorkoutID] {
                if results.count != 0 {
                    context?.delete(results[0])
                }
            }
        } catch let error as NSError {
            print("Could not fatch: \(error), \(error.userInfo)")
            onSuccess(false)
        }
        
        contextSave { success in
            onSuccess(success)
        }
    }
}

extension CoreDataManager {
    fileprivate func filteredRequest(id: Int64, modelName: String) -> NSFetchRequest<NSFetchRequestResult> {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult>
            = NSFetchRequest<NSFetchRequestResult>(entityName: modelName)
        fetchRequest.predicate = NSPredicate(format: "id = %@", NSNumber(value: id))
        return fetchRequest
    }
    
    fileprivate func contextSave(onSuccess: ((Bool) -> Void)) {
        do {
            try context?.save()
            onSuccess(true)
        } catch let error as NSError {
            print("Could not save🥶: \(error), \(error.userInfo)")
            onSuccess(false)
        }
    }
}

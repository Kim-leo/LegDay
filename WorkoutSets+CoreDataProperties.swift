//
//  WorkoutSets+CoreDataProperties.swift
//  
//
//  Created by 김승현 on 4/17/24.
//
//

import Foundation
import CoreData


extension WorkoutSets {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WorkoutSets> {
        return NSFetchRequest<WorkoutSets>(entityName: "WorkoutSets")
    }


}

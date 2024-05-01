//
//  WorkoutSets+CoreDataProperties.swift
//  LegDay
//
//  Created by 김승현 on 4/29/24.
//
//

import Foundation
import CoreData


extension WorkoutSets {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WorkoutSets> {
        return NSFetchRequest<WorkoutSets>(entityName: "WorkoutSets")
    }

    @NSManaged public var title: String?
    @NSManaged public var id: Int64
    @NSManaged public var workoutArray: [String]?

}

extension WorkoutSets : Identifiable {

}

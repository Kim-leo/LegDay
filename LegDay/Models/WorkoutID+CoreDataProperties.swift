//
//  WorkoutID+CoreDataProperties.swift
//  LegDay
//
//  Created by 김승현 on 4/30/24.
//
//

import Foundation
import CoreData


extension WorkoutID {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WorkoutID> {
        return NSFetchRequest<WorkoutID>(entityName: "WorkoutID")
    }

    @NSManaged public var id: Int64
    @NSManaged public var workoutForCollectionViewCell: [[String]]?

}

extension WorkoutID : Identifiable {

}

//
//  StatsPeMaxCount+CoreDataProperties.swift
//  LegDay
//
//  Created by 김승현 on 4/29/24.
//
//

import Foundation
import CoreData


extension StatsPeMaxCount {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StatsPeMaxCount> {
        return NSFetchRequest<StatsPeMaxCount>(entityName: "StatsPeMaxCount")
    }

    @NSManaged public var maxCount: Int64

}

extension StatsPeMaxCount : Identifiable {

}

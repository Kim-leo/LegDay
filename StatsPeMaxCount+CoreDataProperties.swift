//
//  StatsPeMaxCount+CoreDataProperties.swift
//  
//
//  Created by 김승현 on 4/17/24.
//
//

import Foundation
import CoreData


extension StatsPeMaxCount {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StatsPeMaxCount> {
        return NSFetchRequest<StatsPeMaxCount>(entityName: "StatsPeMaxCount")
    }


}

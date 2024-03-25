//
//  WorkoutModel.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import Foundation
class WorkoutModel {
    
//    static let shared = WorkoutModel()

    var selectedWorkoutPerPokerShapeArray: [String] = ["운동 1", "운동 2", "운동 3", "운동 4"]
    var howManyTimesNum: Int = 0
    
    
    var originalWorkouts: [String] = []
}

class MyWorkout {
    static let shared = MyWorkout()
    
    var selectedWorkoutPerPokerShapeArray: [String] = ["운동 1", "운동 2", "운동 3", "운동 4"]
    
    var myWorkoutsList = [[String]]()
    var myWorkoutTitles = [String]()
    
    
}

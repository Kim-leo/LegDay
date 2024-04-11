//
//  WorkoutModel.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import Foundation
class WorkoutModel {

    var selectedWorkoutPerPokerShapeArray: [String] = ["운동 1", "운동 2", "운동 3", "운동 4"]
    var howManyTimesNum: Int = 0
    
    
    var originalWorkouts: [String] = []
}

class MyWorkout {
    static let shared = MyWorkout()
    
    var selectedWorkoutPerPokerShapeArray: [String] = ["운동 1", "운동 2", "운동 3", "운동 4"]
    
    var myWorkoutsList: [[String]] = [["스쿼트", "오른쪽 런지", "왼쪽 런지", "마운틴 클라이머"]]
    var myWorkoutTitles: [String] = ["(샘플) 하체 루틴"]
    
    var selectedWorkoutInSelectWorkoutVC = [String]()
    var selectedWorkoutTitleInSelectWorkoutVC = String()
    
    var isComeFromMyPageVC = false
    
    var setMaximumNumberOfWorkout = Int()
    
    var numberOfWorkoutsStartedArray =  Array(repeating: 0, count: 9)
    var numberOfWorkoutsFinishedArray = Array(repeating: 0, count: 9)
    var maximumOfcontinuousProgress = Array(repeating: 0, count: 9)
    var timeCountSumArray = Array(repeating: 0, count: 9)
    var averageWorkoutTimeArray = Array(repeating: "00 : 00 : 00", count: 9)

}

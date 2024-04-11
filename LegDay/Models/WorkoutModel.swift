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
    
    var typeOfWorkouts: [String] = ["전체", "상체", "하체", "맨몸", "유산소", "스트레칭"]
    
    var workoutsForCollectionViewCell: [[String]] = [
        [],
        ["이두", "삼두", "가슴근육", "복근", "딥스"],
        ["스쿼트", "오른쪽 런지", "왼쪽 런지", "마운틴 클라이머"],
        ["버피테스트", "턱걸이", "푸쉬업", "크런치", "플랭크"],
        ["러닝", "사이클"],
        ["팔 스트레칭", "다리 스트레칭", "가슴 스트레칭"],
    ]
    
    var selectedWorkoutPerPokerShapeArray: [String] = ["운동 1", "운동 2", "운동 3", "운동 4"]
    
    var myWorkoutsList: [[String]] = [["스쿼트", "오른쪽 런지", "왼쪽 런지", "마운틴 클라이머"]]
    var myWorkoutTitles: [String] = ["(샘플) 하체 루틴"]
    
    var selectedTableViewIndexPathRow = Int()
    
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

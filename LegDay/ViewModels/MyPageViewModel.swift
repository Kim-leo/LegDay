//
//  MyPageViewModel.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import Foundation
import UIKit

class MyPageViewModel {
    static let shared = MyPageViewModel()
    
    var myWorkoutModel = MyWorkout.shared
    var myWorkoutsTitles = [String]()
    var myWorkoutsList = [[String]]()
    
    func updateTableViewCell(_ view: MyPageView) {
        myWorkoutsTitles = myWorkoutModel.myWorkoutTitles
        myWorkoutsList = myWorkoutModel.myWorkoutsList
    }
    
    
}

//
//  HomeViewModel.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import Foundation
import UIKit


class HomeViewModel {
    static let shared = HomeViewModel()
    
    var myWorkoutModel = MyWorkout.shared
    
    func initializeWorkoutsInDataModel() {
        let loadedWorkoutIDData = CoreDataManager.shared.getWorkoutIDData()
        if loadedWorkoutIDData.isEmpty {
            CoreDataManager.shared.saveWorkoutIDData(id: 0, workoutForCollectionViewCell: myWorkoutModel.workoutsForCollectionViewCell) { _ in }
        } 
    }
}

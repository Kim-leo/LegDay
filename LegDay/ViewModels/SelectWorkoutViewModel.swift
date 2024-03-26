//
//  SelectWorkoutViewModel.swift
//  LegDay
//
//  Created by 김승현 on 3/25/24.
//

import Foundation
import UIKit

class SelectWorkoutViewModel {
    static let shared = SelectWorkoutViewModel()
    
    var myWorkoutModel = MyWorkout.shared
    var myWorkoutsTitles = [String]()
    var myWorkoutsList = [[String]]()
    
    func selectWorkoutAndReadyToLoadOnWorkoutVC(_ view: SelectWorkoutView, indexPath: IndexPath) {
        myWorkoutModel.selectedWorkoutInSelectWorkoutVC = myWorkoutsList[indexPath.row]
        myWorkoutModel.selectedWorkoutTitleInSelectWorkoutVC = myWorkoutsTitles[indexPath.row]
    }
    
    func updateTableViewCell(_ view: SelectWorkoutView) {
        myWorkoutsTitles = myWorkoutModel.myWorkoutTitles
        myWorkoutsList = myWorkoutModel.myWorkoutsList
    }
    
    func changeColorOfTheBtn(_ view: SelectWorkoutView) {
        view.nextBtn.isEnabled = true
        view.nextBtn.backgroundColor = (view.nextBtn.isEnabled) ? Colors().redColor : .systemGray4
    }
    
    
}

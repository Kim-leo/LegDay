//
//  MyPageEditViewModel.swift
//  LegDay
//
//  Created by 김승현 on 4/11/24.
//

import Foundation
import UIKit

class MyPageEditViewModel {
    static let shared = MyPageEditViewModel()
    
    var myWorkoutModel = MyWorkout.shared
    
    var typeOfWorkouts = [String]()
    
    var yourAllWorkoutsArray = [String]()
    
    func initialSetting(_ view: MyPageEditView) {
        typeOfWorkouts = myWorkoutModel.typeOfWorkouts
        yourAllWorkoutsArray = Array(myWorkoutModel.workoutsForCollectionViewCell.joined())
        
        view.titleTextField.text = "\(myWorkoutModel.myWorkoutTitles[myWorkoutModel.selectedTableViewIndexPathRow])"
    }
    
    func autoSaveEditedData(_ view: MyPageEditView, vc: MyPageViewController) {
        myWorkoutModel.myWorkoutTitles[myWorkoutModel.selectedTableViewIndexPathRow] = view.titleTextField.text ?? ""
        
        
//        let cell = myPageView.myWorkoutTableView.dequeueReusableCell(withIdentifier: "MyPageCell", for: [0, myWorkoutModel.selectedTableViewIndexPathRow]) as! MyPageCell
//        myPageView.myWorkoutTableView.reloadData()
//        cell.workoutTitleLabel.text = myWorkoutModel.myWorkoutTitles[myWorkoutModel.selectedTableViewIndexPathRow]
        
        print("Done")
    }
}

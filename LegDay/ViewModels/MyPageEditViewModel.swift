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
    var workoutForCategories = [[String]]()
    var yourAllWorkoutsArray = [String]()
    
    var workoutsInTableCell = [String]()
    var selectedOneWorkout = String()
    
    var loadedWorkoutSets = CoreDataManager.shared.getWorkoutData()
    
    func initialSetting(_ view: MyPageEditView) {
        view.lowerCollectinView.reloadData()
        typeOfWorkouts = myWorkoutModel.typeOfWorkouts
        workoutForCategories = CoreDataManager.shared.getWorkoutIDData().map({$0.workoutForCollectionViewCell ?? [[]]})[0]
        yourAllWorkoutsArray = Array(workoutForCategories.joined())
        
        // MARK: - 'Load' data in DataModel
//        view.titleTextField.text = "\(loadedWorkoutSets.map({$0.title ?? ""}).reversed()[myWorkoutModel.selectedTableViewIndexPathRow])"
//        workoutsInTableCell = loadedWorkoutSets.map({$0.workoutArray ?? []}).reversed()[myWorkoutModel.selectedTableViewIndexPathRow]
        
        
        view.titleTextField.text = myWorkoutModel.selectedWorkoutTitleInSelectWorkoutVC
        workoutsInTableCell = myWorkoutModel.selectedWorkoutInSelectWorkoutVC
        
    }
    
    func autoSaveEditedData(_ view: MyPageEditView) {
//        print("SelectedCoreDataWorkoutID: ", CoreDataManager.shared.getWorkoutData().map({$0.id}).reversed()[myWorkoutModel.selectedTableViewIndexPathRow])
        
        let rawTitleString = view.titleTextField.text ?? ""
        
        
        // MARK: - 'Save' edited data in DataModel
//        let selectedCoreDataWorkoutID = CoreDataManager.shared.getWorkoutData().map({$0.id}).reversed()[myWorkoutModel.selectedTableViewIndexPathRow]
//        print("here: ", selectedCoreDataWorkoutID)
        
        let indexPathRowToBeUpdated: Int = CoreDataManager.shared.getWorkoutData().count - myWorkoutModel.selectedTableViewIndexPathRow + 1
        CoreDataManager.shared.updateWorkoutData(indexPath: myWorkoutModel.selectedTableViewIndexPathRow, title: rawTitleString, workoutArray: workoutsInTableCell)
        
//        myWorkoutModel.myWorkoutTitles[myWorkoutModel.selectedTableViewIndexPathRow] = titleString
//        myWorkoutModel.myWorkoutsList[myWorkoutModel.selectedTableViewIndexPathRow] = workoutsInTableCell
        
        
        
    }
    
    func tapBackgroundView(_ view: MyPageEditView) {
        view.backgroundTransparentView.alpha = 0
        view.backgroundAlphaView.alpha = 0
        
    }
    
    func tapWorkoutCell(_ view: MyPageEditView, indexPath: IndexPath) {
        selectedOneWorkout = yourAllWorkoutsArray[indexPath.row]
        for label in view.pokerWorkoutNameLabels {
            label.text = "\(workoutsInTableCell[label.tag])"
        }
    }
    
    func tapPokerBtns(_ view: MyPageEditView, sender: UIButton) {
        view.backgroundAlphaView.alpha = 0
        view.backgroundTransparentView.alpha = 0
        workoutsInTableCell[sender.tag] = selectedOneWorkout
    }
}

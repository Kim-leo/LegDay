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
    
    
    func getSelectedTableViewIndexPathRow(indexPath: IndexPath) {
        myWorkoutModel.selectedTableViewIndexPathRow = indexPath.row
    }
    
    // MARK: - DataModel: 'Load' data in DataModel
    func updateTableViewCell(_ view: MyPageView) {
//        myWorkoutsTitles = myWorkoutModel.myWorkoutTitles
//        myWorkoutsList = myWorkoutModel.myWorkoutsList
        
        let loadedWorkoutSets = CoreDataManager.shared.getWorkoutData()
        myWorkoutsTitles = loadedWorkoutSets.map({$0.title ?? ""})
        myWorkoutsList = loadedWorkoutSets.map({$0.workoutArray ?? []})
        
    }

    // MARK: - Get Current WorkoutData and get ready to print in nextVC(MyPageEditVC)
    func saveCurrentCellData(indexPath: IndexPath) {
        myWorkoutModel.selectedWorkoutTitleInSelectWorkoutVC = CoreDataManager.shared.getWorkoutData().map({$0.title ?? ""}).reversed()[indexPath.row]
        myWorkoutModel.selectedWorkoutInSelectWorkoutVC = CoreDataManager.shared.getWorkoutData().map({$0.workoutArray ?? []}).reversed()[indexPath.row]
        
    }
    
//    func editWorkoutFromMyPageVC() {
//        myWorkoutModel.isComeFromMyPageVC = true
//    }
    
    // MARK: - 'Delete' Data in DataModel
    func deleteCellAndMyWorkoutData(_ view: MyPageView, indexPath: IndexPath) {
        let currentIndexPathRow = CoreDataManager.shared.getWorkoutData().map({$0.id}).reversed()[indexPath.row]
        CoreDataManager.shared.deleteWorkoutData(id: Int64(currentIndexPathRow)) { _ in }
        
        myWorkoutsTitles.remove(at: indexPath.row)
//        myWorkoutModel.myWorkoutTitles.remove(at: indexPath.row)
        
        myWorkoutsList.remove(at: indexPath.row)
//        myWorkoutModel.myWorkoutsList.remove(at: indexPath.row)
        view.myWorkoutTableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func showAlertViewWhenMyworkoutListIsEmpty(_ view: MyPageView) {
        view.noSavedSetsAlertLabel.alpha = (myWorkoutsList.isEmpty) ? 0.8 : 0
    }
}

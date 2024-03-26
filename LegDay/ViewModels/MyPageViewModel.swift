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
    
    func deleteCellAndMyWorkoutData(_ view: MyPageView, indexPath: IndexPath) {
        myWorkoutsTitles.remove(at: indexPath.row)
        myWorkoutModel.myWorkoutTitles.remove(at: indexPath.row)
        
        myWorkoutsList.remove(at: indexPath.row)
        myWorkoutModel.myWorkoutsList.remove(at: indexPath.row)
        view.myWorkoutTableView.deleteRows(at: [indexPath], with: .automatic)
        
        print(myWorkoutsList)
    }
    
    func editMyWorkouts() {
        print("셀 편집")
    }
    
    func goToWorkoutRightNow() {
        print("셀 운동 바로 하기")
    }
}

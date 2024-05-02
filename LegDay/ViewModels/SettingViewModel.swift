//
//  SettingViewModel.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import Foundation
import UIKit

class SettingViewModel {
    static let shared = SettingViewModel(workoutModel: WorkoutModel())
    
    var workoutModel = WorkoutModel()
    var myWorkoutModel = MyWorkout.shared
    
    var selectedWorkoutPerPokerShapeArray = ["운동 1", "운동 2", "운동 3", "운동 4"]
    var originalWorkoutArray = Array(repeating: "", count: 4)
    var typeOfWorkouts = [String]()
    var yourAllWorkoutsArray: [String] = ["+ 직접 입력"]
    
    var workoutForCategories = [[String]]()
    
    var whichWorkout = ""
    var inputWorkout = ""
        
    var isLeftBarBtnClicked = false
    
    var rowInPickerView: Int = 0
    
    var idNumber: Int64 = 0
    
    init(workoutModel: WorkoutModel) {
        self.workoutModel = WorkoutModel()
    }
    
    
    
}

extension SettingViewModel {
 
    func initialSetting(view: SettingView) {
        workoutForCategories = myWorkoutModel.workoutsForCollectionViewCell
        typeOfWorkouts = myWorkoutModel.typeOfWorkouts
        
        if yourAllWorkoutsArray.count == 1 {
            yourAllWorkoutsArray += Array(workoutForCategories.joined())
//            workoutModel.originalWorkouts = yourAllWorkoutsArray
        }
        
        
        for label in view.setPokerShapeLabel {
            label.text = "\(originalWorkoutArray[label.tag])"
        }
    }
    
    func cellAddWorkoutTap(_ view: SettingView) {
        view.backGroundTransparentView.alpha = 0.5
        view.leftBarBtnItem.isEnabled = false
        view.rightBarBtnItem.isEnabled = false
        view.categoryView.alpha = 1
        view.categoryLabel.text = "운동을 직접 추가합니다."
    }
    
    func categoryBtnTap(_ view: SettingView, sender: UIButton) {
        switch sender.tag {
        case 1:
            print("직접 입력한 운동 저장하는 코드")
            addWorkoutByYourself(view, vc: SettingViewController())
            
        default:
            view.backGroundTransparentView.alpha = 0
            view.leftBarBtnItem.isEnabled = true
            view.rightBarBtnItem.isEnabled = true
            view.categoryView.alpha = 0
            break
        }
    }
    
    func selectRowInPickerView(_ view: SettingView) {
        rowInPickerView = view.categoryPickerView.selectedRow(inComponent: 0)
        view.categoryPickerView.selectRow(rowInPickerView, inComponent: 0, animated: false)
        view.categoryTextField.text = myWorkoutModel.typeOfWorkouts[rowInPickerView]
        view.categoryTextField.resignFirstResponder()
        
        
        
    }
    
    func addWorkoutByYourself(_ view: SettingView, vc: SettingViewController) {
        inputWorkout = view.categoryNameTextField.text ?? ""

        if inputWorkout.contains("+ 직접 입력") {
            view.categoryLabel.text = "다른 이름으로 입력하세요."
        } else if inputWorkout.isEmpty {
            view.categoryLabel.text = "운동 이름을 입력해주세요."
        } else {
            view.backGroundTransparentView.alpha = 0
            view.leftBarBtnItem.isEnabled = true
            view.rightBarBtnItem.isEnabled = true
            view.categoryView.alpha = 0
            
            saveAndUpdateMyNewWorkout(view)
        }
    }
    
    func saveAndUpdateMyNewWorkout(_ view: SettingView) {        workoutForCategories[rowInPickerView].append(inputWorkout)
        myWorkoutModel.workoutsForCollectionViewCell = workoutForCategories
        
        view.lowerCollectinView.performBatchUpdates {
            view.lowerCollectinView.insertItems(at: [IndexPath(item: 1, section: 0)])
            yourAllWorkoutsArray.insert(inputWorkout, at: 1)
        }
        
        
        
    }
    
    func rightBarBtnTap(_ view: SettingView) {
        view.leftBarBtnItem.isEnabled = false
        view.rightBarBtnItem.isEnabled = false
        view.saveSetAlertView.alpha = 1
        view.backGroundTransparentView.alpha = 0.5
    }
    
    func alertBtnTapAction(_ view: SettingView, sender: UIButton) {
        switch sender.tag {
        case 0:
            view.leftBarBtnItem.isEnabled = true
            view.rightBarBtnItem.isEnabled = true
            view.saveSetAlertView.alpha = 0
            view.backGroundTransparentView.alpha = 0
        case 1:
            saveCurrentWorkoutSet(view)
        default:
            break
        }
        view.saveSetAlertTextField.text = ""
        view.endEditing(true)
    }
    
    
    
    func saveCurrentWorkoutSet(_ view: SettingView) {
        inputWorkout = view.saveSetAlertTextField.text ?? ""
        
        // MARK: - DataModel: 'Save' data in DataModel
//        myWorkoutModel.myWorkoutTitles.append(inputWorkout)
//        myWorkoutModel.myWorkoutsList.append(myWorkoutModel.selectedWorkoutPerPokerShapeArray)
        
        if CoreDataManager.shared.getWorkoutData().count == 0 {
            idNumber = 0
        } else {
            idNumber = (CoreDataManager.shared.getWorkoutData().map({$0.id}).first ?? 0) + 1 
        }
        
        CoreDataManager.shared.saveWorkoutData(id: idNumber, title: inputWorkout, workoutArray: myWorkoutModel.selectedWorkoutPerPokerShapeArray) { onSuccess in
            print("saved = \(onSuccess)")
        }
        
        
//        print(CoreDataManager.shared.getWorkoutData().map({$0.id}))
//        print(CoreDataManager.shared.getWorkoutData().map({$0.title}))
//        print(CoreDataManager.shared.getWorkoutData().map({$0.workoutArray}))
//        print(CoreDataManager.shared.getWorkoutIDData().map({$0.id}))
        
        view.saveSetAlertView.alpha = 0
        view.saveCompleteLabel.text = "세트 저장 완료!"
        view.saveCompleteImageView.image = UIImage(systemName: "checkmark.square")
        view.backGroundTransparentView.alpha = 0
        UIView.animate(withDuration: 2) {
            view.saveCompleteView.alpha = 1
            view.saveCompleteView.alpha = 0
        }
        view.leftBarBtnItem.isEnabled = true
        view.rightBarBtnItem.isEnabled = true
    }
    
    func pokerCardBtnTapped(view: SettingView, _ sender: UIButton) {
        view.leftBarBtnItem.isEnabled = true
        view.rightBarBtnItem.isEnabled = true
        view.backGroundTransparentView.alpha = 0
        view.backgroundViewForSettingPokerShapes.alpha = 0
        view.lowerCollectinView.alpha = 1
        
        selectedWorkoutPerPokerShapeArray[sender.tag] = whichWorkout
        myWorkoutModel.selectedWorkoutPerPokerShapeArray[sender.tag] = whichWorkout
        view.setPokerShapeLabel[sender.tag].text = whichWorkout
        
        guard let cell = view.lowerCollectinView.dequeueReusableCell(withReuseIdentifier: "LowerCell", for: IndexPath()) as? LowerCell else { return }
        cell.isSelected = false
        view.lowerCollectinView.reloadData()
    }
    
    func backgroundViewForSettingPokerShapeTap(_ view: SettingView) {
        view.backGroundTransparentView.alpha = 0
        view.backgroundViewForSettingPokerShapes.alpha = 0
        view.leftBarBtnItem.isEnabled = true
        view.rightBarBtnItem.isEnabled = true
    }
    
    func changeSetPokerLabelWhenComeFromMyPage(_ view: SettingView) {
        switch myWorkoutModel.isComeFromMyPageVC {
        case true:
            for label in view.setPokerShapeLabel {
                label.text = "\(myWorkoutModel.selectedWorkoutInSelectWorkoutVC[label.tag])"
            }
            
            myWorkoutModel.isComeFromMyPageVC = false
        case false:
            break
        }
    }
    
    func deleteDataRelatedToCell(_ view: SettingView, indexPath: IndexPath) {
        let dataTobeDeleted = yourAllWorkoutsArray[indexPath.row]
        let whichIndex2DArray = workoutForCategories.map { $0.contains(dataTobeDeleted) }.firstIndex(of: true) ?? 0
        let whichIndex1DArrayIn2DArray = workoutForCategories[whichIndex2DArray].map { $0.contains(dataTobeDeleted) }.firstIndex(of: true) ?? 0
        
        yourAllWorkoutsArray.remove(at: indexPath.row)
        workoutForCategories[whichIndex2DArray].remove(at: whichIndex1DArrayIn2DArray)
        
        view.lowerCollectinView.deleteItems(at: [IndexPath(item: indexPath.row, section: 0)])
        view.lowerCollectinView.reloadData()
        myWorkoutModel.workoutsForCollectionViewCell = workoutForCategories
    }
    
    func tryingToDeleteAddWorkoutByYourselfCell(_ view: SettingView) {
        view.saveCompleteLabel.text = "삭제 불가능!"
        view.saveCompleteImageView.image = UIImage(systemName: "exclamationmark.octagon")
        UIView.animate(withDuration: 2) {
            view.saveCompleteView.alpha = 1
            view.saveCompleteView.alpha = 0
            
        }
    }
    
    @objc func leftBarBtnItemTapped(_ view: SettingView) {
        switch isLeftBarBtnClicked {
        case false:
            view.rightBarBtnItem.isEnabled = false
            view.rightBarBtnItem.setTitleColor(Colors().darkBlack, for: .normal)
            
            view.leftBarBtnItem.setTitle("삭제 완료", for: .normal)
            isLeftBarBtnClicked = true
        case true:
            view.rightBarBtnItem.isEnabled = true
            view.rightBarBtnItem.setTitleColor(.white, for: .normal)
            
            view.leftBarBtnItem.setTitle("삭제", for: .normal)
            view.leftBarBtnItem.setTitleColor(Colors().softRedColor, for: .normal)
            
            view.saveCompleteLabel.text = "삭제 완료!"
            view.saveCompleteImageView.image = UIImage(systemName: "checkmark.square")
            view.backGroundTransparentView.alpha = 0
            UIView.animate(withDuration: 2) {
                view.saveCompleteView.alpha = 1
                view.saveCompleteView.alpha = 0
                
            }
            
            isLeftBarBtnClicked = false
            
        }
    }
    
    
}

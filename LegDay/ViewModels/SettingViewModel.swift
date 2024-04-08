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
    var originalWorkoutArray = ["", "", "", ""]
    var typeOfWorkouts: [String] = ["전체", "상체", "하체", "맨몸", "유산소", "스트레칭"]
    var yourAllWorkoutsArray: [String] = ["+ 직접 입력"]
    
    var workoutForCategories: [[String]] = [
        [],
        ["이두", "삼두", "가슴근육", "복근", "딥스"],
        ["스쿼트", "오른쪽 런지", "왼쪽 런지", "마운틴 클라이머"],
        ["버피테스트", "턱걸이", "푸쉬업", "크런치", "플랭크"],
        ["러닝", "사이클"],
        ["팔 스트레칭", "다리 스트레칭", "가슴 스트레칭"],
    ]
    
    var whichWorkout = ""
    var inputWorkout = ""
    
    var whoCalledAlertView = 0
    
    var isLeftBarBtnClicked = false
    
    init(workoutModel: WorkoutModel) {
        self.workoutModel = WorkoutModel()
    }
    
    
    
}

extension SettingViewModel {
 
    func initialSetting(view: SettingView) {
        if yourAllWorkoutsArray.count == 1 {
            yourAllWorkoutsArray += Array(workoutForCategories.joined())
            workoutModel.originalWorkouts = yourAllWorkoutsArray
        }
        
        for btn in view.categoryBtns {
            btn.setTitle("\(typeOfWorkouts[btn.tag])", for: .normal)
        }
        
        for label in view.setPokerShapeLabel {
            label.text = "\(originalWorkoutArray[label.tag])"
        }
        
        
    }
    
    func settingMessageForAlertMessageLabel(_ view: SettingView) {
        view.backGroundTransparentView.alpha = 0.5
        view.leftBarBtnItem.isEnabled = false
        switch whoCalledAlertView {
        case 0:
            view.alertMessageLabel.text = "운동을 직접 추가합니다."
            view.alertOkBtn.setTitle("카테고리 지정", for: .normal)
            view.alertTextField.placeholder = " 운동 이름"
        case 1:
            view.alertMessageLabel.text = "나만의 운동 세트를 만들어 보아요."
            view.alertOkBtn.setTitle("저장", for: .normal)
            view.alertTextField.placeholder = " 생략 가능"
        default:
            break
        }
    }
    
    func alertBtnTapAction(_ view: SettingView, sender: UIButton) {
        switch sender.tag {
        case 0:
            view.leftBarBtnItem.isEnabled = true
            view.rightBarBtnItem.isEnabled = true
            view.alertView.alpha = 0
            view.backGroundTransparentView.alpha = 0
        case 1:
            switch whoCalledAlertView {
            case 0:
                addWorkoutByYourself(view, vc: SettingViewController())
            case 1:
                saveCurrentWorkoutSet(view)
            default:
                break
            }
        default:
            break
        }
        view.alertTextField.text = ""
        view.endEditing(true)
    }
    
    func addWorkoutByYourself(_ view: SettingView, vc: SettingViewController) {
        inputWorkout = view.alertTextField.text ?? ""
        if inputWorkout.contains("+ 직접 입력") {
            view.alertMessageLabel.text = "다른 이름으로 입력하세요."
        } else if inputWorkout.isEmpty {
            view.alertMessageLabel.text = "운동 이름을 입력해주세요."
        } else {
            view.alertView.alpha = 0
            view.stackViewVertical.alpha = 1
        }
    }
    
    func saveCurrentWorkoutSet(_ view: SettingView) {
        inputWorkout = view.alertTextField.text ?? ""
        myWorkoutModel.myWorkoutTitles.append(inputWorkout)
        myWorkoutModel.myWorkoutsList.append(myWorkoutModel.selectedWorkoutPerPokerShapeArray)
        view.alertView.alpha = 0
        view.saveCompleteLabel.text = "세트 저장 완료!"
        view.saveCompleteImageView.image = UIImage(systemName: "checkmark.square")
        view.backGroundTransparentView.alpha = 0
        UIView.animate(withDuration: 2) {
            view.saveCompleteView.alpha = 1
            view.saveCompleteView.alpha = 0
        }
        view.leftBarBtnItem.isEnabled = true
        
    }
    
    func categoryBtnTapped(view: SettingView) {
        view.leftBarBtnItem.isEnabled = true
        view.rightBarBtnItem.isEnabled = true
        view.stackViewVertical.alpha = 0
        view.backGroundTransparentView.alpha = 0
        
        view.lowerCollectinView.performBatchUpdates {
            view.lowerCollectinView.insertItems(at: [IndexPath(item: 1, section: 0)])
            yourAllWorkoutsArray.insert(inputWorkout, at: 1)
        }
        workoutModel.originalWorkouts.append(inputWorkout)
    }
    
    func cancelBtnTapped(view: SettingView) {
        inputWorkout = ""
        view.leftBarBtnItem.isEnabled = true
        view.rightBarBtnItem.isEnabled = true
        view.stackViewVertical.alpha = 0
        view.backGroundTransparentView.alpha = 0
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

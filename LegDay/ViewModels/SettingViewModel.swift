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
        
        view.categoryBtns.map {
            $0.setTitle("\(typeOfWorkouts[$0.tag])", for: .normal)
        }
        
        view.setPokerShapeLabel.map {
            $0.text = "\(originalWorkoutArray[$0.tag])"
        }
        
    }
    
    func settingMessageForAlertMessageLabel(_ view: SettingView) {
        view.lowerCollectinView.alpha = 0.5
        view.upperCollectinView.alpha = 0.5
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
            view.alertView.alpha = 0
            view.lowerCollectinView.alpha = 1
            view.upperCollectinView.alpha = 1
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
            vc.view.bringSubviewToFront(view.stackViewVertical)
            
        }
    }
    
    func saveCurrentWorkoutSet(_ view: SettingView) {
        inputWorkout = view.alertTextField.text ?? ""
        myWorkoutModel.myWorkoutTitles.append(inputWorkout)
        myWorkoutModel.myWorkoutsList.append(myWorkoutModel.selectedWorkoutPerPokerShapeArray)
        
        
        
        view.alertView.alpha = 0
        view.lowerCollectinView.alpha = 1
        view.upperCollectinView.alpha = 1
    }
    
    func categoryBtnTapped(view: SettingView) {
        view.stackViewVertical.alpha = 0
        view.lowerCollectinView.alpha = 1
        view.upperCollectinView.alpha = 1

        view.lowerCollectinView.performBatchUpdates {
            view.lowerCollectinView.insertItems(at: [IndexPath(item: 1, section: 0)])
            yourAllWorkoutsArray.insert(inputWorkout, at: 1)
        } completion: { [weak self] _ in
        }
        workoutModel.originalWorkouts.append(inputWorkout)
        print(workoutModel.originalWorkouts)
    }
    
    func cancelBtnTapped(view: SettingView) {
        inputWorkout = ""
        view.stackViewVertical.alpha = 0
        view.lowerCollectinView.alpha = 1
        view.upperCollectinView.alpha = 1
    }
    
    func pokerCardBtnTapped(view: SettingView, _ sender: UIButton) {
        view.verticalStackViewForSettingPokerShapes.alpha = 0
        view.lowerCollectinView.alpha = 1
        
        selectedWorkoutPerPokerShapeArray[sender.tag] = whichWorkout
        myWorkoutModel.selectedWorkoutPerPokerShapeArray[sender.tag] = whichWorkout
        view.setPokerShapeLabel[sender.tag].text = whichWorkout
        
        guard let cell = view.lowerCollectinView.dequeueReusableCell(withReuseIdentifier: "LowerCell", for: IndexPath()) as? LowerCell else { return }
        cell.isSelected = false
        view.lowerCollectinView.reloadData()
    }
    
    func changeSetPokerLabelWhenComeFromMyPage(_ view: SettingView) {
        switch myWorkoutModel.isComeFromMyPageVC {
        case true:
            view.setPokerShapeLabel.map {
                $0.text = "\(myWorkoutModel.selectedWorkoutInSelectWorkoutVC[$0.tag])"
            }
            myWorkoutModel.isComeFromMyPageVC = false
        case false:
            break
        }
    }
}

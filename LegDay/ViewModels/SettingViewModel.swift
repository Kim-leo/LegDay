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
    
    func addWorkoutByYourself(view: SettingView, vc: SettingViewController) {
        let alert = UIAlertController(title: "추가하기", message: "수행하고 싶은 운동을 직접 추가합니다.", preferredStyle: .alert)
        alert.addTextField{ (myTextField) in
            myTextField.placeholder = "입력하기"
            myTextField.autocorrectionType = .no
            myTextField.spellCheckingType = .no
        }
        let okAction = UIAlertAction(title: "카테고리 지정", style: .default) { [self] (ok) in
            inputWorkout = alert.textFields?[0].text ?? ""
            view.lowerCollectinView.alpha = 0.5
            view.stackViewVertical.alpha = 1
            vc.view.bringSubviewToFront(view.stackViewVertical)
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel) { (cancel) in }
        alert.addAction(okAction)
        alert.addAction(cancel)
        vc.present(alert, animated: true, completion: nil)
    }
    
    func categoryBtnTapped(view: SettingView) {
        view.stackViewVertical.alpha = 0
        view.lowerCollectinView.alpha = 1
        
//        viewFile.lowerCollectinView.reloadData()
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
    
    func rightBarBtnTap(_ vc: SettingViewController) {
        // 추후 커스텀 디자인 예정
        let alert = UIAlertController(title: "이름 설정", message: "나만의 운동 세트에 이름을 만들어봐요!", preferredStyle: .alert)
        alert.addTextField{ (myTextField) in
            myTextField.placeholder = "생략 가능"
            myTextField.autocorrectionType = .no
            myTextField.spellCheckingType = .no
        }
        let saveAction = UIAlertAction(title: "저장", style: .default) { [self] (ok) in
            myWorkoutModel.myWorkoutTitles.append(alert.textFields?[0].text ?? "")
            myWorkoutModel.myWorkoutsList.append(myWorkoutModel.selectedWorkoutPerPokerShapeArray)
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel) { (cancel) in }
        alert.addAction(saveAction)
        alert.addAction(cancel)
        vc.present(alert, animated: true, completion: nil)
        
        
        
        
    }
    
   
}

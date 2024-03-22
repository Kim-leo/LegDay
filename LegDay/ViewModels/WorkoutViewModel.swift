//
//  WorkoutViewModel.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import Foundation
import UIKit

class WorkoutViewModel {
    let cardModel: CardModel
//    var workoutModel: WorkoutModel
    
    var workoutModel = WorkoutModel()
    
    var myWorkoutModel = MyWorkout.shared
    
    var cardSet = CardModel().cardSet
    var emptyArray = [String]()
    var pickedCard: String = ""
    
    init(cardModel: CardModel, workoutModel: WorkoutModel) {
        self.cardModel = CardModel()
        self.workoutModel = WorkoutModel()
    }
}

extension WorkoutViewModel {
    func componentsInitialSetting(_ view: WorkoutView) {
        view.cardNameLabel.text = "운동 시작 클릭!"
        view.workoutLabels[0].text = "화이팅"
        view.workoutLabels[0].textColor = .black
        view.nextBtn.setTitle("시작", for: .normal)
        view.nextBtn.backgroundColor = .systemBlue
        view.cardCountLabel.text = ""
    }
    
    func changeCardNameLabelTextColor(_ view: WorkoutView) {
        if pickedCard.hasPrefix("Heart") || pickedCard.hasPrefix("Diamond") {
            view.cardNameLabel.textColor = .systemRed
        } else {
            view.cardNameLabel.textColor = .black
        }
    }
    
    func numberOfWorkoutsToPerform(_ view: WorkoutView) {
        switch pickedCard.lastString {
        case "0":
            workoutModel.howManyTimesNum = 10
        case "J":
            workoutModel.howManyTimesNum = 11
        case "Q":
            workoutModel.howManyTimesNum = 12
        case "K":
            workoutModel.howManyTimesNum = 13
        default:
            workoutModel.howManyTimesNum = Int(pickedCard.lastString) ?? 0
            break
        }
        
        view.workoutLabels[1].text = "\(workoutModel.howManyTimesNum) times"
    }
    
    func distinguishTheShapeOfTheCard(_ view: WorkoutView) {
        let startIndex = pickedCard.index(pickedCard.startIndex, offsetBy: 0)
        let endIndex = pickedCard.index(pickedCard.startIndex, offsetBy: 1)
        let pickedCardShape = String(pickedCard[startIndex..<endIndex])
        
        view.workoutLabels[0].text = "\(myWorkoutModel.selectedWorkoutPerPokerShapeArray[cardModel.pokserShape.firstIndex(of: pickedCardShape) ?? 0])"
    }
    
    func changeCardInfoUIText(_ view: WorkoutView) {
        view.cardNameLabel.text = pickedCard
        view.cardImageView.image = UIImage(named: pickedCard)
        view.cardCountLabel.text = "\(emptyArray.count) / 52"
    }
    
    func startWorkout(_ view: WorkoutView) {
        view.nextBtn.setTitle("다음", for: .normal)
        
        pickedCard = cardSet.randomElement() ?? ""
        cardSet.remove(pickedCard)
        emptyArray.append(pickedCard)
    
        changeCardNameLabelTextColor(view)
        numberOfWorkoutsToPerform(view)
        distinguishTheShapeOfTheCard(view)
        changeCardInfoUIText(view)
        
        if emptyArray.count == 52 {
            view.nextBtn.setTitle("마치기", for: .normal)
            view.nextBtn.backgroundColor = .black
        }
    }
    
    func endOfWorkout(_ view: WorkoutView) {
        view.cardImageView.image = UIImage(named: "Joker")
        view.cardNameLabel.text = "운동 끝!"
        view.cardNameLabel.textColor = .systemBlue
        view.workoutLabels[0].text = "축하해요~"
        view.workoutLabels[0].textColor = .systemGreen
        view.workoutLabels[1].text = ""
        view.cardCountLabel.text = ""
        view.nextBtn.setTitle("한 번 더 하기", for: .normal)
        view.nextBtn.backgroundColor = .black
        
        emptyArray.removeAll()
        cardSet = CardModel().cardSet
    }
    
    func nextBtnTapped(_ view: WorkoutView) {
        switch view.nextBtn.currentTitle ?? "" {
        case "마치기":
            endOfWorkout(view)
        case "한 번 더 하기":
            componentsInitialSetting(view)
        default:
            startWorkout(view)
        }
    }
}

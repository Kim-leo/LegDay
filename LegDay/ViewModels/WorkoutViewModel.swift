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
        view.cardNameLabel.text = "Let's go."
        view.workoutLabel.text = "화이팅"
        view.workoutLabel.textColor = .white
        view.nextBtn.setTitle("시작", for: .normal)
        view.nextBtn.setTitleColor(.white, for: .normal)
        view.nextBtn.backgroundColor = Colors().redColor
        view.cardCountLabel.text = ""
    }
    
    func changeCardNameLabelTextColor(_ view: WorkoutView) {
        if pickedCard.hasPrefix("Heart") || pickedCard.hasPrefix("Diamond") {
            view.cardNameLabel.textColor = .systemRed
        } else {
            view.cardNameLabel.textColor = .white
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
        
        view.numberOfWorkoutLabel.text = "\(workoutModel.howManyTimesNum) times"
        
        let fontSize = UIFont.boldSystemFont(ofSize: 18)
        let attributedString = NSMutableAttributedString(string: view.numberOfWorkoutLabel.text ?? "")
        
        attributedString.addAttribute(.font, value: fontSize, range: (view.numberOfWorkoutLabel.text! as NSString).range(of: "times"))
        view.numberOfWorkoutLabel.attributedText = attributedString
    }
    
    func distinguishTheShapeOfTheCard(_ view: WorkoutView) {
        let startIndex = pickedCard.index(pickedCard.startIndex, offsetBy: 0)
        let endIndex = pickedCard.index(pickedCard.startIndex, offsetBy: 1)
        let pickedCardShape = String(pickedCard[startIndex..<endIndex])
        
        view.workoutLabel.text = "\(myWorkoutModel.selectedWorkoutInSelectWorkoutVC[cardModel.pokserShape.firstIndex(of: pickedCardShape) ?? 0])"
        
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
            view.nextBtn.backgroundColor = .white
            view.nextBtn.setTitleColor(Colors().darkBlack, for: .normal)
        }
    }
    
    func endOfWorkout(_ view: WorkoutView) {
        view.cardImageView.image = UIImage(named: "Joker")
        view.cardNameLabel.text = "운동 끝"
        view.cardNameLabel.textColor = .white
        view.workoutLabel.text = "Impressive!"
        view.workoutLabel.textColor = .systemOrange
        view.numberOfWorkoutLabel.text = ""
        view.cardCountLabel.text = ""
        view.nextBtn.setTitle("한 번 더 하기", for: .normal)
        view.nextBtn.setTitleColor(Colors().darkBlack, for: .normal)
        view.nextBtn.backgroundColor = .systemOrange
        
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

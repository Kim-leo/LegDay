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
    
    var workoutModel = WorkoutModel()
    
    var myWorkoutModel = MyWorkout.shared
    
//    var cardSet = CardModel().cardSet
    var cardArrayPerShape = CardModel().cardsArrayPerShape
    var cardSetWithMaximumNumber = [String]()
    var totalCardNumber = Int()
    
    var emptyArray = [String]()
    var pickedCard: String = ""
    
    let emitter = CAEmitterLayer()
    
    var countContinuousNumberOfWorkoutSet: Int = 0
    
    init(cardModel: CardModel, workoutModel: WorkoutModel) {
        self.cardModel = CardModel()
        self.workoutModel = WorkoutModel()
    }
}

extension WorkoutViewModel {
    func settingMaxNumberOfWorkout() {
        for i in 0..<myWorkoutModel.setMaximumNumberOfWorkout {
            for j in 0...3 {
                cardSetWithMaximumNumber.append(cardArrayPerShape[j][i])
            }
        }
        print(cardSetWithMaximumNumber)
        totalCardNumber = cardSetWithMaximumNumber.count
    }
    
    
    
    func componentsInitialSetting(_ view: WorkoutView) {
        settingMaxNumberOfWorkout()
        
        view.cardNameLabel.text = "Let's go."
        view.workoutLabel.text = (myWorkoutModel.selectedWorkoutTitleInSelectWorkoutVC.isEmpty) ? "운동을 시작합니다!" : "\(myWorkoutModel.selectedWorkoutTitleInSelectWorkoutVC)"
        view.workoutLabel.textColor = .white
        view.nextBtn.setTitle("시작", for: .normal)
        view.nextBtn.setTitleColor(.white, for: .normal)
        view.nextBtn.backgroundColor = Colors().redColor
        view.cardCountLabel.text = ""
        view.cardImageView.image = UIImage(named: "Start")
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
        view.cardCountLabel.text = "\(emptyArray.count) / \(totalCardNumber)"
    }
    
    func startWorkout(_ view: WorkoutView) {
        view.nextBtn.setTitle("다음", for: .normal)
        
        pickedCard = cardSetWithMaximumNumber.randomElement() ?? ""
        let indexOfPickedCard = Int(cardSetWithMaximumNumber.firstIndex(of: pickedCard) ?? 0)
        cardSetWithMaximumNumber.remove(at: indexOfPickedCard)

        
        emptyArray.append(pickedCard)
    
        changeCardNameLabelTextColor(view)
        numberOfWorkoutsToPerform(view)
        distinguishTheShapeOfTheCard(view)
        changeCardInfoUIText(view)
        
        if emptyArray.count == totalCardNumber {
            view.nextBtn.setTitle("마치기", for: .normal)
            view.nextBtn.backgroundColor = .white
            view.nextBtn.setTitleColor(Colors().darkBlack, for: .normal)
        }
    }
    
    func endOfWorkout(_ view: WorkoutView) {
        view.confettiAnimationForWorkoutVC(view, emitter: emitter)
        
        view.cardImageView.image = UIImage(named: "Complete")
        view.cardNameLabel.text = "운동 끝"
        view.cardNameLabel.textColor = .white
        view.workoutLabel.text = "Impressive!"
        view.workoutLabel.textColor = .systemOrange
        view.numberOfWorkoutLabel.text = ""
        view.cardCountLabel.text = ""
        view.finishBtnStackView.alpha = 1
        view.nextBtn.alpha = 0
        emptyArray.removeAll()

        cardSetWithMaximumNumber.removeAll()
    }
    
    func nextBtnTapped(_ view: WorkoutView) {
        switch view.nextBtn.currentTitle ?? "" {
        case "마치기":
            endOfWorkout(view)
            myWorkoutModel.numberOfWorkoutsFinishedArray[myWorkoutModel.setMaximumNumberOfWorkout - 5] += 1
            countContinuousNumberOfWorkoutSet += 1
            countMaximumOfcontinuousProgress()
        case "시작":
            myWorkoutModel.numberOfWorkoutsStartedArray[myWorkoutModel.setMaximumNumberOfWorkout - 5] += 1
            fallthrough
        default:
            startWorkout(view)
        }
    }
    
    func finishBtnTapped(_ view: WorkoutView, vc: WorkoutViewController, sender: UIButton) {
        view.finishBtnStackView.alpha = 0
        view.nextBtn.alpha = 1
        switch sender.tag {
        case 0:
            vc.navigationController?.popToRootViewController(animated: true)
        case 1:
            emitter.removeFromSuperlayer()
            componentsInitialSetting(view)
        default:
            break
        }
    }
    
    func countMaximumOfcontinuousProgress() {
        myWorkoutModel.maximumOfcontinuousProgress[myWorkoutModel.setMaximumNumberOfWorkout - 5] = (countContinuousNumberOfWorkoutSet >= myWorkoutModel.maximumOfcontinuousProgress[myWorkoutModel.setMaximumNumberOfWorkout - 5]) ? countContinuousNumberOfWorkoutSet : myWorkoutModel.maximumOfcontinuousProgress[myWorkoutModel.setMaximumNumberOfWorkout - 5]
    }
    
    func tryingToLeaveDuringWorkout(_ view: WorkoutView) {
        view.backgroundAlphaView.alpha = 0.5
        view.alertBackgroundTransparentView.alpha = 1
    }
    
    
    func alertBtnsTap(_ view: WorkoutView, vc: WorkoutViewController, sender: UIButton) {
        switch sender.tag {
        case 1:
            view.backgroundAlphaView.alpha = 0
            view.alertBackgroundTransparentView.alpha = 0
            vc.navigationController?.popViewController(animated: true)
        default:
            view.backgroundAlphaView.alpha = 0
            view.alertBackgroundTransparentView.alpha = 0
            break
        }
        
        
    }
    
    
}

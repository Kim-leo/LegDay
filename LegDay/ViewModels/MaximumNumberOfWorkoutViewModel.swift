//
//  MaximumNumberOfWorkoutViewModel.swift
//  LegDay
//
//  Created by 김승현 on 4/3/24.
//

import Foundation
import UIKit

class MaximumNumberOfWorkoutViewModel {
    static let shared = MaximumNumberOfWorkoutViewModel()
    
    var myWorkoutModel = MyWorkout.shared
    
    var myMaximumNumber = Int()
    var maximumNumberOfWorkout = Array(5...13)
    let cardStringArray = ["5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    
    let images = [["Spade 5", "Spade 6", "Spade 7", "Spade 8", "Spade 9", "Spade 10", "Spade J", "Spade Q", "Spade K"],
                  ["Heart 5", "Heart 6", "Heart 7", "Heart 8", "Heart 9", "Heart 10", "Heart J", "Heart Q", "Heart K"],
                  ["Clover 5", "Clover 6", "Clover 7", "Clover 8", "Clover 9", "Clover 10", "Clover J", "Clover Q", "Clover K"],
                  ["Diamond 5", "Diamond 6", "Diamond 7", "Diamond 8", "Diamond 9", "Diamond 10", "Diamond J", "Diamond Q", "Diamond K"]
                  ]
    var maxNumberPerCards = Int()
    var totalNumberPerCards = Int()
    
    func setMaximumNumberOfWorkout(row: Int) {
        myMaximumNumber = maximumNumberOfWorkout[row]
        
    }
    
    func showMaxNumberOnLabel(view: MaximumNumberOfWorkoutView, row: Int) {
        maxNumberPerCards = Array(1...(row + 5)).reduce(0, +)
        view.maxNumLabel.text = "\(maxNumberPerCards)" + " 회"
        
        totalNumberPerCards = maxNumberPerCards * 4
        view.totalNumberLabel.text = "\(totalNumberPerCards)" + " 회"
        
        view.detailDescriptionLabel.text = "하나의 운동별로 표시될 카드는 A 부터 \(cardStringArray[row]) 입니다"
        
        changeTextColorOfNumberLabels(view: view)
        
    }
    
    func changeTextColorOfNumberLabels(view: MaximumNumberOfWorkoutView) {
        let fontSize = UIFont.boldSystemFont(ofSize: 30)
        let attributedString = NSMutableAttributedString(string: view.maxNumLabel.text ?? "")
        attributedString.addAttribute(.font, value: fontSize, range: (view.maxNumLabel.text! as NSString).range(of: "\(maxNumberPerCards)"))
        attributedString.addAttribute(.foregroundColor, value: Colors().redColor, range: (view.maxNumLabel.text! as NSString).range(of: "\(maxNumberPerCards)"))
        view.maxNumLabel.attributedText = attributedString
        
        let attributedString2 = NSMutableAttributedString(string: view.totalNumberLabel.text ?? "")
        attributedString2.addAttribute(.font, value: fontSize, range: (view.totalNumberLabel.text! as NSString).range(of: "\(totalNumberPerCards)"))
        attributedString2.addAttribute(.foregroundColor, value: Colors().redColor, range: (view.totalNumberLabel.text! as NSString).range(of: "\(totalNumberPerCards)"))
        view.totalNumberLabel.attributedText = attributedString2
    }
    
    func changeColorOfTheBtn(_ view: MaximumNumberOfWorkoutView) {
        view.nextBtn.isEnabled = true
        view.nextBtn.backgroundColor = (view.nextBtn.isEnabled) ? Colors().redColor : .systemGray4
    }
    
    func readyToLoadOnWorkoutVC() {
        myWorkoutModel.setMaximumNumberOfWorkout = myMaximumNumber
    }
}

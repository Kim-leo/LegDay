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
    
    
    
    func changeColorOfTheBtn(_ view: MaximumNumberOfWorkoutView) {
        view.nextBtn.isEnabled = true
        view.nextBtn.backgroundColor = (view.nextBtn.isEnabled) ? Colors().redColor : .systemGray4
    }
}

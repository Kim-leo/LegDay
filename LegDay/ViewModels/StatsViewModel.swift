//
//  StatsViewModel.swift
//  LegDay
//
//  Created by 김승현 on 4/4/24.
//

import Foundation
import UIKit

class StatsViewModel {
    static let shared = StatsViewModel()
    
    let maxNumbersArray = ["5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    
    func eachStatsBtnTapped(_ view: StatsView, sender: UIButton) {
        for btn in view.eachStatsBtns {
            btn.setTitleColor(.white, for: .normal)
        }
        sender.setTitleColor(Colors().redColor, for: .normal)
        
        view.eachStatsCollectionView.scrollToItem(at: [0, sender.tag], at: .left, animated: false)
    }
}

//
//  SettingView.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import Foundation
import UIKit

class SettingView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.addSubview(startWorkoutBtn)
        self.backgroundColor = .white
        viewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("뷰 초기화 에러 발생")
    }
    
    func viewLayout() {
        
    }
}

//
//  StatsView.swift
//  LegDay
//
//  Created by 김승현 on 4/4/24.
//

import Foundation
import UIKit

class StatsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors().darkBlack
        
        
       
        
        
        viewLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("뷰 초기화 에러 발생!")
    }
    
    func viewLayout() {
        
    }
}

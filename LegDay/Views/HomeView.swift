//
//  HomeView.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    lazy var startWorkoutBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .black
        btn.setTitle("운동 시작", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        return btn
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(startWorkoutBtn)
        self.backgroundColor = .white
        viewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("뷰 초기화 에러 발생")
    }
    
    func viewLayout() {
        startWorkoutBtn.translatesAutoresizingMaskIntoConstraints = false
        startWorkoutBtn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4).isActive = true
        startWorkoutBtn.heightAnchor.constraint(equalTo: startWorkoutBtn.widthAnchor, multiplier: 0.68).isActive = true
        startWorkoutBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        startWorkoutBtn.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}

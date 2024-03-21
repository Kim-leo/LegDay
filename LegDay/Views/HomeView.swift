//
//  HomeView.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    lazy var legDayLabel: UILabel = {
        let label = UILabel()
        label.text = "Leg Day"
        label.textAlignment = .center
        label.font = UIFont(name: "Menlo", size: 60)
        label.textColor = .black
        return label
    }()
    
    lazy var startWorkoutBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .black
        btn.setTitle("운동 시작", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        btn.layer.cornerRadius = 20
        btn.clipsToBounds = true
        btn.isUserInteractionEnabled = true
        return btn
    }()
    
    lazy var descriptionBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
        btn.tintColor = .darkGray
        return btn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(legDayLabel)
        self.addSubview(startWorkoutBtn)
        self.addSubview(descriptionBtn)
        self.backgroundColor = .white
        viewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("뷰 초기화 에러 발생")
    }
    
    func viewLayout() {
        descriptionBtn.translatesAutoresizingMaskIntoConstraints = false
        descriptionBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        descriptionBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        descriptionBtn.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        descriptionBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
        legDayLabel.translatesAutoresizingMaskIntoConstraints = false
        legDayLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        legDayLabel.heightAnchor.constraint(equalTo: legDayLabel.widthAnchor, multiplier: 0.68).isActive = true
        legDayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        legDayLabel.topAnchor.constraint(equalTo: descriptionBtn.bottomAnchor, constant: 20).isActive = true
        
        startWorkoutBtn.translatesAutoresizingMaskIntoConstraints = false
        startWorkoutBtn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4).isActive = true
        startWorkoutBtn.heightAnchor.constraint(equalTo: startWorkoutBtn.widthAnchor, multiplier: 0.68).isActive = true
        startWorkoutBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        startWorkoutBtn.topAnchor.constraint(equalTo: legDayLabel.bottomAnchor, constant: 100).isActive = true
    }
}

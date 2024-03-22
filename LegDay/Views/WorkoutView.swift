//
//  WorkoutView.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import Foundation
import UIKit

class WorkoutView: UIView {
    lazy var cardImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Joker")
        return iv
    }()
    
    lazy var cardCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    lazy var cardNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    lazy var workoutLabelStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.backgroundColor = .clear
        return sv
    }()
    
    lazy var workoutLabels: [UILabel] = {
        var labels = [UILabel]()
        for i in 0...1 {
            let label = UILabel()
            label.tag = i
            label.textAlignment = .center
            label.textColor = .white
            label.font = UIFont.boldSystemFont(ofSize: 30)
            labels.append(label)
        }
        return labels
    }()
    
    lazy var nextBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("다음", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        btn.backgroundColor = Colors().redColor
        btn.layer.cornerRadius = 20
        btn.clipsToBounds = true
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors().darkBlack
        self.addSubview(cardImageView)
        self.addSubview(cardCountLabel)
        self.addSubview(cardNameLabel)
        self.addSubview(workoutLabelStackView)
        self.addSubview(nextBtn)
        workoutLabels.map { workoutLabelStackView.addArrangedSubview($0) }
        viewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("뷰 초기화 에러 발생")
    }
    
    func viewLayout() {
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        cardImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100).isActive = true
        cardImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100).isActive = true
        cardImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        cardCountLabel.translatesAutoresizingMaskIntoConstraints = false
        cardCountLabel.leadingAnchor.constraint(equalTo: cardImageView.trailingAnchor, constant: 10).isActive = true
        cardCountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        cardCountLabel.bottomAnchor.constraint(equalTo: cardImageView.bottomAnchor).isActive = true
        cardCountLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        cardNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cardNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cardNameLabel.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 10).isActive = true
        cardNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50).isActive = true
        cardNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50).isActive = true
        cardNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        workoutLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        workoutLabelStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        workoutLabelStackView.topAnchor.constraint(equalTo: cardNameLabel.bottomAnchor, constant: 10).isActive = true
        workoutLabelStackView.leadingAnchor.constraint(equalTo: cardNameLabel.leadingAnchor).isActive = true
        workoutLabelStackView.trailingAnchor.constraint(equalTo: cardNameLabel.trailingAnchor).isActive = true
        workoutLabelStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nextBtn.topAnchor.constraint(equalTo: workoutLabelStackView.bottomAnchor, constant: 50).isActive = true
        nextBtn.widthAnchor.constraint(equalTo: cardImageView.widthAnchor).isActive = true
        nextBtn.heightAnchor.constraint(equalTo: nextBtn.widthAnchor, multiplier: 0.4).isActive = true
    }
}

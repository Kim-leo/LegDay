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
//        iv.backgroundColor = .systemGreen
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
        sv.spacing = 20
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
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.3
            labels.append(label)
        }
        return labels
    }()
    
    lazy var workoutLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.3
        return label
    }()
    
    lazy var numberOfWorkoutLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.3
        return label
    }()
    
    lazy var nextBtnView: UIView = {
        let iv = UIView()
//        iv.backgroundColor = .systemGreen
        return iv
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
//        self.addSubview(workoutLabelStackView)
        self.addSubview(workoutLabel)
        self.addSubview(numberOfWorkoutLabel)
        self.addSubview(nextBtnView)
        nextBtnView.addSubview(nextBtn)
//        workoutLabels.map { workoutLabelStackView.addArrangedSubview($0) }
        viewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("뷰 초기화 에러 발생")
    }
    
    func viewLayout() {
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        cardImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cardImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        cardImageView.heightAnchor.constraint(equalTo: cardImageView.widthAnchor, multiplier: 1.6).isActive = true
        
        cardCountLabel.translatesAutoresizingMaskIntoConstraints = false
        cardCountLabel.leadingAnchor.constraint(equalTo: cardImageView.trailingAnchor, constant: 10).isActive = true
        cardCountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        cardCountLabel.bottomAnchor.constraint(equalTo: cardImageView.bottomAnchor).isActive = true
        cardCountLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        cardNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cardNameLabel.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 10).isActive = true
        cardNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        cardNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        cardNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        workoutLabel.translatesAutoresizingMaskIntoConstraints = false
        workoutLabel.topAnchor.constraint(equalTo: cardNameLabel.bottomAnchor, constant: 10).isActive = true
        workoutLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        workoutLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        workoutLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        numberOfWorkoutLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfWorkoutLabel.topAnchor.constraint(equalTo: workoutLabel.bottomAnchor, constant: 10).isActive = true
        numberOfWorkoutLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        numberOfWorkoutLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        numberOfWorkoutLabel.heightAnchor.constraint(equalTo: workoutLabel.heightAnchor).isActive = true
        
        nextBtnView.translatesAutoresizingMaskIntoConstraints = false
        nextBtnView.topAnchor.constraint(equalTo: numberOfWorkoutLabel.bottomAnchor).isActive = true
        nextBtnView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        nextBtnView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        nextBtnView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        nextBtn.heightAnchor.constraint(equalTo: nextBtn.widthAnchor, multiplier: 0.4).isActive = true
        nextBtn.centerXAnchor.constraint(equalTo: nextBtnView.centerXAnchor).isActive = true
        nextBtn.centerYAnchor.constraint(equalTo: nextBtnView.centerYAnchor).isActive = true
        
    }
}

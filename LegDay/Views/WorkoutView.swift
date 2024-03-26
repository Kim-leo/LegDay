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
        label.numberOfLines = 0
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
        self.addSubview(nextBtn)
//        workoutLabels.map { workoutLabelStackView.addArrangedSubview($0) }
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
        
        workoutLabel.translatesAutoresizingMaskIntoConstraints = false
        workoutLabel.topAnchor.constraint(equalTo: cardNameLabel.bottomAnchor, constant: 10).isActive = true
        workoutLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        workoutLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        workoutLabel.heightAnchor.constraint(equalTo: workoutLabel.widthAnchor, multiplier: 0.2).isActive = true
        
        numberOfWorkoutLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfWorkoutLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        numberOfWorkoutLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        numberOfWorkoutLabel.topAnchor.constraint(equalTo: workoutLabel.bottomAnchor, constant: -10).isActive = true
        numberOfWorkoutLabel.heightAnchor.constraint(equalTo: workoutLabel.heightAnchor).isActive = true
        
        
//        workoutLabelStackView.translatesAutoresizingMaskIntoConstraints = false
//        workoutLabelStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        workoutLabelStackView.topAnchor.constraint(equalTo: cardNameLabel.bottomAnchor, constant: 10).isActive = true
//        workoutLabelStackView.leadingAnchor.constraint(equalTo: cardNameLabel.leadingAnchor).isActive = true
//        workoutLabelStackView.trailingAnchor.constraint(equalTo: cardNameLabel.trailingAnchor).isActive = true
//        workoutLabelStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nextBtn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        nextBtn.heightAnchor.constraint(equalTo: nextBtn.widthAnchor, multiplier: 0.4).isActive = true
        nextBtn.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
    }
}

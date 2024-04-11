//
//  WorkoutView.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import Foundation
import UIKit

class WorkoutView: UIView {
    lazy var backgroundGradientView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var leftBarBtnItem: UIButton = {
        let btn = UIButton()
        btn.setTitle("돌아가기", for: .normal)
        btn.setTitleColor(.lightGray, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.frame = CGRect(x: 0, y: 0, width: 80, height: 30)
        return btn
    }()
    
    lazy var timerNavigationBarLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.text = "00 : 00 : 00"
        label.font = UIFont.systemFont(ofSize: 20)
        label.frame = CGRect(x: 0, y: 0, width: 120, height: 30)
        return label
    }()
    
    lazy var cardImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Start")
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
    
    lazy var finishBtnStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 20
        sv.distribution = .fillEqually
        sv.backgroundColor = .clear
        return sv
    }()
    
    lazy var doneAndLeaveBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("종료하기", for: .normal)
        btn.setTitleColor(Colors().darkBlack, for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 15
        btn.clipsToBounds = true
        btn.tag = 0
        return btn
    }()
    
    lazy var oneMoreTimeBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("한 번 더 하기", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = Colors().redColor
        btn.layer.cornerRadius = 15
        btn.clipsToBounds = true
        btn.tag = 1
        return btn
    }()
    
    lazy var backgroundAlphaView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var alertBackgroundTransparentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var tryingToLeaveAlertView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var alertMessageLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors().darkBlack
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "운동을 그만하고 나갈까요? \n\n" + "지금 나가면 미완수 기록으로 저장됩니다."
        return label
    }()
    
    lazy var alertBtnStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .center
        sv.distribution = .fillEqually
        return sv
    }()
    
    lazy var alertCancelBtn: UIButton = {
        let btn = UIButton()
        btn.tag = 0
        btn.setTitle("마저 하러 가기", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = Colors().softBlack
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        return btn
    }()
    
    lazy var alertOkBtn: UIButton = {
        let btn = UIButton()
        btn.tag = 1
        btn.setTitle("운동 그만하기", for: .normal)
        btn.setTitleColor(Colors().softBlack, for: .normal)
        btn.backgroundColor = .clear
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(backgroundGradientView)
        self.addSubview(cardImageView)
        self.addSubview(cardCountLabel)
        self.addSubview(cardNameLabel)
        self.addSubview(workoutLabel)
        self.addSubview(numberOfWorkoutLabel)
        self.addSubview(nextBtnView)
        nextBtnView.addSubview(nextBtn)
        self.addSubview(finishBtnStackView)
        finishBtnStackView.addArrangedSubview(doneAndLeaveBtn)
        finishBtnStackView.addArrangedSubview(oneMoreTimeBtn)
        
        self.addSubview(backgroundAlphaView)
        self.addSubview(alertBackgroundTransparentView)
        alertBackgroundTransparentView.addSubview(tryingToLeaveAlertView)
        tryingToLeaveAlertView.addSubview(alertMessageLabel)
        tryingToLeaveAlertView.addSubview(alertBtnStackView)
        alertBtnStackView.addArrangedSubview(alertCancelBtn)
        alertBtnStackView.addArrangedSubview(alertOkBtn)
        
        viewLayout()
        
        finishBtnStackView.alpha = 0
        backgroundAlphaView.alpha = 0
        alertBackgroundTransparentView.alpha = 0
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("뷰 초기화 에러 발생")
    }
    
    func viewLayout() {
        backgroundGradientView.translatesAutoresizingMaskIntoConstraints = false
        backgroundGradientView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundGradientView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backgroundGradientView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backgroundGradientView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
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
        nextBtnView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        nextBtn.heightAnchor.constraint(equalTo: nextBtn.widthAnchor, multiplier: 0.4).isActive = true
        nextBtn.centerXAnchor.constraint(equalTo: nextBtnView.centerXAnchor).isActive = true
        nextBtn.centerYAnchor.constraint(equalTo: nextBtnView.centerYAnchor).isActive = true
        
        finishBtnStackView.translatesAutoresizingMaskIntoConstraints = false
        finishBtnStackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        finishBtnStackView.heightAnchor.constraint(equalTo: nextBtn.heightAnchor).isActive = true
        finishBtnStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        finishBtnStackView.centerYAnchor.constraint(equalTo: nextBtnView.centerYAnchor).isActive = true
        
        backgroundAlphaView.translatesAutoresizingMaskIntoConstraints = false
        backgroundAlphaView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundAlphaView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backgroundAlphaView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backgroundAlphaView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        alertBackgroundTransparentView.translatesAutoresizingMaskIntoConstraints = false
        alertBackgroundTransparentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        alertBackgroundTransparentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        alertBackgroundTransparentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        alertBackgroundTransparentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        tryingToLeaveAlertView.translatesAutoresizingMaskIntoConstraints = false
        tryingToLeaveAlertView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        tryingToLeaveAlertView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        tryingToLeaveAlertView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        tryingToLeaveAlertView.heightAnchor.constraint(equalTo: tryingToLeaveAlertView.widthAnchor).isActive = true
        
        alertMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        alertMessageLabel.topAnchor.constraint(equalTo: tryingToLeaveAlertView.topAnchor, constant: 10).isActive = true
        alertMessageLabel.leadingAnchor.constraint(equalTo: tryingToLeaveAlertView.leadingAnchor).isActive = true
        alertMessageLabel.trailingAnchor.constraint(equalTo: tryingToLeaveAlertView.trailingAnchor).isActive = true
        alertMessageLabel.heightAnchor.constraint(equalTo: tryingToLeaveAlertView.heightAnchor, multiplier: 0.5).isActive = true
        
        alertBtnStackView.translatesAutoresizingMaskIntoConstraints = false
        alertBtnStackView.topAnchor.constraint(equalTo: alertMessageLabel.bottomAnchor).isActive = true
        alertBtnStackView.bottomAnchor.constraint(equalTo: tryingToLeaveAlertView.bottomAnchor, constant: -10).isActive = true
        alertBtnStackView.widthAnchor.constraint(equalTo: tryingToLeaveAlertView.widthAnchor, multiplier: 0.9).isActive = true
        alertBtnStackView.centerXAnchor.constraint(equalTo: tryingToLeaveAlertView.centerXAnchor).isActive = true
        
        alertCancelBtn.translatesAutoresizingMaskIntoConstraints = false
        alertCancelBtn.widthAnchor.constraint(equalTo: alertBtnStackView.widthAnchor).isActive = true
        alertCancelBtn.heightAnchor.constraint(equalTo: alertBtnStackView.heightAnchor, multiplier: 0.5).isActive = true
        
        alertOkBtn.translatesAutoresizingMaskIntoConstraints = false
        alertOkBtn.widthAnchor.constraint(equalTo: alertBtnStackView.widthAnchor).isActive = true
        alertOkBtn.heightAnchor.constraint(equalTo: alertBtnStackView.heightAnchor, multiplier: 0.5).isActive = true

    }
}

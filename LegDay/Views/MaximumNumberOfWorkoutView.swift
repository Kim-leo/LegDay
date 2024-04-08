//
//  MaximumNumberOfWorkoutView.swift
//  LegDay
//
//  Created by 김승현 on 4/3/24.
//

import Foundation
import UIKit

class MaximumNumberOfWorkoutView: UIView {
    lazy var backgroundGradientView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var leftBarBtnItem: UIButton = {
        let btn = UIButton()
        btn.setTitle("돌아가기", for: .normal)
        btn.setTitleColor(Colors().darkBlack, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.frame = CGRect(x: 0, y: 0, width: 80, height: 30)
        return btn
    }()
    
    lazy var guideLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "최대 횟수를 설정하세요"
        label.textColor = Colors().darkBlack
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    lazy var guideLabelStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        return sv
    }()
    
    lazy var numberLabelStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        return sv
    }()
    
    lazy var maxNumGuideLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "  한 운동 당 총 횟수:"
        label.textColor = Colors().darkBlack
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var maxNumLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "45 회"
        label.textColor = Colors().redColor
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    lazy var totalNumGuideLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "  모든 운동 횟수:"
        label.textColor = Colors().darkBlack
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var totalNumberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "180 회"
        label.textColor = Colors().redColor
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    lazy var detailDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "하나의 운동별로 표시될 카드는 A 부터 9 입니다"
        label.textAlignment = .center
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    lazy var viewForPickerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    lazy var maxNumPickerView: UIPickerView = {
        let pv = UIPickerView()
        pv.backgroundColor = .clear
        return pv
    }()
    
    lazy var nextBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("선택 완료", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemGray4
        btn.isEnabled = false
        btn.layer.cornerRadius = 20
        btn.clipsToBounds = true
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(backgroundGradientView)
        self.addSubview(guideLabel)
        self.addSubview(guideLabelStackView)
        self.addSubview(numberLabelStackView)
        self.addSubview(detailDescriptionLabel)
        guideLabelStackView.addArrangedSubview(maxNumGuideLabel)
        guideLabelStackView.addArrangedSubview(totalNumGuideLabel)
        numberLabelStackView.addArrangedSubview(maxNumLabel)
        numberLabelStackView.addArrangedSubview(totalNumberLabel)
        self.addSubview(viewForPickerView)
        viewForPickerView.addSubview(maxNumPickerView)
        self.addSubview(nextBtn)
        
        viewLayout()
        rotatePickerView(pv: maxNumPickerView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("뷰 초기화 에러 발생")
    }
    
    func rotatePickerView(pv: UIPickerView) {
        let y = pv.frame.origin.y
        let x = pv.frame.origin.x
        
        pv.transform = CGAffineTransform(rotationAngle: -90 * (.pi / 180))
        pv.frame = CGRect(x: x, y: y, width: pv.frame.height, height: pv.frame.width)
    }
    
    func viewLayout() {
        backgroundGradientView.translatesAutoresizingMaskIntoConstraints = false
        backgroundGradientView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundGradientView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backgroundGradientView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backgroundGradientView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        guideLabel.translatesAutoresizingMaskIntoConstraints = false
        guideLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        guideLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        guideLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        guideLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        guideLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        guideLabelStackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        guideLabelStackView.topAnchor.constraint(equalTo: guideLabel.bottomAnchor).isActive = true
        guideLabelStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        guideLabelStackView.heightAnchor.constraint(equalTo: guideLabel.heightAnchor, multiplier: 2).isActive = true
        
        numberLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        numberLabelStackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        numberLabelStackView.topAnchor.constraint(equalTo: guideLabel.bottomAnchor).isActive = true
        numberLabelStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        numberLabelStackView.heightAnchor.constraint(equalTo: guideLabel.heightAnchor, multiplier: 2).isActive = true
        
        detailDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        detailDescriptionLabel.topAnchor.constraint(equalTo: guideLabelStackView.bottomAnchor).isActive = true
        detailDescriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        detailDescriptionLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.95).isActive = true
        detailDescriptionLabel.heightAnchor.constraint(equalTo: guideLabelStackView.heightAnchor, multiplier: 0.5).isActive = true
        
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nextBtn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        nextBtn.heightAnchor.constraint(equalTo: nextBtn.widthAnchor, multiplier: 0.4).isActive = true
        nextBtn.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        
        viewForPickerView.translatesAutoresizingMaskIntoConstraints = false
        viewForPickerView.topAnchor.constraint(equalTo: detailDescriptionLabel.bottomAnchor, constant: 15).isActive = true
        viewForPickerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        viewForPickerView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.95).isActive = true
        viewForPickerView.bottomAnchor.constraint(equalTo: nextBtn.topAnchor, constant: -20).isActive = true
        
        maxNumPickerView.translatesAutoresizingMaskIntoConstraints = false
        maxNumPickerView.topAnchor.constraint(equalTo: viewForPickerView.topAnchor).isActive = true
        maxNumPickerView.leadingAnchor.constraint(equalTo: viewForPickerView.leadingAnchor).isActive = true
        maxNumPickerView.trailingAnchor.constraint(equalTo: viewForPickerView.trailingAnchor).isActive = true
        maxNumPickerView.bottomAnchor.constraint(equalTo: viewForPickerView.bottomAnchor).isActive = true
    }
}

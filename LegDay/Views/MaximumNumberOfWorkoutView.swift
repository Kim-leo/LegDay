//
//  MaximumNumberOfWorkoutView.swift
//  LegDay
//
//  Created by 김승현 on 4/3/24.
//

import Foundation
import UIKit

class MaximumNumberOfWorkoutView: UIView {
    lazy var guideLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "한 운동 당 횟수를 설정하세요"
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    lazy var maxNumLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "한 운동 당 총 횟수: "
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var viewForPickerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
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
        self.backgroundColor = Colors().darkBlack
        self.addSubview(guideLabel)
        self.addSubview(maxNumLabel)
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
        guideLabel.translatesAutoresizingMaskIntoConstraints = false
        guideLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        guideLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        guideLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.95).isActive = true
        guideLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
        
        maxNumLabel.translatesAutoresizingMaskIntoConstraints = false
        maxNumLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        maxNumLabel.widthAnchor.constraint(equalTo: guideLabel.widthAnchor).isActive = true
        maxNumLabel.heightAnchor.constraint(equalTo: guideLabel.heightAnchor).isActive = true
        maxNumLabel.topAnchor.constraint(equalTo: guideLabel.bottomAnchor).isActive = true
        
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nextBtn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        nextBtn.heightAnchor.constraint(equalTo: nextBtn.widthAnchor, multiplier: 0.4).isActive = true
        nextBtn.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        
        viewForPickerView.translatesAutoresizingMaskIntoConstraints = false
        viewForPickerView.topAnchor.constraint(equalTo: maxNumLabel.bottomAnchor, constant: 15).isActive = true
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

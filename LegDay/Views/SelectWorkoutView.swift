//
//  SelectWorkoutView.swift
//  LegDay
//
//  Created by 김승현 on 3/25/24.
//

import Foundation
import UIKit

class SelectWorkoutView: UIView {
    lazy var guideLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "수행할 운동 세트를 고르세요"
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    lazy var viewForTableView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var myWorkoutTableView: UITableView = {
        let tv = UITableView()
        tv.register(MyWorkoutCell.self, forCellReuseIdentifier: "MyWorkoutCell")
        tv.layer.masksToBounds = true
        tv.layer.cornerRadius = 10
        tv.backgroundColor = .black
        return tv
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
        self.addSubview(viewForTableView)
        viewForTableView.addSubview(myWorkoutTableView)
        self.addSubview(nextBtn)
        
        viewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("뷰 초기화 에러 발생")
    }
    
    func viewLayout() {
        guideLabel.translatesAutoresizingMaskIntoConstraints = false
        guideLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        guideLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        guideLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.95).isActive = true
        guideLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
        
        viewForTableView.translatesAutoresizingMaskIntoConstraints = false
        viewForTableView.topAnchor.constraint(equalTo: guideLabel.bottomAnchor, constant: 15).isActive = true
        viewForTableView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        viewForTableView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.95).isActive = true
        viewForTableView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4).isActive = true
        
        myWorkoutTableView.translatesAutoresizingMaskIntoConstraints = false
        myWorkoutTableView.topAnchor.constraint(equalTo: viewForTableView.topAnchor).isActive = true
        myWorkoutTableView.leadingAnchor.constraint(equalTo: viewForTableView.leadingAnchor).isActive = true
        myWorkoutTableView.trailingAnchor.constraint(equalTo: viewForTableView.trailingAnchor).isActive = true
        myWorkoutTableView.bottomAnchor.constraint(equalTo: viewForTableView.bottomAnchor).isActive = true
        
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nextBtn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        nextBtn.heightAnchor.constraint(equalTo: nextBtn.widthAnchor, multiplier: 0.4).isActive = true
        nextBtn.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
    }
}


//
//  MyPageView.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import Foundation
import UIKit

class MyPageView: UIView {
    lazy var backgroundGradientView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "저장한 세트"
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var viewForTableView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var myWorkoutTableView: UITableView = {
        let tv = UITableView()
        tv.register(MyPageCell.self, forCellReuseIdentifier: "MyPageCell")
        tv.backgroundColor = .clear
        return tv
    }()
    
    lazy var noSavedSetsAlertLabel: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.alpha = 0.8
        label.textAlignment = .center
        label.textColor = Colors().darkBlack
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "저장한 세트가 없습니다. \n\n"  + "나만의 운동 세트를 만드세요!"
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(backgroundGradientView)
        self.addSubview(viewForTableView)
        self.addSubview(noSavedSetsAlertLabel)
        viewForTableView.addSubview(myWorkoutTableView)
        viewLayout()
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
        
        viewForTableView.translatesAutoresizingMaskIntoConstraints = false
        viewForTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        viewForTableView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.95).isActive = true
        viewForTableView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        viewForTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        myWorkoutTableView.translatesAutoresizingMaskIntoConstraints = false
        myWorkoutTableView.topAnchor.constraint(equalTo: viewForTableView.topAnchor, constant: 5).isActive = true
        myWorkoutTableView.leadingAnchor.constraint(equalTo: viewForTableView.leadingAnchor, constant: 5).isActive = true
        myWorkoutTableView.trailingAnchor.constraint(equalTo: viewForTableView.trailingAnchor, constant: -5).isActive = true
        myWorkoutTableView.bottomAnchor.constraint(equalTo: viewForTableView.bottomAnchor, constant: -5).isActive = true
        
        noSavedSetsAlertLabel.translatesAutoresizingMaskIntoConstraints = false
        noSavedSetsAlertLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        noSavedSetsAlertLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        noSavedSetsAlertLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        noSavedSetsAlertLabel.heightAnchor.constraint(equalTo: noSavedSetsAlertLabel.widthAnchor, multiplier: 0.4).isActive = true
    }
}

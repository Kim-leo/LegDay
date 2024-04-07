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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(backgroundGradientView)
        self.addSubview(viewForTableView)
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
//        viewForTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        viewForTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        viewForTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        myWorkoutTableView.translatesAutoresizingMaskIntoConstraints = false
        myWorkoutTableView.topAnchor.constraint(equalTo: viewForTableView.topAnchor, constant: 5).isActive = true
        myWorkoutTableView.leadingAnchor.constraint(equalTo: viewForTableView.leadingAnchor, constant: 5).isActive = true
        myWorkoutTableView.trailingAnchor.constraint(equalTo: viewForTableView.trailingAnchor, constant: -5).isActive = true
        myWorkoutTableView.bottomAnchor.constraint(equalTo: viewForTableView.bottomAnchor, constant: -5).isActive = true
    }
}

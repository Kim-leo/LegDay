//
//  MyPageView.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import Foundation
import UIKit

class MyPageView: UIView {
    lazy var myWorkoutTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .lightGray
        tv.register(MyWorkoutCell.self, forCellReuseIdentifier: "MyWorkoutCell")
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors().darkBlack
        
        self.addSubview(myWorkoutTableView)
        viewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("뷰 초기화 에러 발생")
    }
    
    func viewLayout() {
        myWorkoutTableView.translatesAutoresizingMaskIntoConstraints = false
        myWorkoutTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        myWorkoutTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        myWorkoutTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        myWorkoutTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

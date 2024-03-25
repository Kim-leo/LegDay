//
//  ExtensionVC.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import Foundation
import UIKit

extension UIViewController {
    var myWorkoutModel: MyWorkout {
        get {
            return MyWorkout.shared
        }
    }
    
    var leftBarBtn: UIBarButtonItem {
        get {
            let btn = UIBarButtonItem(title: "돌아가기", style: .plain, target: self, action: #selector(leftBarBtnTapped(_:)))
            btn.tintColor = .lightGray
            return btn
        }
    }
    
    var rightBarBtn: UIBarButtonItem {
        get {
            let btn = UIBarButtonItem(title: "마이 운동에 저장", style: .plain, target: self, action: #selector(rightBarBtnTapped(_:)))
            
            btn.tintColor = .lightGray
            return btn
        }
        
    }
    
    @objc func leftBarBtnTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func rightBarBtnTapped(_ sender: UIBarButtonItem) {
        print(myWorkoutModel.selectedWorkoutPerPokerShapeArray)
    }
    
    func setupViewLayout(yourView: UIView) {
        yourView.translatesAutoresizingMaskIntoConstraints = false
        yourView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        yourView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        yourView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        yourView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}

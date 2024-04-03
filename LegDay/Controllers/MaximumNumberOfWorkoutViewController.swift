//
//  SettingMaximumNumberOfWorkoutViewController.swift
//  LegDay
//
//  Created by 김승현 on 4/3/24.
//

import UIKit

class MaximumNumberOfWorkoutViewController: UIViewController {

    var leftBarBtn: UIBarButtonItem {
        get {
            let btn = UIBarButtonItem(title: "돌아가기", style: .plain, target: self, action: #selector(maximumNumberOfWorkoutVCleftBarBtnTapped(_:)))
            btn.tintColor = .lightGray
            return btn
        }
    }
    
    let maxNumWorkoutView = MaximumNumberOfWorkoutView()
    let viewModel = MaximumNumberOfWorkoutViewModel.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        self.navigationItem.leftBarButtonItem = self.leftBarBtn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(maxNumWorkoutView)
        setupViewLayout(yourView: maxNumWorkoutView)
        
    }
    

    
}

extension MaximumNumberOfWorkoutViewController {
    @objc func maximumNumberOfWorkoutVCleftBarBtnTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
}

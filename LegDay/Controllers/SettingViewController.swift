//
//  SettingViewController.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import UIKit

class SettingViewController: UIViewController {
    
    let settingView = SettingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(settingView)
        setupViewLayout(yourView: settingView)
        
    }
    

}

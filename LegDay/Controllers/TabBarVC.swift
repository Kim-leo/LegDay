//
//  TabBarVC.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let homeVC = HomeViewController()
        let settingVC = SettingViewController()
        let myPageVC = MyPageViewController()
        
        homeVC.tabBarItem.title = "홈"
        
        settingVC.tabBarItem.title = "운동 설정"
        
        myPageVC.tabBarItem.title = "마이 페이지"
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = .darkGray
        tabBar.unselectedItemTintColor = .systemGray2
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBar.layer.borderWidth = 1
        
        viewControllers = [homeVC, settingVC, myPageVC]
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

   

}

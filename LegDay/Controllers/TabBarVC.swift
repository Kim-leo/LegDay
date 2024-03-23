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
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let settingVC = UINavigationController(rootViewController: SettingViewController())
//        let settingVC = SettingViewController()
        let myPageVC = MyPageViewController()
        

        homeVC.tabBarItem.title = "운동 하기"
        homeVC.tabBarItem.image = UIImage(systemName: "figure.strengthtraining.functional")
        
        settingVC.tabBarItem.title = "운동 설정"
        settingVC.tabBarItem.image = UIImage(systemName: "figure.mind.and.body")
        
        myPageVC.tabBarItem.title = "마이 운동"
        myPageVC.tabBarItem.image = UIImage(systemName: "person.fill")
        
        tabBar.backgroundColor = .black
        tabBar.tintColor = Colors().redColor
        tabBar.unselectedItemTintColor = .lightGray
//        tabBar.layer.borderColor = UIColor.lightGray.cgColor
//        tabBar.layer.borderWidth = 1
        
        self.viewControllers = [homeVC, settingVC, myPageVC]
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

   

}

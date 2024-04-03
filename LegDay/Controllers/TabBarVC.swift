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
        let myPageVC = UINavigationController(rootViewController: MyPageViewController())
        let statsVC = UINavigationController(rootViewController: StatsViewController())
        
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithTransparentBackground()
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance

        homeVC.tabBarItem.title = "운동 하기"
        homeVC.tabBarItem.image = UIImage(systemName: "figure.strengthtraining.functional")
        
        settingVC.tabBarItem.title = "운동 설정"
        settingVC.tabBarItem.image = UIImage(systemName: "figure.mind.and.body")
        
        myPageVC.tabBarItem.title = "마이 운동"
        myPageVC.tabBarItem.image = UIImage(systemName: "person.fill")
        
        statsVC.tabBarItem.title = "통계"
        statsVC.tabBarItem.image = UIImage(systemName: "chart.bar.xaxis")
        
        tabBar.backgroundColor = .black
        tabBar.tintColor = Colors().redColor
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.isTranslucent = false

        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithTransparentBackground()
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
        self.viewControllers = [homeVC, settingVC, myPageVC, statsVC]

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

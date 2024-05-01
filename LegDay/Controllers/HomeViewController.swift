//
//  ViewController.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import UIKit

class HomeViewController: UIViewController {

    let homeView = HomeView()
    
    var rightBarButton = UIBarButtonItem()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tabBarController?.tabBar.isHidden = false
        
    }
    
    var gradientLayer: CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundGradientColor(homeView.backgroundGradientView, topColor: Colors().darkRedColor.cgColor, bottomColor: UIColor.black.cgColor)
        rightBarButton = UIBarButtonItem(customView: homeView.descriptionBtn)
        self.navigationItem.rightBarButtonItem = rightBarButton
        self.view.addSubview(homeView)
        setupViewLayout(yourView: homeView)
        
        homeView.startWorkoutBtn.addTarget(self, action: #selector(startWorkoutBtnTapped), for: .touchUpInside)
        homeView.descriptionBtn.addTarget(self, action: #selector(descriptionBtnTapped), for: .touchUpInside)
        
        for i in 0...2 {
//            CoreDataManager.shared.deleteWorkoutData(id: Int64(i)) { _ in }
        }

////        CoreDataManager.shared.deleteWorkoutIDData(id: 0) { _ in }
////        CoreDataManager.shared.deleteWorkoutIDData(id: 0) { _ in }
////        CoreDataManager.shared.deleteWorkoutIDData(id: 1) { _ in }
//        print(CoreDataManager.shared.getWorkoutData().map({$0.id}))

    }
    
    
    
    
    @objc func startWorkoutBtnTapped(_ sender: UIButton) {
        let selectVC = SelectWorkoutViewController()
        
        navigationController?.pushViewController(selectVC, animated: true)
    }
    
    @objc func descriptionBtnTapped(_ sender: UIButton) {
        let descriptionVC = DescriptionViewController()
        navigationController?.pushViewController(descriptionVC, animated: true)
    }
}


//
//  ViewController.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import UIKit

class HomeViewController: UIViewController {

    let homeView = HomeView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tabBarController?.tabBar.isHidden = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(homeView)
        setupViewLayout(yourView: homeView)
        homeView.startWorkoutBtn.addTarget(self, action: #selector(startWorkoutBtnTapped), for: .touchUpInside)
        homeView.descriptionBtn.addTarget(self, action: #selector(descriptionBtnTapped), for: .touchUpInside)
        
        
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


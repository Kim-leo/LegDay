//
//  StatsViewController.swift
//  LegDay
//
//  Created by 김승현 on 4/4/24.
//

import UIKit

class StatsViewController: UIViewController {
    
    let statsView = StatsView()
    var viewModel = StatsViewModel.shared
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = statsView.titleLabel
        self.view.backgroundColor = .white
        self.view.addSubview(statsView)
        setupViewLayout(yourView: statsView)
        for btn in statsView.eachStatsBtns {
            btn.addTarget(self, action: #selector(eachStatsBtnsTapped), for: .touchUpInside)
        }
        statsView.initializingBtn.addTarget(self, action: #selector(initializingBtnTapped), for: .touchUpInside)
        
        viewModel.workoutInfo(statsView)
        
    }

}

extension StatsViewController {
    @objc func eachStatsBtnsTapped(_ sender: UIButton) {
        print(sender.tag)
        viewModel.eachStatsBtnTapped(statsView, sender: sender)
        
    }
    
    @objc func initializingBtnTapped(_ sender: UIButton) {
        print("initialize data")
    }
}


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
    
    var rightBarBtn = UIBarButtonItem()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        viewModel.workoutInfo(statsView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        rightBarBtn = UIBarButtonItem(customView: statsView.rightBarBtnItem)
        
        self.navigationItem.titleView = statsView.titleLabel
        self.navigationItem.rightBarButtonItem = rightBarBtn
        self.view.backgroundColor = .white
        self.view.addSubview(statsView)
        setupViewLayout(yourView: statsView)
        
        statsView.rightBarBtnItem.addTarget(self, action: #selector(rightBarBtnTap), for: .touchUpInside)
        for btn in statsView.eachStatsBtns {
            btn.addTarget(self, action: #selector(eachStatsBtnsTapped), for: .touchUpInside)
        }
        statsView.alertCancelBtn.addTarget(self, action: #selector(alertBtnTap), for: .touchUpInside)
        statsView.alertOkBtn.addTarget(self, action: #selector(alertBtnTap), for: .touchUpInside)
        
        
    }

}

extension StatsViewController {
    @objc func rightBarBtnTap(_ sender: UIBarButtonItem) {
        viewModel.alertViewAppears(statsView, vc: self)
    }
    
    @objc func eachStatsBtnsTapped(_ sender: UIButton) {
        print(sender.tag)
        viewModel.eachStatsBtnTapped(statsView, sender: sender)
    }
    
    @objc func alertBtnTap(_ sender: UIButton) {
        viewModel.initializingBtnTapped(statsView, sender: sender)
    }
    
    
}


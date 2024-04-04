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
        
        
        viewModel.workoutInfo(statsView)
        
    }

}

extension StatsViewController {
    @objc func rightBarBtnTap(_ sender: UIBarButtonItem) {
        print("데이터 초기화")
    }
    
    @objc func eachStatsBtnsTapped(_ sender: UIButton) {
        print(sender.tag)
        viewModel.eachStatsBtnTapped(statsView, sender: sender)
        
    }
    
    
}


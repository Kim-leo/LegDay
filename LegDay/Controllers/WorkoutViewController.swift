//
//  WorkoutViewController.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import UIKit

class WorkoutViewController: UIViewController {

    let workoutView = WorkoutView()
    let viewModel = WorkoutViewModel(cardModel: CardModel(), workoutModel: WorkoutModel())
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.leftBarButtonItem = self.leftBarBtn
        tabBarController?.tabBar.isHidden = true
        tabBarController?.tabBar.isTranslucent = true
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(workoutView)
        setupViewLayout(yourView: workoutView)

        viewModel.componentsInitialSetting(workoutView)
        workoutView.nextBtn.addTarget(self, action: #selector(nextBtnTappedAction), for: .touchUpInside)
    }

}

extension WorkoutViewController {
    @objc func nextBtnTappedAction(_ sender: UIButton) {
        viewModel.nextBtnTapped(workoutView)
        
    }
}

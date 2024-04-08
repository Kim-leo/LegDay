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
    
    var leftBarBtn: UIBarButtonItem {
        get {
            let btn = UIBarButtonItem(title: "돌아가기", style: .plain, target: self, action: #selector(workoutVCleftBarBtnTapped(_:)))
            btn.tintColor = .lightGray
            return btn
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.leftBarButtonItem = self.leftBarBtn
        tabBarController?.tabBar.isHidden = true
        tabBarController?.tabBar.isTranslucent = true
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundGradientColor(workoutView.backgroundGradientView, topColor: UIColor.darkGray.cgColor, bottomColor: UIColor.black.cgColor)
        self.view.addSubview(workoutView)
        setupViewLayout(yourView: workoutView)

        viewModel.componentsInitialSetting(workoutView)
        workoutView.nextBtn.addTarget(self, action: #selector(nextBtnTappedAction), for: .touchUpInside)
        workoutView.doneAndLeaveBtn.addTarget(self, action: #selector(finishBtnTapped), for: .touchUpInside)
        workoutView.oneMoreTimeBtn.addTarget(self, action: #selector(finishBtnTapped), for: .touchUpInside)
        workoutView.alertOkBtn.addTarget(self, action: #selector(alertBtnsTap), for: .touchUpInside)
        workoutView.alertCancelBtn.addTarget(self, action: #selector(alertBtnsTap), for: .touchUpInside)
    }

}

extension WorkoutViewController {
    @objc func workoutVCleftBarBtnTapped(_ sender: UIBarButtonItem) {
        viewModel.tryingToLeaveDuringWorkout(workoutView)
    }
    
    @objc func nextBtnTappedAction(_ sender: UIButton) {
        viewModel.nextBtnTapped(workoutView)
        
    }
    
    @objc func finishBtnTapped(_ sender: UIButton) {
        viewModel.finishBtnTapped(workoutView, vc: self, sender: sender)
    }
    
    @objc func alertBtnsTap(_ sender: UIButton) {
        viewModel.alertBtnsTap(workoutView, vc: self, sender: sender)
    }
    
    
}

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
    
    var leftBarBtn = UIBarButtonItem()
    
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
        
        leftBarBtn = UIBarButtonItem(customView: workoutView.leftBarBtnItem)
        self.navigationItem.titleView = workoutView.timerNavigationBarLabel
        
        viewModel.componentsInitialSetting(workoutView)
        workoutView.leftBarBtnItem.addTarget(self, action: #selector(workoutVCleftBarBtnTapped), for: .touchUpInside)
        workoutView.nextBtn.addTarget(self, action: #selector(nextBtnTappedAction), for: .touchUpInside)
        workoutView.doneAndLeaveBtn.addTarget(self, action: #selector(finishBtnTapped), for: .touchUpInside)
        workoutView.oneMoreTimeBtn.addTarget(self, action: #selector(finishBtnTapped), for: .touchUpInside)
        workoutView.alertOkBtn.addTarget(self, action: #selector(alertBtnsTap), for: .touchUpInside)
        workoutView.alertCancelBtn.addTarget(self, action: #selector(alertBtnsTap), for: .touchUpInside)
        
        
    }
}

extension WorkoutViewController {
    @objc func timeCounter() {
        viewModel.startTimerAndPrintTimeToLabel(workoutView)
    }
    
    @objc func workoutVCleftBarBtnTapped(_ sender: UIBarButtonItem) {
        switch workoutView.nextBtn.currentTitle ?? "" {
        case "시작":
            self.navigationController?.popViewController(animated: true)
        default:
            viewModel.tryingToLeaveDuringWorkout(workoutView)
            viewModel.timer.invalidate()
        }
        
    }
    
    @objc func nextBtnTappedAction(_ sender: UIButton) {
        switch sender.currentTitle ?? "" {
        case "마치기":
            viewModel.endOfWorkout(workoutView)
            viewModel.saveFinishedWorkoutData()
            viewModel.countMaximumOfcontinuousProgress()
            viewModel.stopTimerAndResetTime(workoutView)
            viewModel.calculateAverateTimeInWorkingOut()
        case "시작":
            viewModel.saveStartWorkoutData()
            viewModel.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCounter), userInfo: nil, repeats: true)
            fallthrough
        default:
            viewModel.startWorkout(workoutView)
        
        }
    }
    
    @objc func finishBtnTapped(_ sender: UIButton) {
        viewModel.finishBtnTapped(workoutView, vc: self, sender: sender)
    }
    
    @objc func alertBtnsTap(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            workoutView.backgroundAlphaView.alpha = 0
            workoutView.alertBackgroundTransparentView.alpha = 0
            self.navigationController?.popViewController(animated: true)
        default:
            viewModel.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCounter), userInfo: nil, repeats: true)
            workoutView.backgroundAlphaView.alpha = 0
            workoutView.alertBackgroundTransparentView.alpha = 0
            break
        }
        
    }
    
    
}

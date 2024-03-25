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
        self.view.backgroundColor = .white
        
        self.view.addSubview(workoutView)
        setupViewLayout(yourView: workoutView)

        viewModel.componentsInitialSetting(workoutView)
        workoutView.nextBtn.addTarget(self, action: #selector(nextBtnTappedAction), for: .touchUpInside)
    }

}

extension WorkoutViewController {
    @objc func workoutVCleftBarBtnTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "운동 그만하기", message: "", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "그만하고 나가기", style: .default) { [self] (ok) in
            self.navigationController?.popViewController(animated: true)
        }
        let cancel = UIAlertAction(title: "계속하기", style: .cancel) { (cancel) in }
        alert.addAction(yesAction)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @objc func nextBtnTappedAction(_ sender: UIButton) {
        viewModel.nextBtnTapped(workoutView)
        
    }
}

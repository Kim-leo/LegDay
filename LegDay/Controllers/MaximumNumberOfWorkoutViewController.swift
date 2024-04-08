//
//  SettingMaximumNumberOfWorkoutViewController.swift
//  LegDay
//
//  Created by 김승현 on 4/3/24.
//

import UIKit

class MaximumNumberOfWorkoutViewController: UIViewController {

//    var leftBarBtn: UIBarButtonItem {
//        get {
//            let btn = UIBarButtonItem(title: "돌아가기", style: .plain, target: self, action: #selector(maximumNumberOfWorkoutVCleftBarBtnTapped(_:)))
//            btn.tintColor = Colors().darkBlack
//            return btn
//        }
//    }
    
    var leftBarBtn = UIBarButtonItem()
    
    let maxNumWorkoutView = MaximumNumberOfWorkoutView()
    let viewModel = MaximumNumberOfWorkoutViewModel.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        self.navigationItem.leftBarButtonItem = self.leftBarBtn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundGradientColor(maxNumWorkoutView.backgroundGradientView, topColor: UIColor.white.cgColor, bottomColor: UIColor.black.cgColor)
        self.view.addSubview(maxNumWorkoutView)
        setupViewLayout(yourView: maxNumWorkoutView)
        
        leftBarBtn = UIBarButtonItem(customView: maxNumWorkoutView.leftBarBtnItem)
        
        maxNumWorkoutView.nextBtn.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
        maxNumWorkoutView.leftBarBtnItem.addTarget(self, action: #selector(popVC), for: .touchUpInside)
        maxNumWorkoutView.maxNumPickerView.delegate = self
        maxNumWorkoutView.maxNumPickerView.dataSource = self
        maxNumWorkoutView.maxNumPickerView.selectRow(viewModel.maximumNumberOfWorkout[0] - 1, inComponent: 0, animated: false)
    }
}

extension MaximumNumberOfWorkoutViewController {
    @objc func maximumNumberOfWorkoutVCleftBarBtnTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func nextBtnTapped(_ sender: UIButton) {
        viewModel.readyToLoadOnWorkoutVC()
        let workoutVC = WorkoutViewController()
        navigationController?.pushViewController(workoutVC, animated: true)
    }
}

extension MaximumNumberOfWorkoutViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
   
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(viewModel.maximumNumberOfWorkout[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel.setMaximumNumberOfWorkout(row: row)
        viewModel.showMaxNumberOnLabel(view: maxNumWorkoutView, row: row)
        viewModel.changeColorOfTheBtn(maxNumWorkoutView)
        
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return CGFloat(100)
    }
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .clear

        let cardImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        cardImage.contentMode = .scaleAspectFill
        cardImage.image = UIImage(named: viewModel.images.randomElement()![row])
        
        view.transform = CGAffineTransform(rotationAngle:  90 * (.pi / 180))
        view.addSubview(cardImage)
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.maximumNumberOfWorkout.count
    }
    
    
}

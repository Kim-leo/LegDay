//
//  SettingMaximumNumberOfWorkoutViewController.swift
//  LegDay
//
//  Created by 김승현 on 4/3/24.
//

import UIKit

class MaximumNumberOfWorkoutViewController: UIViewController {

    var leftBarBtn: UIBarButtonItem {
        get {
            let btn = UIBarButtonItem(title: "돌아가기", style: .plain, target: self, action: #selector(maximumNumberOfWorkoutVCleftBarBtnTapped(_:)))
            btn.tintColor = .lightGray
            return btn
        }
    }
    
    let sampleData = ["A", "B", "C", "D", "E", "F", "G"]
    
    let maxNumWorkoutView = MaximumNumberOfWorkoutView()
    let viewModel = MaximumNumberOfWorkoutViewModel.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        self.navigationItem.leftBarButtonItem = self.leftBarBtn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(maxNumWorkoutView)
        setupViewLayout(yourView: maxNumWorkoutView)
        
        maxNumWorkoutView.nextBtn.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
        
        maxNumWorkoutView.maxNumPickerView.delegate = self
        maxNumWorkoutView.maxNumPickerView.dataSource = self
        
        
    }
    

    
}

extension MaximumNumberOfWorkoutViewController {
    @objc func maximumNumberOfWorkoutVCleftBarBtnTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func nextBtnTapped(_ sender: UIButton) {
        let workoutVC = WorkoutViewController()
        navigationController?.pushViewController(workoutVC, animated: true)
    }
}

extension MaximumNumberOfWorkoutViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    // 스크롤 가능한 피커뷰 톱니 수 리턴.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    // PickerView 내에서 특정한 위치(row)를 가리키게 될 때, 그 위치에 해당하는 문자열을 반환하는 메서드
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sampleData[row]
    }
    
   
    // PickerView 에서 특정 row가 focus되었을 때 어떤 행동을 할지 정의하는 메서드입니다.
    // 여기서는 정오를 확인하고, 정답일 경우 다음 복습활동으로 넘어간다.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(sampleData[row])
        
        viewModel.changeColorOfTheBtn(maxNumWorkoutView)
//        switch data.jaeum[row] {
//        case data.review3AnswerSheet[userData.currentJaeumIs]:   // 정답
//            views.correctAnswer(label: correctOrWrongLabel)
////            moveToNextView(nextVCIdentifier: "R4ViewController")
//            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "R4ViewController") as? R4ViewController else { return }
//            nextVC.takenLevelNum = self.takenLevelNum
//            self.navigationController?.pushViewController(nextVC, animated: true)
//        default:                                                // 오답
//            views.wrongAnswer(label: correctOrWrongLabel)
//        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return CGFloat(100)
    }
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .black
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        label.backgroundColor = .clear
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 35)
        label.text = sampleData[row] //자음
        view.transform = CGAffineTransform(rotationAngle:  90 * (.pi / 180))
        view.addSubview(label)
        return view
    }
    
    // PickerView에 표시될 항목의 개수를 반환하는 메서드
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sampleData.count
    }
}

//
//  SettingViewController.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import UIKit

class SettingViewController: UIViewController {
    let settingView = SettingView()
    let viewModel = SettingViewModel.shared
    
    var leftBarBtn = UIBarButtonItem()
    var rightBarBtn = UIBarButtonItem()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tabBarController?.tabBar.isHidden = false
        viewModel.changeSetPokerLabelWhenComeFromMyPage(settingView)
        settingView.rightBarBtnItem.isEnabled = true
        settingView.leftBarBtnItem.isEnabled = true
        
        print(CoreDataManager.shared.getWorkoutData().map({$0.objectID}))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundGradientColor(settingView.backgroundGradientView, topColor: Colors().darkRedColor.cgColor, bottomColor: UIColor.black.cgColor)
        leftBarBtn = UIBarButtonItem(customView: settingView.leftBarBtnItem)
        rightBarBtn = UIBarButtonItem(customView: settingView.rightBarBtnItem)
        
        self.navigationItem.leftBarButtonItem = leftBarBtn
        self.navigationItem.titleView = settingView.titleLabel
        self.navigationItem.rightBarButtonItem = self.rightBarBtn
        self.view.addSubview(settingView)
        setupViewLayout(yourView: settingView)
        
        settingView.upperCollectinView.delegate = self
        settingView.upperCollectinView.dataSource = self
        settingView.lowerCollectinView.delegate = self
        settingView.lowerCollectinView.dataSource = self
        settingView.categoryPickerView.delegate = self
        settingView.categoryPickerView.dataSource = self
        
        viewModel.initialSetting(view: settingView)

        for btn in settingView.pokerShapeBtns {
            btn.addTarget(self, action: #selector(pokerShapeBtnsTapped), for: .touchUpInside)
        }
        
        settingView.saveSetAlertCancelBtn.addTarget(self, action: #selector(alertBtnTapped), for: .touchUpInside)
        settingView.saveSetAlertOkBtn.addTarget(self, action: #selector(alertBtnTapped), for: .touchUpInside)
        
        settingView.categoryOkBtn.addTarget(self, action: #selector(categoryBtnTapped), for: .touchUpInside)
        settingView.categoryCancelBtn.addTarget(self, action: #selector(categoryBtnTapped), for: .touchUpInside)
        
        settingView.leftBarBtnItem.addTarget(self, action: #selector(leftBarBtnTap), for: .touchUpInside)
        settingView.rightBarBtnItem.addTarget(self, action: #selector(rightBarBtnTap), for: .touchUpInside)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(backgroundViewTapped))
        settingView.backgroundViewForSettingPokerShapes.addGestureRecognizer(tapGestureRecognizer)
        
        
        configuratePickerViewToolBar()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
}


extension SettingViewController {
    @objc func leftBarBtnTap(_ sender: UIBarButtonItem) {
        viewModel.leftBarBtnItemTapped(settingView)
    }
    
    @objc func rightBarBtnTap(_ sender: UIBarButtonItem) {
        viewModel.rightBarBtnTap(settingView)
    }
    
    @objc func categoryBtnTapped(_ sender: UIButton) {
        viewModel.categoryBtnTap(settingView, sender: sender)
    }
    
    @objc func pokerShapeBtnsTapped(_ sender: UIButton) {
        viewModel.pokerCardBtnTapped(view: settingView, sender)
        settingView.pokerWorkoutNameLabels[sender.tag].text = viewModel.whichWorkout
    }
    
    @objc func alertBtnTapped(_ sender: UIButton) {
        viewModel.alertBtnTapAction(settingView, sender: sender)
    }
    
    @objc func backgroundViewTapped(_ sender: UITapGestureRecognizer) {
        viewModel.backgroundViewForSettingPokerShapeTap(settingView)
    }
}


extension SettingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return viewModel.typeOfWorkouts.count
        case 1:
            return viewModel.yourAllWorkoutsArray.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpperCell", for: indexPath) as? UpperCell else { return UICollectionViewCell() }
            cell.typesOfWorkoutLabel.text = viewModel.typeOfWorkouts[indexPath.row]
            cell.isSelected = (indexPath.row == 0) ? true : false
            if indexPath.item == 0 {
                cell.isSelected = true
                settingView.upperCollectinView.selectItem(at: indexPath,
                animated: false, scrollPosition: .init())
            }
            
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LowerCell", for: indexPath) as? LowerCell else { return UICollectionViewCell() }
            cell.typesOfWorkoutLabel.text = viewModel.yourAllWorkoutsArray[indexPath.row]
            cell.typesOfWorkoutLabel.backgroundColor = (cell.typesOfWorkoutLabel.text == "+ 직접 입력") ? .systemGray3 : .systemGray6
            
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 0:
            let width = settingView.upperCollectinView.frame.width / 5
            let height = settingView.upperCollectinView.frame.height
            return CGSize(width: width, height: height)
        case 1:
            let width = collectionView.frame.width / 3 - 5
            return CGSize(width: width, height: width)
        default:
            return CGSize()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = settingView.lowerCollectinView.dequeueReusableCell(withReuseIdentifier: "LowerCell", for: IndexPath()) as? LowerCell else { return }
        switch collectionView.tag {
        case 0:
            collectionView.performBatchUpdates {
                viewModel.yourAllWorkoutsArray.removeAll()
                if viewModel.typeOfWorkouts[indexPath.row] == "전체" {
                    viewModel.yourAllWorkoutsArray.append("+ 직접 입력")
                    viewModel.yourAllWorkoutsArray += Array(viewModel.workoutForCategories.joined())
                } else {
                    viewModel.yourAllWorkoutsArray += Array(viewModel.workoutForCategories[indexPath.row])
                }
            }
            
            cell.isSelected = false
            settingView.lowerCollectinView.reloadData()
        case 1:
            switch viewModel.isLeftBarBtnClicked {
            case true:
                switch viewModel.yourAllWorkoutsArray[indexPath.row] {
                case "+ 직접 입력":
                    viewModel.tryingToDeleteAddWorkoutByYourselfCell(settingView)
                    break
                default:
                    viewModel.deleteDataRelatedToCell(settingView, indexPath: indexPath)
                }
            case false:
                settingView.leftBarBtnItem.isEnabled = false
                settingView.rightBarBtnItem.isEnabled = false
                switch viewModel.yourAllWorkoutsArray[indexPath.row] {
                case "+ 직접 입력":
                    print("new alert view will appear")
                    viewModel.cellAddWorkoutTap(settingView)
//                      viewModel.settingMessageForAlertMessageLabel(settingView)
                default:
                    settingView.backGroundTransparentView.alpha = 0.5
                    settingView.backgroundViewForSettingPokerShapes.alpha = 1
                    self.view.bringSubviewToFront(settingView.backgroundViewForSettingPokerShapes)
                    viewModel.whichWorkout = viewModel.yourAllWorkoutsArray[indexPath.row]
                    for label in settingView.pokerWorkoutNameLabels {
                        label.text = "\(viewModel.selectedWorkoutPerPokerShapeArray[label.tag])"
                    }
                }
            }
        default:
            break
        }
    }
}

extension SettingViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.myWorkoutModel.typeOfWorkouts[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.myWorkoutModel.typeOfWorkouts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        settingView.categoryTextField.text = viewModel.myWorkoutModel.typeOfWorkouts[row]
    }
    
    func configuratePickerViewToolBar() {
        settingView.categoryTextField.inputView = settingView.categoryPickerView
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = .white
        toolBar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(self.donePickerView))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelBtn = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(self.cancelPickerView))
        
        toolBar.setItems([cancelBtn,flexibleSpace,doneBtn], animated: false)
        toolBar.isUserInteractionEnabled = true
        settingView.categoryTextField.inputAccessoryView = toolBar
    }
    
    @objc func donePickerView() {
        viewModel.selectRowInPickerView(settingView)
    }

    @objc func cancelPickerView() {
        settingView.categoryTextField.text = nil
        settingView.categoryTextField.resignFirstResponder()
    }
    
    
}


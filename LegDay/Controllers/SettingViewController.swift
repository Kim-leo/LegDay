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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftBarBtn = UIBarButtonItem(customView: settingView.leftBarBtnItem)
        rightBarBtn = UIBarButtonItem(customView: settingView.rightBarBtnItem)
        
        self.navigationItem.leftBarButtonItem = leftBarBtn
        self.navigationItem.rightBarButtonItem = self.rightBarBtn
        self.view.backgroundColor = .white
        self.view.addSubview(settingView)
        setupViewLayout(yourView: settingView)
        
        settingView.upperCollectinView.delegate = self
        settingView.upperCollectinView.dataSource = self
        settingView.lowerCollectinView.delegate = self
        settingView.lowerCollectinView.dataSource = self
        
        viewModel.initialSetting(view: settingView)
        
        settingView.categoryBtns.map {
            $0.addTarget(self, action: #selector(categoryBtnTapped), for: .touchUpInside)
        }
        settingView.cancelBtn.addTarget(self, action: #selector(cancelBtnTapped), for: .touchUpInside)
        
        settingView.pokerShapeBtns.map {
            $0.addTarget(self, action: #selector(pokerShapeBtnsTapped), for: .touchUpInside)
        }
        settingView.alertCancelBtn.addTarget(self, action: #selector(alertBtnTapped), for: .touchUpInside)
        settingView.alertOkBtn.addTarget(self, action: #selector(alertBtnTapped), for: .touchUpInside)
        
        settingView.leftBarBtnItem.addTarget(self, action: #selector(leftBarBtnTap), for: .touchUpInside)
        settingView.rightBarBtnItem.addTarget(self, action: #selector(rightBarBtnTap), for: .touchUpInside)
    }
    
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
        }
    
    
}


extension SettingViewController {
    @objc func leftBarBtnTap(_ sender: UIBarButtonItem) {
        viewModel.leftBarBtnItemTapped(settingView)
    }
    
    @objc func rightBarBtnTap(_ sender: UIBarButtonItem) {
        settingView.alertView.alpha = 1
        viewModel.whoCalledAlertView = 1
        viewModel.settingMessageForAlertMessageLabel(settingView)
    }
    
    @objc func categoryBtnTapped(_ sender: UIButton) {
        viewModel.workoutForCategories[sender.tag].append(viewModel.inputWorkout)
        viewModel.categoryBtnTapped(view: settingView)
    }
    
    @objc func cancelBtnTapped(_ sender: UIButton) {
        viewModel.cancelBtnTapped(view: settingView)
    }
    
    @objc func pokerShapeBtnsTapped(_ sender: UIButton) {
        viewModel.pokerCardBtnTapped(view: settingView, sender)
        settingView.pokerWorkoutNameLabels[sender.tag].text = viewModel.whichWorkout
    }
    
    @objc func alertBtnTapped(_ sender: UIButton) {
        viewModel.alertBtnTapAction(settingView, sender: sender)
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
            break
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
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 0:
            let width = settingView.upperCollectinView.frame.width / 4
            let height = settingView.upperCollectinView.frame.height
            return CGSize(width: width, height: height)
        case 1:
            let width = collectionView.frame.width / 3 - 5
            return CGSize(width: width, height: width)
        default:
            return CGSize()
            break
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
                switch viewModel.yourAllWorkoutsArray[indexPath.row] {
                case "+ 직접 입력":
    //                viewModel.addWorkoutByYourself(view: settingView, vc: self)
                    settingView.alertView.alpha = 1
                    viewModel.whoCalledAlertView = 0
                    viewModel.settingMessageForAlertMessageLabel(settingView)
                default:
                    collectionView.alpha = 0.5
                    settingView.verticalStackViewForSettingPokerShapes.alpha = 1
                    self.view.bringSubviewToFront(settingView.verticalStackViewForSettingPokerShapes)
                    viewModel.whichWorkout = viewModel.yourAllWorkoutsArray[indexPath.row]
    //                myView.pokerShapeBtns.map { $0.setTitle("\(viewModel.selectedWorkoutPerPokerShapeArray[$0.tag])", for: .normal)}
                    settingView.pokerWorkoutNameLabels.map { $0.text = "\(viewModel.selectedWorkoutPerPokerShapeArray[$0.tag])" }
                    
                }
            }
            
            
        default:
            break
        }
    }
}



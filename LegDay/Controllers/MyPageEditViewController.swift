//
//  MyPageEditViewController.swift
//  LegDay
//
//  Created by 김승현 on 4/11/24.
//

import UIKit


class MyPageEditViewController: UIViewController {

    let myPageEditView = MyPageEditView()
    let viewModel = MyPageEditViewModel.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.initialSetting(myPageEditView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(myPageEditView)
        setupViewLayout(yourView: myPageEditView)
        
        myPageEditView.upperCollectinView.delegate = self
        myPageEditView.upperCollectinView.dataSource = self
        myPageEditView.lowerCollectinView.delegate = self
        myPageEditView.lowerCollectinView.dataSource = self
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(backgroundViewTapped))
        myPageEditView.backgroundTransparentView.addGestureRecognizer(tapGestureRecognizer)
        
        for btn in myPageEditView.pokerShapeBtns {
            btn.addTarget(self, action: #selector(tapPokerBtns), for: .touchUpInside)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        viewModel.autoSaveEditedData(myPageEditView)
    }
}

extension MyPageEditViewController {
    @objc func backgroundViewTapped(_ sender: UITapGestureRecognizer) {
        viewModel.tapBackgroundView(myPageEditView)
    }
    
    @objc func tapPokerBtns(_ sender: UIButton) {
        viewModel.tapPokerBtns(myPageEditView, sender: sender)
    }
}

extension MyPageEditViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
            cell.typesOfWorkoutLabel.layer.masksToBounds = true
            cell.typesOfWorkoutLabel.layer.cornerRadius = cell.frame.height / 3
            cell.typesOfWorkoutLabel.text = viewModel.typeOfWorkouts[indexPath.row]
            cell.typesOfWorkoutLabel.font = UIFont.systemFont(ofSize: 13)
            cell.isSelected = (indexPath.row == 0) ? true : false
            if indexPath.item == 0 {
                cell.isSelected = true
                myPageEditView.upperCollectinView.selectItem(at: indexPath,
                animated: false, scrollPosition: .init())
            }
            
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LowerCell", for: indexPath) as? LowerCell else { return UICollectionViewCell() }
            cell.typesOfWorkoutLabel.layer.masksToBounds = true
            cell.typesOfWorkoutLabel.layer.cornerRadius = cell.frame.height / 4
            cell.typesOfWorkoutLabel.text = viewModel.yourAllWorkoutsArray[indexPath.row]
            cell.typesOfWorkoutLabel.font = UIFont.systemFont(ofSize: 15)
            cell.typesOfWorkoutLabel.backgroundColor = .white
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 0:
            let width = myPageEditView.upperCollectinView.frame.width / 5
            let height = myPageEditView.upperCollectinView.frame.height
            return CGSize(width: width, height: height)
        case 1:
            let width = collectionView.frame.width / 3 - 5
            let height = collectionView.frame.height / 3 - 5
            return CGSize(width: width, height: height)
        default:
            return CGSize()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = myPageEditView.lowerCollectinView.dequeueReusableCell(withReuseIdentifier: "LowerCell", for: IndexPath()) as? LowerCell else { return }
        switch collectionView.tag {
        case 0:
            collectionView.performBatchUpdates {
                viewModel.yourAllWorkoutsArray.removeAll()
                if viewModel.typeOfWorkouts[indexPath.row] == "전체" {
                    viewModel.yourAllWorkoutsArray += Array(viewModel.myWorkoutModel.workoutsForCollectionViewCell.joined())
                } else {
                    viewModel.yourAllWorkoutsArray += Array(viewModel.myWorkoutModel.workoutsForCollectionViewCell[indexPath.row])
                }
            }
            
            cell.isSelected = false
            myPageEditView.lowerCollectinView.reloadData()
        case 1:
            myPageEditView.backgroundTransparentView.alpha = 1
            myPageEditView.backgroundAlphaView.alpha = 0.8
            
            viewModel.tapWorkoutCell(myPageEditView, indexPath: indexPath)
            
        default:
            break
        }
        
    }
}

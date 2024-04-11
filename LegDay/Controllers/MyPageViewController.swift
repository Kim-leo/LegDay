//
//  MyPageViewController.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import UIKit

class MyPageViewController: UIViewController  {
    
    
    let myPageView = MyPageView()
    let viewModel = MyPageViewModel.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        viewModel.updateTableViewCell(myPageView)
        myPageView.myWorkoutTableView.reloadData()
        viewModel.showAlertViewWhenMyworkoutListIsEmpty(myPageView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundGradientColor(myPageView.backgroundGradientView, topColor: UIColor.darkGray.cgColor, bottomColor: UIColor.black.cgColor)
        self.navigationItem.titleView = myPageView.titleLabel
        self.view.addSubview(myPageView)
        setupViewLayout(yourView: myPageView)
        
        myPageView.myWorkoutTableView.delegate = self
        myPageView.myWorkoutTableView.dataSource = self
        
        
    }
    
}

extension MyPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.myWorkoutsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageCell", for: indexPath) as? MyPageCell else { return .init() }
        cell.backgroundColor = .clear
        cell.workoutTitleLabel.text = "\(viewModel.myWorkoutsTitles[indexPath.row])"
        for i in 0...3 {
            cell.setPokerShapeLabel[i].text = "\(viewModel.myWorkoutsList[indexPath.row][i])"
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let workoutRightNowAction = UIContextualAction(style: .normal, title: "바로 운동하기") { (action, view, completion) in
            self.viewModel.saveCurrentCellData(indexPath: indexPath)
            let maxNumVC = MaximumNumberOfWorkoutViewController()
            self.navigationController?.pushViewController(maxNumVC, animated: true)
            completion(true)
        }
        workoutRightNowAction.backgroundColor = Colors().darkBlack
        workoutRightNowAction.image = UIImage(systemName: "figure.strengthtraining.functional")
        
        
        let editAction = UIContextualAction(style: .normal, title: "편집") { (action, view, completion) in
            self.viewModel.saveCurrentCellData(indexPath: indexPath)
            self.viewModel.editWorkoutFromMyPageVC()
            self.tabBarController?.selectedIndex = 1
            
            completion(true)
        }
        editAction.backgroundColor = .darkGray
        editAction.image = UIImage(systemName: "pencil.and.ellipsis.rectangle")
        
        let deleteAction = UIContextualAction(style: .normal, title: "삭제") { (action, view, completion) in
            self.viewModel.deleteCellAndMyWorkoutData(self.myPageView, indexPath: indexPath)
            self.viewModel.showAlertViewWhenMyworkoutListIsEmpty(self.myPageView)
            completion(true)
        }
        deleteAction.backgroundColor = Colors().softRedColor
        deleteAction.image = UIImage(systemName: "trash")

        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, editAction, workoutRightNowAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    
}

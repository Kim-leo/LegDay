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
        
        viewModel.updateTableViewCell(myPageView)
        myPageView.myWorkoutTableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
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
        let deleteAction = UIContextualAction(style: .normal, title: "삭제") { (action, view, completion) in
            print("셀 삭제")
            
            completion(true)
        }
        deleteAction.backgroundColor = Colors().softRedColor
        deleteAction.image = UIImage(systemName: "trash")
        
        let editAction = UIContextualAction(style: .normal, title: "편집") { (action, view, completion) in
            print("셀 편집")
            
            completion(true)
        }
        editAction.backgroundColor = .darkGray
        editAction.image = UIImage(systemName: "pencil")
        
        let workoutRightNowAction = UIContextualAction(style: .normal, title: "바로 운동하기") { (action, view, completion) in
            print("셀 운동 바로 하기")
            
            completion(true)
        }
        workoutRightNowAction.backgroundColor = Colors().darkBlack
        workoutRightNowAction.image = UIImage(systemName: "figure.strengthtraining.functional")

        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, editAction, workoutRightNowAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    
}

//
//  SelectWorkoutViewController.swift
//  LegDay
//
//  Created by 김승현 on 3/25/24.
//

import UIKit

class SelectWorkoutViewController: UIViewController {

    var leftBarBtn: UIBarButtonItem {
        get {
            let btn = UIBarButtonItem(title: "돌아가기", style: .plain, target: self, action: #selector(selectWorkoutVCleftBarBtnTapped(_:)))
            btn.tintColor = .lightGray
            return btn
        }
    }
    
    let selectWorkoutView = SelectWorkoutView()
    let viewModel = SelectWorkoutViewModel.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        self.navigationItem.leftBarButtonItem = self.leftBarBtn
        
        viewModel.updateTableViewCell(selectWorkoutView)
        selectWorkoutView.myWorkoutTableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(selectWorkoutView)
        setupViewLayout(yourView: selectWorkoutView)
        
        selectWorkoutView.myWorkoutTableView.delegate = self
        selectWorkoutView.myWorkoutTableView.dataSource = self
        
        selectWorkoutView.nextBtn.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        selectWorkoutView.nextBtn.isEnabled = false
        selectWorkoutView.nextBtn.backgroundColor = .systemGray4
    }
}

extension SelectWorkoutViewController {
    @objc func selectWorkoutVCleftBarBtnTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func nextBtnTapped(_ sender: UIButton) {
        let workoutVC = WorkoutViewController()
        navigationController?.pushViewController(workoutVC, animated: true)
    }
}

extension SelectWorkoutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.myWorkoutsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyWorkoutCell", for: indexPath) as? MyWorkoutCell else { return .init() }
        cell.workoutTitleLabel.text = "\(viewModel.myWorkoutsTitles[indexPath.row])"
        for i in 0...3 {
            cell.setPokerShapeLabel[i].text = "\(viewModel.myWorkoutsList[indexPath.row][i])"
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.changeColorOfTheBtn(selectWorkoutView)
    }
   
       
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}


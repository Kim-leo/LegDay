//
//  SelectWorkoutViewController.swift
//  LegDay
//
//  Created by 김승현 on 3/25/24.
//

import UIKit

class SelectWorkoutViewController: UIViewController {
    
    let selectWorkoutView = SelectWorkoutView()
    let viewModel = SelectWorkoutViewModel.shared
    
    var leftBarBtn = UIBarButtonItem()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        self.navigationItem.leftBarButtonItem = self.leftBarBtn
        
        viewModel.updateTableViewCell(selectWorkoutView)
        selectWorkoutView.myWorkoutTableView.reloadData()
        popSwipeRecognizer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.view.addSubview(selectWorkoutView)
        setupViewLayout(yourView: selectWorkoutView)
        backgroundGradientColor(selectWorkoutView.backgroundGradientView, topColor: Colors().darkRedColor.cgColor, bottomColor: UIColor.black.cgColor)
        leftBarBtn = UIBarButtonItem(customView: selectWorkoutView.leftBarBtnItem)
        
        selectWorkoutView.myWorkoutTableView.delegate = self
        selectWorkoutView.myWorkoutTableView.dataSource = self
        
        selectWorkoutView.leftBarBtnItem.addTarget(self, action: #selector(popVC), for: .touchUpInside)
        selectWorkoutView.nextBtn.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        selectWorkoutView.nextBtn.isEnabled = false
        selectWorkoutView.nextBtn.backgroundColor = .systemGray4
    }
}

extension SelectWorkoutViewController {
    @objc func nextBtnTapped(_ sender: UIButton) {
        let maxNumVC = MaximumNumberOfWorkoutViewController()
        navigationController?.pushViewController(maxNumVC, animated: true)
    }
}

extension SelectWorkoutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.myWorkoutsList.count
        return CoreDataManager.shared.getWorkoutData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelectWorkoutCell", for: indexPath) as? SelectWorkoutCell else { return .init() }
//        cell.workoutTitleLabel.text = "\(viewModel.myWorkoutsTitles[indexPath.row])"
        cell.workoutTitleLabel.text = "\(CoreDataManager.shared.getWorkoutData().map({$0.title}).reversed()[indexPath.row] ?? "")"
        for i in 0...3 {
//            cell.setPokerShapeLabel[i].text = "\(viewModel.myWorkoutsList[indexPath.row][i])"
            cell.setPokerShapeLabel[i].text = "\(CoreDataManager.shared.getWorkoutData().map({$0.workoutArray ?? []}).reversed()[indexPath.row][i])"
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectWorkoutAndReadyToLoadOnWorkoutVC(indexPath: indexPath)
        viewModel.changeColorOfTheBtn(selectWorkoutView)
    }
   
       
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


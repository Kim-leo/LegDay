//
//  MyPageViewController.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import UIKit

class MyPageViewController: UIViewController  {
    
    let myPageView = MyPageView()
    
    let sampleData = ["A", "B", "C", "D", "F", "G"]
    
    
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
        return sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyWorkoutCell", for: indexPath) as? MyWorkoutCell else { return .init() }
        cell.workoutTitleLabel.text = "\(sampleData[indexPath.row])"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

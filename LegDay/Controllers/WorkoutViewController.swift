//
//  WorkoutViewController.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import UIKit

class WorkoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("WorkoutVC")
        self.view.backgroundColor = .systemYellow
        tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import UIKit

class HomeViewController: UIViewController {

    let homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(homeView)
        setupViewLayout(yourView: homeView)
        
    }


}


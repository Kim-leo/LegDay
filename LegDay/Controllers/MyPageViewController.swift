//
//  MyPageViewController.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import UIKit

class MyPageViewController: UIViewController {

    let myPageView = MyPageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(myPageView)
        setupViewLayout(yourView: myPageView)
        
    }
    
   

}

//
//  DescriptionViewController.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import UIKit

class DescriptionViewController: UIViewController {

    var leftBarBtn: UIBarButtonItem {
        get {
            let btn = UIBarButtonItem(title: "돌아가기", style: .plain, target: self, action: #selector(descriptionLeftBarBtnTapped(_:)))
            btn.tintColor = .lightGray
            return btn
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.leftBarButtonItem = self.leftBarBtn
        tabBarController?.tabBar.isHidden = true
        tabBarController?.tabBar.isTranslucent = true
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "사용 설명"
        self.view.backgroundColor = .white
        
        
    }
    
}

extension DescriptionViewController {
    @objc func descriptionLeftBarBtnTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
}

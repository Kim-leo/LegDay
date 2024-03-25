//
//  ExtensionVC.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import Foundation
import UIKit

extension UIViewController {
    

    
    func setupViewLayout(yourView: UIView) {
        yourView.translatesAutoresizingMaskIntoConstraints = false
        yourView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        yourView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        yourView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        yourView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}

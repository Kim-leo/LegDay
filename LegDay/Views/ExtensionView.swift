//
//  ExtensionView.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
}

struct Colors {
    let colorArray: [UIColor] = [
    UIColor(red: 255, green: 222, blue: 255),
    UIColor(red: 222, green: 222, blue: 255),
    UIColor(red: 255, green: 255, blue: 222),
    UIColor(red: 222, green: 222, blue: 239),
    UIColor(red: 222, green: 239, blue: 255),
    UIColor(red: 222, green: 255, blue: 255),
    UIColor(red: 239, green: 222, blue: 239),
    UIColor(red: 255, green: 222, blue: 222),
    UIColor(red: 239, green: 222, blue: 222),
    UIColor(red: 255, green: 239, blue: 222),
    UIColor(red: 255, green: 222, blue: 239),
    UIColor(red: 239, green: 222, blue: 255),
    UIColor(red: 222, green: 255, blue: 239),
    UIColor(red: 239, green: 255, blue: 222),
    UIColor(red: 222, green: 255, blue: 222),
    UIColor(red: 222, green: 239, blue: 222),
    UIColor(red: 222, green: 239, blue: 239),
    UIColor(red: 239, green: 239, blue: 222)
    ]
}

extension String {
    var lastString: String {
        get {
            if self.isEmpty { return self }
            let lastIndex = self.index(before: self.endIndex)
            return String(self[lastIndex])
        }
    }
}

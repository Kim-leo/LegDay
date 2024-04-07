//
//  ExtensionVC.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import Foundation
import UIKit

extension UIViewController {
    
    func confettiAnimation() {
        let emitter = CAEmitterLayer()
        
        emitter.emitterPosition = CGPoint(
            x: view.center.x,
            y: view.center.y
        )
        
        let pokerShapeImages = ["Spade 1", "Diamond 1", "Heart 1", "Clover 1"]
        
        let cells: [CAEmitterCell] = pokerShapeImages.compactMap {
            let cell = CAEmitterCell()
            cell.scale = 0.01
            cell.emissionRange = .pi * 2
            cell.lifetime = 100
            cell.birthRate = 10
            cell.velocity = 30
            cell.contents = UIImage(named: $0)!.cgImage
            return cell
        }
        emitter.emitterCells = cells
        view.layer.addSublayer(emitter)
    }
    
    func setupViewLayout(yourView: UIView) {
        yourView.translatesAutoresizingMaskIntoConstraints = false
        yourView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        yourView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        yourView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        yourView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    func backgroundGradientColor(_ myView: UIView, topColor: CGColor, bottomColor: CGColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.colors = [bottomColor, topColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = self.view.bounds
        myView.layer.addSublayer(gradientLayer)
    }
    
}

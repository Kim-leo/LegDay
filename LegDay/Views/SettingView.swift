//
//  SettingView.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import Foundation
import UIKit

class SettingView: UIView {
    lazy var stackViewVertical: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.backgroundColor = .clear
        return sv
    }()
    
    lazy var upperView: UIView = {
        let v = UIView()
        return v
    }()
    
    lazy var upperCollectinView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 50
        layout.footerReferenceSize = .zero
        layout.headerReferenceSize = .zero
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.tag = 0
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = true
        cv.backgroundColor = .clear
        cv.register(UpperCell.self, forCellWithReuseIdentifier: "UpperCell")
        return cv
    }()
    
    lazy var lowerView: UIView = {
        let v = UIView()
        return v
    }()
    
    lazy var lowerCollectinView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.footerReferenceSize = .zero
        layout.headerReferenceSize = .zero
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.tag = 1
        cv.isPagingEnabled = true
        cv.showsVerticalScrollIndicator = true
        cv.register(LowerCell.self, forCellWithReuseIdentifier: "LowerCell")
        cv.backgroundColor = .clear
        return cv
    }()
    
    lazy var stackViewHorizontal1: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 10
        return sv
    }()
    
    lazy var stackViewHorizontal2: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 10
        return sv
    }()
    
    lazy var categoryBtns: [UIButton] = {
        var btnArr = [UIButton]()
        for num in 0...5 {
            let btn = UIButton()
            btn.tag = num
            btn.backgroundColor = .white
            btn.setTitle("\(btn.tag)", for: .normal)
            btn.setTitleColor(.darkGray, for: .normal)
            btn.tintColor = .white
            btn.layer.cornerRadius = 15
            btn.clipsToBounds = true
            btn.layer.borderColor = UIColor.darkGray.cgColor
            btn.layer.borderWidth = 1
            btnArr.append(btn)
        }
        return btnArr
    }()
    
    lazy var cancelBtnView: UIView = {
        let v = UIView()
        return v
    }()
    
    lazy var cancelBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("X", for: .normal)
        btn.setTitleColor(.darkGray, for: .normal)
        btn.backgroundColor = . white
        btn.layer.cornerRadius = 15
        btn.clipsToBounds = true
        btn.layer.borderColor = UIColor.darkGray.cgColor
        btn.layer.borderWidth = 1
        return btn
    }()
    
    lazy var verticalStackViewForSettingPokerShapes: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.backgroundColor = .clear
        return sv
    }()
    
    lazy var stackViewHorizontal3: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 10
        return sv
    }()
    
    lazy var stackViewHorizontal4: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 10
        return sv
    }()

    lazy var pokerShapeViews: [UIView] = {
        var views = [UIView]()
        for num in 0...3 {
            var view = UIView()
            view.backgroundColor = .white
            view.layer.cornerRadius = 15
            view.clipsToBounds = true
            view.layer.borderColor = UIColor.darkGray.cgColor
            view.layer.borderWidth = 1
            views.append(view)
        }
        return views
    }()
    
    lazy var pokerShapeBtns: [UIButton] = {
        var btnArr = [UIButton]()
        let pokerShapeImages = ["suit.spade.fill", "diamond.fill", "heart.fill", "suit.club.fill"]
        for num in 0...3 {
            let btn = UIButton()
            btn.tag = num
            btn.backgroundColor = .white
            btn.setBackgroundImage(UIImage(systemName: pokerShapeImages[num]), for: .normal)
            btn.imageView?.contentMode = .scaleToFill
            btn.tintColor = (num % 3 == 0) ? .black : .red
            btnArr.append(btn)
        }
        return btnArr
    }()
    
    lazy var pokerWorkoutNameLabels: [UILabel] = {
        var labelArr = [UILabel]()
        for num in 0...3 {
            let label = UILabel()
            label.tag = num
            label.backgroundColor = .white
            label.textAlignment = .center
            label.textColor = .darkGray
            label.text = "\(num) sample"
            label.font = UIFont.systemFont(ofSize: 18)
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            labelArr.append(label)
        }
        return labelArr
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors().darkBlack
        [upperView, lowerView, stackViewVertical, verticalStackViewForSettingPokerShapes].map {
            self.addSubview($0)
        }
        upperView.addSubview(upperCollectinView)
        lowerView.addSubview(lowerCollectinView)
        
        
        [stackViewHorizontal1, stackViewHorizontal2, cancelBtnView].map {
            stackViewVertical.addArrangedSubview($0)
        }
        for num in 0...2 {
            stackViewHorizontal1.addArrangedSubview(categoryBtns[num])
            stackViewHorizontal2.addArrangedSubview(categoryBtns[num + 3])
        }
        cancelBtnView.addSubview(cancelBtn)
        
        [stackViewHorizontal3, stackViewHorizontal4].map {
            verticalStackViewForSettingPokerShapes.addArrangedSubview($0)
        }
        
        for i in 0...1 {
            stackViewHorizontal3.addArrangedSubview(pokerShapeViews[i])
            stackViewHorizontal4.addArrangedSubview(pokerShapeViews[i + 2])
        }
        
        for i in 0...3 {
            pokerShapeViews[i].addSubview(pokerShapeBtns[i])
            pokerShapeViews[i].addSubview(pokerWorkoutNameLabels[i])
        }
        
        stackViewVertical.alpha = 0
        verticalStackViewForSettingPokerShapes.alpha = 0
        
        viewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("뷰 초기화 에러 발생")
    }
    
    func viewLayout() {
        upperView.translatesAutoresizingMaskIntoConstraints = false
        upperView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        upperView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        .isActive = true
        upperView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        upperView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        upperCollectinView.translatesAutoresizingMaskIntoConstraints = false
        upperCollectinView.topAnchor.constraint(equalTo: upperView.topAnchor).isActive = true
        upperCollectinView.leadingAnchor.constraint(equalTo: upperView.leadingAnchor, constant: 10).isActive = true
        upperCollectinView.trailingAnchor.constraint(equalTo: upperView.trailingAnchor, constant: -10).isActive = true
        upperCollectinView.bottomAnchor.constraint(equalTo: upperView.bottomAnchor).isActive = true
        
        lowerView.translatesAutoresizingMaskIntoConstraints = false
        lowerView.topAnchor.constraint(equalTo: upperView.bottomAnchor, constant: 5).isActive = true
        lowerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        lowerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        lowerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        lowerCollectinView.translatesAutoresizingMaskIntoConstraints = false
        lowerCollectinView.topAnchor.constraint(equalTo: lowerView.topAnchor).isActive = true
        lowerCollectinView.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 10).isActive = true
        lowerCollectinView.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -10).isActive = true
        lowerCollectinView.bottomAnchor.constraint(equalTo: lowerView.bottomAnchor).isActive = true
        
        stackViewVertical.translatesAutoresizingMaskIntoConstraints = false
        stackViewVertical.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackViewVertical.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackViewVertical.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6).isActive = true
        stackViewVertical.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
        
        cancelBtn.translatesAutoresizingMaskIntoConstraints = false
        cancelBtn.centerXAnchor.constraint(equalTo: stackViewVertical.centerXAnchor).isActive = true
        cancelBtn.centerYAnchor.constraint(equalTo: cancelBtnView.centerYAnchor).isActive = true
        cancelBtn.widthAnchor.constraint(equalTo: cancelBtnView.widthAnchor, multiplier: 0.2).isActive = true
        cancelBtn.heightAnchor.constraint(equalTo: cancelBtn.widthAnchor).isActive = true
        
        verticalStackViewForSettingPokerShapes.translatesAutoresizingMaskIntoConstraints = false
        verticalStackViewForSettingPokerShapes.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        verticalStackViewForSettingPokerShapes.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        verticalStackViewForSettingPokerShapes.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        verticalStackViewForSettingPokerShapes.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        
        for i in 0...3 {
            pokerShapeBtns[i].translatesAutoresizingMaskIntoConstraints = false
            pokerShapeBtns[i].leadingAnchor.constraint(equalTo: pokerShapeViews[i].leadingAnchor).isActive = true
            pokerShapeBtns[i].trailingAnchor.constraint(equalTo: pokerShapeViews[i].trailingAnchor).isActive = true
            pokerShapeBtns[i].topAnchor.constraint(equalTo: pokerShapeViews[i].topAnchor).isActive = true
            pokerShapeBtns[i].heightAnchor.constraint(equalTo: pokerShapeViews[i].heightAnchor, multiplier: 0.7).isActive = true
            
            pokerWorkoutNameLabels[i].translatesAutoresizingMaskIntoConstraints = false
            pokerWorkoutNameLabels[i].centerXAnchor.constraint(equalTo: pokerShapeViews[i].centerXAnchor).isActive = true
            pokerWorkoutNameLabels[i].widthAnchor.constraint(equalTo: pokerShapeViews[i].widthAnchor, multiplier: 0.9).isActive = true
            pokerWorkoutNameLabels[i].topAnchor.constraint(equalTo: pokerShapeBtns[i].bottomAnchor).isActive = true
            pokerWorkoutNameLabels[i].bottomAnchor.constraint(equalTo: pokerShapeViews[i].bottomAnchor).isActive = true
        }
    }
}

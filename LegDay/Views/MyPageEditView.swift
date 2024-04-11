//
//  MyPageEdit.swift
//  LegDay
//
//  Created by 김승현 on 4/11/24.
//

import Foundation
import UIKit

class MyPageEditView: UIView {
    lazy var titleTextField: UITextField = {
        let tf = UITextField()
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.backgroundColor = .systemGray6
        tf.textColor = .black
        tf.layer.cornerRadius = 5
        tf.layer.masksToBounds = true

        return tf
    }()
    
    lazy var upperCollectinView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.footerReferenceSize = .zero
        layout.headerReferenceSize = .zero
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.tag = 0
        cv.isPagingEnabled = false
        cv.showsHorizontalScrollIndicator = false
        cv.register(UpperCell.self, forCellWithReuseIdentifier: "UpperCell")
        cv.backgroundColor = .clear
        return cv
    }()
    
    lazy var thinDividingLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    lazy var lowerCollectinView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.footerReferenceSize = .zero
        layout.headerReferenceSize = .zero
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.tag = 1
        cv.isPagingEnabled = false
        cv.showsVerticalScrollIndicator = true
        cv.register(LowerCell.self, forCellWithReuseIdentifier: "LowerCell")
        cv.backgroundColor = .clear
        cv.layer.borderColor = UIColor.lightGray.cgColor
        return cv
    }()
    
    lazy var backgroundAlphaView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    lazy var backgroundTransparentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var pokerCardBigStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.backgroundColor = .clear
        return sv
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
        self.backgroundColor = .white
        self.addSubview(titleTextField)
        self.addSubview(upperCollectinView)
        self.addSubview(thinDividingLine)
        self.addSubview(lowerCollectinView)
        self.addSubview(backgroundAlphaView)
        self.addSubview(backgroundTransparentView)
        backgroundTransparentView.addSubview(pokerCardBigStackView)
        pokerCardBigStackView.addArrangedSubview(stackViewHorizontal1)
        pokerCardBigStackView.addArrangedSubview(stackViewHorizontal2)
        for i in 0...1 {
            stackViewHorizontal1.addArrangedSubview(pokerShapeViews[i])
            stackViewHorizontal2.addArrangedSubview(pokerShapeViews[i+2])
        }
        
        for i in 0...3 {
            pokerShapeViews[i].addSubview(pokerShapeBtns[i])
            pokerShapeViews[i].addSubview(pokerWorkoutNameLabels[i])
        }
        viewLayout()
        
        backgroundAlphaView.alpha = 0
        backgroundTransparentView.alpha = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("뷰 초기화 에러 발생!")
    }
    
    func viewLayout() {
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        titleTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        titleTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        upperCollectinView.translatesAutoresizingMaskIntoConstraints = false
        upperCollectinView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 10).isActive = true
        upperCollectinView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -2).isActive = true
        upperCollectinView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 2).isActive = true
        upperCollectinView.heightAnchor.constraint(equalTo: titleTextField.heightAnchor, multiplier: 1.2).isActive = true
        
        thinDividingLine.translatesAutoresizingMaskIntoConstraints = false
        thinDividingLine.topAnchor.constraint(equalTo: upperCollectinView.bottomAnchor, constant: 5).isActive = true
        thinDividingLine.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        thinDividingLine.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        thinDividingLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        lowerCollectinView.translatesAutoresizingMaskIntoConstraints = false
        lowerCollectinView.topAnchor.constraint(equalTo: thinDividingLine.bottomAnchor, constant: 10).isActive = true
        lowerCollectinView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        lowerCollectinView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        lowerCollectinView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        backgroundAlphaView.translatesAutoresizingMaskIntoConstraints = false
        backgroundAlphaView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundAlphaView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backgroundAlphaView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backgroundAlphaView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        backgroundTransparentView.translatesAutoresizingMaskIntoConstraints = false
        backgroundTransparentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundTransparentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backgroundTransparentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backgroundTransparentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        pokerCardBigStackView.translatesAutoresizingMaskIntoConstraints = false
        pokerCardBigStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pokerCardBigStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        pokerCardBigStackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6).isActive = true
        pokerCardBigStackView.heightAnchor.constraint(equalTo: pokerCardBigStackView.widthAnchor, multiplier: 1.2).isActive = true
        
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


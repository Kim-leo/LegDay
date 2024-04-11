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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(titleTextField)
        self.addSubview(upperCollectinView)
        self.addSubview(thinDividingLine)
        self.addSubview(lowerCollectinView)
        viewLayout()
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
    }
}


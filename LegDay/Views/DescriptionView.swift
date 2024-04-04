
//
//  ViewForAboutTheAppVC.swift
//  DeckOfCardsWorkout2
//
//  Created by 김승현 on 3/8/24.
//

import Foundation
import UIKit

class DescriptionView: UIView {
    
    lazy var stackViewFor3Btns: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 20
        sv.backgroundColor = .clear
        return sv
    }()
    
    lazy var descriptionBtns: [UIButton] = {
        var btnArr = [UIButton]()
        let btnTitleArr = ["레그 데이", 
                           "운동 시작",
                           "운동 설정",
                           "마이 운동"]
        let btnImageArr = [UIImage(named: "AppIcon"),
                           UIImage(systemName: "figure.strengthtraining.functional"),
                           UIImage(systemName: "figure.mind.and.body"),
                           UIImage(systemName: "person.fill")]
        for num in 0...3 {
            let btn = UIButton()
            btn.tag = num
            btn.setTitle("\(btnTitleArr[num])", for: .normal)
            btn.backgroundColor = .white
            btn.setTitleColor(Colors().darkBlack, for: .normal)
            btn.setImage(btnImageArr[num], for: .normal)
            btn.imageView?.contentMode = .scaleAspectFit
            btn.tintColor = Colors().softRedColor
            btn.layer.cornerRadius = 10
            btn.clipsToBounds = true
            btn.layer.borderColor = UIColor.darkGray.cgColor
            btn.layer.borderWidth = 1
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            btnArr.append(btn)
        }
        return btnArr
    }()
    
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors().darkBlack
        return view
    }()

    lazy var xBtn: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(.darkGray, for: .normal)
        btn.setTitle("X", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        btn.tintColor = .black
        btn.backgroundColor = .clear
        return btn
    }()
    
    lazy var descripTionCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.footerReferenceSize = .zero
        layout.headerReferenceSize = .zero
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.tag = 0
        cv.isScrollEnabled = false
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.register(DescriptionCell.self, forCellWithReuseIdentifier: "DescriptionCell")
        cv.backgroundColor = .clear
        return cv
    }()
    
    lazy var bottomMiniStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        return sv
    }()
    
    lazy var leftBtn: UIButton = {
        let btn = UIButton()
        btn.tag = 0
        btn.setTitleColor(.darkGray, for: .normal)
        btn.setTitle("<", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        btn.tintColor = .black
        return btn
    }()
    
    lazy var rightBtn: UIButton = {
        let btn = UIButton()
        btn.tag = 1
        btn.setTitleColor(.darkGray, for: .normal)
        btn.setTitle(">", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        btn.tintColor = .black
        return btn
    }()
    
    lazy var pageControlBar: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = .white
        pc.currentPageIndicatorTintColor = Colors().softRedColor
        return pc
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors().darkBlack
        self.addSubview(stackViewFor3Btns)
        self.addSubview(backgroundView)
        backgroundView.addSubview(xBtn)
        backgroundView.addSubview(descripTionCollectionView)
        backgroundView.addSubview(bottomMiniStackView)
        
        bottomMiniStackView.addArrangedSubview(leftBtn)
        bottomMiniStackView.addArrangedSubview(pageControlBar)
        bottomMiniStackView.addArrangedSubview(rightBtn)
        
        for i in descriptionBtns {
            stackViewFor3Btns.addArrangedSubview(i)
        }
        
        backgroundView.alpha = 0
   
        viewLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("뷰 초기화 에러 발생!")
    }
    
    func viewLayout() {
        stackViewFor3Btns.translatesAutoresizingMaskIntoConstraints = false
        stackViewFor3Btns.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackViewFor3Btns.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackViewFor3Btns.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        stackViewFor3Btns.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4).isActive = true
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        descripTionCollectionView.translatesAutoresizingMaskIntoConstraints = false
        descripTionCollectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        descripTionCollectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        descripTionCollectionView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        descripTionCollectionView.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.8).isActive = true
        
        xBtn.translatesAutoresizingMaskIntoConstraints = false
        xBtn.topAnchor.constraint(equalTo: backgroundView.topAnchor).isActive = true
        xBtn.trailingAnchor.constraint(equalTo: descripTionCollectionView.trailingAnchor).isActive = true
        xBtn.bottomAnchor.constraint(equalTo: descripTionCollectionView.topAnchor).isActive = true
        xBtn.widthAnchor.constraint(equalTo: xBtn.heightAnchor).isActive = true
        
        bottomMiniStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomMiniStackView.topAnchor.constraint(equalTo: descripTionCollectionView.bottomAnchor).isActive = true
        bottomMiniStackView.leadingAnchor.constraint(equalTo: descripTionCollectionView.leadingAnchor).isActive = true
        bottomMiniStackView.trailingAnchor.constraint(equalTo: descripTionCollectionView.trailingAnchor).isActive = true
        bottomMiniStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        leftBtn.translatesAutoresizingMaskIntoConstraints = false
        leftBtn.widthAnchor.constraint(equalTo: bottomMiniStackView.widthAnchor, multiplier: 0.15).isActive = true
        
        pageControlBar.translatesAutoresizingMaskIntoConstraints = false
        pageControlBar.widthAnchor.constraint(equalTo: bottomMiniStackView.widthAnchor, multiplier: 0.7).isActive = true
        
        rightBtn.translatesAutoresizingMaskIntoConstraints = false
        rightBtn.widthAnchor.constraint(equalTo: bottomMiniStackView.widthAnchor, multiplier: 0.15).isActive = true
    }
    
}

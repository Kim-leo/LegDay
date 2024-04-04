//
//  StatsView.swift
//  LegDay
//
//  Created by 김승현 on 4/4/24.
//

import Foundation
import UIKit

class StatsView: UIView {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "통계"
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var guideLabel: UILabel = {
        let label = UILabel()
        label.text = "최대 횟수 별 운동 기록"
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    lazy var maxNumStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.layer.borderColor = UIColor.lightGray.cgColor
        sv.layer.borderWidth = 1
        return sv
    }()
    
    lazy var eachStatsBtns: [UIButton] = {
        var btns = [UIButton]()
        let maxNumbersArray = ["5", "6", "7", "8", "9", "10", "J", "Q", "K"]
        for i in 0..<9 {
            let btn = UIButton()
            btn.tag = i
            btn.setTitle(maxNumbersArray[i], for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.backgroundColor = .clear
            btns.append(btn)
        }
        return btns
    }()
    
    lazy var eachStatsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.footerReferenceSize = .zero
        layout.headerReferenceSize = .zero
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.tag = 1
        cv.isScrollEnabled = false
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.register(EachStatsCell.self, forCellWithReuseIdentifier: "EachStatsCell")
        cv.backgroundColor = .white
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors().darkBlack
        self.addSubview(guideLabel)
        self.addSubview(maxNumStackView)
        for i in 0..<9 {
            maxNumStackView.addArrangedSubview(eachStatsBtns[i])
        }
        eachStatsBtns[0].setTitleColor(Colors().redColor, for: .normal)
        self.addSubview(eachStatsCollectionView)
        viewLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("뷰 초기화 에러 발생!")
    }
    
    func viewLayout() {
        guideLabel.translatesAutoresizingMaskIntoConstraints = false
        guideLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        guideLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.95).isActive = true
        guideLabel.heightAnchor.constraint(equalTo: guideLabel.widthAnchor, multiplier: 0.1).isActive = true
        guideLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        maxNumStackView.translatesAutoresizingMaskIntoConstraints = false
        maxNumStackView.topAnchor.constraint(equalTo: guideLabel.bottomAnchor, constant: 5).isActive = true
        maxNumStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -2).isActive = true
        maxNumStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 2).isActive = true
        maxNumStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        eachStatsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        eachStatsCollectionView.topAnchor.constraint(equalTo: maxNumStackView.bottomAnchor).isActive = true
        eachStatsCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        eachStatsCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        eachStatsCollectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    
}



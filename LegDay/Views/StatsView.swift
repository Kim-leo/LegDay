//
//  StatsView.swift
//  LegDay
//
//  Created by 김승현 on 4/4/24.
//

import Foundation
import UIKit
import DGCharts

class StatsView: UIView {
    lazy var rightBarBtnItem: UIButton = {
        let btn = UIButton()
        btn.setTitle("초기화", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.frame = CGRect(x: 0, y: 0, width: 80, height: 30)
        return btn
    }()
    
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
        label.font = UIFont.systemFont(ofSize: 15)
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
    
    lazy var chartBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var pieChart: PieChartView = {
        let pc = PieChartView()
        pc.backgroundColor = .clear
        pc.centerText = "수행 횟수 기록"
        return pc
    }()
    
    lazy var transparentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var infoBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var eachStatsEntireStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        
        return sv
    }()
    
    lazy var leftStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 10
        sv.distribution = .fillEqually
        return sv
    }()
    
    lazy var rightStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 10
        sv.distribution = .fillEqually
        return sv
    }()
    
    lazy var leftStatsLabels: [UILabel] = {
        var labels = [UILabel]()
        let infoDescriptionArray = ["시작한 운동", "완료한 운동", "완료율", "최다 연속 기록"]
        for i in 0...3 {
            let label = UILabel()
            label.tag = i
            label.text = infoDescriptionArray[i]
            label.textAlignment = .left
            label.font = UIFont.systemFont(ofSize: 15)
            labels.append(label)
        }
        return labels
    }()
    
    lazy var rightStatsLabels: [UILabel] = {
        var labels = [UILabel]()
        for i in 0...3 {
            let label = UILabel()
            label.tag = i
            label.text = "\(i + 1)"
            label.textAlignment = .right
            label.font = UIFont.systemFont(ofSize: 15)
            labels.append(label)
        }
        return labels
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
        
        self.addSubview(infoBackgroundView)
        self.addSubview(chartBackgroundView)
        chartBackgroundView.addSubview(pieChart)
        chartBackgroundView.addSubview(transparentView)
        infoBackgroundView.addSubview(eachStatsEntireStackView)
        eachStatsEntireStackView.addArrangedSubview(leftStackView)
        eachStatsEntireStackView.addArrangedSubview(rightStackView)
        for tag in 0...3 {
            leftStackView.addArrangedSubview(leftStatsLabels[tag])
            rightStackView.addArrangedSubview(rightStatsLabels[tag])
        }
        
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
        
        infoBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        infoBackgroundView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        infoBackgroundView.heightAnchor.constraint(equalTo: infoBackgroundView.widthAnchor, multiplier: 0.5).isActive = true
        infoBackgroundView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        infoBackgroundView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        
        eachStatsEntireStackView.translatesAutoresizingMaskIntoConstraints = false
        eachStatsEntireStackView.widthAnchor.constraint(equalTo: infoBackgroundView.widthAnchor, multiplier: 0.9).isActive = true
        eachStatsEntireStackView.heightAnchor.constraint(equalTo: infoBackgroundView.heightAnchor, multiplier: 0.9).isActive = true
        eachStatsEntireStackView.centerXAnchor.constraint(equalTo: infoBackgroundView.centerXAnchor).isActive = true
        eachStatsEntireStackView.centerYAnchor.constraint(equalTo: infoBackgroundView.centerYAnchor).isActive = true
        
        chartBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        chartBackgroundView.topAnchor.constraint(equalTo: maxNumStackView.bottomAnchor, constant: 10).isActive = true
        chartBackgroundView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        chartBackgroundView.widthAnchor.constraint(equalTo: infoBackgroundView.widthAnchor).isActive = true
        chartBackgroundView.bottomAnchor.constraint(equalTo: infoBackgroundView.topAnchor, constant: -10).isActive = true
        
        pieChart.translatesAutoresizingMaskIntoConstraints = false
        pieChart.topAnchor.constraint(equalTo: chartBackgroundView.topAnchor).isActive = true
        pieChart.leadingAnchor.constraint(equalTo: chartBackgroundView.leadingAnchor).isActive = true
        pieChart.trailingAnchor.constraint(equalTo: chartBackgroundView.trailingAnchor).isActive = true
        pieChart.bottomAnchor.constraint(equalTo: chartBackgroundView.bottomAnchor).isActive = true
        
        transparentView.translatesAutoresizingMaskIntoConstraints = false
        transparentView.topAnchor.constraint(equalTo: chartBackgroundView.topAnchor).isActive = true
        transparentView.leadingAnchor.constraint(equalTo: chartBackgroundView.leadingAnchor).isActive = true
        transparentView.trailingAnchor.constraint(equalTo: chartBackgroundView.trailingAnchor).isActive = true
        transparentView.bottomAnchor.constraint(equalTo: chartBackgroundView.bottomAnchor).isActive = true
    }
    
    
}



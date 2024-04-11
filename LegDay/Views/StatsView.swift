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
    lazy var backgroundGradientView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var rightBarBtnItem: UIButton = {
        let btn = UIButton()
        btn.setTitle("초기화", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.frame = CGRect(x: 0, y: 0, width: 80, height: 30)
        return btn
    }()
    
    lazy var backgroundScrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .clear
        return sv
    }()
    
    lazy var backgroundContentView: UIView = {
        let view = UIView()
//        view.backgroundColor = .clear
        return view
    }()

    lazy var backGroundTransparentView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    lazy var backgroundViewForAlertView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var alertView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    lazy var alertMessageLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors().darkBlack
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "이 페이지의 기록을 초기화 할까요?" + "\n\n" + "초기화 후에는 되돌릴 수 없습니다."
        return label
    }()
    
    lazy var alertBtnStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .center
        sv.distribution = .fillEqually
        return sv
    }()
    
    lazy var alertCancelBtn: UIButton = {
        let btn = UIButton()
        btn.tag = 0
        btn.setTitle("취소", for: .normal)
        btn.setTitleColor(Colors().softBlack, for: .normal)
        btn.backgroundColor = .clear
        return btn
    }()
    
    lazy var alertOkBtn: UIButton = {
        let btn = UIButton()
        btn.tag = 1
        btn.setTitle("초기화", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = Colors().softBlack
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
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
        let infoDescriptionArray = ["시작한 운동", "완료한 운동", "완료율", "최다 연속 기록", "평균 운동 시간"]
        for i in 0...4 {
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
        for i in 0...4 {
            let label = UILabel()
            label.tag = i
            label.text = "\(i + 1)"
            label.textAlignment = .right
            label.font = UIFont.systemFont(ofSize: 15)
            labels.append(label)
        }
        return labels
    }()
    
    lazy var initializingCompleteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var initializingCompleteImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "tray")
        iv.tintColor = Colors().redColor
        return iv
    }()
    
    lazy var initializingCompleteLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors().redColor
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "기록 초기화 완료"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(backgroundScrollView)
        backgroundScrollView.addSubview(backgroundContentView)
        backgroundContentView.addSubview(backgroundGradientView)
        backgroundContentView.addSubview(guideLabel)
        backgroundContentView.addSubview(maxNumStackView)
        
//        self.addSubview(backgroundGradientView)
//        self.addSubview(guideLabel)
//        self.addSubview(maxNumStackView)
        for i in 0..<9 {
            maxNumStackView.addArrangedSubview(eachStatsBtns[i])
        }
        eachStatsBtns[0].setTitleColor(Colors().redColor, for: .normal)
        
        backgroundContentView.addSubview(infoBackgroundView)
        backgroundContentView.addSubview(chartBackgroundView)
//        self.addSubview(infoBackgroundView)
//        self.addSubview(chartBackgroundView)
        chartBackgroundView.addSubview(pieChart)
        chartBackgroundView.addSubview(transparentView)
        infoBackgroundView.addSubview(eachStatsEntireStackView)
        eachStatsEntireStackView.addArrangedSubview(leftStackView)
        eachStatsEntireStackView.addArrangedSubview(rightStackView)
        for tag in 0...4 {
            leftStackView.addArrangedSubview(leftStatsLabels[tag])
            rightStackView.addArrangedSubview(rightStatsLabels[tag])
        }
        
        self.addSubview(backGroundTransparentView)
        self.addSubview(backgroundViewForAlertView)
//        self.addSubview(backGroundTransparentView)
//        self.addSubview(backgroundViewForAlertView)
        backgroundViewForAlertView.addSubview(alertView)
        alertView.addSubview(alertMessageLabel)
        alertView.addSubview(alertBtnStackView)
        alertBtnStackView.addArrangedSubview(alertOkBtn)
        alertBtnStackView.addArrangedSubview(alertCancelBtn)
        backGroundTransparentView.alpha = 0
        backgroundViewForAlertView.alpha = 0
        
        self.addSubview(initializingCompleteView)
//        self.addSubview(initializingCompleteView)
        initializingCompleteView.addSubview(initializingCompleteImageView)
        initializingCompleteView.addSubview(initializingCompleteLabel)
        initializingCompleteView.alpha = 0
        
       
                
        viewLayout()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("뷰 초기화 에러 발생!")
    }
    
    func viewLayout() {
        backgroundScrollView.translatesAutoresizingMaskIntoConstraints = false
        backgroundScrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backgroundScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backgroundScrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        backgroundContentView.translatesAutoresizingMaskIntoConstraints = false
        backgroundContentView.topAnchor.constraint(equalTo: backgroundScrollView.topAnchor).isActive = true
        backgroundContentView.leadingAnchor.constraint(equalTo: backgroundScrollView.leadingAnchor).isActive = true
        backgroundContentView.trailingAnchor.constraint(equalTo: backgroundScrollView.trailingAnchor).isActive = true
        backgroundContentView.bottomAnchor.constraint(equalTo: backgroundScrollView.bottomAnchor).isActive = true
        backgroundContentView.widthAnchor.constraint(equalTo: backgroundScrollView.widthAnchor).isActive = true
        backgroundContentView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.1).isActive = true
        
        backgroundGradientView.translatesAutoresizingMaskIntoConstraints = false
        backgroundGradientView.topAnchor.constraint(equalTo: backgroundContentView.topAnchor).isActive = true
        backgroundGradientView.leadingAnchor.constraint(equalTo: backgroundContentView.leadingAnchor).isActive = true
        backgroundGradientView.trailingAnchor.constraint(equalTo: backgroundContentView.trailingAnchor).isActive = true
        backgroundGradientView.bottomAnchor.constraint(equalTo: backgroundContentView.bottomAnchor).isActive = true
        
        guideLabel.translatesAutoresizingMaskIntoConstraints = false
        guideLabel.topAnchor.constraint(equalTo: backgroundContentView.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        guideLabel.widthAnchor.constraint(equalTo: backgroundContentView.widthAnchor, multiplier: 0.95).isActive = true
        guideLabel.heightAnchor.constraint(equalTo: guideLabel.widthAnchor, multiplier: 0.1).isActive = true
        guideLabel.centerXAnchor.constraint(equalTo: backgroundContentView.centerXAnchor).isActive = true
        
        maxNumStackView.translatesAutoresizingMaskIntoConstraints = false
        maxNumStackView.topAnchor.constraint(equalTo: guideLabel.bottomAnchor, constant: 5).isActive = true
        maxNumStackView.leadingAnchor.constraint(equalTo: backgroundContentView.leadingAnchor, constant: -2).isActive = true
        maxNumStackView.trailingAnchor.constraint(equalTo: backgroundContentView.trailingAnchor, constant: 2).isActive = true
        maxNumStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        chartBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        chartBackgroundView.topAnchor.constraint(equalTo: maxNumStackView.bottomAnchor, constant: 20).isActive = true
        chartBackgroundView.centerXAnchor.constraint(equalTo: backgroundContentView.centerXAnchor).isActive = true
        chartBackgroundView.widthAnchor.constraint(equalTo: infoBackgroundView.widthAnchor).isActive = true
        chartBackgroundView.heightAnchor.constraint(equalTo: chartBackgroundView.widthAnchor, multiplier: 0.8).isActive = true
        
        pieChart.translatesAutoresizingMaskIntoConstraints = false
        pieChart.topAnchor.constraint(equalTo: chartBackgroundView.topAnchor).isActive = true
        pieChart.leadingAnchor.constraint(equalTo: chartBackgroundView.leadingAnchor).isActive = true
        pieChart.trailingAnchor.constraint(equalTo: chartBackgroundView.trailingAnchor).isActive = true
        pieChart.bottomAnchor.constraint(equalTo: chartBackgroundView.bottomAnchor).isActive = true
        
        infoBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        infoBackgroundView.topAnchor.constraint(equalTo: chartBackgroundView.bottomAnchor, constant: 20).isActive = true
        infoBackgroundView.widthAnchor.constraint(equalTo: backgroundContentView.widthAnchor, multiplier: 0.9).isActive = true
        infoBackgroundView.heightAnchor.constraint(equalTo: chartBackgroundView.heightAnchor, multiplier: 0.7).isActive = true
        infoBackgroundView.centerXAnchor.constraint(equalTo: backgroundContentView.centerXAnchor).isActive = true
//        infoBackgroundView.bottomAnchor.constraint(equalTo: backgroundContentView.bottomAnchor, constant: -5).isActive = true
        
        eachStatsEntireStackView.translatesAutoresizingMaskIntoConstraints = false
        eachStatsEntireStackView.widthAnchor.constraint(equalTo: infoBackgroundView.widthAnchor, multiplier: 0.9).isActive = true
        eachStatsEntireStackView.heightAnchor.constraint(equalTo: infoBackgroundView.heightAnchor, multiplier: 0.9).isActive = true
        eachStatsEntireStackView.centerXAnchor.constraint(equalTo: infoBackgroundView.centerXAnchor).isActive = true
        eachStatsEntireStackView.centerYAnchor.constraint(equalTo: infoBackgroundView.centerYAnchor).isActive = true
        
//        chartBackgroundView.translatesAutoresizingMaskIntoConstraints = false
//        chartBackgroundView.topAnchor.constraint(equalTo: maxNumStackView.bottomAnchor, constant: 10).isActive = true
//        chartBackgroundView.centerXAnchor.constraint(equalTo: backgroundContentView.centerXAnchor).isActive = true
//        chartBackgroundView.widthAnchor.constraint(equalTo: infoBackgroundView.widthAnchor).isActive = true
//        chartBackgroundView.bottomAnchor.constraint(equalTo: infoBackgroundView.topAnchor, constant: -10).isActive = true
        
        transparentView.translatesAutoresizingMaskIntoConstraints = false
        transparentView.topAnchor.constraint(equalTo: chartBackgroundView.topAnchor).isActive = true
        transparentView.leadingAnchor.constraint(equalTo: chartBackgroundView.leadingAnchor).isActive = true
        transparentView.trailingAnchor.constraint(equalTo: chartBackgroundView.trailingAnchor).isActive = true
        transparentView.bottomAnchor.constraint(equalTo: chartBackgroundView.bottomAnchor).isActive = true
        
        backGroundTransparentView.translatesAutoresizingMaskIntoConstraints = false
        backGroundTransparentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backGroundTransparentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backGroundTransparentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backGroundTransparentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        backgroundViewForAlertView.translatesAutoresizingMaskIntoConstraints = false
        backgroundViewForAlertView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundViewForAlertView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backgroundViewForAlertView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backgroundViewForAlertView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        alertView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        alertView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        alertView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        
        alertMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        alertMessageLabel.topAnchor.constraint(equalTo: alertView.topAnchor).isActive = true
        alertMessageLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor).isActive = true
        alertMessageLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor).isActive = true
        alertMessageLabel.heightAnchor.constraint(equalTo: alertView.heightAnchor, multiplier: 0.6).isActive = true
        
        alertBtnStackView.translatesAutoresizingMaskIntoConstraints = false
        alertBtnStackView.widthAnchor.constraint(equalTo: alertView.widthAnchor, multiplier: 0.9).isActive = true
        alertBtnStackView.centerXAnchor.constraint(equalTo: alertView.centerXAnchor).isActive = true
        alertBtnStackView.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -10).isActive = true
        alertBtnStackView.topAnchor.constraint(equalTo: alertMessageLabel.bottomAnchor, constant: 5).isActive = true
        
        alertOkBtn.translatesAutoresizingMaskIntoConstraints = false
        alertOkBtn.widthAnchor.constraint(equalTo: alertBtnStackView.widthAnchor).isActive = true
        alertOkBtn.heightAnchor.constraint(equalTo: alertBtnStackView.heightAnchor, multiplier: 0.5).isActive = true
        
        alertCancelBtn.translatesAutoresizingMaskIntoConstraints = false
        alertCancelBtn.widthAnchor.constraint(equalTo: alertBtnStackView.widthAnchor).isActive = true
        alertCancelBtn.heightAnchor.constraint(equalTo: alertBtnStackView.heightAnchor, multiplier: 0.5).isActive = true
        
        initializingCompleteView.translatesAutoresizingMaskIntoConstraints = false
        initializingCompleteView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        initializingCompleteView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        initializingCompleteView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        initializingCompleteView.heightAnchor.constraint(equalTo: initializingCompleteView.widthAnchor, multiplier: 0.7).isActive = true
        
        initializingCompleteImageView.translatesAutoresizingMaskIntoConstraints = false
        initializingCompleteImageView.topAnchor.constraint(equalTo: initializingCompleteView.topAnchor, constant: 10).isActive = true
        initializingCompleteImageView.centerXAnchor.constraint(equalTo: initializingCompleteView.centerXAnchor).isActive = true
        initializingCompleteImageView.heightAnchor.constraint(equalTo: initializingCompleteView.heightAnchor, multiplier: 0.4).isActive = true
        initializingCompleteImageView.widthAnchor.constraint(equalTo: initializingCompleteImageView.heightAnchor).isActive = true
        
        initializingCompleteLabel.translatesAutoresizingMaskIntoConstraints = false
        initializingCompleteLabel.bottomAnchor.constraint(equalTo: initializingCompleteView.bottomAnchor, constant: -10).isActive = true
        initializingCompleteLabel.heightAnchor.constraint(equalTo: initializingCompleteImageView.heightAnchor).isActive = true
        initializingCompleteLabel.widthAnchor.constraint(equalTo: initializingCompleteView.widthAnchor, multiplier: 0.9).isActive = true
        initializingCompleteLabel.centerXAnchor.constraint(equalTo: initializingCompleteView.centerXAnchor).isActive = true
    }
    
    
}



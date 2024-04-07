//
//  SettingView.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import Foundation
import UIKit

class SettingView: UIView {
    lazy var backgroundGradientView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var leftBarBtnItem: UIButton = {
        let btn = UIButton()
        btn.setTitle("삭제", for: .normal)
        btn.setTitleColor(Colors().softRedColor, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.frame = CGRect(x: 0, y: 0, width: 80, height: 30)
        return btn
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "운동 설정"
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var rightBarBtnItem: UIButton = {
        let btn = UIButton()
        btn.setTitle("세트 저장", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.frame = CGRect(x: 0, y: 0, width: 80, height: 30)
        return btn
    }()
    
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
    
    lazy var backGroundTransparentView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    lazy var backgroundViewForSettingPokerShapes: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
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
    
    lazy var setPokerShapeStackView: UIStackView = {
        let sv = UIStackView()
        sv.backgroundColor = .systemGray6
        sv.axis = .horizontal
        sv.alignment = .center
        sv.spacing = 5
        sv.distribution = .fillEqually
        return sv
    }()
    
    lazy var setPokerShapeEachView: [UIView] = {
        var views = [UIView]()
        for i in 0...3 {
            let view = UIView()
            views.append(view)
        }
        return views
    }()
    
    lazy var setPokerShapeLabel: [UILabel] = {
        var labels = [UILabel]()
        for i in 0...3 {
            let label = UILabel()
            label.tag = i
            label.textAlignment = .center
            label.numberOfLines = 1
            label.lineBreakMode = .byWordWrapping
            label.text = ""
            label.font = UIFont.systemFont(ofSize: 13)
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.3
            label.textColor = (i % 3 == 0) ? .black : .red
            labels.append(label)
        }
        return labels
    }()
    
    lazy var setPokerShapeImage: [UIImageView] = {
        var imageViews = [UIImageView]()
        let pokerShapeImages = ["suit.spade.fill", "diamond.fill", "heart.fill", "suit.club.fill"]
        for i in 0...3 {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFit
            iv.image = UIImage(systemName: pokerShapeImages[i])
            iv.tintColor = (i % 3 == 0) ? .black : .red
            imageViews.append(iv)
        }
        return imageViews
    }()
    
    lazy var alertView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var alertMessageLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors().darkBlack
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "샘플 텍스트 알림입니다."
        return label
    }()
    
    lazy var alertTextField: UITextField = {
        let tf = UITextField()
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.backgroundColor = .systemGray6
        tf.layer.cornerRadius = 5
        tf.layer.masksToBounds = true
        tf.layer.borderColor = UIColor.darkGray.cgColor
        tf.layer.borderWidth = 1
        return tf
    }()
    
    lazy var alertBtnStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .bottom
        sv.spacing = 10
        sv.distribution = .fillEqually
        return sv
    }()
    
    lazy var alertCancelBtn: UIButton = {
        let btn = UIButton()
        btn.tag = 0
        btn.setTitle("취소", for: .normal)
        btn.setTitleColor(Colors().softBlack, for: .normal)
        btn.backgroundColor = .systemGray6
        btn.layer.cornerRadius = 5
        btn.layer.masksToBounds = true
        return btn
    }()
    
    lazy var alertOkBtn: UIButton = {
        let btn = UIButton()
        btn.tag = 1
        btn.setTitle("샘플", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = Colors().softBlack
        btn.layer.cornerRadius = 5
        btn.layer.masksToBounds = true
        return btn
    }()
    
    lazy var saveCompleteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var saveCompleteImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "checkmark.square")
        iv.tintColor = Colors().redColor
        return iv
    }()
    
    lazy var saveCompleteLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors().redColor
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "세트 저장 완료!"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(backgroundGradientView)
        self.addSubview(upperView)
        self.addSubview(lowerView)
        self.addSubview(backGroundTransparentView)
        self.addSubview(stackViewVertical)
        self.addSubview(backgroundViewForSettingPokerShapes)
//        self.addSubview(verticalStackViewForSettingPokerShapes)
        backgroundViewForSettingPokerShapes.addSubview(verticalStackViewForSettingPokerShapes)
        self.addSubview(setPokerShapeStackView)
        self.addSubview(alertView)
        self.addSubview(saveCompleteView)
        
        upperView.addSubview(upperCollectinView)
        lowerView.addSubview(lowerCollectinView)
        
        alertView.addSubview(alertTextField)
        alertView.addSubview(alertMessageLabel)
        alertView.addSubview(alertBtnStackView)
        alertBtnStackView.addArrangedSubview(alertCancelBtn)
        alertBtnStackView.addArrangedSubview(alertOkBtn)
        
        saveCompleteView.addSubview(saveCompleteImageView)
        saveCompleteView.addSubview(saveCompleteLabel)
        
        stackViewVertical.addArrangedSubview(stackViewHorizontal1)
        stackViewVertical.addArrangedSubview(stackViewHorizontal2)
        stackViewVertical.addArrangedSubview(cancelBtnView)
        
        for num in 0...2 {
            stackViewHorizontal1.addArrangedSubview(categoryBtns[num])
            stackViewHorizontal2.addArrangedSubview(categoryBtns[num + 3])
        }
        cancelBtnView.addSubview(cancelBtn)
        
        verticalStackViewForSettingPokerShapes.addArrangedSubview(stackViewHorizontal3)
        verticalStackViewForSettingPokerShapes.addArrangedSubview(stackViewHorizontal4)
        
        for i in 0...1 {
            stackViewHorizontal3.addArrangedSubview(pokerShapeViews[i])
            stackViewHorizontal4.addArrangedSubview(pokerShapeViews[i + 2])
        }
        
        for i in 0...3 {
            pokerShapeViews[i].addSubview(pokerShapeBtns[i])
            pokerShapeViews[i].addSubview(pokerWorkoutNameLabels[i])
            setPokerShapeStackView.addArrangedSubview(setPokerShapeEachView[i])
            
            setPokerShapeEachView[i].addSubview(setPokerShapeImage[i])
            setPokerShapeEachView[i].addSubview(setPokerShapeLabel[i])
        }
        
        stackViewVertical.alpha = 0
        backGroundTransparentView.alpha = 0
        backgroundViewForSettingPokerShapes.alpha = 0
//        verticalStackViewForSettingPokerShapes.alpha = 0
        alertView.alpha = 0
        saveCompleteView.alpha = 0
        
        viewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("뷰 초기화 에러 발생")
    }
    
    func viewLayout() {
        backgroundGradientView.translatesAutoresizingMaskIntoConstraints = false
        backgroundGradientView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundGradientView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backgroundGradientView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backgroundGradientView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
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
        
        setPokerShapeStackView.translatesAutoresizingMaskIntoConstraints = false
        setPokerShapeStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        setPokerShapeStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        setPokerShapeStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        setPokerShapeStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
        
        lowerView.translatesAutoresizingMaskIntoConstraints = false
        lowerView.topAnchor.constraint(equalTo: upperView.bottomAnchor, constant: 5).isActive = true
        lowerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        lowerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        lowerView.bottomAnchor.constraint(equalTo: setPokerShapeStackView.topAnchor).isActive = true
        
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
        
        
        backGroundTransparentView.translatesAutoresizingMaskIntoConstraints = false
        backGroundTransparentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backGroundTransparentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backGroundTransparentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backGroundTransparentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        backgroundViewForSettingPokerShapes.translatesAutoresizingMaskIntoConstraints = false
        backgroundViewForSettingPokerShapes.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        backgroundViewForSettingPokerShapes.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backgroundViewForSettingPokerShapes.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backgroundViewForSettingPokerShapes.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
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
        
        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        alertView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        alertView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        alertView.heightAnchor.constraint(equalTo: alertView.widthAnchor).isActive = true
        
        alertTextField.translatesAutoresizingMaskIntoConstraints = false
        alertTextField.centerYAnchor.constraint(equalTo: alertView.centerYAnchor).isActive = true
        alertTextField.centerXAnchor.constraint(equalTo: alertView.centerXAnchor).isActive = true
        alertTextField.widthAnchor.constraint(equalTo: alertView.widthAnchor, multiplier: 0.9).isActive = true
        alertTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        alertMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        alertMessageLabel.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 5).isActive = true
        alertMessageLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor).isActive = true
        alertMessageLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor).isActive = true
        alertMessageLabel.bottomAnchor.constraint(equalTo: alertTextField.topAnchor, constant: -5).isActive = true
        
        alertBtnStackView.translatesAutoresizingMaskIntoConstraints = false
        alertBtnStackView.leadingAnchor.constraint(equalTo: alertTextField.leadingAnchor).isActive = true
        alertBtnStackView.trailingAnchor.constraint(equalTo: alertTextField.trailingAnchor).isActive = true
        alertBtnStackView.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -10).isActive = true
        alertBtnStackView.topAnchor.constraint(equalTo: alertTextField.bottomAnchor, constant: 5).isActive = true
        
        alertCancelBtn.translatesAutoresizingMaskIntoConstraints = false
        alertCancelBtn.heightAnchor.constraint(equalTo: alertBtnStackView.heightAnchor, multiplier: 0.8).isActive = true
        
        alertOkBtn.translatesAutoresizingMaskIntoConstraints = false
        alertOkBtn.heightAnchor.constraint(equalTo: alertBtnStackView.heightAnchor, multiplier: 0.8).isActive = true
        
        for i in 0...3 {
            setPokerShapeImage[i].translatesAutoresizingMaskIntoConstraints = false
            setPokerShapeImage[i].topAnchor.constraint(equalTo: setPokerShapeEachView[i].topAnchor).isActive = true
            setPokerShapeImage[i].leadingAnchor.constraint(equalTo: setPokerShapeEachView[i].leadingAnchor).isActive = true
            setPokerShapeImage[i].trailingAnchor.constraint(equalTo: setPokerShapeEachView[i].trailingAnchor).isActive = true
            setPokerShapeImage[i].heightAnchor.constraint(equalTo: setPokerShapeStackView.heightAnchor, multiplier: 0.6).isActive = true
            
            setPokerShapeLabel[i].translatesAutoresizingMaskIntoConstraints = false
            setPokerShapeLabel[i].leadingAnchor.constraint(equalTo: setPokerShapeEachView[i].leadingAnchor).isActive = true
            setPokerShapeLabel[i].trailingAnchor.constraint(equalTo: setPokerShapeEachView[i].trailingAnchor).isActive = true
            setPokerShapeLabel[i].bottomAnchor.constraint(equalTo: setPokerShapeEachView[i].bottomAnchor).isActive = true
            setPokerShapeLabel[i].topAnchor.constraint(equalTo: setPokerShapeImage[i].bottomAnchor).isActive = true
            
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
        
        saveCompleteView.translatesAutoresizingMaskIntoConstraints = false
        saveCompleteView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        saveCompleteView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        saveCompleteView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        saveCompleteView.heightAnchor.constraint(equalTo: alertView.widthAnchor, multiplier: 0.7).isActive = true
        
        saveCompleteImageView.translatesAutoresizingMaskIntoConstraints = false
        saveCompleteImageView.topAnchor.constraint(equalTo: saveCompleteView.topAnchor, constant: 10).isActive = true
        saveCompleteImageView.centerXAnchor.constraint(equalTo: saveCompleteView.centerXAnchor).isActive = true
        saveCompleteImageView.heightAnchor.constraint(equalTo: saveCompleteView.heightAnchor, multiplier: 0.4).isActive = true
        saveCompleteImageView.widthAnchor.constraint(equalTo: saveCompleteImageView.heightAnchor).isActive = true
        
        saveCompleteLabel.translatesAutoresizingMaskIntoConstraints = false
        saveCompleteLabel.bottomAnchor.constraint(equalTo: saveCompleteView.bottomAnchor, constant: -10).isActive = true
        saveCompleteLabel.heightAnchor.constraint(equalTo: saveCompleteImageView.heightAnchor).isActive = true
        saveCompleteLabel.widthAnchor.constraint(equalTo: saveCompleteView.widthAnchor, multiplier: 0.9).isActive = true
        saveCompleteLabel.centerXAnchor.constraint(equalTo: saveCompleteView.centerXAnchor).isActive = true
    }
}

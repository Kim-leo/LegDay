//
//  MyWorkoutCell.swift
//  LegDay
//
//  Created by 김승현 on 3/25/24.
//

import UIKit

class MyPageCell: UITableViewCell {
    
    lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var workoutTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Menlo", size: 20)
        return label
    }()

    lazy var setPokerShapeStackView: UIStackView = {
        let sv = UIStackView()
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
    
    lazy var setPokerShapeLabel: [UILabel] = {
        var labels = [UILabel]()
        let shapeImageArray = ["Spade", "Diamond", "Heart", "Clover"]
        for i in 0...3 {
            let label = UILabel()
            label.tag = i
            label.textAlignment = .center
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.text = "\(shapeImageArray[i])"
            label.font = UIFont.systemFont(ofSize: 13)
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.3
            label.textColor = (i % 3 == 0) ? .black : .red
            labels.append(label)
        }
        return labels
    }()
    
    lazy var rightArrowImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "chevron.right")
        iv.tintColor = .lightGray
        return iv
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        self.contentView.addSubview(cellView)
        cellView.addSubview(workoutTitleLabel)
        cellView.addSubview(setPokerShapeStackView)
        for i in 0...3 {
            setPokerShapeStackView.addArrangedSubview(setPokerShapeEachView[i])
            setPokerShapeEachView[i].addSubview(setPokerShapeImage[i])
            setPokerShapeEachView[i].addSubview(setPokerShapeLabel[i])
        }
        cellView.addSubview(rightArrowImageView)
        
        
        setupLayoutForMyWorkoutCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayoutForMyWorkoutCell() {
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        workoutTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        workoutTitleLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 5).isActive = true
        workoutTitleLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -5).isActive = true
        workoutTitleLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 5).isActive = true
        workoutTitleLabel.heightAnchor.constraint(equalTo: cellView.heightAnchor, multiplier: 0.2).isActive = true
        
        setPokerShapeStackView.translatesAutoresizingMaskIntoConstraints = false
        setPokerShapeStackView.topAnchor.constraint(equalTo: workoutTitleLabel.bottomAnchor).isActive = true
        setPokerShapeStackView.leadingAnchor.constraint(equalTo: workoutTitleLabel.leadingAnchor).isActive = true
        setPokerShapeStackView.trailingAnchor.constraint(equalTo: workoutTitleLabel.trailingAnchor, constant: -10).isActive = true
        setPokerShapeStackView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -5).isActive = true
        
        rightArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        rightArrowImageView.topAnchor.constraint(equalTo: workoutTitleLabel.topAnchor).isActive = true
        rightArrowImageView.leadingAnchor.constraint(equalTo: setPokerShapeStackView.trailingAnchor).isActive = true
        rightArrowImageView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -5).isActive = true
        rightArrowImageView.bottomAnchor.constraint(equalTo: setPokerShapeStackView.bottomAnchor).isActive = true
        
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
        }
    }
    
}

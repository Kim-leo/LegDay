//
//  SelectWorkoutCell.swift
//  LegDay
//
//  Created by 김승현 on 3/25/24.
//

import UIKit

class SelectWorkoutCell: UITableViewCell {
    lazy var workoutTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Menlo", size: 17)
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
            label.font = UIFont.systemFont(ofSize: 10)
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.3
            label.textColor = (i % 3 == 0) ? .black : .red
            labels.append(label)
        }
        return labels
    }()
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .white
        self.contentView.addSubview(workoutTitleLabel)
        self.contentView.addSubview(setPokerShapeStackView)
        for i in 0...3 {
            setPokerShapeStackView.addArrangedSubview(setPokerShapeEachView[i])
            
            setPokerShapeEachView[i].addSubview(setPokerShapeImage[i])
            setPokerShapeEachView[i].addSubview(setPokerShapeLabel[i])
        }
        
        
        setupLayoutForMyWorkoutCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    func setupLayoutForMyWorkoutCell() {
        workoutTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        workoutTitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        workoutTitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.95).isActive = true
        workoutTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        workoutTitleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2).isActive = true
        
        setPokerShapeStackView.translatesAutoresizingMaskIntoConstraints = false
        setPokerShapeStackView.topAnchor.constraint(equalTo: workoutTitleLabel.bottomAnchor).isActive = true
        setPokerShapeStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        setPokerShapeStackView.widthAnchor.constraint(equalTo: workoutTitleLabel.widthAnchor).isActive = true
        setPokerShapeStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        
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

//
//  UpperCell.swift
//  LegDay
//
//  Created by 김승현 on 3/22/24.
//

import UIKit

class UpperCell: UICollectionViewCell {
    lazy var typesOfWorkoutLabel: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.layer.borderColor = UIColor.darkGray.cgColor
        label.layer.borderWidth = 1
        label.backgroundColor = .white
        label.textColor = Colors().darkBlack
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(typesOfWorkoutLabel)
        setupLayoutForUpperCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayoutForUpperCell() {
        typesOfWorkoutLabel.translatesAutoresizingMaskIntoConstraints = false
        typesOfWorkoutLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        typesOfWorkoutLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        typesOfWorkoutLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.9).isActive = true
        typesOfWorkoutLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.8).isActive = true
        
    }

    

}

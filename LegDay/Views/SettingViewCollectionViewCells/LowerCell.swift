//
//  LowerCell.swift
//  LegDay
//
//  Created by 김승현 on 3/22/24.
//

import UIKit

class LowerCell: UICollectionViewCell {
    
    lazy var typesOfWorkoutLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray6
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.3
        label.layer.masksToBounds = true
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 8
        
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
        typesOfWorkoutLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.9).isActive = true
    }
}

extension LowerCell {
    override var isSelected: Bool {
        didSet {
            if isSelected {
                typesOfWorkoutLabel.textColor = .white
                typesOfWorkoutLabel.backgroundColor = Colors().redColor
            } else {
                typesOfWorkoutLabel.textColor = Colors().darkBlack
                typesOfWorkoutLabel.backgroundColor = .white
            }
        }
    }
}

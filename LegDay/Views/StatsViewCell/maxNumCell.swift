//
//  maxNumCell.swift
//  LegDay
//
//  Created by 김승현 on 4/4/24.
//

import UIKit

class maxNumCell: UICollectionViewCell {

    lazy var eachCellLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
//        label.backgroundColor = .black
        return label
    }()
    
    lazy var underBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(eachCellLabel)
        self.contentView.addSubview(underBarView)
        setupLayoutForMaxNumCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


extension maxNumCell {
    override var isSelected: Bool {
        didSet {
            if isSelected {
                eachCellLabel.textColor = Colors().redColor
                underBarView.backgroundColor = Colors().redColor
            }
            else {
                eachCellLabel.textColor = .white
                underBarView.backgroundColor = .clear
            }
        }
    }
    
    func setupLayoutForMaxNumCell() {
        eachCellLabel.translatesAutoresizingMaskIntoConstraints = false
        eachCellLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        eachCellLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        eachCellLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        eachCellLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4).isActive = true
        
        underBarView.translatesAutoresizingMaskIntoConstraints = false
        underBarView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        underBarView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        underBarView.topAnchor.constraint(equalTo: eachCellLabel.bottomAnchor).isActive = true
        underBarView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -1).isActive = true
    }
}


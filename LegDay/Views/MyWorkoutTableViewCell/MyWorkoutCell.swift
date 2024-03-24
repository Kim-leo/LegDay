//
//  MyWorkoutCell.swift
//  LegDay
//
//  Created by 김승현 on 3/25/24.
//

import UIKit

class MyWorkoutCell: UITableViewCell {
    
    lazy var sampleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(sampleLabel)
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
        sampleLabel.translatesAutoresizingMaskIntoConstraints = false
        sampleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        sampleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        sampleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        sampleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
}

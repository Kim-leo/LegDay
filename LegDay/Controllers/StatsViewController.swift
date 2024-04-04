//
//  StatsViewController.swift
//  LegDay
//
//  Created by 김승현 on 4/4/24.
//

import UIKit

class StatsViewController: UIViewController {
    
    let statsView = StatsView()
    var viewModel = StatsViewModel.shared
    
    let colors = [UIColor.systemRed, UIColor.systemOrange, UIColor.systemYellow,
                  UIColor.systemGreen, UIColor.systemBlue, UIColor.systemPurple,
                  UIColor.systemCyan, UIColor.systemPink, UIColor.systemMint]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = statsView.titleLabel
        self.view.backgroundColor = .white
        self.view.addSubview(statsView)
        setupViewLayout(yourView: statsView)
        
        
        statsView.maxNumCollectionView.delegate = self
        statsView.maxNumCollectionView.dataSource = self
        statsView.eachStatsCollectionView.delegate = self
        statsView.eachStatsCollectionView.dataSource = self
    }

}

extension StatsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.maxNumbersArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "maxNumCell", for: indexPath) as! maxNumCell
            cell.eachCellLabel.text = "\(viewModel.maxNumbersArray[indexPath.row])"
            
            if indexPath.item == 0 {
                cell.isSelected = true
            } else {
                cell.isSelected = false
            }
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EachStatsCell", for: indexPath) as! EachStatsCell
            cell.backgroundColor = colors[indexPath.row]
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 0:
            let width = collectionView.frame.size.width / CGFloat(viewModel.maxNumbersArray.count)
            return CGSize(width: width, height: collectionView.frame.size.height)
        default:
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
        }
    }
    
}

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
    
    let colors = [UIColor.systemRed, UIColor.systemOrange, UIColor.systemYellow, UIColor.systemGreen, UIColor.systemBlue, UIColor.systemPurple, UIColor.systemPink, UIColor.systemCyan, UIColor.systemMint]
    
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
        for btn in statsView.eachStatsBtns {
            btn.addTarget(self, action: #selector(eachStatsBtnsTapped), for: .touchUpInside)
        }
        
        statsView.eachStatsCollectionView.delegate = self
        statsView.eachStatsCollectionView.dataSource = self
    }

}

extension StatsViewController {
    @objc func eachStatsBtnsTapped(_ sender: UIButton) {
        print(sender.tag)
        viewModel.eachStatsBtnTapped(statsView, sender: sender)
    }
}

extension StatsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.maxNumbersArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EachStatsCell", for: indexPath) as! EachStatsCell
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
}

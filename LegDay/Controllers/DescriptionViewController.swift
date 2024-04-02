//
//  DescriptionViewController.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import UIKit

class DescriptionViewController: UIViewController {

    let descriptionView = DescriptionView()
    var viewModel = DescriptionViewModel()
    
    var leftBarBtn: UIBarButtonItem {
        get {
            let btn = UIBarButtonItem(title: "돌아가기", style: .plain, target: self, action: #selector(descriptionLeftBarBtnTapped(_:)))
            btn.tintColor = .lightGray
            return btn
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.leftBarButtonItem = self.leftBarBtn
        tabBarController?.tabBar.isHidden = true
        tabBarController?.tabBar.isTranslucent = true
        self.title = "사용 설명"
        self.navigationController?.navigationBar.scrollEdgeAppearance?.titleTextAttributes = [.foregroundColor: UIColor.white]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(descriptionView)
        setupViewLayout(yourView: descriptionView)
        
        for btn in descriptionView.descriptionBtns {
            btn.addTarget(self, action: #selector(descriptionBtnTapped), for: .touchUpInside)
        }
        
        descriptionView.xBtn.addTarget(self, action: #selector(xBtnTapped), for: .touchUpInside)
        descriptionView.leftBtn.addTarget(self, action: #selector(leftOrRightBtnTapped), for: .touchUpInside)
        descriptionView.rightBtn.addTarget(self, action: #selector(leftOrRightBtnTapped), for: .touchUpInside)
        
        descriptionView.descripTionCollectionView.delegate = self
        descriptionView.descripTionCollectionView.dataSource = self
    }
    
}


extension DescriptionViewController {
    @objc func descriptionLeftBarBtnTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func descriptionBtnTapped(_ sender: UIButton, tag: Int) {
        viewModel.descriptionBtnsTapped(view: descriptionView, sender)

    }
    
    @objc func xBtnTapped(_ sender: UIButton, tag: Int) {
        viewModel.xBtnTapped(view: descriptionView)
        
        
    }
    
    @objc func leftOrRightBtnTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            viewModel.leftBtnTapped(view: descriptionView)
        case 1:
            viewModel.rightBtnTapped(view: descriptionView)
        default:
            break
        }
    }
}

extension DescriptionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let numberOfCells = viewModel.screenImageName[viewModel.chosenBtnTag].count
        descriptionView.pageControlBar.numberOfPages = numberOfCells
        return numberOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DescriptionCell", for: indexPath) as? DescriptionCell else { return .init() }
//        collectionView.reloadData() -> 사용 금지
        let imageName: String = "\(viewModel.screenImageName[viewModel.chosenBtnTag][indexPath.row])" + ".png"
        cell.screenImageView.image = UIImage(named: imageName)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
}

extension DescriptionViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.frame.size.width != 0 {
            let value = (scrollView.contentOffset.x / scrollView.frame.width)
            descriptionView.pageControlBar.currentPage = Int(round(value))
        }
    }
}

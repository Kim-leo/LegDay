//
//  DescriptionViewModel.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import Foundation
import UIKit

class DescriptionViewModel {
    var chosenBtnTag: Int = 0
    
    let screenImageName = [
        ["레그데이1", "레그데이2", "레그데이3", "레그데이4"],
        ["운동 설정 화면1", "운동 설정 화면2", "운동 설정 화면3", "운동 설정 화면4", "운동 설정 화면5", "운동 설정 화면6"],
        ["운동 하기 화면1", "운동 하기 화면2", "운동 하기 화면3", "운동 하기 화면4"],
        ["마이 운동 화면1"]
    ]
    
}

extension DescriptionViewModel {
    func descriptionBtnsTapped(view: DescriptionView, _ sender: UIButton) {
        view.backgroundView.alpha = 1
        
        chosenBtnTag = sender.tag
        
        view.descripTionCollectionView.reloadData()
        view.descripTionCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .left, animated: false)
    }
    
    func xBtnTapped(view: DescriptionView) {
        view.backgroundView.alpha = 0
        
    }
    
    func leftBtnTapped(view: DescriptionView) {
        view.descripTionCollectionView.scrollToItem(at: IndexPath(item: view.pageControlBar.currentPage - 1, section: 0), at: .left, animated: true)
    }
    
    func rightBtnTapped(view: DescriptionView) {
         if view.pageControlBar.currentPage != screenImageName[chosenBtnTag].count - 1 {
            view.descripTionCollectionView.scrollToItem(at: IndexPath(item: view.pageControlBar.currentPage + 1, section: 0), at: .right, animated: true)
        }
        
    }
    
    
    
}



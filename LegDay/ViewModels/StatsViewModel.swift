//
//  StatsViewModel.swift
//  LegDay
//
//  Created by 김승현 on 4/4/24.
//

import Foundation
import UIKit
import DGCharts

class StatsViewModel {
    var priceData: [Double]! = [100, 345, 20, 120, 90, 300, 450, 220, 120]
    
    static let shared = StatsViewModel()
    var myWorkoutModel = MyWorkout.shared
    
    let maxNumbersArray = ["5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    var selectMaxNumberInBtns = Int()
    
    var pieChartLabelText = String()
    let pieChartColorArray = [[UIColor.systemGreen, UIColor.darkGray], [UIColor.systemOrange, UIColor.darkGray], [Colors().redColor, UIColor.darkGray]]
    
    var numberOfWorkoutsStartedArray = [Int]()
    var numberOfWorkoutsFinishedArray = [Int]()
    var maximumOfcontinuousProgress = [Int]()
    var averageTimeInWorkingOutArray = [String]()
    var pieData: [Double] = [0, 0]
    
    func eachStatsBtnTapped(_ view: StatsView, sender: UIButton) {
        for btn in view.eachStatsBtns {
            btn.setTitleColor(.white, for: .normal)
        }
        sender.setTitleColor(Colors().redColor, for: .normal)
        
        selectMaxNumberInBtns = sender.tag
        
        workoutInfo(view)
    }
    
    func workoutInfo(_ view: StatsView) {
        getEachStatsInfoFromModel()
        showEachStatsInfoToLabels(view)
        
        caculateDataForPieChart()
        setPieData(pieChartView: view.pieChart, pieChartDataEntries: entryData(values: pieData))
    }
    
    func getEachStatsInfoFromModel() {
        numberOfWorkoutsStartedArray = myWorkoutModel.numberOfWorkoutsStartedArray
        numberOfWorkoutsFinishedArray = myWorkoutModel.numberOfWorkoutsFinishedArray
        maximumOfcontinuousProgress = myWorkoutModel.maximumOfcontinuousProgress
        averageTimeInWorkingOutArray = myWorkoutModel.averageWorkoutTimeArray
    }
    
    func showEachStatsInfoToLabels(_ view: StatsView) {
        view.rightStatsLabels[0].text = "\(numberOfWorkoutsStartedArray[selectMaxNumberInBtns]) 회"
        view.rightStatsLabels[1].text = "\(numberOfWorkoutsFinishedArray[selectMaxNumberInBtns]) 회"
        view.rightStatsLabels[3].text = "\(maximumOfcontinuousProgress[selectMaxNumberInBtns]) 회"
        view.rightStatsLabels[4].text = "\(averageTimeInWorkingOutArray[selectMaxNumberInBtns])"
        
        switch numberOfWorkoutsStartedArray[selectMaxNumberInBtns] == 0 {
        case true:
            view.pieChart.centerText = "기록이 없습니다"
            view.rightStatsLabels[2].text = "\(0)" + "%"
            break
        default:
            view.pieChart.centerText = "세트 완료 기록"
            let percentNumber = round((Double(numberOfWorkoutsFinishedArray[selectMaxNumberInBtns]) / Double(numberOfWorkoutsStartedArray[selectMaxNumberInBtns])) * 100)
            view.rightStatsLabels[2].text = "\(Int(percentNumber))" + "%"
            
        }
    }
    
    func alertViewAppears(_ view: StatsView, vc: StatsViewController) {
        view.backGroundTransparentView.alpha = 0.5
        view.backgroundViewForAlertView.alpha = 1
    }
    
    func initializingBtnTapped(_ view: StatsView, sender: UIButton) {
        switch sender.tag {
        case 1:
            myWorkoutModel.numberOfWorkoutsStartedArray[selectMaxNumberInBtns] = 0
            myWorkoutModel.numberOfWorkoutsFinishedArray[selectMaxNumberInBtns] = 0
            myWorkoutModel.maximumOfcontinuousProgress[selectMaxNumberInBtns] = 0
            myWorkoutModel.timeCountSumArray[selectMaxNumberInBtns] = 0
            myWorkoutModel.averageWorkoutTimeArray[selectMaxNumberInBtns] = "00 : 00 : 00"
            workoutInfo(view)
            view.backGroundTransparentView.alpha = 0
            view.backgroundViewForAlertView.alpha = 0
            UIView.animate(withDuration: 2) {
                view.initializingCompleteView.alpha = 1
                view.initializingCompleteView.alpha = 0
            }
            
        default:
            view.backGroundTransparentView.alpha = 0
            view.backgroundViewForAlertView.alpha = 0
            break
        }
    }
    
}

extension StatsViewModel {
    func caculateDataForPieChart() {
        let numberOfWorkoutsUnfinished = numberOfWorkoutsStartedArray[selectMaxNumberInBtns] - numberOfWorkoutsFinishedArray[selectMaxNumberInBtns]
        pieData[0] = Double(numberOfWorkoutsFinishedArray[selectMaxNumberInBtns])
        pieData[1] = Double(numberOfWorkoutsUnfinished)
    }
    
    func setPieData(pieChartView: PieChartView, pieChartDataEntries: [ChartDataEntry]) {
        let pieChartdataSet = PieChartDataSet(entries: pieChartDataEntries, label: "")
        
        pieChartdataSet.colors = pieChartColorArray[selectMaxNumberInBtns / 3]
        
        
        let pieChartData = PieChartData(dataSet: pieChartdataSet)
        pieChartView.data = pieChartData
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        pieChartData.setValueFormatter(DefaultValueFormatter(formatter:formatter))
    }
    
    func entryData(values: [Double]) -> [ChartDataEntry] {
        var pieDataEntries: [ChartDataEntry] = []
        for i in 0 ..< values.count {
            let pieDataEntry = PieChartDataEntry(value: values[i], label: ["완수", "미완수"][i], data: "" as AnyObject)
            pieDataEntries.append(pieDataEntry)
        }
        return pieDataEntries
    }
}

//
//  CardModel.swift
//  LegDay
//
//  Created by 김승현 on 3/21/24.
//

import Foundation

class CardModel {
//    let cardSet: Set<String> = ["Spade 1", "Spade 2", "Spade 3", "Spade 4", "Spade 5", "Spade 6", "Spade 7", "Spade 8", "Spade 9", "Spade 10", "Spade J", "Spade Q", "Spade K", "Heart 1", "Heart 2", "Heart 3", "Heart 4", "Heart 5", "Heart 6", "Heart 7", "Heart 8", "Heart 9", "Heart 10", "Heart J", "Heart Q", "Heart K", "Clover 1", "Clover 2", "Clover 3", "Clover 4", "Clover 5", "Clover 6", "Clover 7", "Clover 8", "Clover 9", "Clover 10", "Clover J", "Clover Q", "Clover K", "Diamond 1", "Diamond 2", "Diamond 3", "Diamond 4", "Diamond 5", "Diamond 6", "Diamond 7", "Diamond 8", "Diamond 9", "Diamond 10", "Diamond J", "Diamond Q", "Diamond K"
//    ]
    
    let cardsArrayPerShape = [
        ["Spade 1", "Spade 2", "Spade 3", "Spade 4", "Spade 5", "Spade 6", "Spade 7", "Spade 8", "Spade 9", "Spade 10", "Spade J", "Spade Q", "Spade K"],
        ["Diamond 1", "Diamond 2", "Diamond 3", "Diamond 4", "Diamond 5", "Diamond 6", "Diamond 7", "Diamond 8", "Diamond 9", "Diamond 10", "Diamond J", "Diamond Q", "Diamond K"],
        ["Heart 1", "Heart 2", "Heart 3", "Heart 4", "Heart 5", "Heart 6", "Heart 7", "Heart 8", "Heart 9", "Heart 10", "Heart J", "Heart Q", "Heart K"],
        ["Clover 1", "Clover 2", "Clover 3", "Clover 4", "Clover 5", "Clover 6", "Clover 7", "Clover 8", "Clover 9", "Clover 10", "Clover J", "Clover Q", "Clover K"]]
    
    let pokserShape = ["S", "D", "H", "C"]
    
    let cardName: String
    let myWorkout: String
    
    init(cardName: String = "카드", myWorkout: String = "Joker") {
        self.cardName = cardName
        self.myWorkout = myWorkout
    }
    
    
    
}

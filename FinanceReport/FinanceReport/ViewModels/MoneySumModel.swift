//
//  MoneySumModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 16.03.2022.
//

import Foundation

class MoneySum: Identifiable, ObservableObject {
    
    @Published var myFundsSum: Int = 0
 //   @Published var myFundsInner: Int = 0
    
 //   @Published var myDutiesInner: Int = 0
    
    @Published var myDutiesSum: Int = 0
    
    @Published var lastMonthMoneySum: Int = 0
    
    @Published var planningIncomesSum: Int = 0
    @Published var planningExpensesSum: Int = 0
    @Published var planningRemainderSum: Int = 0
    
    @Published var factIncomesSum: Int = 0
    @Published var factExpensesSum: Int = 0
    @Published var onHandsMoneySum: Int = 0
    
    
    @Published var fundsArray: [Int] = []
    
}

class Fund {
    
    var name: String
    var score: Int
    
    init(name: String = "Новый счет", score: Int = 0) {
        self.name = name
        self.score = score
    }
}

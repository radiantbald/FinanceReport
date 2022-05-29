//
//  FactViewModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 03.05.2022.
//

import Foundation

class FactViewModel: ObservableObject {
    
    static let shared = FactViewModel()
    
    @Published var factIncomesTotal: FactRemainderModel = FactRemainderModel()
    @Published var factExpensesTotal: FactRemainderModel = FactRemainderModel()
    @Published var factRemainderTotal: FactRemainderModel = FactRemainderModel()
    
    var lastMonthMoney = LastMonthViewModel.shared
    var factIncomes = FactIncomesViewModel.shared
    var factExpenses = FactExpensesViewModel.shared
    
    func factRemainderSum() -> Int {
        factRemainderTotal.score = lastMonthMoney.lastMonthMoney.score + factIncomes.sumFactIncomes() - factExpenses.sumFactExpenses()
        return factRemainderTotal.score
    }
    func setFactIncomesTotal(score: FactRemainderModel) {
        factIncomesTotal.score = score.score
    }
    func setFactExpensesTotal(score: FactRemainderModel) {
        factExpensesTotal.score = score.score
    }
    func setFactRemainderSum(score: FactRemainderModel) {
        factRemainderTotal.score = score.score
    }
}

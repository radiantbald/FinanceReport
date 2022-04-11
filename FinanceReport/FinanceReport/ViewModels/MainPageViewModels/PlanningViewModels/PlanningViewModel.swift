//
//  PlanningViewModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 10.04.2022.
//

import Foundation

class PlanningViewModel: ObservableObject {
    
    static let shared = PlanningViewModel()
    
    @Published var planningRemainder: PlanningModel = PlanningModel()
    
    var lastMonthMoney = LastMonthViewModel.shared
    var planningIncomes = PlanningIncomesViewModel.shared
    var planningExpenses = PlanningExpensesViewModel.shared
    
    func planningRemainderSum() -> Int {
        planningRemainder.score = lastMonthMoney.lastMonthMoney.score + planningIncomes.sumPlanningIncomes() - planningExpenses.sumPlanningExpenses()
        return planningRemainder.score
    }
    
    func setRemainderSum(score: PlanningModel) {
        planningRemainder.score = score.score
    }
}

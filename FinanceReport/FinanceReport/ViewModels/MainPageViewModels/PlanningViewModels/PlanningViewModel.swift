//
//  PlanningViewModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 10.04.2022.
//

import Foundation

class PlanningViewModel: ObservableObject {
    
    static let shared = PlanningViewModel()
    
    @Published var planningIncomesTotal: PlanningIncomesModel = PlanningIncomesModel()
    @Published var planningExpensesTotal: PlanningExpensesModel = PlanningExpensesModel()
    @Published var planningRemainder: PlanningModel = PlanningModel()
    
    var lastMonthMoney = LastMonthViewModel.shared
    var planningIncomes = PlanningIncomesViewModel.shared
    var planningExpenses = PlanningExpensesViewModel.shared
    
    func planningRemainderSum() -> Int {
        planningRemainder.score = lastMonthMoney.lastMonthMoney.score + planningIncomes.sumPlanningIncomes() - planningExpenses.sumPlanningExpenses()
        return planningRemainder.score
    }
    func setPlanningIncomesTotal(score: PlanningIncomesModel) {
        planningIncomesTotal.score = score.score
    }
    func setPlanningExpensesTotal(score: PlanningExpensesModel) {
        planningExpensesTotal.score = score.score
    }
    func setPlanningRemainderSum(score: PlanningModel) {
        planningRemainder.score = score.score
    }
}

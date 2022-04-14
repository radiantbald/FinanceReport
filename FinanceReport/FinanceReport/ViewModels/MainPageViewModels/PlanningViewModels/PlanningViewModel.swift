//
//  PlanningViewModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 10.04.2022.
//

import Foundation

class PlanningViewModel: ObservableObject {
    
    static let shared = PlanningViewModel()
    
    @Published var planningIncomesTotal: PlanningRemainderModel = PlanningRemainderModel()
    @Published var planningExpensesTotal: PlanningRemainderModel = PlanningRemainderModel()
    @Published var planningRemainderTotal: PlanningRemainderModel = PlanningRemainderModel()
    
    var lastMonthMoney = LastMonthViewModel.shared
    var planningIncomes = PlanningIncomesViewModel.shared
    var planningExpenses = PlanningExpensesViewModel.shared
    
    func planningRemainderSum() -> Int {
        planningRemainderTotal.score = planningIncomes.sumPlanningIncomes()
        return planningRemainderTotal.score
    }
    func setPlanningIncomesTotal(score: PlanningRemainderModel) {
        planningIncomesTotal.score = score.score
    }
    func setPlanningExpensesTotal(score: PlanningRemainderModel) {
        planningExpensesTotal.score = score.score
    }
    func setPlanningRemainderSum(score: PlanningRemainderModel) {
        planningRemainderTotal.score = score.score
    }
}

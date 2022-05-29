//
//  PlanningExpensesViewModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 10.04.2022.
//

import Foundation

class PlanningExpensesViewModel: ObservableObject {
    
    @Published var planningExpensesArray: [PlanningExpensesModel] = []
    
    static let shared = PlanningExpensesViewModel()
    private init() {}
    
    func getPlanningExpenses(id: String) -> PlanningExpensesModel? {
        
        for expense in planningExpensesArray {
            if expense.id == id {
                return expense
            }
        }
        return nil
    }
    
    func setPlanningExpenses(planningExpense: PlanningExpensesModel) {
        
        for(index, selfExpense) in planningExpensesArray.enumerated() {
            if planningExpense.id == selfExpense.id {
                planningExpensesArray[index].id = planningExpense.id
                planningExpensesArray[index].name = planningExpense.name
                planningExpensesArray[index].score = planningExpense.score
            }
        }
    }
    func sumPlanningExpenses() -> Int {
        let sumPlanningExpensesArray = planningExpensesArray.map {$0.score}
        let planningExpensesSum = sumPlanningExpensesArray.reduce(0, { x, y in x + y})
        if planningExpensesArray.isEmpty {
            return 0
        } else {
        return planningExpensesSum
        }
    }
}

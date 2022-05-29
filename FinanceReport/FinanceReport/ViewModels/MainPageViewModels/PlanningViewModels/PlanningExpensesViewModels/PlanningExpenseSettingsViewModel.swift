//
//  PlanningExpenseSettingsViewModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 17.04.2022.
//

import Foundation

class PlanningExpensesSettingsViewModel: ObservableObject {
    
    @Published var planningExpense: PlanningExpensesModel
    
    init(planningExpense: PlanningExpensesModel) {
        self.planningExpense = planningExpense
    }
}

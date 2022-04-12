//
//  PlanningIncomesSettingsViewModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 12.04.2022.
//

import Foundation

class PlanningIncomesSettingsViewModel: ObservableObject {
    
    @Published var planningIncome: PlanningIncomesModel
    
    init(planningIncome: PlanningIncomesModel){
        self.planningIncome = planningIncome
    }
}

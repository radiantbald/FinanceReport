//
//  PlanningIncomesViewModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 10.04.2022.
//

import Foundation

class PlanningIncomesViewModel: ObservableObject {

    @Published var planningIncomesArray: [PlanningIncomesModel] = []
    
    static let shared = PlanningIncomesViewModel()
    private init() {}
    
    func getPlanningIncome(id: String) -> PlanningIncomesModel? {
        
        for income in planningIncomesArray {
            if income.id == id {
                return income
            }
        }
        return nil
    }
    
    func setPlanningIncome(planningIncome: PlanningIncomesModel) {
        
        for (index, selfIncome) in planningIncomesArray.enumerated() {
            if planningIncome.id == selfIncome.id {
                planningIncomesArray[index].id = planningIncome.id
                planningIncomesArray[index].name = planningIncome.name
                planningIncomesArray[index].score = planningIncome.score
            }
        }
    }
    
    func sumPlanningIncomes() -> Int {
        
        let sumPlanningIncomesArray = planningIncomesArray.map{$0.score}
        let planningIncomesSum = sumPlanningIncomesArray.reduce(0, {x, y in x + y})
        if planningIncomesArray.isEmpty {
            return 0
        } else {
        return planningIncomesSum
        }
    }
}

//
//  PlanningIncomesViewModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 10.04.2022.
//

import Foundation

class PlanningIncomesViewModel: ObservableObject {

    @Published var planningIncomesArray: [PlanningIncomesModel] = []
    @Published var planningIncomesTotal: PlanningIncomesModel = PlanningIncomesModel()
    
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
    
    func setPlanningIncome(income: PlanningIncomesModel) {
        
        for (index, selfIncome) in planningIncomesArray.enumerated() {
            if income.id == selfIncome.id {
                planningIncomesArray[index].id = income.id
                planningIncomesArray[index].name = income.id
                planningIncomesArray[index].score = income.score
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

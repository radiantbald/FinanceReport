//
//  FactIncomesViewModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 03.05.2022.
//

import Foundation

class FactIncomesViewModel: ObservableObject {
    
    @Published var factIncomesArray: [FactIncomesModel] = []
    
    static let shared = FactIncomesViewModel()
    private init() {}
    
    func getFactIncome(id: String) -> FactIncomesModel? {
        for income in factIncomesArray {
            if income.id == id {
                return income
            }
        }
        return nil
    }
    
    func setFactIncomes(factIncome: FactIncomesModel) {
        
        for (index, selfIncome) in factIncomesArray.enumerated() {
            if factIncome.id == selfIncome.id {
                factIncomesArray[index].id = factIncome.id
                factIncomesArray[index].name = factIncome.name
                factIncomesArray[index].score = factIncome.score
            }
        }
    }
    
    func sumFactIncomes() -> Int {
        
        let sumFactIncomesArray = factIncomesArray.map{$0.score}
        let factIncomesSum = sumFactIncomesArray.reduce(0, {x, y in x + y})
        if factIncomesArray.isEmpty {
            return 0
        } else {
            return factIncomesSum
        }
    }
}

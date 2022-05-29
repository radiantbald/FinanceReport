//
//  FactExpensesViewModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 03.05.2022.
//

import Foundation

class FactExpensesViewModel: ObservableObject {
    
    @Published var factExpensesArray: [FactExpensesModel] = []
    
    static let shared = FactExpensesViewModel()
    private init() {}
    
    func getFactExpenses(id: String) -> FactExpensesModel? {
        
        for expense in factExpensesArray {
            if expense.id == id {
                return expense
            }
        }
        return nil
    }
    
    func setFactExpenses(factExpense: FactExpensesModel) {
        
        for(index, selfExpense) in factExpensesArray.enumerated() {
            if factExpense.id == selfExpense.id {
                factExpensesArray[index].id = factExpense.id
                factExpensesArray[index].name = factExpense.name
                factExpensesArray[index].score = factExpense.score
            }
        }
    }
    func sumFactExpenses() -> Int {
        let sumFactExpensesArray = factExpensesArray.map {$0.score}
        let factExpensesSum = sumFactExpensesArray.reduce(0, { x, y in x + y})
        if factExpensesArray.isEmpty {
            return 0
        } else {
        return factExpensesSum
        }
    }
}

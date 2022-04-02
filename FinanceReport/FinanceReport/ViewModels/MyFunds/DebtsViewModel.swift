//
//  DebtsViewModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 29.03.2022.
//

import Foundation

class DebtsViewModel: ObservableObject {
    
    @Published var debtsArray: [DebtModel] = []

    static let shared = DebtsViewModel()
    
    private init(){}
    
    func getDebt(id: String) -> DebtModel? {
        
        for debt in debtsArray {
            if debt.id == id {
                return debt
            }
        }
        return nil
    }
    
    func setDebt(debt: DebtModel) {
        
        for (index, selfDebt) in debtsArray.enumerated() {
            if debt.id == selfDebt.id {
                debtsArray[index].id = debt.id
                debtsArray[index].name = debt.name
                debtsArray[index].score = debt.score
            }
        }
    }
}

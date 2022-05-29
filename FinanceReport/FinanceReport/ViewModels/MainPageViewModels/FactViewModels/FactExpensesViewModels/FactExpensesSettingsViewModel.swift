//
//  FactExpensesSettingsViewModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 03.05.2022.
//

import Foundation

class FactExpensesSettingsViewModel: ObservableObject {
    
    @Published var factExpense: FactExpensesModel
    
    init(factExpense: FactExpensesModel) {
        self.factExpense = factExpense
    }
}

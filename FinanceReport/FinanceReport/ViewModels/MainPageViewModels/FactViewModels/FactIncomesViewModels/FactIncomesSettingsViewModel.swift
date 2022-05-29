//
//  FactIncomesSettingsViewModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 03.05.2022.
//

import Foundation

class FactIncomesSettingsViewModel: ObservableObject {
    
    @Published var factIncome: FactIncomesModel
    
    init(factIncome: FactIncomesModel) {
        self.factIncome = factIncome
    }
}

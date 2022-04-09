//
//  DebtSettingsViewModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 29.03.2022.
//

import Foundation

class DebtSettingsViewModel: ObservableObject {
    
    @Published var debt: DebtModel
    
    init(debt: DebtModel) {
        self.debt = debt
    }
}

//
//  LastMonthSettingsViewModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 08.04.2022.
//

import Foundation

class LastMonthSettingsViewModel: ObservableObject {
    
    @Published var lastMonthMoney: LastMonthModel
    
    init(lastMonthMoney: LastMonthModel) {
        self.lastMonthMoney = lastMonthMoney
    }
}

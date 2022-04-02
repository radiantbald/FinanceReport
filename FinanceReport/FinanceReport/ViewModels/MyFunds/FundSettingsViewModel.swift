//
//  FundSettingsViewModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 26.03.2022.
//

import Foundation

class FundSettingsViewModel: ObservableObject {
    
    @Published var fund: FundModel
    
    init(fund: FundModel) {
        self.fund = fund
    }
}

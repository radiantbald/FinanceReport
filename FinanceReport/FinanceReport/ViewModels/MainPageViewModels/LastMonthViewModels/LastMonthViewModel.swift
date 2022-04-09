//
//  LastMonthViewModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 08.04.2022.
//

import Foundation

class LastMonthViewModel: ObservableObject {
    
    static let shared = LastMonthViewModel()
    
    @Published var lastMonthMoney: LastMonthModel = LastMonthModel()
    
    func setLastMonthMoney(score: LastMonthModel) {
        lastMonthMoney.score = score.score
    }
}

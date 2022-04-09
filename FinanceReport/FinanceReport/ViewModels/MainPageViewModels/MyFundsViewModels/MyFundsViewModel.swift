//
//  MyFundsViewModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 29.03.2022.
//

import Foundation
import SwiftUI

class MyFundsViewModel: ObservableObject {
    
    static let shared = MyFundsViewModel()
    
    @Published var totalFunds: MyFundsModel = MyFundsModel()
    
    var fundsViewModel = FundsViewModel.shared
    var debtsViewModel = DebtsViewModel.shared
    
    func myFundsSum() -> Int {
        totalFunds.score = fundsViewModel.sumFunds() - debtsViewModel.sumDebts()
        return totalFunds.score
    }
    
    func setFundSum(score: MyFundsModel) {
        totalFunds.score = score.score
    }
}

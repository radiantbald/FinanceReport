//
//  ListRowFundsViewModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 26.03.2022.
//

import Foundation
import SwiftUI
import Combine

class FundsViewModel: ObservableObject {
    
    @Published var fundsArray: [FundModel] = []
    
    static let shared = FundsViewModel()
    
    private init(){}
    
    func getFund(id: String) -> FundModel? {
        
        for fund in fundsArray {
            if fund.id == id {
                return fund
            }
        }
        return nil
    }
    
    func setFund(fund: FundModel) {
        
        for (index, selfFund) in fundsArray.enumerated() {
            if fund.id == selfFund.id {
                fundsArray[index].id = fund.id
                fundsArray[index].name = fund.name
                fundsArray[index].score = fund.score
            }
        }
    }
    
    func sumFunds() -> Int{
        let fundsScoresArray = fundsArray.map {$0.score}
        
        let fundScoresSum = fundsScoresArray.reduce(0, { x, y in
            x + y
        })
        
        if fundsScoresArray.isEmpty {
            return 0
        } else {
            return fundScoresSum
        }
    }
}


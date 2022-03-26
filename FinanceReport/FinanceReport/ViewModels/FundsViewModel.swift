//
//  ListRowFundsViewModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 26.03.2022.
//

import Foundation
import SwiftUI

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
                fundsArray[index].score = fund.score
                fundsArray[index].name = fund.name
            }
        }
    }
}

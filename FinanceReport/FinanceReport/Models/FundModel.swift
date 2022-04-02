//
//  FundModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 25.03.2022.
//

import Foundation

struct FundModel: Hashable {
    var id: String = UUID().uuidString
    var name: String = "Новый счет"
    var score: Int = 0
}


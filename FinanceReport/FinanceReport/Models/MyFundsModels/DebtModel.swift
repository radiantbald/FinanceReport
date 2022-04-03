//
//  DebtModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 29.03.2022.
//

import Foundation

struct DebtModel: Hashable {
    var id: String = UUID().uuidString
    var name: String = "Новый долг"
    var score: Int = 0
}

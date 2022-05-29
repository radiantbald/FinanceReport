//
//  FactExpensesModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 28.04.2022.
//

import Foundation

struct FactExpensesModel: Hashable {
    var id: String = UUID().uuidString
    var name: String = "Фактическая статья расходов"
    var score: Int = 0
}

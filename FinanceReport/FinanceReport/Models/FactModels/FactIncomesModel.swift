//
//  FactIncomesModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 28.04.2022.
//

import Foundation

struct FactIncomesModel: Hashable {
    var id: String = UUID().uuidString
    var name: String = "Фактическая статья дохода"
    var score: Int = 0
}

//
//  PlanningExpensesModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 11.04.2022.
//

import Foundation

struct PlanningExpensesModel: Hashable {
    var id: String = UUID().uuidString
    var name: String = "Предполагаемая статья расхода"
    var score: Int = 0
}

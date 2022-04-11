//
//  PlanningIncomesModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 11.04.2022.
//

import Foundation

struct PlanningIncomesModel: Hashable {
    var id: String = UUID().uuidString
    var name: String = "Планируемая статья дохода"
    var score: Int = 0
}

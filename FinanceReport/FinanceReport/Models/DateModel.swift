//
//  DateModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 03.05.2022.
//

import Foundation

struct DateModel: Identifiable {
    var id: String = UUID().uuidString
    var day: Int
    var date: Date
}


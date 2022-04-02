//
//  DateModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 16.03.2022.
//

import Foundation

extension DateFormatter {
    static let ddMMyy: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateFormat = "dd-MM-yy"
        return formatter
    }()
}
extension Date {
   func formatToString(using formatter: DateFormatter) -> String {
      return formatter.string(from: self)
   }
}

let date = Date()

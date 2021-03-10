//
//  Validation.swift
//  RBizReportApp
//
//  Created by Igor Malyarov on 21.01.2021.
//

import Foundation
#warning("this or Validation SP???")
extension Report {
    public static func isValid(
        company: String,
        month: Int,
        year: Int,
        revenue: Double,
        dailyAverage: Double,
        totalExpenses: Double
    ) -> Bool {

        nil == validationError(company: company, month: month, year: year, revenue: revenue, dailyAverage: dailyAverage, totalExpenses: totalExpenses)
    }

    public static func validationError(
        company: String,
        month: Int,
        year: Int,
        revenue: Double,
        dailyAverage: Double,
        totalExpenses: Double
    ) -> EntityError.ReportValidationError? {

        let cleanCompany = company.trimmingCharacters(in: .whitespaces)
        guard !cleanCompany.isEmpty else { return .emptyCompany }
        guard 1...12 ~= month else { return .invalidMonth(month) }
        guard 2020...2050 ~= year else { return .invalidYear(year) }
        guard revenue > 0 else { return .invalidRevenue(revenue) }
        guard dailyAverage > 0 else { return .invalidDailyAverage(dailyAverage) }
        guard totalExpenses > 0 else { return .invalidTotalExpenses(totalExpenses) }

        return nil
    }
}

extension ReportGroup {
    public static func isValid(title: String, groupNumber: Int) -> Bool {
        nil == validationError(title: title, groupNumber: groupNumber)
    }

    public static func validationError(title: String, groupNumber: Int) -> EntityError.ReportGroupValidationError? {
        let cleanTitle = title.trimmingCharacters(in: .whitespaces)
        guard !cleanTitle.isEmpty else { return .emptyGroupTitle }
        guard groupNumber > 0 else { return .invalidGroupNumber }

        return nil
    }
}

extension ReportItem {
    public static func isValid(title: String, itemNumber: Int) -> Bool {
        nil == validationError(title: title, itemNumber: itemNumber)
    }

    public static func validationError(title: String, itemNumber: Int) -> EntityError.ReportItemValidationError? {
        let cleanTitle = title.trimmingCharacters(in: .whitespaces)
        guard !cleanTitle.isEmpty else { return .emptyItemTitle }
        guard itemNumber > 0 else { return .invalidItemNumber }

        return nil
    }
}


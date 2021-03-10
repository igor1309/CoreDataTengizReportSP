//
//  EntityError.swift
//  RBizReportApp
//
//  Created by Igor Malyarov on 21.01.2021.
//

import Foundation

public enum EntityError {
    public enum ReportValidationError: Error, Equatable {
        case emptyCompany
        case invalidMonth(Int)
        case invalidYear(Int)
        case invalidRevenue(Double)
        case invalidDailyAverage(Double)
        case invalidTotalExpenses(Double)
    }

    public enum ReportGroupValidationError: Error, Equatable {
        case emptyGroupTitle
        case invalidGroupNumber
    }

    public enum ReportItemValidationError: Error, Equatable {
        case emptyItemTitle
        case invalidItemNumber
    }
}

extension EntityError.ReportValidationError: LocalizedError {
    public var errorDescription: String? {
        switch self {
            case .emptyCompany:
                return NSLocalizedString(
                    "Company can't be empty.",
                    comment: ""
                )

            case let .invalidMonth(month):
                return NSLocalizedString(
                    "Month should be in a 1-12 range, but it's \(month)",
                    comment: ""
                )

            case let .invalidYear(year):
                return NSLocalizedString(
                    "Year should be in a 2020-2005 range, but it's \(year)",
                    comment: ""
                )

            case let .invalidRevenue(revenue):
                return NSLocalizedString(
                    "Revenue can't be negative, but it's \(revenue)",
                    comment: ""
                )

            case let .invalidDailyAverage(dailyAverageRevenue):
                return NSLocalizedString(
                    "Daily Average can't be negative, but it's \(dailyAverageRevenue)",
                    comment: ""
                )

            case let .invalidTotalExpenses(totalExpenses):
                return NSLocalizedString(
                    "Total Expenses can't be negative, but it's \(totalExpenses)",
                    comment: ""
                )
        }
    }
}

extension EntityError.ReportGroupValidationError: LocalizedError {
    public var errorDescription: String? {
        switch self {
            case .emptyGroupTitle:
                return NSLocalizedString(
                    "Group Title can't be empty.",
                    comment: ""
                )

            case .invalidGroupNumber:
                return NSLocalizedString(
                    "Group Number should be positive.",
                    comment: ""
                )
        }
    }
}

extension EntityError.ReportItemValidationError: LocalizedError {
    public var errorDescription: String? {
        switch self {
            case .emptyItemTitle:
                return NSLocalizedString(
                    "Item Title can't be empty.",
                    comment: ""
                )

            case .invalidItemNumber:
                return NSLocalizedString(
                    "Item Number should be positive.",
                    comment: ""
                )
        }
    }
}

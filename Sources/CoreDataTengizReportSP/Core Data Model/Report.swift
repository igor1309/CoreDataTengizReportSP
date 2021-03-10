//
//  Report.swift
//  RBizReportApp
//
//  Created by Igor Malyarov on 20.12.2020.
//

import Foundation

extension Report {
    var date: Date {
        get { date_ ?? .distantPast }
        set { date_ = newValue }
    }

    var company: String {
        get { company_ ?? "" }
        set { company_ = newValue }
    }

    var month: Int {
        get { Int(month_) }
        set { month_ = Int16(newValue) }
    }

    var year: Int {
        get { Int(year_) }
        set { year_ = Int16(newValue) }
    }

    var note: String {
        get { note_ ?? "" }
        set { note_ = newValue }
    }

    var groups: [ReportGroup] {
        get { (groups_ as? Set<ReportGroup> ?? []).sorted() }
        set { groups_ = Set(newValue) as NSSet }
    }

    var calculatedTotalExpenses: Double {
        groups.map(\.amountCalculated).reduce(0, +)
    }
    var totalExpensesDelta: Double { totalExpenses - calculatedTotalExpenses }
    var isTotalExpensesMatch: Bool { totalExpenses == calculatedTotalExpenses }

    #warning("finish with isTotalExpensesMatch logic")
    var hasIssue: Bool {
        // report has issue if at least one item (in any group) has issue OR totals don't match
        // !groups.flatMap(\.rows).map(\.hasIssue).allSatisfy { !$0 }
        !groups.map(\.hasIssue).allSatisfy { !$0 } && !isTotalExpensesMatch
    }

    var isTotalOk: Bool {
        revenue - totalExpenses == balance
    }
    var isBalanceOk: Bool {
        runningBalance == openingBalance + balance
    }
}

extension Report: Comparable {
    public static func < (lhs: Report, rhs: Report) -> Bool {
        lhs.company < rhs.company
            && lhs.year < rhs.year
            && lhs.month < rhs.month
    }

}

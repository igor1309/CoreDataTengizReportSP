//
//  Report.swift
//  RBizReportApp
//
//  Created by Igor Malyarov on 20.12.2020.
//

import Foundation

extension Report {
    public var date: Date {
        get { date_ ?? .distantPast }
        set { date_ = newValue }
    }

    public var company: String {
        get { company_ ?? "" }
        set { company_ = newValue }
    }

    public var month: Int {
        get { Int(month_) }
        set { month_ = Int16(newValue) }
    }

    #warning("write tests for this")
    public var monthStr: String {
        get { monthStr_ ?? "" }
        set { monthStr_ = newValue }
    }

    public var year: Int {
        get { Int(year_) }
        set { year_ = Int16(newValue) }
    }

    public var note: String {
        get { note_ ?? "" }
        set { note_ = newValue }
    }

    public var groups: [ReportGroup] {
        get { (groups_ as? Set<ReportGroup> ?? []).sorted() }
        set { groups_ = Set(newValue) as NSSet }
    }

    public var calculatedTotalExpenses: Double {
        groups.map(\.amountCalculated).reduce(0, +)
    }
    public var totalExpensesDelta: Double { totalExpenses - calculatedTotalExpenses }
    public var isTotalExpensesMatch: Bool { totalExpenses == calculatedTotalExpenses }

    #warning("finish with isTotalExpensesMatch logic")
    public var hasIssue: Bool {
        // report has issue if at least one item (in any group) has issue OR totals don't match
        // !groups.flatMap(\.rows).map(\.hasIssue).allSatisfy { !$0 }
        !groups.map(\.hasIssue).allSatisfy { !$0 } && !isTotalExpensesMatch
    }

    public var isTotalOk: Bool {
        revenue - totalExpenses == balance
    }
    public var isBalanceOk: Bool {
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

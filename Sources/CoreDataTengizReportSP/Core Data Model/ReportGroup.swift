//
//  ReportGroup.swift
//  RBizReportApp
//
//  Created by Igor Malyarov on 20.12.2020.
//

import Foundation

extension ReportGroup {
    public var title: String {
        get { title_ ?? "" }
        set { title_ = newValue }
    }

    public var note: String {
        get { note_ ?? "" }
        set { note_ = newValue }
    }

    public var groupNumber: Int {
        get { Int(groupNumber_) }
        set { groupNumber_ = Int16(newValue) }
    }

    public var items: [ReportItem] {
        get { (items_ as? Set<ReportItem> ?? []).sorted() }
        set { items_ = Set(newValue) as NSSet }
    }

    public var amountCalculated: Double {
        items.map(\.amount).reduce(0, +)
    }
    public var amountDelta: Double { amount - amountCalculated }
    public var isAmountMatch: Bool { amount == amountCalculated }

    #warning("FINISH THIS")
    public var hasIssue: Bool {
        // report has issue if at least one item (in any group) has issue OR totals don't match
        !items.map(\.hasIssue).allSatisfy { !$0 }
    }

}

extension ReportGroup: Comparable {
    public static func < (lhs: ReportGroup, rhs: ReportGroup) -> Bool {
        lhs.groupNumber < rhs.groupNumber
    }

}

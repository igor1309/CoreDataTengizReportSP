//
//  ReportGroup.swift
//  RBizReportApp
//
//  Created by Igor Malyarov on 20.12.2020.
//

import Foundation

extension ReportGroup {
    var title: String {
        get { title_ ?? "" }
        set { title_ = newValue }
    }

    var note: String {
        get { note_ ?? "" }
        set { note_ = newValue }
    }

    var groupNumber: Int {
        get { Int(groupNumber_) }
        set { groupNumber_ = Int16(newValue) }
    }

    var items: [ReportItem] {
        get { (items_ as? Set<ReportItem> ?? []).sorted() }
        set { items_ = Set(newValue) as NSSet }
    }

    var amountCalculated: Double {
        items.map(\.amount).reduce(0, +)
    }
    var amountDelta: Double { amount - amountCalculated }
    var isAmountMatch: Bool { amount == amountCalculated }

    #warning("FINISH THIS")
    var hasIssue: Bool {
        // report has issue if at least one item (in any group) has issue OR totals don't match
        !items.map(\.hasIssue).allSatisfy { !$0 }
    }

}

extension ReportGroup: Comparable {
    public static func < (lhs: ReportGroup, rhs: ReportGroup) -> Bool {
        lhs.groupNumber < rhs.groupNumber
    }

}

//
//  ReportItem.swift
//  RBizReportApp
//
//  Created by Igor Malyarov on 20.12.2020.
//

import Foundation

extension ReportItem {
    public var title: String {
        get { title_ ?? "" }
        set { title_ = newValue }
    }

    public var note: String {
        get { note_ ?? "" }
        set { note_ = newValue }
    }

    public var itemNumber: Int {
        get { Int(itemNumber_) }
        set { itemNumber_ = Int16(newValue) }
    }

    public var isAmountMatch: Bool {
        #warning("continue with ecomonis rows")
        return true
        //        amount == economicRows.map(\.amount).reduce(0, +)
    }

}

extension ReportItem: Comparable {
    public static func < (lhs: ReportItem, rhs: ReportItem) -> Bool {
        lhs.itemNumber < rhs.itemNumber
    }

}

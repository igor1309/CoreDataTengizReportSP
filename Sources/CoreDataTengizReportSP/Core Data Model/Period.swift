//
//  Period.swift
//  RBizReport
//
//  Created by Igor Malyarov on 13.01.2021.
//

import Foundation

public struct Period: Codable, Equatable {
    let month: Int
    let year: Int
}

extension Report {
    public var period: Period {
        get { Period(month: Int(month), year: Int(year)) }
        set {
            month = newValue.month
            year = newValue.year
        }
    }

}

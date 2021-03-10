//
//  PeriodTests.swift
//  RBizReportTests
//
//  Created by Igor Malyarov on 13.01.2021.
//

import XCTest
import CoreData
@testable import CoreDataTengizReportSP

final class PeriodTests: BaseTestCase {
    func testPeriod() {
        let report = Report(context: context)

        let period = Period(month: 11, year: 2020)
        report.period = period

        XCTAssertEqual(report.month, 11)
        XCTAssertEqual(report.year, 2020)

        report.month = 2
        report.year = 2021
        let period2 = report.period

        XCTAssertEqual(period2, Period(month: 2, year: 2021))
        XCTAssertEqual(report.month, 2)
        XCTAssertEqual(report.year, 2021)
    }
}

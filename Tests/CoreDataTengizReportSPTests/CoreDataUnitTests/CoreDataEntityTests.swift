//
//  CoreDataEntityTests.swift
//  RBizReportTests
//
//  Created by Igor Malyarov on 13.01.2021.
//

import XCTest
import CoreData
@testable import CoreDataTengizReportSP

final class CoreDataEntityTests: BaseTestCase {
    func testEntityRelationships() {
        let item = ReportItem(context: context)
        let group = ReportGroup(context: context)
        let report = Report(context: context)

        group.addToItems_(item)
        XCTAssertEqual(item.group, group, "ERROR setting Group items")
        XCTAssertNotNil(group.items_, "ERROR setting Group items")
        XCTAssertNotNil(group.items.first)
        if let first = try? XCTUnwrap(group.items.first) {
            XCTAssertEqual(first, item)
        }
        XCTAssertFalse(group.items.isEmpty)
        XCTAssertEqual(group.items.count, 1)

        report.addToGroups_(group)
        XCTAssertEqual(group.report, report, "ERROR setting Reports group")
        XCTAssertNotNil(report.groups_, "ERROR setting Reports group")
        XCTAssertNotNil(report.groups.first)
        if let first = try? XCTUnwrap(report.groups.first) {
            XCTAssertEqual(first, group)
        }
        XCTAssertFalse(report.groups.isEmpty)
        XCTAssertEqual(report.groups.count, 1)
    }

    func testEntityComputedProperties() {
        let item = ReportItem(context: context)
        item.amount = 200_000
        item.hasIssue = true

        let group = ReportGroup(context: context)
        group.amount = 900_000
        group.addToItems_(item)
        group.items.append(item)
        item.group = group

        XCTAssertNotNil(group.items.first, "ERROR setting Group items")
        XCTAssertEqual(group.items.count, 1, "ERROR setting Group items")

        XCTAssertEqual(group.amountCalculated, 200_000, "ERROR calculating Group amountCalculated property")
        XCTAssertEqual(group.amountDelta, 700_000, "ERROR calculating Group amountDelta property")
        XCTAssertFalse(group.isAmountMatch, "ERROR calculating Group isAmountMatch property")
        XCTAssertTrue(group.hasIssue, "ERROR calculating Group hasIssue property")

        let report = Report(context: context)
        report.balance = 1_000_000
        report.openingBalance = 500_000
        report.revenue = 2_500_000
        report.runningBalance = -500_000
        report.totalExpenses = 1_500_000
        report.addToGroups_(group)

        XCTAssertNotNil(report.groups_, "ERROR setting Reports group")
        XCTAssertEqual(group.report, report, "ERROR setting Reports group")
        XCTAssertNotNil(report.groups.first, "ERROR setting Reports group")
        XCTAssertEqual(report.groups.count, 1, "ERROR setting Reports group")

        XCTAssertEqual(report.calculatedTotalExpenses, 200_000, "ERROR calculationg Report calculatedTotalExpenses property")
        XCTAssertEqual(report.totalExpensesDelta, 1_300_000, "ERROR calculationg Report totalExpensesDelta property")
        XCTAssertTrue(report.hasIssue, "ERROR calculating Report hasIssue property")
    }

}


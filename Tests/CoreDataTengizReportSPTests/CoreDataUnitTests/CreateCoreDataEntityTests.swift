//
//  CreateCoreDataEntityTests.swift
//  RBizReportTests
//
//  Created by Igor Malyarov on 13.01.2021.
//

import XCTest
import CoreData
@testable import CoreDataTengizReportSP

final class CreateCoreDataEntityTests: BaseTestCase {

    // MARK: 'database is empty' check is in testBaseTestCase()

    func testCreateReportsAndGroupsAndItems() throws {
        let targetCount = 10

        for _ in 0..<targetCount {
            let report = Report(context: context)

            for _ in 0..<targetCount {
                let group = ReportGroup(context: context)
                group.report = report

                for _ in 0..<targetCount {
                    let item = ReportItem(context: context)
                    item.group = group
                }
            }
        }

        XCTAssertEqual(try context.count(for: reportRequest),
                       targetCount,
                       "Error creating Reports")
        XCTAssertEqual(try context.count(for: groupRequest),
                       targetCount * targetCount,
                       "Error creating Report Groups")
        XCTAssertEqual(try context.count(for: itemRequest),
                       targetCount * targetCount * targetCount,
                       "Error creating Report Group Items")
    }

    func testCreateReport() {
        let report = Report(context: context)
        report.company = "Test Company"
        report.balance = 1_000_000
        report.dailyAverage = 100_000
        let now = Date()
        report.date = now
        report.month = 9
        report.note = "Some Report Note"
        report.openingBalance = 500_000
        report.revenue = 2_500_000
        report.runningBalance = -500_000
        report.totalExpenses = 1_500_000
        report.year = 2020

        XCTAssertNotNil(report, "Report should not be nil")
        XCTAssertEqual(report.company, "Test Company", "ERROR setting Report company property")
        XCTAssertEqual(report.company_, "Test Company", "ERROR setting Report company property")
        XCTAssertEqual(report.balance, 1_000_000, "ERROR setting Report balance property")
        XCTAssertEqual(report.dailyAverage, 100_000, "ERROR setting Report dailyAverage property")
        XCTAssertEqual(report.date, now, "ERROR setting Report date property")
        XCTAssertEqual(report.date_, now, "ERROR setting Report date property")
        XCTAssertEqual(report.month, 9, "ERROR setting Report month property")
        XCTAssertEqual(report.month_, 9, "ERROR setting Report month property")
        XCTAssertEqual(report.note, "Some Report Note", "ERROR setting Report note property")
        XCTAssertEqual(report.note_, "Some Report Note", "ERROR setting Report note property")
        XCTAssertEqual(report.openingBalance, 500_000, "ERROR setting Report openingBalance property")
        XCTAssertEqual(report.revenue, 2_500_000, "ERROR setting Report revenue property")
        XCTAssertEqual(report.runningBalance, -500_000, "ERROR setting Report runningBalance property")
        XCTAssertEqual(report.totalExpenses, 1_500_000, "ERROR setting Report totalExpenses property")
        XCTAssertEqual(report.year, 2020, "ERROR setting Report year property")
        XCTAssertEqual(report.year_, 2020, "ERROR setting Report year property")
    }

    func testCreateReportGroup() {
        let group = ReportGroup(context: context)
        group.amount = 900_000
        group.groupNumber = 10
        group.note = "Some Group Note"
        group.target = 0.2
        group.title = "Group Title"

        XCTAssertNotNil(group, "Report Group should not be nil")
        XCTAssertEqual(group.amount, 900_000, "ERROR setting Group amount property")
        XCTAssertEqual(group.groupNumber, 10, "ERROR setting Group groupNumber property")
        XCTAssertEqual(group.groupNumber_, 10, "ERROR setting Group groupNumber property")
        XCTAssertEqual(group.note, "Some Group Note", "ERROR setting Group note property")
        XCTAssertEqual(group.note_, "Some Group Note", "ERROR setting Group note property")
        XCTAssertEqual(group.target, 0.2, "ERROR setting Group target property")
        XCTAssertEqual(group.title, "Group Title", "ERROR setting Group title property")
        XCTAssertEqual(group.title_, "Group Title", "ERROR setting Group title property")
    }

    func testCreateReportItem() {
        let item = ReportItem(context: context)
        item.amount = 200_000
        item.hasIssue = true
        item.itemNumber = 5
        item.note_ = "Some Item Note"
        item.title = "Item Title"

        XCTAssertNotNil(item, "Report Item should not be nil")
        XCTAssertEqual(item.amount, 200_000, "ERROR setting Item amount property")
        XCTAssertEqual(item.hasIssue, true, "ERROR setting Item amount property")
        XCTAssertEqual(item.itemNumber, 5, "ERROR setting Item amount property")
        XCTAssertEqual(item.itemNumber_, 5, "ERROR setting Item amount property")
        XCTAssertEqual(item.note, "Some Item Note", "ERROR setting Item amount property")
        XCTAssertEqual(item.note_, "Some Item Note", "ERROR setting Item amount property")
        XCTAssertEqual(item.title, "Item Title", "ERROR setting Item amount property")
        XCTAssertEqual(item.title_, "Item Title", "ERROR setting Item amount property")
    }

}

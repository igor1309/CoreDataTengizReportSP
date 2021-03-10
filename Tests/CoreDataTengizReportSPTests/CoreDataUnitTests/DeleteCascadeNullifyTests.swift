//
//  DeleteCascadeNullifyTests.swift
//  RBizReportAppTests
//
//  Created by Igor Malyarov on 21.01.2021.
//

import XCTest
import CoreData
@testable import CoreDataTengizReportSP

final class DeleteCascadeNullifyTests: BaseTestCase {

    // MARK: 'database is empty' check is in testBaseTestCase()

    func testDeleteReport() throws {
        let report = Report(context: context)
        XCTAssertEqual(try context.count(for: reportRequest), 1, "Error creating Report")

        let targetCount = 10

        for _ in 0..<targetCount {
            let group = ReportGroup(context: context)
            group.report = report
        }
        XCTAssertEqual(try context.count(for: groupRequest), targetCount, "Error creating \(targetCount) groups")

        let groups = try context.fetch(groupRequest)

        let firstGroup = try XCTUnwrap(groups.first)
        context.delete(firstGroup)
        XCTAssertEqual(try context.count(for: groupRequest), targetCount - 1, "Error deleting group")

        let lastGroup = try XCTUnwrap(groups.last)
        context.delete(lastGroup)
        XCTAssertEqual(try context.count(for: groupRequest), targetCount - 2, "Error deleting group")

        let group = groups[1]
        context.delete(group)
        XCTAssertEqual(try context.count(for: groupRequest), targetCount - 3, "Error deleting group")

        XCTAssertEqual(try context.count(for: reportRequest), 1, "Error Group Nullify delete")

        let reports = try context.fetch(reportRequest)
        let firstReport = try XCTUnwrap(reports.first)
        context.delete(firstReport)
        XCTAssertEqual(try context.count(for: reportRequest), 0, "Error deleting report")
        XCTAssertEqual(try context.count(for: groupRequest), 0, "Error Cascade delete")
    }

    func testDeleteReportGroup() throws {
        let group = ReportGroup(context: context)
        XCTAssertEqual(try context.count(for: groupRequest), 1, "Error creating Group")

        let targetCount = 10

        for _ in 0..<targetCount {
            let item = ReportItem(context: context)
            item.group = group
        }
        XCTAssertEqual(try context.count(for: itemRequest), targetCount, "Error creating \(targetCount) items")

        let items = try context.fetch(itemRequest)

        let firstItem = try XCTUnwrap(items.first)
        context.delete(firstItem)
        XCTAssertEqual(try context.count(for: itemRequest), targetCount - 1, "Error deleting item")

        let lastItem = try XCTUnwrap(items.last)
        context.delete(lastItem)
        XCTAssertEqual(try context.count(for: itemRequest), targetCount - 2, "Error deleting item")

        let item = items[1]
        context.delete(item)
        XCTAssertEqual(try context.count(for: itemRequest), targetCount - 3, "Error deleting item")

        XCTAssertEqual(try context.count(for: groupRequest), 1, "Error Item Nullify delete")

        let groups = try context.fetch(groupRequest)
        let firstGroup = try XCTUnwrap(groups.first)
        context.delete(firstGroup)
        XCTAssertEqual(try context.count(for: groupRequest), 0, "Error deleting group")
        XCTAssertEqual(try context.count(for: itemRequest), 0, "Error Cascade delete")
    }

    func testDeleteReportItem() throws {
        let report = Report(context: context)
        let group = ReportGroup(context: context)
        group.report = report
        (0..<10).forEach { _ in
            let item = ReportItem(context: context)
            item.group = group
        }
        XCTAssertEqual(try context.count(for: ReportItem.fetchRequest()), 10, "Error adding Report Items to context")

        let first = try XCTUnwrap(group.items.first)
        context.delete(first)
        XCTAssertEqual(try context.count(for: ReportItem.fetchRequest()), 9, "Error deleting item")
        XCTAssertEqual(try context.count(for: ReportGroup.fetchRequest()), 1, "Error Item Nullify delete")

        let last = try XCTUnwrap(group.items.last)
        context.delete(last)
        XCTAssertEqual(try context.count(for: ReportItem.fetchRequest()), 8, "Error deleting item")
        XCTAssertEqual(try context.count(for: ReportGroup.fetchRequest()), 1, "Error Item Nullify delete")

        context.delete(group)
        XCTAssertEqual(try context.count(for: ReportItem.fetchRequest()), 0, "Error Item Cascade delete")
        XCTAssertEqual(try context.count(for: ReportGroup.fetchRequest()), 0, "Error Group delete")
    }
}

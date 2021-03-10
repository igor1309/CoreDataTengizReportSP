//
//  DeleteCoreDataEntityTests.swift
//  RBizReportAppTests
//
//  Created by Igor Malyarov on 14.01.2021.
//

import XCTest
import CoreData
@testable import CoreDataTengizReportSP

final class DeleteCoreDataEntityTests: BaseTestCase {

    // MARK: 'database is empty' check is in testBaseTestCase()

    func testDeleteReport() throws {
        let report = Report(context: context)
        XCTAssertEqual(try context.count(for: reportRequest), 1, "Error adding Report to context")

        context.delete(report)
        XCTAssertEqual(try context.count(for: reportRequest), 0, "Error deleting Report")
    }

    func testDeleteReportGroup() throws {
        let group = ReportGroup(context: context)
        XCTAssertEqual(try context.count(for: groupRequest), 1, "Error adding Report Group to context")

        context.delete(group)
        XCTAssertEqual(try context.count(for: groupRequest), 0, "Error deleting Report Grooup")
    }

    func testDeleteReportItem() throws {
        let item = ReportItem(context: context)
        XCTAssertEqual(try context.count(for: itemRequest), 1, "Error adding Report Item to context")

        context.delete(item)
        XCTAssertEqual(try context.count(for: itemRequest), 0, "Error deleting Report Item")
    }
}

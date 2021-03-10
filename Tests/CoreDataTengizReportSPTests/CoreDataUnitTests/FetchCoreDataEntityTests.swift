//
//  FetchCoreDataEntityTests.swift
//  RBizReportAppTests
//
//  Created by Igor Malyarov on 14.01.2021.
//

import XCTest
import CoreData
@testable import CoreDataTengizReportSP

//  FIXME: FINISH THIS: 
final class FetchCoreDataEntityTests: BaseTestCase {

    // MARK: 'database is empty' check is in testBaseTestCase()

    func testFetchReport() throws {
        _ = Report(context: context)
        let results = try context.fetch(reportRequest)
        XCTAssertFalse(results.isEmpty, "ERROR adding/fetching Report to context")
        XCTAssertEqual(results.count, 1, "ERROR adding/fetching Report to context")

        _ = Report(context: context)
        let results2 = try context.fetch(reportRequest)
        XCTAssertFalse(results2.isEmpty, "ERROR adding/fetching Report to context")
        XCTAssertEqual(results2.count, 2, "ERROR adding/fetching Report to context")
    }

    func testFetchReportGroup() throws {
        _ = ReportGroup(context: context)
        let results = try context.fetch(groupRequest)
        XCTAssertFalse(results.isEmpty, "ERROR adding/fetching Report Group to context")
        XCTAssertEqual(results.count, 1, "ERROR adding/fetching Report Group to context")

        _ = ReportGroup(context: context)
        let results2 = try context.fetch(groupRequest)
        XCTAssertFalse(results2.isEmpty, "ERROR adding/fetching Report Group to context")
        XCTAssertEqual(results2.count, 2, "ERROR adding/fetching Report Group to context")
    }

    func testFetchReportItem() throws {
        _ = ReportItem(context: context)
        let results = try context.fetch(itemRequest)
        XCTAssertFalse(results.isEmpty, "ERROR adding/fetching Report Item to context")
        XCTAssertEqual(results.count, 1, "ERROR adding/fetching Report Item to context")

        _ = ReportItem(context: context)
        let results2 = try context.fetch(itemRequest)
        XCTAssertFalse(results2.isEmpty, "ERROR adding/fetching Report Item to context")
        XCTAssertEqual(results2.count, 2, "ERROR adding/fetching Report Item to context")
    }
}

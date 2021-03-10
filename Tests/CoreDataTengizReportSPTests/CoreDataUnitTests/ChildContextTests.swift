//
//  ChildContextTests.swift
//  RBizReportAppTests
//
//  Created by Igor Malyarov on 19.01.2021.
//

import XCTest
import CoreData
@testable import CoreDataTengizReportSP

final class ChildContextTests: BaseTestCase {
    func testChildContext() {
        let report = Report(context: context)
        report.company = "Test Company"

        let childContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        childContext.parent = context

        let childReport = childContext.object(with: report.objectID) as? Report
        XCTAssertNotNil(childReport, "Error getting Report in child context")

        childReport?.balance = 1_000_000
        XCTAssertEqual(report.balance, 0)

        childContext.saveContext()
        XCTAssertEqual(report.balance, 1_000_000)

        context.saveContext()
        XCTAssertEqual(report.balance, 1_000_000)
    }

}

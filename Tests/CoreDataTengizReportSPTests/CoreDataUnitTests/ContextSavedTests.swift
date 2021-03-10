//
//  ContextSavedTests.swift
//  RBizReportAppTests
//
//  Created by Igor Malyarov on 14.01.2021.
//

import XCTest
import CoreData
@testable import CoreDataTengizReportSP

final class ContextSavedTests: BaseTestCase {
    func testContextSaved() {
        expectation(forNotification: .NSManagedObjectContextDidSave,
                    object: context) { _ in
            return true
        }

        context.perform {
            let item = ReportItem(context: self.context)
            item.amount = 100_000
            self.context.saveContext()

            XCTAssertNotNil(item)
        }

        waitForExpectations(timeout: 2) { error in
            XCTAssertNil(error, "Save did not occur")
        }
    }

    // https://www.raywenderlich.com/11349416-unit-testing-core-data-in-ios
    func testBackgroundContextSaved() {
        expectation(forNotification: .NSManagedObjectContextDidSave,
                    object: context) { _ in
            return true
        }

        backgroundContext.perform {
            let item = ReportItem(context: self.context)
            item.amount = 100_000
            self.context.saveContext()

            XCTAssertNotNil(item)
        }

        waitForExpectations(timeout: 2) { error in
            XCTAssertNil(error, "Save did not occur")
        }
    }
}

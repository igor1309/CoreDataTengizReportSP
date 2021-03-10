//
//  BaseTestCase.swift
//  RBizReportTests
//
//  Created by Igor Malyarov on 13.01.2021.
//

import XCTest
import CoreData
@testable import CoreDataTengizReportSP

enum TestError: Error {
    case error
}

class BaseTestCase: XCTestCase {
    // var coreDataStack: CoreDataStack!
    var context: NSManagedObjectContext!
    var backgroundContext: NSManagedObjectContext!

    let reportRequest = Report.fetchRequest(NSPredicate.all)
    let groupRequest = ReportGroup.fetchRequest(NSPredicate.all)
    let itemRequest = ReportItem.fetchRequest(NSPredicate.all)

    override func setUpWithError() throws {
        let coreDataStack = CoreDataStack(inMemory: true)
        context = coreDataStack.context
        backgroundContext = coreDataStack.backgroundContext
    }

    override func tearDown() {
        super.tearDown()
        // coreDataStack = nil
        context = nil
        backgroundContext = nil
    }

    func testBaseTestCase() {
        // XCTAssertNotNil(coreDataStack)
        XCTAssertNotNil(context)
        XCTAssertNotNil(backgroundContext)

        XCTAssertEqual(try context.count(for: reportRequest), 0, "ERROR: new database is not empty")
        XCTAssertEqual(try context.count(for: groupRequest), 0, "ERROR: new database is not empty")
        XCTAssertEqual(try context.count(for: itemRequest), 0, "ERROR: new database is not empty")
    }
}

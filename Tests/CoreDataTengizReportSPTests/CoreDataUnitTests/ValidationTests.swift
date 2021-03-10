//
//  ValidationTests.swift
//  ReportStoreTests
//
//  Created by Igor Malyarov on 23.01.2021.
//

import XCTest
@testable import CoreDataTengizReportSP

class ValidationTests: XCTestCase {
    func testReportCompanyValidation() {
        var isValid = Report.isValid(company: "", month: 9, year: 2020, revenue: 1_000_000, dailyAverage: 100_000, totalExpenses: 800_000)
        XCTAssertFalse(isValid, "Empty company validated")
        var error = Report.validationError(company: "", month: 9, year: 2020, revenue: 1_000_000, dailyAverage: 100_000, totalExpenses: 800_000)
        XCTAssertEqual(error, .emptyCompany, "Empty company validated")

        isValid = Report.isValid(company: " ", month: 9, year: 2020, revenue: 1_000_000, dailyAverage: 100_000, totalExpenses: 800_000)
        XCTAssertFalse(isValid, "Empty company validated")
        error = Report.validationError(company: " ", month: 9, year: 2020, revenue: 1_000_000, dailyAverage: 100_000, totalExpenses: 800_000)
        XCTAssertEqual(error, .emptyCompany, "Empty company validated")
    }

    func testReportMonthValidation() {
        var month = 0
        var isValid = Report.isValid(company: "Test", month: month, year: 2020, revenue: 1_000_000, dailyAverage: 100_000, totalExpenses: 800_000)
        XCTAssertFalse(isValid, "Invalid month validated")
        var error = Report.validationError(company: "Test", month: month, year: 2020, revenue: 1_000_000, dailyAverage: 100_000, totalExpenses: 800_000)
        XCTAssertEqual(error, .invalidMonth(month), "Invalid month validated")

        month = 13
        isValid = Report.isValid(company: "Test", month: month, year: 2020, revenue: 1_000_000, dailyAverage: 100_000, totalExpenses: 800_000)
        XCTAssertFalse(isValid, "Invalid month validated")
        error = Report.validationError(company: "Test", month: month, year: 2020, revenue: 1_000_000, dailyAverage: 100_000, totalExpenses: 800_000)
        XCTAssertEqual(error, .invalidMonth(month), "Empty month validated")

        for month in 1...12 {
            isValid = Report.isValid(company: "Test", month: month, year: 2020, revenue: 1_000_000, dailyAverage: 100_000, totalExpenses: 800_000)
            XCTAssert(isValid, "Invalid month validated")
            error = Report.validationError(company: "Test", month: month, year: 2020, revenue: 1_000_000, dailyAverage: 100_000, totalExpenses: 800_000)
            XCTAssertNil(error, "Correct month not validated")
        }
    }

    func testReportYearValidation() {
        var year = 2010
        var isValid = Report.isValid(company: "Test", month: 9, year: year, revenue: 1_000_000, dailyAverage: 100_000, totalExpenses: 800_000)
        XCTAssertFalse(isValid, "Empty year validated")
        var error = Report.validationError(company: "Test", month: 9, year: year, revenue: 1_000_000, dailyAverage: 100_000, totalExpenses: 800_000)
        XCTAssertEqual(error, .invalidYear(year), "Empty year validated")

        year = 2051
        isValid = Report.isValid(company: "Test", month: 9, year: year, revenue: 1_000_000, dailyAverage: 100_000, totalExpenses: 800_000)
        XCTAssertFalse(isValid, "Empty year validated")
        error = Report.validationError(company: "Test", month: 9, year: year, revenue: 1_000_000, dailyAverage: 100_000, totalExpenses: 800_000)
        XCTAssertEqual(error, .invalidYear(year), "Empty year validated")
    }

    func testReportValidation() {
        let revenue = -1_000_000.00
        var isValid = Report.isValid(company: "Test", month: 9, year: 2020, revenue: revenue, dailyAverage: 100_000, totalExpenses: 800_000)
        XCTAssertFalse(isValid, "Negative Revenue validated")
        var error = Report.validationError(company: "Test", month: 9, year: 2020, revenue: revenue, dailyAverage: 100_000, totalExpenses: 800_000)
        XCTAssertEqual(error, .invalidRevenue(revenue), "Negative Revenue validated")

        let dailyAverage = -100_000.00
        isValid = Report.isValid(company: "Test", month: 9, year: 2020, revenue: 1_000_000, dailyAverage: dailyAverage, totalExpenses: 800_000)
        XCTAssertFalse(isValid, "Negative Daily Average validated")
        error = Report.validationError(company: "Test", month: 9, year: 2020, revenue: 1_000_000, dailyAverage: dailyAverage, totalExpenses: 800_000)
        XCTAssertEqual(error, .invalidDailyAverage(dailyAverage), "Negative Daily Average validated")

        let totalExpenses = -800_000.00
        isValid = Report.isValid(company: "Test", month: 9, year: 2020, revenue: 1_000_000, dailyAverage: 100_000, totalExpenses: totalExpenses)
        XCTAssertFalse(isValid, "Negative Total Expenses validated")
        error = Report.validationError(company: "Test", month: 9, year: 2020, revenue: 1_000_000, dailyAverage: 100_000, totalExpenses: totalExpenses)
        XCTAssertEqual(error, .invalidTotalExpenses(totalExpenses), "Negative Total Expenses validated")

        isValid = Report.isValid(company: "Test", month: 9, year: 2020, revenue: 1_000_000, dailyAverage: 100_000, totalExpenses: 800_000)
        XCTAssert(isValid, "Correct Report not validated")
        error = Report.validationError(company: "Test", month: 9, year: 2020, revenue: 1_000_000, dailyAverage: 100_000, totalExpenses: 800_000)
        XCTAssertNil(error, "Correct Report not validated")
    }

    func testReportGroupValidation() {
        var test = (title: "", groupNumber: 0)
        var isValid = ReportGroup.isValid(title: test.title, groupNumber: test.groupNumber)
        XCTAssertFalse(isValid, "Empty title validated")
        var error = ReportGroup.validationError(title: test.title, groupNumber: test.groupNumber)
        XCTAssertEqual(error, .emptyGroupTitle, "Empty title validated")

        test = (title: " ", groupNumber: 0)
        isValid = ReportGroup.isValid(title: test.title, groupNumber: test.groupNumber)
        XCTAssertFalse(isValid, "Empty title validated")
        error = ReportGroup.validationError(title: test.title, groupNumber: test.groupNumber)
        XCTAssertEqual(error, .emptyGroupTitle, "Empty title validated")

        test = (title: "Group", groupNumber: 10)
        isValid = ReportGroup.isValid(title: test.title, groupNumber: test.groupNumber)
        XCTAssert(isValid)
        error = ReportGroup.validationError(title: test.title, groupNumber: test.groupNumber)
        XCTAssertNil(error, "Correct Group not validated")

        test = (title: "Group", groupNumber: 0)
        isValid = ReportGroup.isValid(title: test.title, groupNumber: test.groupNumber)
        XCTAssertFalse(isValid, "Zero or Negative Group Number validated")
        error = ReportGroup.validationError(title: test.title, groupNumber: test.groupNumber)
        XCTAssertEqual(error, .invalidGroupNumber, "Zero or Negative Group Number validated")

        test = (title: "Group", groupNumber: -10)
        isValid = ReportGroup.isValid(title: test.title, groupNumber: test.groupNumber)
        XCTAssertFalse(isValid, "Zero or Negative Group Number validated")
        error = ReportGroup.validationError(title: test.title, groupNumber: test.groupNumber)
        XCTAssertEqual(error, .invalidGroupNumber, "Zero or Negative Group Number validated")
    }

    func testReportItemValidation() {
        var test = (title: "", itemNumber: 0)
        var isValid = ReportItem.isValid(title: test.title, itemNumber: test.itemNumber)
        XCTAssertFalse(isValid, "Empty title validated")
        var error = ReportItem.validationError(title: test.title, itemNumber: test.itemNumber)
        XCTAssertEqual(error, .emptyItemTitle, "Empty title validated")

        test = (title: " ", itemNumber: 0)
        isValid = ReportItem.isValid(title: test.title, itemNumber: test.itemNumber)
        XCTAssertFalse(isValid, "Empty title validated")
        error = ReportItem.validationError(title: test.title, itemNumber: test.itemNumber)
        XCTAssertEqual(error, .emptyItemTitle, "Empty title validated")

        test = (title: "Item", itemNumber: 10)
        isValid = ReportItem.isValid(title: test.title, itemNumber: test.itemNumber)
        XCTAssert(isValid, "Correct Item not validated")
        error = ReportItem.validationError(title: test.title, itemNumber: test.itemNumber)
        XCTAssertNil(error, "Correct Item not validated")

        test = (title: "Item", itemNumber: 0)
        isValid = ReportItem.isValid(title: test.title, itemNumber: test.itemNumber)
        XCTAssertFalse(isValid, "Zero or Negative Item Number validated")
        error = ReportItem.validationError(title: test.title, itemNumber: test.itemNumber)
        XCTAssertEqual(error, .invalidItemNumber, "Zero or Negative Item Number validated")

        test = (title: "Item", itemNumber: -10)
        isValid = ReportItem.isValid(title: test.title, itemNumber: test.itemNumber)
        XCTAssertFalse(isValid, "Zero or Negative Item Number validated")
        error = ReportItem.validationError(title: test.title, itemNumber: test.itemNumber)
        XCTAssertEqual(error, .invalidItemNumber, "Zero or Negative Item Number validated")
    }
}

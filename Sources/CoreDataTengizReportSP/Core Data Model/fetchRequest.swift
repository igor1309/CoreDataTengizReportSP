//
//  fetchRequest.swift
//  RBizReportApp
//
//  Created by Igor Malyarov on 21.12.2020.
//

import CoreData

public extension Report {
    static func fetchRequest(forCompany company: String, month: Int) -> NSFetchRequest<Report> {
        let companyPredicate = NSPredicate(format: "%K == %@", #keyPath(Report.company_), company)
        let monthPredicate = NSPredicate(format: "%K == %@", #keyPath(Report.month_), NSNumber(value: month))
        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [companyPredicate, monthPredicate])
        return Report.fetchRequest(predicate)
    }

    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<Report> {
        let sortDescriptorCompany = NSSortDescriptor(key: #keyPath(Report.company_), ascending: true)
        let sortDescriptorYear = NSSortDescriptor(key: #keyPath(Report.year_), ascending: false)
        let sortDescriptorMonth = NSSortDescriptor(key: #keyPath(Report.month_), ascending: false)
        return fetchRequest(predicate, sortDescriptors: [sortDescriptorCompany, sortDescriptorYear, sortDescriptorMonth])
    }

    static func fetchRequest(_ predicate: NSPredicate, sortDescriptors: [NSSortDescriptor]) -> NSFetchRequest<Report> {
        let request = NSFetchRequest<Report>(entityName: "Report")
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        return request
    }
}

public extension ReportGroup {
    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<ReportGroup> {
        let sortDescriptor = NSSortDescriptor(key: #keyPath(ReportGroup.groupNumber_), ascending: true)
        return fetchRequest(predicate, sortDescriptors: [sortDescriptor])
    }

    static func fetchRequest(_ predicate: NSPredicate, sortDescriptors: [NSSortDescriptor]) -> NSFetchRequest<ReportGroup> {
        let request = NSFetchRequest<ReportGroup>(entityName: "ReportGroup")
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        return request
    }
}

public extension ReportItem {
    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<ReportItem> {
        let sortDescriptor = NSSortDescriptor(key: #keyPath(ReportItem.itemNumber_), ascending: true)
        return fetchRequest(predicate, sortDescriptors: [sortDescriptor])
    }

    static func fetchRequest(_ predicate: NSPredicate, sortDescriptors: [NSSortDescriptor]) -> NSFetchRequest<ReportItem> {
        let request = NSFetchRequest<ReportItem>(entityName: "ReportItem")
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        return request
    }
}

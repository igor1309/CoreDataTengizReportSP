//
//  CoreDataStack.swift
//  RBizReport
//
//  Created by Igor Malyarov on 14.01.2021.
//

import CoreData

// I'm using a subclass so the persistent container will look for the data model in the framework bundle rather than the app bundle
@available(macOS 10.12, *)
public class PersistentContainer: NSPersistentContainer {}

public final class CoreDataStack {
    public static let modelName = "RBizReportModel"

    public static let model: NSManagedObjectModel = {
        let bundle = Bundle.module//(for: CoreDataStack.self)

        guard let url = bundle.url(forResource: modelName, withExtension: "momd") else {
            fatalError("Failed to locate momd file for \(modelName)")
        }

        guard let model = NSManagedObjectModel(contentsOf: url) else {
            fatalError("Failed to load momd file for \(modelName)")
        }

        return model
    }()

    private let container: PersistentContainer

    public lazy var context: NSManagedObjectContext = {
        container.viewContext
    }()

    public lazy var backgroundContext: NSManagedObjectContext = {
        container.newBackgroundContext()
    }()

    public init(inMemory: Bool = false) {
        container = PersistentContainer(name: Self.modelName, managedObjectModel: Self.model)

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}

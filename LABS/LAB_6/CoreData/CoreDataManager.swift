//
//  CoreDataManager.swift
//  LABS
//
//  Created by Сергей Адольевич on 17.04.2022.
//

import Foundation
import CoreData

protocol CoreDataManagerProtocol {
    var readContext: NSManagedObjectContext { get }
    var writeContext: NSManagedObjectContext { get }
}

final class CoreDataManager: CoreDataManagerProtocol {
    
    let persistantContainer = NSPersistentContainer(name: "Game")
    
    var readContext: NSManagedObjectContext {
        persistantContainer.viewContext
    }
    
    var writeContext: NSManagedObjectContext {
        persistantContainer.newBackgroundContext()
    }
    
    init() {
        persistantContainer.loadPersistentStores{_, error in
            if let errror = error {
                assertionFailure("Error: \(error)")
            }
        }
    }
}


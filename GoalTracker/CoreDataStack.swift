//
//  CoreDataStack.swift
//  GoalTracker
//
//  Created by Tifo Audi Alif Putra on 27/04/22.
//

import CoreData

final class CoreDataStack {
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "GoalTracker")
        persistentContainer.loadPersistentStores { _ , error in
            guard error == nil else {
                return
            }
        }
        return persistentContainer
    }()
    
    lazy var viewContext: NSManagedObjectContext = {
        self.persistentContainer.viewContext
    }()
    
    func save() {
        guard viewContext.hasChanges else {
            return
        }
        
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
    }
}

//
// Created by Shaban on 20/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import UIKit
import Core
import CoreData

struct VenueEntry {
    static let entity = "Venue"
    static let name = "name"
    static let id = "id"
}

struct VenueDao {

    func all() throws -> [VenueResponse] {
        guard let appDelegate = UIApplication.shared.delegate as? CoreAppDelegate else {
            return []
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: VenueEntry.entity)
        let venue = try managedContext.fetch(fetchRequest)
        let items = venue.map { item -> VenueResponse in
            let name = item.value(forKey: VenueEntry.name) as? String ?? ""
            let id = item.value(forKey: VenueEntry.id) as? String ?? ""
            return VenueResponse(fsqID: id, name: name)
        }
        return items
    }

    func save(_ items: [VenueResponse]) async throws {
        AppDatabase.delete(entity: VenueEntry.entity)
        for item in items {
            try save(item: item)
        }
    }

    func save(item: VenueResponse) throws {
        guard let appDelegate = UIApplication.shared.delegate as? CoreAppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: VenueEntry.entity, in: managedContext)!
        let venue = NSManagedObject(entity: entity, insertInto: managedContext)

        venue.setValue(item.name, forKeyPath: VenueEntry.name)
        venue.setValue(item.fsqID, forKeyPath: VenueEntry.id)
        try managedContext.save()
    }

}

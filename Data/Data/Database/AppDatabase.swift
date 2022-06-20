//
// Created by Shaban on 20/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import CoreData
import UIKit
import Core

struct AppDatabase {

    static func delete(entity: String) {
        guard let appDelegate = UIApplication.shared.delegate as? CoreAppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false

        do {
            let results = try managedContext.fetch(fetchRequest)
            for managedObject in results {
                let managedObjectData: NSManagedObject = managedObject
                managedContext.delete(managedObjectData)
            }
        } catch let error as NSError {
            print("Delete all data in \(entity) error : \(error) \(error.userInfo)")
        }
    }
}

//
//  DataController.swift
//  AquaPulse
//
//  Created by 許桓菘 on 2023/5/24.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "Model")
    
    init() {
        container.loadPersistentStores{desc,error in
            if let error = error{
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    
    }
    func save(context: NSManagedObjectContext){
        do{
            try context.save()
            print("Data saves!! WUHU!!!")
        }catch{
            print("We could not save the Data...")
        }
    }
    
    func getDrinkMetaDataCount() -> Int {
        let fetchRequest: NSFetchRequest<CDDrinkMetaData> = CDDrinkMetaData.fetchRequest()
        
        do {
            let count = try container.viewContext.count(for: fetchRequest)
            return count
        } catch {
            print("Failed to fetch CDDrinkMetaData count: \(error)")
            return 0
        }
    }
    func getDrinkItemCount(for metaData: CDDrinkMetaData) -> Int {
        return metaData.relationship_drinkitem?.count ?? 0
    }
}

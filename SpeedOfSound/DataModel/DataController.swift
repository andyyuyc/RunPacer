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
    
    /*func addFood(nmae: String, calories: Double, context: NSManagedObjectContext){
        let drink = Drink_coredaata(context: context)
        drink.id=UUID()
        drink.name = "水"
        drink.proportion=1
        drink.color = "Color.blue"
        drink.image = "glass-of-water"
        
        save(context: context)
    }*/
    
   
    
}

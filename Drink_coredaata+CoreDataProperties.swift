//
//  Drink_coredaata+CoreDataProperties.swift
//  AquaPulse
//
//  Created by 許桓菘 on 2023/6/17.
//
//

import Foundation
import CoreData


extension Drink_coredaata {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Drink_coredaata> {
        return NSFetchRequest<Drink_coredaata>(entityName: "Drink_coredaata")
    }

    @NSManaged public var color: String?
    @NSManaged public var id: UUID?
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var proportion: Float

}

extension Drink_coredaata : Identifiable {

}

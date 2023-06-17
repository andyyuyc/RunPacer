//
//  CDdrink_item+CoreDataProperties.swift
//  AquaPulse
//
//  Created by 許桓菘 on 2023/6/18.
//
//

import Foundation
import CoreData


extension CDdrink_item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDdrink_item> {
        return NSFetchRequest<CDdrink_item>(entityName: "CDdrink_item")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var drink_num: Int64
    @NSManaged public var ml: Int64
    @NSManaged public var relationship_Metadata: CDDrinkMetaData?

}

extension CDdrink_item : Identifiable {

}

//
//  CDDrinkMetaData+CoreDataProperties.swift
//  AquaPulse
//
//  Created by 許桓菘 on 2023/6/18.
//
//

import Foundation
import CoreData


extension CDDrinkMetaData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDDrinkMetaData> {
        return NSFetchRequest<CDDrinkMetaData>(entityName: "CDDrinkMetaData")
    }

    @NSManaged public var float: Int64
    @NSManaged public var relationship_drinkitem: NSSet?

}

// MARK: Generated accessors for relationship_drinkitem
extension CDDrinkMetaData {

    @objc(addRelationship_drinkitemObject:)
    @NSManaged public func addToRelationship_drinkitem(_ value: CDdrink_item)

    @objc(removeRelationship_drinkitemObject:)
    @NSManaged public func removeFromRelationship_drinkitem(_ value: CDdrink_item)

    @objc(addRelationship_drinkitem:)
    @NSManaged public func addToRelationship_drinkitem(_ values: NSSet)

    @objc(removeRelationship_drinkitem:)
    @NSManaged public func removeFromRelationship_drinkitem(_ values: NSSet)

}

extension CDDrinkMetaData : Identifiable {

}

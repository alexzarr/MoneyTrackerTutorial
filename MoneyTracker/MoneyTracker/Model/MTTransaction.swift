//
//  MTTransaction.swift
//  MoneyTracker
//
//  Created by Alex Zarr on 2023-07-17.
//

import Foundation
import CoreData

final class MTTransaction: NSManagedObject {
    @NSManaged public var id: UUID?
    @NSManaged public var amount: NSDecimalNumber
    @NSManaged public var type: MTTransactionType
    @NSManaged public var madeOn: Date
    @NSManaged public var addedOn: Date
    @NSManaged public var lastModifiedOn: Date
    @NSManaged public var isRemoved: Bool
}

extension MTTransaction {
    class func fetchRequest() -> NSFetchRequest<MTTransaction> {
        let request = NSFetchRequest<MTTransaction>(entityName: "MTTransaction")
        request.predicate = NSPredicate(format: "isRemoved == false")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \MTTransaction.madeOn, ascending: false)]
        return request
    }
}

// MARK: - Identifiable
extension MTTransaction: Identifiable { }

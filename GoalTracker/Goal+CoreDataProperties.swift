//
//  Goal+CoreDataProperties.swift
//  GoalTracker
//
//  Created by Tifo Audi Alif Putra on 27/04/22.
//
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var title: String?
    @NSManaged public var desc: String?
    @NSManaged public var currentProgress: Int64
    @NSManaged public var totalProgress: Int64

}

extension Goal : Identifiable {

}

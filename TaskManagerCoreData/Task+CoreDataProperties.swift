//
//  Task+CoreDataProperties.swift
//  TaskManagerCoreData
//
//  Created by David Dean on 4/24/18.
//  Copyright © 2018 David Dean. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var title: String?
    @NSManaged public var desc: String?

}

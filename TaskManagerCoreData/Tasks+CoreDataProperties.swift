//
//  Tasks+CoreDataProperties.swift
//  TaskManagerCoreData
//
//  Created by David Dean on 4/24/18.
//  Copyright © 2018 David Dean. All rights reserved.
//
//

import Foundation
import CoreData


extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var title: String?
    @NSManaged public var taskDescription: String?

}

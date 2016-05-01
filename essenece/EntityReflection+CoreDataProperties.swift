//
//  EntityReflection+CoreDataProperties.swift
//  essenece
//
//  Created by martin chibwe on 4/10/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension EntityReflection {

    @NSManaged var body: String?
    @NSManaged var idea: String?
    @NSManaged var location: String?
    @NSManaged var date: NSTimeInterval
    @NSManaged var imagedata: NSData?
	
	func sectionName() -> String {
		//        let date = NSDate().dateByAddingTimeInterval(self.date)Ø
		let date = NSDate(timeIntervalSinceReferenceDate: 123)
		let f = NSDateFormatter()
		f.dateFormat = "MMM yyyy"
		
		return f.stringFromDate(date)
	}

}

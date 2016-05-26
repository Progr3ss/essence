//
//  EntityReflection+CoreDataProperties.swift
//  essenece
//
//  Created by martin chibwe on 5/6/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension EntityReflection {

    @NSManaged var body: String?
    @NSManaged var date: NSTimeInterval
    @NSManaged var idea: String?
    @NSManaged var imagedata: NSData?
    @NSManaged var location: String?
    @NSManaged var question: String?
	
	func sectionName() -> String {
		let date = NSDate(timeIntervalSince1970: self.date)
		let f = NSDateFormatter()
		f.dateFormat = "MMMM yyy"
		
		return f.stringFromDate(date)
	}

	

}

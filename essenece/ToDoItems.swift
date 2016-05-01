//
//  ToDoItems.swift
//  essenece
//
//  Created by martin chibwe on 4/9/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit



class ToDoItems {
	
	
	// A text description of this item.
	var text: String
	var originalCenter = CGPoint()
	var deleteOnDragRelease = false
	
	
	// A Boolean value that determines the completed state of this item.
	var completed: Bool
	
	// Returns a ToDoItem initialized with the given text and default completed value.
	init(text: String) {
		self.text = text
		self.completed = false
		
		
	}
}
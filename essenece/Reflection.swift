//
//  Reflection.swift
//  essenece
//
//  Created by martin chibwe on 4/9/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit
import CoreData
class Reflection: UIViewController, UITextViewDelegate {
	
	

	@IBOutlet weak var bodyReflection: UITextField!
	@IBOutlet weak var userIdeaReflection: UILabel!
	@IBOutlet weak var reflectionView: UITextView!
	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var question: UILabel!
	@IBOutlet weak var addImage: UIButton!
	
	@IBOutlet weak var tvBgView: UIView!
	@IBOutlet weak var vTopConstraints: NSLayoutConstraint!
	
	var reflection : EntityReflection!
	var entry: EntityReflection!
	var userQuestion:String!
	let dataStack = CoreDataStack.sharedInstance
	
	var toDoItems = [ToDoItems]()
	
    override func viewDidLoad() {
        
        super.viewDidLoad()
		self.reflectionView.delegate = self

		
		date()
	
		reflectionView.becomeFirstResponder()
	
		

		if self.entry != nil{
            
			self.reflectionView.text = self.entry.body //self.entry.body
            userIdeaReflection.text = self.entry.idea
		}
		
	

    }
	
	func keyboardWillShow(sender: NSNotification) {
		self.view.frame.origin.y -= 150
	}
	func keyboardWillHide(sender: NSNotification) {
		self.view.frame.origin.y += 150
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension Reflection {
	
	func date() {

		
		let currentDate = NSDate()
		let dateFormatter = NSDateFormatter()
		
		dateFormatter.locale = NSLocale.currentLocale()
		var convertedDate = dateFormatter.stringFromDate(currentDate)
		
		
		dateFormatter.dateFormat = " MMMM dd, yyyy"
		convertedDate = dateFormatter.stringFromDate(currentDate)
		print("Current date \(convertedDate)")
		self.dateLabel.text = convertedDate

	}

	
	func insertDiaryEntry(){
		
		let entry = NSEntityDescription.insertNewObjectForEntityForName("EntityReflection", inManagedObjectContext: dataStack.managedObjectContext) as! EntityReflection
		
		entry.body = self.reflectionView.text
		entry.idea = toDoItems[0].text
		entry.question = self.userQuestion
		entry.date = NSDate().timeIntervalSince1970
		
		dataStack.saveContext()
		
	}
	
	func updateDiaryEntry() {
		self.entry.body = self.reflectionView.text
		
		

		let dataStack = CoreDataStack.sharedInstance
		
		dataStack.saveContext()
	}

	
	@IBAction func doneWasPressed(sender: AnyObject) {
		
		if self.entry != nil{
			self.updateDiaryEntry()
		}else{
			insertDiaryEntry()
		}
		transferToListDismiss()
		
	}
	
	
	@IBAction func cancelWasPressed(sender: AnyObject) {
		
		transferToListDismiss()
	}
	
	func transferToListDismiss(){
		performSegueWithIdentifier("timelineSegue", sender: nil)
	}
	
	//MARK: TextView Delegates
	
	func textViewDidBeginEditing(textView: UITextView) {
		
		self.vTopConstraints.constant = 0
	}
	
	func textViewDidEndEditing(textView: UITextView) {
		
		self.vTopConstraints.constant = 141
	}
}
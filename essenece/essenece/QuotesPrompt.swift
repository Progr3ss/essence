//
//  QuotesPrompt.swift
//  essenece
//
//  Created by martin chibwe on 4/6/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit

class QuotesPrompt: UIViewController, UITextFieldDelegate {
	


	@IBOutlet weak var userQuestion: UITextField!
	@IBOutlet weak var quotesTextField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
		
		quotesTextField.text = questions[0]
		self.userQuestion.delegate = self
		

    }
	
//	navigation
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		
		
		if segue.identifier == "showDivergent" {
			
			let divergent = segue.destinationViewController as! Divergent
			
			divergent.userQuestionFromQ = userQuestion.text!
			

		}
		
		
	}
	
	
	
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		
		textField.resignFirstResponder()
		
		if (!textField.text!.isEmpty) {
			
			self.userQuestion.text = textField.text!
			textField.textColor = UIColor.whiteColor()
			
			performSegueWithIdentifier("showDivergent", sender: self)
			
			
		}
		
		
		return true
	}
	
	

 
}

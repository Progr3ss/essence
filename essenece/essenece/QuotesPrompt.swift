//
//  QuotesPrompt.swift
//  essenece
//
//  Created by martin chibwe on 4/6/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit

class QuotesPrompt: UIViewController, UITextFieldDelegate {
	


	@IBOutlet weak var timerPicker: UIPickerView!
	@IBOutlet weak var userQuestion: UITextField!
	@IBOutlet weak var quotesTextField: UITextView!
	@IBOutlet weak var randomQuotes: UILabel!
	
	@IBOutlet weak var howHowtimeLabel: UILabel!
	@IBOutlet weak var textViewQuotes: UITextView!
	var timer = 5
	
	@IBOutlet weak var vTfTopConstraints: NSLayoutConstraint!
	
	//MARK: View Cycle
	
    override func viewDidLoad() {
        super.viewDidLoad()
		timerPicker.delegate = self
		timerPicker.dataSource = self
		let randomIndex = Int(arc4random_uniform(UInt32(questions.count)))

		textViewQuotes.text = questions[randomIndex]
		userQuestion.hidden = true
		
		self.userQuestion.delegate = self
		self.textViewQuotes.backgroundColor = UIColor.clearColor()
		self.textViewQuotes.textAlignment = NSTextAlignment.Center
		self.textViewQuotes.selectable = false
		
		
//		self.textViewQuotes.hidden = true
//		self.howHowtimeLabel.hidden = true
		
    }
	
	override func viewWillAppear(animated: Bool) {
		
		UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: { 
			self.textViewQuotes.hidden = false
			self.howHowtimeLabel.hidden = false
			
			}, completion: nil)
	}
	
	
//	navigation
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		
		
		if segue.identifier == "showDivergent" {
			
			let divergent = segue.destinationViewController as! Divergent
			
			divergent.userQuestionFromQ = userQuestion.text!
			divergent.counter = timer
			
			print("passing timer \(timer)")
			

		}
		
		
	}
	
	//MARK: TextView Delegate
	
	func textViewShouldBeginEditing(textView: UITextView) -> Bool {
		
		return true
	}
	
	func textViewDidBeginEditing(textView: UITextView) {
		
		//self.view.frame = CGRectMake (self.view.frame.origin.x, -250, self.view.frame.size.width, self.view.frame.size.height)
	}
	
	//MARK: Textfield Delegates
	
	func textFieldShouldBeginEditing(textField: UITextField) -> Bool  {
		
		return true
	}
	
	func textFieldDidBeginEditing(textField: UITextField)  {
		
		
//		self.vTfTopConstraints.constant = CGFloat (-150.0)
		
		timerPicker.hidden = true
		howHowtimeLabel.hidden = true
		
	}
	
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		
		self.setupViewFrameLayout()
		textField.resignFirstResponder()
		
		if (!textField.text!.isEmpty) {
			
			self.userQuestion.text = textField.text!
			textField.textColor = UIColor.whiteColor()
			
			performSegueWithIdentifier("showDivergent", sender: self)
		}
		
		return true
	}
	
	//MARK: Void Methods
	
	func setupViewFrameLayout() {
		
//		self.vTfTopConstraints.constant = CGFloat (24.0)
		self.view.frame = CGRectMake (self.view.frame.origin.x, 0, self.view.frame.size.width, self.view.frame.size.height)
	}

}


extension QuotesPrompt : UIPickerViewDelegate , UIPickerViewDataSource{
	
//	func updateLabel(){
////		let time = timerData[0]
//		
////		print(" you selected \(time)")
//		
//	}
	
	func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
		
		return 1
	}
	
	func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		
		return timerData.count
	}
	
	
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return timerData[row]
	}
	
	func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		
		if row == 0 {
			//change to 60 
			
			timer = 10
			
		}
		else if (row == 1){
			timer = 120
		}
		else if (row == 2){
			timer = 180
			
		}
		else if (row == 3){
			timer = 240
			
		}
		else if (row == 4){
			timer = 300
			
		}
		else if (row == 5){
			timer = 360
			
		}
		else if (row == 6){
			timer = 420
			
		}
		else if (row == 7){
			timer = 480
			
		}
		else if (row == 8){
			timer = 540
			
		}
		else if (row == 9){
			timer = 600
			
		}
		

		UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
			
				self.userQuestion.hidden = false
			}, completion: nil)
		
	
		
	}
	
	
	
	
	
	
}

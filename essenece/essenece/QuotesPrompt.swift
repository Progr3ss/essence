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
	
	var timer = 5
    override func viewDidLoad() {
        super.viewDidLoad()
		timerPicker.delegate = self
		timerPicker.dataSource = self
		
		quotesTextField.text = questions[0]
		self.userQuestion.delegate = self
		

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
			
			timer = 60
			
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
		
		
		print("Timer is \(timer)")
		
		
	}
	
	
	
	
	
}

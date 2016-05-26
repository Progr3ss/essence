//
//  Divergent.swift
//  essenece
//
//  Created by martin chibwe on 4/6/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit
import AVFoundation
class Divergent: UIViewController {
	


	
	@IBOutlet weak var ideaCounter: UILabel!
	@IBOutlet weak var timeCounter: UILabel!
	var timer = NSTimer()
	var counter = 0
	var player: AVAudioPlayer?
	@IBOutlet weak var userQuestionQ: UILabel!
	@IBOutlet weak var userIdeas: UITextField!
	@IBOutlet weak var tableView: UITableView!
	
	
	var toDoItems = [ToDoItems]()
	var mListIdeas :NSMutableArray = []
	var mColorArray : NSMutableArray = []
	var userQuestionFromQ = ""
	
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
	
		userIdeas.delegate = self
		userQuestionQ.text = userQuestionFromQ
		
		timeCounter.text = "\(counter)"
		
		
		userIdeas.becomeFirstResponder()

    }
	
}

extension Divergent {
	
	
	func playSound() {
		let url = NSBundle.mainBundle().URLForResource("drope", withExtension: "wav")!
		
		do {
			player = try AVAudioPlayer(contentsOfURL: url)
			guard let player = player else { return }
			
			player.prepareToPlay()
			player.play()
		} catch let error as NSError {
			print(error.description)
		}
	}
}


extension Divergent:UITableViewDataSource {
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! IdeaCell
		
		let item = toDoItems[indexPath.row]
		cell.backgroundColor = mColorArray[indexPath.row] as? UIColor
		cell.userInputLabel?.text = item.text
		
		return cell
	
		
	}
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 66
    }
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		ideaCounter.text = "\(toDoItems.count)"
		return toDoItems.count
	}
	

	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
		return true
	}
	
	
}

extension Divergent:UITextFieldDelegate{
	
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		if(!textField.text!.isEmpty){
			
			self.toDoItems.append(ToDoItems(text:textField.text!))
			textField.text = ""
//			textField.textColor = UIColor.whiteColor()
			tableView.hidden = false
			
			let randomIndex = Int(arc4random_uniform(UInt32(colorsArray.count)))
			mColorArray.addObject(colorsArray[randomIndex] as UIColor)
			
//			let mindexPath = NSIndexPath(forRow: self.toDoItems.cou)
			let mindexPath = NSIndexPath(forRow:self.toDoItems.count-1, inSection: 0)
			
			tableView.insertRowsAtIndexPaths([mindexPath], withRowAnimation: UITableViewRowAnimation.Top)
			tableView.scrollToRowAtIndexPath(mindexPath, atScrollPosition: UITableViewScrollPosition.Top, animated: false)
			playSound()
			self.tableView.reloadData()
		}
		timerCounting()
		return false 
	}
}
//MARK:FUNCTIONS
extension Divergent {
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		
		if segue.identifier == "convergentSegue" {

			let convergentView = segue.destinationViewController as! Convergent
			
			convergentView.self.toDoItems = self.toDoItems
			convergentView.mColorArray = mColorArray
			convergentView.userQuestion = userQuestionQ.text
			
//			print("In transfer = {\(self.toDoItems) and color \(mColorArray)}")
		}
	}
	
	
	func timerCounting(){
		timer.invalidate()
//		timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(Divergent.timeAction), userInfo: nil, repeats: true)
     timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(Divergent.timeAction), userInfo: nil, repeats: true)
	}
	
	func timeAction(){
		counter -= 1
		timeCounter.text = "\(counter)"
		
		if counter == 0 {
			performSegueWithIdentifier("convergentSegue", sender: nil)
		}
	}
	

}



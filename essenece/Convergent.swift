//
//  Convergent.swift
//  essenece
//
//  Created by martin chibwe on 4/9/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds

class Convergent: UIViewController {
	
	

	@IBOutlet weak var tableView: UITableView!
	

	var toDoItems = [ToDoItems]()
	var mColorArray: NSMutableArray =  []
	var userQuestion: String!
	var player: AVAudioPlayer?
	
	@IBOutlet weak var bannerView: GADBannerView!
	@IBOutlet weak var bannerViewBottonConstraints: NSLayoutConstraint!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		bannerView.adUnitID = "ca-app-pub-6538315736638726/7095363697"
		bannerView.rootViewController = self
		bannerView.loadRequest(GADRequest())
		

        tableView.registerClass(DivergentCell.self, forCellReuseIdentifier: "cell")
    }

}

extension Convergent {
	
	
	func playSound() {
		let url = NSBundle.mainBundle().URLForResource("swipe", withExtension: "wav")!
		
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
extension Convergent: UITableViewDataSource {
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		if toDoItems.count == 1 {
			performSegueWithIdentifier("reflectionSegue", sender: nil)
		}
		
		return toDoItems.count
	}
	
	func imageWithImage(image:UIImage,scaledToSize newSize:CGSize)->UIImage{
		
		UIGraphicsBeginImageContext( newSize )
		image.drawInRect(CGRect(x: 0,y: 0,width: newSize.width,height: newSize.height))
		let newImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return newImage.imageWithRenderingMode(.AlwaysTemplate)
	}

	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! DivergentCell
		
		let item = toDoItems[indexPath.row]
		cell.textLabel?.text = item.text
		cell.textLabel?.numberOfLines = 0

		cell.backgroundColor = mColorArray[indexPath.row] as? UIColor
		cell.imageView?.image = imageWithImage(UIImage(named: "idea")!, scaledToSize: CGSize(width: 30, height: 30))
		cell.imageView?.contentMode = .ScaleAspectFit
	
		cell.delegate = self
		cell.toDoItem = item
		return cell
	}
	

	
}
extension Convergent: UITableViewDelegate{

	
}

extension Convergent {
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		
		if segue.identifier == "reflectionSegue" {
			
		
			if let reflection = segue.destinationViewController as? Reflection {
				reflection.self.toDoItems = self.toDoItems
				reflection.userQuestion = userQuestion
				
				
				
			}

		}
	}
}

extension Convergent: TableViewCellDelegate {
	
	func toDoItemDeleted(toDoItem: ToDoItems) {
		let index = (toDoItems as NSArray).indexOfObject(toDoItem)
		if index == NSNotFound { return }
		
		// could removeAtIndex in the loop but keep it here for when indexOfObject works
		toDoItems.removeAtIndex(index)
		
		// use the UITableView to animate the removal of this row
		tableView.beginUpdates()
		let indexPathForRow = NSIndexPath(forRow: index, inSection: 0)
		tableView.deleteRowsAtIndexPaths([indexPathForRow], withRowAnimation: .Fade)
		tableView.endUpdates()
	}
	
	
}

//extension Convergent : GADBannerViewDelegate{
//	func adView(bannerView: GADBannerView!, didFailToReceiveAdWithError error: GADRequestError!) {
//		
//		if bannerViewBottonConstraints.constant == 0{
//			UIView.animateWithDuration(0.25, animations: { 
//				self.bannerViewBottonConstraints.constant = -CGRectGetHeight(self.bannerView.bounds)
//				
//				
//				self.view.layoutIfNeeded()
//				
//				}, completion: nil)
//		}
//		
//	}
//	
//	func adViewDidReceiveAd(bannerView: GADBannerView!) {
//		
//		if bannerViewBottonConstraints.constant != 0{
//			UIView.animateWithDuration(0.25, animations: {
//				self.bannerViewBottonConstraints.constant = 0
//				
//				self.bannerViewBottonConstraints.constant = 0
//				self.view.layoutIfNeeded()
//				
//	
//				
//				}, completion: nil)
//		}
//		
//	}
//	
//}
//


//
//  Timeline.swift
//  essenece
//
//  Created by martin chibwe on 4/10/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit
import CoreData

class Timeline: UIViewController {

	

	@IBOutlet weak var tableView: UITableView!
	
	
	var coreDataStack: CoreDataStack!
	var fetchedResultsController: NSFetchedResultsController!
	let dataStack = CoreDataStack.sharedInstance
	let entryCell = ConfigureCellForEntry()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
	
		tableView.estimatedRowHeight = 136
		tableView.rowHeight = UITableViewAutomaticDimension
//		table
		fetchResultController ()
		fetchedResultsController.delegate = self
		
		do {
			try fetchedResultsController.performFetch()
		} catch let error as NSError {
			print("Error: \(error.localizedDescription)")
		}
		


		do {
			try fetchedResultsController.performFetch()
		} catch let error as NSError {
			print("Error: \(error.localizedDescription)")
		}
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}


//NSFetechRequest
extension Timeline: NSFetchedResultsControllerDelegate {
	
	func entryListFetchequest() -> NSFetchRequest {
		let fetchRequest = NSFetchRequest(entityName: "EntityReflection")
		let date =
			NSSortDescriptor(key: "date", ascending:false)
		fetchRequest.sortDescriptors = [date]
		return fetchRequest
	}
	
	func fetchResultController() -> NSFetchedResultsController{
		if fetchedResultsController != nil{
			return fetchedResultsController
			
		}
		
		let fetchRequest:NSFetchRequest = self.entryListFetchequest()
		
		
		fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: dataStack.managedObjectContext, sectionNameKeyPath: "sectionName", cacheName: nil)
		
			fetchedResultsController?.delegate = self
		
		return fetchedResultsController
	}
	
	//Deletion
	
	func controllerWillChangeContent(controller: NSFetchedResultsController) {
		
		tableView.beginUpdates()
		
	}
	
	
	func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
		switch type {
		case .Insert:
			print("*** NSFetchedResultsChangeInsert (object)")
			tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Fade)
			
		case .Delete:
			print("*** NSFetchedResultsChangeDelete (object)")
			tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
			
		case .Update:
			tableView.reloadRowsAtIndexPaths([indexPath!], withRowAnimation: UITableViewRowAnimation.Fade)
		case .Move:
			print("*** NSFetchedResultsChangeMove (object)")
			tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
			tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Fade)
		}
	}
	
	func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
		switch type {
		case .Insert:
			print("*** NSFetchedResultsChangeInsert (section)")
			tableView.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
			
		case .Delete:
			print("*** NSFetchedResultsChangeDelete (section)")
			tableView.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
			
		case .Update:
			print("*** NSFetchedResultsChangeUpdate (section)")
			
		case .Move:
			print("*** NSFetchedResultsChangeMove (section)")
		}
	}
	
	func controllerDidChangeContent(controller: NSFetchedResultsController) {
		print("*** controllerDidChangeContent")
		tableView.endUpdates()
	}
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		
		if segue.identifier == "edit" {
		
//			let cell = sender as? UITableViewCell
//			let indexPath = tableView.indexPathForCell(cell!)
//			let navigationController = segue.destinationViewController as? UINavigationController
//			let entryViewCon = navigationController?.topViewController as? Reflection
//			entryViewCon?.reflection = self.fetchedResultsController.objectAtIndexPath(indexPath!) as! EntityReflection
		
		}
		
	}
}

extension Timeline: UITableViewDataSource, UITableViewDelegate{

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TimelineCell
		let entry = self.fetchedResultsController.objectAtIndexPath(indexPath) as? EntityReflection
		//cell.configureCellForEntry(entry!)
		cell.configureCellForEntry(entry!)
		
		return cell
	}
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		return fetchedResultsController.sections!.count
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		
//		let sectionInfo =  fetchedResultsController.sections![section]
//		
//		return sectionInfo.numberOfObjects
		
		
		let rows: NSFetchedResultsSectionInfo = self.fetchedResultsController.sections![section] as NSFetchedResultsSectionInfo
		
		return rows.numberOfObjects
		
	}
	
	func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		
		let sectionInfo =  fetchedResultsController.sections![section]
		return sectionInfo.name
	}
	
	func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
		let entry = self.fetchedResultsController.objectAtIndexPath(indexPath) as? EntityReflection
		dataStack.managedObjectContext.deleteObject(entry!)
		dataStack.saveContext()
	}
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let objVC = self.storyboard?.instantiateViewControllerWithIdentifier("Reflection") as! Reflection
        let selectedEntry = self.fetchedResultsController.objectAtIndexPath(indexPath) as? EntityReflection
        objVC.entry = selectedEntry
        self.presentViewController(objVC, animated: true, completion: nil);
    }
	
//	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//		
//		return tableView.rowHeight
//		
//		let entry = self.fetchResultController().objectAtIndexPath(indexPath) as? EntityReflection
//		
//		let height = entryCell.getHeightForEntry(entry!)
//		
//		return height
//	}

}

//extension TimelineCell: UITableViewDelegate{
//
//	func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
//		
//	
//		
//		return UITableViewCellEditingStyle.Delete
//		
//	}


//}
//

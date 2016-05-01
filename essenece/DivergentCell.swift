//
//  DivergentCell.swift
//  essenece
//
//  Created by martin chibwe on 4/9/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit
import QuartzCore


protocol TableViewCellDelegate {
	// indicates that the given item has been deleted
	func toDoItemDeleted(todoItem: ToDoItems)
}

class DivergentCell: UITableViewCell {
	
	
	@IBOutlet weak var listlabel: UILabel!
	
	var originalCenter = CGPoint()
	var deleteOnDragRelease = false
	// The object that acts as delegate for this cell.
	var delegate: TableViewCellDelegate?
	// The item that this cell renders.
	var toDoItem: ToDoItems?
	
	override func prepareForReuse() {
		super.prepareForReuse()
		self.listlabel.text = nil
	}
	
	required init(coder aDecoder: NSCoder) {
		fatalError("NSCoding not supported")
	}
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		
		
		// utility method for creating the contextual cues
		func createCueLabel() -> UILabel {
			let label = UILabel(frame: CGRect.null)
			label.textColor = UIColor.whiteColor()
			label.font = UIFont.boldSystemFontOfSize(32.0)
			label.backgroundColor = UIColor.clearColor()
			return label
		}
		
		// tick and cross labels for context cues
		
		
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		
		// remove the default blue highlight for selected cells
		selectionStyle = .None
		
		// gradient layer for cell
		
		
		// add a pan recognizer
		let recognizer = UIPanGestureRecognizer(target: self, action: "handlePan:")
		recognizer.delegate = self
		addGestureRecognizer(recognizer)
	}
	//MARK: - horizontal pan gesture methods
	func handlePan(recognizer: UIPanGestureRecognizer) {
		// 1
		if recognizer.state == .Began {
			// when the gesture begins, record the current center location
			originalCenter = center
		}
		// 2
		if recognizer.state == .Changed {
			let translation = recognizer.translationInView(self)
			center = CGPointMake(originalCenter.x + translation.x, originalCenter.y)
			// has the user dragged the item far enough to initiate a delete/complete?
			deleteOnDragRelease = frame.origin.x > +frame.size.width / 2.0
		}
		// 3
		if recognizer.state == .Ended {
			// the frame this cell had before user dragged it
			let originalFrame = CGRect(x: 0, y: frame.origin.y,
			                           width: bounds.size.width, height: bounds.size.height)
			if !deleteOnDragRelease {
				// if the item is not being deleted, snap back to the original location
				UIView.animateWithDuration(0.2, animations: {self.frame = originalFrame})
			}
		}
		
		if deleteOnDragRelease {
			if delegate != nil && toDoItem != nil {
				// notify the delegate that this item should be deleted
				delegate!.toDoItemDeleted(toDoItem!)
			}
		}
	}
	
	override func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
		if let panGestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer {
			let translation = panGestureRecognizer.translationInView(superview!)
			if fabs(translation.x) > fabs(translation.y) {
				return true
			}
			return false
		}
		return false
	}

}

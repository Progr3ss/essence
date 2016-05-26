//
//  TimelineCell.swift
//  essenece
//
//  Created by martin chibwe on 4/13/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit

class TimelineCell: UITableViewCell {
	
	


	@IBOutlet weak var dateTime: UILabel!
	@IBOutlet weak var bodyText: UILabel!
	@IBOutlet weak var question: UILabel!
	@IBOutlet weak var idea: UILabel!
	
	@IBOutlet weak var location: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()


        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func getHeightForEntry(entry:EntityReflection) -> CGFloat {
		
		// Margins at top and bottom of table view cell
		let topMargin:CGFloat    = 35.0
		let bottomMargin:CGFloat = 80.0
		let minHeight:CGFloat    = 85.0
		
		// Get system font size, which is used to render the cell to the screen
		let font = UIFont.systemFontOfSize(UIFont.systemFontSize()) as UIFont
		
		// Calculate the bounding box by providing a maximum width and height in the form of CGSize, also provide attributes to providie such as font to draw the box with
		let boundingBox = entry.body!.boundingRectWithSize(CGSizeMake(202.0, CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:font], context: nil) as CGRect
		
		// Return either the MAX of minimum height, or the CGRECT with the top and bottom margings
		return max(minHeight, (CGRectGetHeight(boundingBox) + topMargin + bottomMargin))
	}
	

	
	func configureCellForEntry(entry:EntityReflection) {
		

		self.bodyText.text = entry.body
		self.question.text = entry.question
		self.idea.text = entry.idea
//		let date =
//		self.dateTime.text = formatter.stringFromDate(date)
		print("body \(entry.body)")

	}

}

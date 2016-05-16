//
//  configureCellForEntry.swift
//  essenece
//
//  Created by martin chibwe on 4/12/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit

class ConfigureCellForEntry: UITableViewCell {

	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var bodyLabel: UILabel!
	@IBOutlet weak var locationLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func configureCellForEntry(entry:EntityReflection) {
		
		// Day of the week, month, year format
//		let formatter = NSDateFormatter()
//		formatter.dateFormat = " MMMM dd, yyyy"
		let formatter = NSDateFormatter()
		formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
		formatter.dateFormat = "MMMM dd, yyyy"
		
		// Create the new date object
		let date = NSDate(timeIntervalSince1970: entry.date)
		
		self.bodyLabel.text = entry.body
		self.locationLabel.text = entry.location
		self.dateLabel.text = formatter.stringFromDate(date)
    }
	
	
	
	// Custom dynamic cell heights
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
}

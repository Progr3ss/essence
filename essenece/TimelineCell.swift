//
//  TimelineCell.swift
//  essenece
//
//  Created by martin chibwe on 4/13/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit

class TimelineCell: UITableViewCell {
	
	

//	@IBOutlet weak var bodyLabel: UILabel!
//	@IBOutlet weak var dateLabel: UILabel!
//	@IBOutlet weak var locationLabel: UILabel!
	
	@IBOutlet weak var dateTime: UILabel!
	@IBOutlet weak var bodyText: UILabel!
	
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
	
//	func getHeightForEntry(entry:EntityReflection) -> CGFloat {
//
//		// Margins at top and bottom of table view cell
//		let topMargin:CGFloat    = 35.0
//		let bottomMargin:CGFloat = 20.0
//		let minHeight:CGFloat    = 15.0
//		
//		// Get system font size, which is used to render the cell to the screen
//		let font = UIFont.systemFontOfSize(UIFont.systemFontSize()) as UIFont
//		
//		// Calculate the bounding box by providing a maximum width and height in the form of CGSize, also provide attributes to providie such as font to draw the box with
//		let boundingBox = entry.body!.boundingRectWithSize(CGSizeMake(66.0, CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:font], context: nil) as CGRect
//		
//		// Return either the MAX of minimum height, or the CGRECT with the top and bottom margings
//		return max(minHeight, (CGRectGetHeight(boundingBox) + topMargin + bottomMargin))
//	}
	
	func configureCellForEntry(entry:EntityReflection) {
		// Create the new date object
		let currentDate = NSDate()
		let dateFormatter = NSDateFormatter()
		
		dateFormatter.locale = NSLocale.currentLocale()
		var convertedDate = dateFormatter.stringFromDate(currentDate)
		
		
		dateFormatter.dateFormat = " MMMM dd, yyyy"
		convertedDate = dateFormatter.stringFromDate(currentDate)
		print("Current date \(convertedDate)")

		
//		// Create the new date object
//		let date = NSDate(timeIntervalSince1970: entry.date)
		
		self.dateTime.text = convertedDate
		
		
//		self.bodyText.text = " this is the body"
		
		self.location.text = "This is a location"
		self.bodyText.text = entry.body
		print("body \(entry.body)")
//		self.dateTime.text = formatter.stringFromDate(date)
		
//		print("date \(self.dateTime.text) and  \(formatter.stringFromDate(date))")
		
		
//		self.locationLabel.text = entry.location
//		self.dateLabel.text = formatter.stringFromDate(date)
//		print("\(self.bodyLabel.text)")
//		self.mainImage!.image = UIImage(named: "icn_noimage")
//		
//		if entry.imageData != nil{
//			self.mainImage!.image = UIImage(data: entry.imageData!)
//		}else{
//			self.mainImage!.image = UIImage(named: "icn_noimage")
//		}
//		
//		// Set the rounded edges - using Quartz framework - ensure clipsubviews is checked in storyboard to perform clipped, otherwise this will do nothing
//		self.mainImage.layer.cornerRadius = CGRectGetWidth(self.mainImage.frame) / 2.0
		
		
	}

}

//
//  WalkthroughContent.swift
//  essenece
//
//  Created by martin chibwe on 5/15/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit

class WalkthroughContent: UIViewController {
	
	@IBOutlet var headingLabel: UILabel!
	@IBOutlet var contentLabel: UILabel!
	@IBOutlet var contentImageView: UIImageView!
	@IBOutlet var pageControl:UIPageControl!
	@IBOutlet var forwardButton:UIButton!
	
	
	var index = 0
	var heading = ""
	var imageFile = ""
	var content = ""

    override func viewDidLoad() {
		
		
        super.viewDidLoad()
		headingLabel.text = heading
		contentLabel.text = content
		contentImageView.image = UIImage(named:imageFile )
		
		pageControl.numberOfPages = 4
		pageControl.currentPage = index
		
		
		switch index {
		case 0...2: forwardButton.setTitle("NEXT", forState: UIControlState.Normal)
		case 3: forwardButton.setTitle("DONE", forState: UIControlState.Normal)
		default: break
		}
		


        // Do any additional setup after loading the view.
    }


    
	@IBAction func nextButtonTapped(sender: AnyObject) {
		
		switch index {
		case 0...2:
			let pageViewController = parentViewController as! WalkthroughPage
			pageViewController.forward(index)
			
			
		case 3:
			let defaults = NSUserDefaults.standardUserDefaults()
			defaults.setBool(true, forKey: "hasViewedWalkthrough")
			
			dismissViewControllerAnimated(true, completion: nil)
			
		default: break
			
		}
	}
}


//
//  WalkthroughPage.swift
//  essenece
//
//  Created by martin chibwe on 5/15/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit

class WalkthroughPage: UIPageViewController {
	
	var pageHeadings = ["Question", "Divergent", "Convergent", "Reflection"]
	var pageImages =   ["Question-page", "Divergent-page", "Convrgent-page","Reflection-page"]
	var pageContents = ["Ask great questions to get great answers",
	                   "Divergent allows you to create  different answers in a limited time.which enables you to be more creative.",
	                   "Convergent enables you to filter out the answers that are not reasonable. Choose only one answer.",
	                   
	                   "Reflect on the answers and questions. "]
	

    override func viewDidLoad() {
        super.viewDidLoad()
		dataSource = self
		
		if let startingViewController  = viewControllerAtIndex(0)
		{
			setViewControllers([startingViewController], direction: .Forward, animated: true, completion: nil)
			
			
		}

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension WalkthroughPage {
	
	func forward(index:Int) {
		if let nextViewController = viewControllerAtIndex(index + 1) {
			setViewControllers([nextViewController], direction: .Forward, animated: true, completion: nil)
		}
	}
}

extension WalkthroughPage: UIPageViewControllerDataSource
{
	
	func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
		
		var index = (viewController as! WalkthroughContent).index
		index += 1
		
		
		return viewControllerAtIndex(index)
		
		
	}
	
	
	func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
		
		var index = (viewController as! WalkthroughContent).index
		index -= 1
		
		return viewControllerAtIndex(index)
	}
	
	

	
	func viewControllerAtIndex(index: Int) -> WalkthroughContent?
	{
		
		if index == NSNotFound || index < 0 || index >= pageHeadings.count
		{
			return nil
		}
		
		if let pageContent =
		storyboard?.instantiateViewControllerWithIdentifier("WalkthroughContent") as?
		WalkthroughContent
		{
			pageContent.imageFile = pageImages[index]
			pageContent.heading = pageHeadings[index]
			pageContent.content = pageContents[index]
			pageContent.index = index
			
			return pageContent
		}
		
		return nil
	}
	
	
	
	
}


extension WalkthroughPage: UIPageViewControllerDelegate
{
	
}
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
	var pageImages = ["Question-page", "Divergent-page", "Convrgent-page","Reflection-page"]
	var pageContents = ["Pin your favorite restaurants and create your own food guide",
	                   "Search and locate your favourite restaurant on Maps",
	                   "Find restaurants pinned by your friends and other foodies around the world","martin test"]

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

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
	
	
//	func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
//		
//		return pageHeadings.count
//	}
//	
//	func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
//		
//		if let pageContentViewController = storyboard?.instantiateViewControllerWithIdentifier("WalkthroughContent") as? WalkthroughContent {
//			
//			return pageContentViewController.index
//			
//		}
//		
//		return 0
//
//	}
	
	
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

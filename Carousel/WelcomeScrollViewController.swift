//
//  WelcomeScrollViewController.swift
//  Carousel
//
//  Created by Frank Yoo on 2/12/16.
//  Copyright © 2016 Frank Yoo. All rights reserved.
//

import UIKit

class WelcomeScrollViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var welcomeScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var tryButtonParentView: UIView!
    @IBOutlet weak var tryCarouselButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        welcomeScrollView.delegate = self
        
        welcomeScrollView.contentSize = CGSize(width: 1280, height: 568)
        welcomeScrollView.frame.size = CGSize(width: 320, height: 568)
        welcomeScrollView.pagingEnabled = true
        welcomeScrollView.showsHorizontalScrollIndicator = false
        
        tryButtonParentView.alpha = 0
        
    }

    func scrollViewDidEndDecelerating(welcomeScrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        let page : Int = Int(round(welcomeScrollView.contentOffset.x / 320))
//        print(page)
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        if page == 3 {
            
         
            // The main view is about to appear...
            func viewWillAppear(animated: Bool) {
                // Set initial transform values 20% of original size
                let transform = CGAffineTransformMakeScale(0.2, 0.2)
                // Apply the transform properties of the views
                pageControl.transform = transform
                tryButtonParentView.transform = transform
                // Set the alpha properties of the views to transparent
                pageControl.alpha = 0
                tryButtonParentView.alpha = 1
            }
            
            //Animate the code within over 0.3 seconds...
            UIView.animateWithDuration(0.3) { () -> Void in
                // Return the views transform properties to their default states.
                self.pageControl.transform = CGAffineTransformIdentity
                self.tryButtonParentView.transform = CGAffineTransformIdentity
                // Set the alpha properties of the views to fully opaque
                self.pageControl.alpha = 0
                self.tryButtonParentView.alpha = 1
            }
            
        } else {
            
            // The main view is about to appear...
            func viewWillAppear(animated: Bool) {
                // Set initial transform values 20% of original size
                let transform = CGAffineTransformMakeScale(0.2, 0.2)
                // Apply the transform properties of the views
                pageControl.transform = transform
                tryButtonParentView.transform = transform
                // Set the alpha properties of the views to transparent
                pageControl.alpha = 1
                tryButtonParentView.alpha = 0
            }
            
            //Animate the code within over 0.3 seconds...
            UIView.animateWithDuration(0.3) { () -> Void in
                // Return the views transform properties to their default states.
                self.pageControl.transform = CGAffineTransformIdentity
                self.tryButtonParentView.transform = CGAffineTransformIdentity
                // Set the alpha properties of the views to fully opaque
                self.pageControl.alpha = 1
                self.tryButtonParentView.alpha = 0
            }
            
        }
        
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

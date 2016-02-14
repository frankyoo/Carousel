//
//  CreateViewController.swift
//  Carousel
//
//  Created by Frank Yoo on 2/14/16.
//  Copyright © 2016 Frank Yoo. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var createScrollView: UIScrollView!
    @IBOutlet weak var formParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var checkboxButton: UIButton!
    @IBOutlet weak var createDropboxButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var createNavBar: UIImageView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createScrollView.delegate = self
        
        createScrollView.contentSize = createScrollView.frame.size
        createScrollView.contentInset.bottom = 100
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -50
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
    }
    
    // The main view is about to appear...
    override func viewWillAppear(animated: Bool) {
        // Set initial transform values 20% of original size
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        // Apply the transform properties of the views
        createNavBar.transform = transform
        formParentView.transform = transform
        // Set the alpha properties of the views to transparent
        createNavBar.alpha = 0
        formParentView.alpha = 0
    }
    
    // The main view appeared...
    override func viewDidAppear(animated: Bool) {
        //Animate the code within over 0.2 seconds...
        UIView.animateWithDuration(0.2) { () -> Void in
            // Return the views transform properties to their default states.
            self.formParentView.transform = CGAffineTransformIdentity
            self.createNavBar.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.formParentView.alpha = 1
            self.createNavBar.alpha = 1
        }
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        
        //        print("keyboardWillShow")
        
        // Move the button up above keyboard
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        
        // Scroll the scrollview up
        createScrollView.contentOffset.y = createScrollView.contentInset.bottom
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        // Move the buttons back down to it's original position
        buttonParentView.frame.origin.y = buttonInitialY
    }
    
    // The scrollView is in the proccess of scrolling...
    func scrollViewDidScroll(createScrollView: UIScrollView) {
        // If the scrollView has been scrolled down by 50px or more...
        if createScrollView.contentOffset.y <= -50 {
            view.endEditing(true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressBack(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func didPressCheckbox(sender: UIButton) {
        sender.selected = !sender.selected
    }

    @IBAction func didPressCreateButton(sender: AnyObject) {

        if firstNameField.text!.isEmpty || lastNameField.text!.isEmpty || emailField.text!.isEmpty || passwordField.text!.isEmpty {
            
            // Create and Show UIAlertController...see guide, Using UIAlertController
            
            let alertController = UIAlertController(title: "All fields required", message: "Please complete all fields to create a Dropbox", preferredStyle: .Alert)
            
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // handle response here.
            }
            // add the OK action to the alert controller
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
            
        } else {
           
            // perform the Segue to the next screen.
            
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let segueToWelcome = mainStoryboard.instantiateViewControllerWithIdentifier("segueToWelcome")
            
            self.presentViewController(segueToWelcome, animated: true, completion: nil)
        }
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

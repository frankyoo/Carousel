//
//  LoginViewController.swift
//  Carousel
//
//  Created by Frank Yoo on 2/12/16.
//  Copyright © 2016 Frank Yoo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var loginNavBar: UIImageView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginScrollView.delegate = self

        loginScrollView.contentSize = loginScrollView.frame.size
        loginScrollView.contentInset.bottom = 100

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
        loginNavBar.transform = transform
        fieldParentView.transform = transform
        // Set the alpha properties of the views to transparent
        loginNavBar.alpha = 0
        fieldParentView.alpha = 0
    }
    
    // The main view appeared...
    override func viewDidAppear(animated: Bool) {
        //Animate the code within over 0.3 seconds...
        UIView.animateWithDuration(0.3) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.loginNavBar.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
        }
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        
//        print("keyboardWillShow")
        
        // Move the button up above keyboard
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        
        // Scroll the scrollview up
        loginScrollView.contentOffset.y = loginScrollView.contentInset.bottom
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        // Move the buttons back down to it's original position
        buttonParentView.frame.origin.y = buttonInitialY
    }
    
    // The scrollView is in the proccess of scrolling...
    func scrollViewDidScroll(loginScrollView: UIScrollView) {
        // If the scrollView has been scrolled down by 50px or more...
        if loginScrollView.contentOffset.y <= -50 {
            view.endEditing(true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPressBack(sender: AnyObject) {
//        navigationController!.popViewControllerAnimated(true)
//        print("back pressed")
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func didPressLogin(sender: AnyObject) {
        // Start animating the activity indicator
        loginIndicator.startAnimating()
        
        if emailField.text == "e" && passwordField.text == "p" {
            // Delay for 2 second.
            delay(2, closure: { () -> () in
                // Stop animating the activity indicator.
                self.loginIndicator.stopAnimating()
                
                // perform the Segue to the next screen.
                
                let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                
                let segueToWelcome = mainStoryboard.instantiateViewControllerWithIdentifier("segueToWelcome")
                
                self.presentViewController(segueToWelcome, animated: true, completion: nil)
                
//                self.performSegueWithIdentifier("segueToWelcome", sender: self)
            })

        } else if emailField.text!.isEmpty || passwordField.text!.isEmpty {

            // Stop animating the activity indicator.
            self.loginIndicator.stopAnimating()
            
            // Create and Show UIAlertController...see guide, Using UIAlertController
            
            var alertTitle: String
            var alertMessage: String
            
            if emailField.text!.isEmpty {

                alertTitle = "Email Required"
                alertMessage = "This is a major key"
                
            } else {
                
                alertTitle = "Password Required"
                alertMessage = "Celebrate the only way, enter a password"

            }
            
            let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .Alert)
            
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
            // Delay for 2 second
            delay(2, closure: { () -> () in
                // Stop animating the activity indicator.
                self.loginIndicator.stopAnimating()

                // Create and Show UIAlertController...see guide, Using UIAlertController
                let alertController = UIAlertController(title: "Invalid Email or Password", message: "You played yourself", preferredStyle: .Alert)
                
                // create an OK action
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
                
                self.presentViewController(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }

            })
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

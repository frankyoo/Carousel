//
//  SettingsViewController.swift
//  Carousel
//
//  Created by Frank Yoo on 2/12/16.
//  Copyright © 2016 Frank Yoo. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var settingsScrollView: UIScrollView!
    @IBOutlet weak var signoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        settingsScrollView.contentSize = CGSize(width: 320, height: 759)
        settingsScrollView.frame.size = CGSize(width: 320, height: 568)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressCloseButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func didPressSignoutButton(sender: AnyObject) {
        // Create and Show UIAlertController...see guide, Using UIAlertController
        let alertController = UIAlertController(title: "Signing out?!", message: "Don't play yourself", preferredStyle: .ActionSheet)
        
        let logoutAction = UIAlertAction(title: "Log Out", style: .Destructive) { (action) in

            // perform the Segue to the next screen.
            
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let segueToLogin = mainStoryboard.instantiateViewControllerWithIdentifier("segueToLogin")
            
            self.presentViewController(segueToLogin, animated: true, completion: nil)
            
        }
        // add the logout action to the alert controller
        alertController.addAction(logoutAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // handle case of user canceling. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alert controller
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
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

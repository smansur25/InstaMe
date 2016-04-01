//
//  LogoutViewController.swift
//  InstaMe :)
//
//  Created by Sumaiya Mansur on 3/31/16.
//  Copyright © 2016 Sumaiya Mansur. All rights reserved.
//

import UIKit
import ParseUI

class LogoutViewController: UIViewController {

    @IBOutlet weak var LogoutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onlogout(sender: AnyObject) {
        PFUser.logOut()
        print("LoggedOut")
        
        self.performSegueWithIdentifier("LoginSegue", sender: nil)
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

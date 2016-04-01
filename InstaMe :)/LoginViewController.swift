//
//  LoginViewController.swift
//  InstaMe :)
//
//  Created by Sumaiya Mansur on 3/28/16.
//  Copyright © 2016 Sumaiya Mansur. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignin(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(usernameField.text!, password: passwordField.text!) { (user: PFUser?, error:NSError?) -> Void in
            
            if let error = error {
                print("User login failed.")
                print(error.localizedDescription)
            } else {
                print("User logged in successfully")
                // display view controller that needs to shown after successful login
                
                self.performSegueWithIdentifier("LoginSegue", sender: nil)
                
                
            }
        }
    }

    
    @IBAction func onSignup(sender: AnyObject) {
        let newUser = PFUser()
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        newUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success {
                print ("Yay, account made")
                self.performSegueWithIdentifier("LoginSegue", sender: nil)
            }
            else {
                print(error?.localizedDescription)
                if error?.code == 202
                {
                    print ("Username is taken, try again")
                }
            }
            
            
            
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

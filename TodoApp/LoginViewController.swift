//
//  LoginViewController.swift
//  TodoApp
//
//  Created by Brandon on 2016-06-18.
//  Copyright © 2016 RBSoftware. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController : UIViewController
{
    
    @IBOutlet var usernameTextBox: UITextField!
    
    @IBOutlet var passwordTextBox: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Login screen loaded.")
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginAttempt(sender: AnyObject) {
        print("Login button pressed.")
        
        usernameTextBox.text = ""
        passwordTextBox.text = ""
        //add logic where if login is correct, load TodoTableNavigation
        let storyboard = UIStoryboard(name: "TodoList", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("TodoTableNavigation") as UIViewController
        presentViewController(vc, animated: true, completion: nil)
        
    }
    
}
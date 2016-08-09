//
//  LoginViewController.swift
//  TodoApp
//
//  Created by Brandon on 2016-06-18.
//  Copyright © 2016 RBSoftware. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import CoreGraphics

class LoginViewController : UIViewController
{
    
    @IBOutlet var usernameTextBox: UITextField!
    
    @IBOutlet var passwordTextBox: UITextField!
    
    @IBOutlet weak var errorMessage: UILabel!
    
    var api: TodoAPI = TodoAPI(url: "https://brandon-todo.herokuapp.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Login screen loaded.")
        
        usernameTextBox.textAlignment = NSTextAlignment.Left
        usernameTextBox.backgroundColor = UIColor.clearColor()
        usernameTextBox.borderStyle = UITextBorderStyle.None
        usernameTextBox.attributedPlaceholder = NSAttributedString(string: "Username", attributes:[NSForegroundColorAttributeName : UIColor.redColor()])
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginAttempt(sender: AnyObject) {
        print("Login button pressed.")
        
        let user = self.usernameTextBox.text!
        let pssd = self.passwordTextBox.text!
        
        
        
        self.api.attemptLogin(user, password: pssd, completion: { (response: JSON) in
            
            print(response)
            
            self.errorMessage.text = "Attempting to log in..."
            
            if(response["status"] == 200) {
                self.displayError("Login successful!")
                let storyboard = UIStoryboard(name: "TodoList", bundle: nil)
                let vc = storyboard.instantiateViewControllerWithIdentifier("TodoTableNavigation") as UIViewController
                self.presentViewController(vc, animated: true, completion: nil)
            }else{
                self.displayError(String(response["reason"]))
            }
            
        })
        
    }
    
    @IBAction func registerAttempt(sender: AnyObject) {
        
        print("Register button pressed.")
        
        performSegueWithIdentifier("registerSegue", sender: self)
        
    }
    
    func displayError(msg: String){
        self.errorMessage.text = msg
        UIView.animateWithDuration(1.0, animations: {
            self.errorMessage.alpha = 1.0
            
            UIView.animateWithDuration(1.0, delay: 2.0, options: .CurveEaseIn, animations: {
                self.errorMessage.alpha = 0.0
                }, completion: nil)
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "registerSegue"){
            print("Preparing to segue to register view...")
        }
    }
    
    func cancelToLoginView(segue: UIStoryboardSegue) {
        print("Cancelled to login view from register view")
    }
    
}





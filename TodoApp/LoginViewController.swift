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

class LoginViewController : UIViewController
{
    
    @IBOutlet var usernameTextBox: UITextField!
    
    @IBOutlet var passwordTextBox: UITextField!
    
    @IBOutlet weak var errorMessage: UILabel!
    
    var api: TodoAPI = TodoAPI(url: "https://brandon-todo.herokuapp.com")
    
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
        
        let user = self.usernameTextBox.text!
        let pssd = self.passwordTextBox.text!
        
        self.api.attemptLogin(user, password: pssd, completion: {
            (response: JSON)
            in
                print(response)
            
                self.displayError()
        })
        
        
//        add logic where if login is correct, load TodoTableNavigation
//        let storyboard = UIStoryboard(name: "TodoList", bundle: nil)
//        let vc = storyboard.instantiateViewControllerWithIdentifier("TodoTableNavigation") as UIViewController
//        presentViewController(vc, animated: true, completion: nil)
        
    }
    
    func displayError(){
        UIView.animateWithDuration(1.0, animations: {
            self.errorMessage.alpha = 1.0
            
            UIView.animateWithDuration(1.0, delay: 2.0, options: .CurveEaseIn, animations: {
                self.errorMessage.alpha = 0.0
                }, completion: nil)
        })
    }
    
}
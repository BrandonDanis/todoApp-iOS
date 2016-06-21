//
//  RegisterViewController.swift
//  TodoApp
//
//  Created by Brandon Danis on 2016-06-19.
//  Copyright © 2016 RBSoftware. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class RegisterViewController : UIViewController
{
    
    @IBOutlet weak var usernameTextbox: UITextField!
    @IBOutlet var passwordTextbox: UITextField!
    @IBOutlet var confirmPasswordTextbox: UITextField!
    @IBOutlet var errorMessage: UILabel!
    
    let api: TodoAPI = TodoAPI(url: "https://brandon-todo.herokuapp.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Register screen loaded")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func attemptingToRegister(sender: AnyObject) {
        
        if(self.usernameTextbox.text == ""){
            displayError("Must enter a username...")
            return
        }else if(self.passwordTextbox.text == ""){
            displayError("Must enter a password...")
            return
        }else if(self.passwordTextbox.text != self.confirmPasswordTextbox.text){
            displayError("Passwords don't match...")
            return
        }
        
        self.errorMessage.text = "Creating account..."
        
        let username = self.usernameTextbox.text!
        let password = self.passwordTextbox.text!
        
        api.addUser(username, password: password, completion: { (response: JSON) in
          
            print(response)
            
            if(response["status"] == 200){
                self.displayError("Account created")
            }else{
                self.displayError(String(response["status"]))
            }
            
        })
        
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
    
}
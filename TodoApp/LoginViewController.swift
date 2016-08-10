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
import SkyFloatingLabelTextField

class LoginViewController : UIViewController, UITextFieldDelegate
{
    
    @IBOutlet var usernameTextBox: SkyFloatingLabelTextField!
    
    @IBOutlet var passwordTextBox: SkyFloatingLabelTextField!
    
    @IBOutlet weak var errorMessage: UILabel!
    
    var api: TodoAPI = TodoAPI(url: "https://brandon-todo.herokuapp.com")
    
    
    let accentColor = UIColor(red:0.01, green:0.10, blue:0.16, alpha:1.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Login screen loaded.")
        
        let bg = UIImageView(image: UIImage(named: "login-bg"))
        bg.frame = self.view.frame
        self.view.insertSubview(bg, atIndex: 0)
        
        
        // setting this view controller as textField delegate
        usernameTextBox.delegate = self
        passwordTextBox.delegate = self
        
        usernameTextBox.placeholder = "Username"
        usernameTextBox.title = "Username"
        usernameTextBox.backgroundColor = UIColor.clearColor()
        usernameTextBox.selectedLineColor = accentColor
        usernameTextBox.selectedTitleColor = accentColor
        usernameTextBox.tintColor = accentColor
        
        
        passwordTextBox.placeholder = "Password"
        passwordTextBox.title = "Password"
        passwordTextBox.backgroundColor = UIColor.clearColor()
        passwordTextBox.selectedLineColor = accentColor
        passwordTextBox.selectedTitleColor = accentColor
        passwordTextBox.tintColor = accentColor
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //dismiss keyboard
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    //function gets called whenever the 'next' key is pressed on keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if(textField == usernameTextBox){
            passwordTextBox.becomeFirstResponder()
        }else if(textField == passwordTextBox){
            loginAttempt(self)
        }
        return true
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





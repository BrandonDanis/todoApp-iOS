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
import SkyFloatingLabelTextField

class RegisterViewController : UIViewController, UITextFieldDelegate
{
    
    @IBOutlet var usernameTextbox: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet var passwordTextbox: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet var confirmPasswordTextbox: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet var registerButton: UIButton!
    
    @IBOutlet var backButton: UIButton!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var errorMessage: UILabel!
    
    let api: TodoAPI = TodoAPI(url: "https://brandon-todo.herokuapp.com")
    
    let accentColor = UIColor(red:0.31, green:0.46, blue:0.46, alpha:1.00)
    
    let darkerAccent = UIColor(red:0.01, green:0.14, blue:0.20, alpha:1.00)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Register screen loaded")
        
        let bg = UIImageView(image: UIImage(named: "login-bg"))
        bg.frame = self.view.frame
        self.view.insertSubview(bg, atIndex: 0)

        // setting this view controller as textField delegate
        usernameTextbox.delegate = self
        passwordTextbox.delegate = self
        
        // setting username textField attributes
        usernameTextbox.placeholder = "Username"
        usernameTextbox.title = "Username"
        usernameTextbox.textColor = UIColor.whiteColor()
        usernameTextbox.placeholderColor = UIColor.whiteColor()
        usernameTextbox.backgroundColor = UIColor.clearColor()
        usernameTextbox.selectedLineColor = UIColor.whiteColor()
        usernameTextbox.selectedTitleColor = UIColor.whiteColor()
        usernameTextbox.tintColor = UIColor.whiteColor()
        usernameTextbox.lineColor = UIColor.whiteColor()
        usernameTextbox.titleColor = UIColor.whiteColor()
        usernameTextbox.iconFont = UIFont(name: "FontAwesome", size: 13)
        usernameTextbox.iconText = "\u{f007}"
        usernameTextbox.iconColor = UIColor.whiteColor()
        usernameTextbox.selectedIconColor = UIColor.whiteColor()
        
        // setting password textField attributes
        passwordTextbox.placeholder = "Password"
        passwordTextbox.title = "Password"
        passwordTextbox.textColor = UIColor.whiteColor()
        passwordTextbox.placeholderColor = UIColor.whiteColor()
        passwordTextbox.backgroundColor = UIColor.clearColor()
        passwordTextbox.selectedLineColor = UIColor.whiteColor()
        passwordTextbox.selectedTitleColor = UIColor.whiteColor()
        passwordTextbox.tintColor = UIColor.whiteColor()
        passwordTextbox.lineColor = UIColor.whiteColor()
        passwordTextbox.titleColor = UIColor.whiteColor()
        passwordTextbox.iconFont = UIFont(name: "FontAwesome", size: 13)
        passwordTextbox.iconText = "\u{f023}"
        passwordTextbox.iconColor = UIColor.whiteColor()
        passwordTextbox.selectedIconColor = UIColor.whiteColor()
        
        // setting confirm password textField attributes
        confirmPasswordTextbox.placeholder = "Confirm Password"
        confirmPasswordTextbox.title = "Confirm Password"
        confirmPasswordTextbox.textColor = UIColor.whiteColor()
        confirmPasswordTextbox.placeholderColor = UIColor.whiteColor()
        confirmPasswordTextbox.backgroundColor = UIColor.clearColor()
        confirmPasswordTextbox.selectedLineColor = UIColor.whiteColor()
        confirmPasswordTextbox.selectedTitleColor = UIColor.whiteColor()
        confirmPasswordTextbox.tintColor = UIColor.whiteColor()
        confirmPasswordTextbox.lineColor = UIColor.whiteColor()
        confirmPasswordTextbox.titleColor = UIColor.whiteColor()
        confirmPasswordTextbox.iconFont = UIFont(name: "FontAwesome", size: 13)
        confirmPasswordTextbox.iconText = "\u{f023}"
        confirmPasswordTextbox.iconColor = UIColor.whiteColor()
        confirmPasswordTextbox.selectedIconColor = UIColor.whiteColor()
        
        // setting error label attributes
        errorMessage.textColor = UIColor.whiteColor()
        
        // setting register button attributes
        registerButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        registerButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
        registerButton.backgroundColor = UIColor.clearColor()
        registerButton.layer.borderWidth = 2.0
        registerButton.layer.borderColor = UIColor.whiteColor().CGColor
        
        // setting login button attributes
        backButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        backButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
        backButton.backgroundColor = UIColor.clearColor()
        backButton.layer.borderWidth = 2.0
        backButton.layer.borderColor = UIColor.whiteColor().CGColor
        
        // looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // dismiss keyboard
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    // function gets called whenever the 'next' key is pressed on keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if(textField == usernameTextbox){
            passwordTextbox.becomeFirstResponder()
        }else if(textField == passwordTextbox){
            confirmPasswordTextbox.becomeFirstResponder()
        }else if(textField == confirmPasswordTextbox){
            attemptingToRegister(self)
        }
        return true
    }
    
    //whenever the a textfield is being edited
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if let skyFloatingLabelTextField = textField as? SkyFloatingLabelTextField {
            skyFloatingLabelTextField.errorMessage = ""
        }
        return true
    }
    
    @IBAction func attemptingToRegister(sender: AnyObject) {
        
        if(self.usernameTextbox.text == ""){
            usernameTextbox.errorMessage = "Missing Username"
            return
        }else if(self.passwordTextbox.text == ""){
            passwordTextbox.errorMessage = "Missing pPssword"
            return
        }else if(self.confirmPasswordTextbox.text != self.confirmPasswordTextbox.text){
            confirmPasswordTextbox.errorMessage = "Password Not Matching"
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
    
    
    @IBAction func backButtonClicked(sender: AnyObject) {
        let parentViewController = self.parentViewController as? StartupViewController
        parentViewController?.switchToLogin()
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
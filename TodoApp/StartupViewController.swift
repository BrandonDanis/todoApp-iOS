//
//  StartupViewController.swift
//  TodoApp
//
//  Created by Brandon Danis on 2016-08-11.
//  Copyright © 2016 RBSoftware. All rights reserved.
//

import Foundation
import UIKit

class StartupViewController: UIViewController
{
    
    
    @IBOutlet var registerContent: UIView!
    
    @IBOutlet var loginContent: UIView!
    
    override func viewDidLoad() {
        
        
        self.registerContent.alpha = 0
        
        self.registerContent.userInteractionEnabled = false
        
        self.loginContent.alpha = 1
        self.registerContent.userInteractionEnabled = true
        
        
    }
    
    func switchToRegister() {
        print("Switching from login to register")
        UIView.animateWithDuration(0.5, animations: {
            self.loginContent.alpha = 0
            self.loginContent.userInteractionEnabled = false
            self.registerContent.alpha = 1
            self.registerContent.userInteractionEnabled = true
        },completion: nil)
        
    }
    
    func switchToLogin() {
        print("Switching from register to login")
        UIView.animateWithDuration(0.5, animations: {
            self.loginContent.alpha = 1
            self.loginContent.userInteractionEnabled = true
            self.registerContent.alpha = 0
            self.registerContent.userInteractionEnabled = false
            },completion: nil)
        
    }
    
    
}
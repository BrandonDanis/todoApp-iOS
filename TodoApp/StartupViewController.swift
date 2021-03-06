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
    
    // cleaning up view before showing.
    override func viewWillAppear(animated: Bool) {
        
        let registerViewController = self.childViewControllers[0] as? RegisterViewController
        registerViewController?.displayingView()
        
        let loginViewController = self.childViewControllers[1] as? LoginViewController
        loginViewController?.displayingView()
    }
    
    func switchToRegister() {
        let registerViewController = self.childViewControllers[0] as? RegisterViewController
        registerViewController?.displayingView()
        UIView.animateWithDuration(0.5, animations: {
            self.loginContent.alpha = 0
            self.loginContent.userInteractionEnabled = false
            self.registerContent.alpha = 1
            self.registerContent.userInteractionEnabled = true
        },completion: nil)
        
    }
    
    func switchToLogin() {
        let loginViewController = self.childViewControllers[1] as? LoginViewController
        loginViewController?.displayingView()
        UIView.animateWithDuration(0.5, animations: {
            self.loginContent.alpha = 1
            self.loginContent.userInteractionEnabled = true
            self.registerContent.alpha = 0
            self.registerContent.userInteractionEnabled = false
            },completion: nil)
        
    }
    
    
}
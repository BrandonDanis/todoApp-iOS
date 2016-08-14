//
//  MainViewController.swift
//  TodoApp
//
//  Created by Brandon Danis on 2016-08-11.
//  Copyright © 2016 RBSoftware. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController
{
    
    @IBOutlet var tempUserIcon : UILabel!
    
    @IBOutlet var newTodoBox : UIView!
    
    @IBOutlet var newRedminderBox : UIView!
    
    @IBOutlet var todoBox : UIView!
    
    @IBOutlet var reminderBox : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting bg
        let bg = UIImageView(image: UIImage(named: "login-bg"))
        bg.frame = self.view.frame
        self.view.insertSubview(bg, atIndex: 0)
        
        // setting up view
        newTodoBox.layer.cornerRadius = 10
        newTodoBox.backgroundColor = UIColor(red:0.93, green:0.45, blue:0.49, alpha:1.00)
        
        todoBox.layer.cornerRadius = 10
        todoBox.backgroundColor = UIColor(red:0.16, green:0.73, blue:0.61, alpha:1.00)
        
        newRedminderBox.layer.cornerRadius = 10
        newRedminderBox.backgroundColor = UIColor(red:0.65, green:0.77, blue:0.27, alpha:1.00)
        
        reminderBox.layer.cornerRadius = 10
        reminderBox.backgroundColor = UIColor(red:0.23, green:0.60, blue:0.85, alpha:1.00)
        
        // setting tempUserIcon
        tempUserIcon.font = UIFont(name: "FontAwesome", size: 110)
        tempUserIcon.textColor = UIColor.whiteColor()
        tempUserIcon.text = "\u{f21b}"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //uh oh
    }
    
    
    
}
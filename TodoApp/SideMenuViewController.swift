//
//  SideMenuViewController.swift
//  TodoApp
//
//  Created by Brandon Danis on 2016-08-26.
//  Copyright © 2016 RBSoftware. All rights reserved.
//

import Foundation
import UIKit

class SideMenuViewController : UIViewController {
    
    @IBOutlet var menuTitleLabel: UILabel!
    
    @IBOutlet var homeButton: UIButton!
    
    @IBOutlet var reminderButton: UIButton!
    
    @IBOutlet var notesButton: UIButton!
    
    @IBOutlet var bgView : UIView!
    
    
    //color declarations
    let blue = UIColor(red:0.23, green:0.60, blue:0.85, alpha:1.00)
    let green = UIColor(red:0.65, green:0.77, blue:0.27, alpha:1.00)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgView.backgroundColor = UIColor(red:0.17, green:0.17, blue:0.17, alpha:1.00)
        
        
        homeButton.backgroundColor = UIColor.clearColor()
        homeButton.setTitleColor(green, forState: UIControlState.Normal)
        
        
        reminderButton.backgroundColor = UIColor.clearColor()
        reminderButton.setTitleColor(green, forState: UIControlState.Normal)
        
        
        notesButton.backgroundColor = UIColor.clearColor()
        notesButton.setTitleColor(green, forState: UIControlState.Normal)
        
    }
    
    override func didReceiveMemoryWarning() {
        print("uh oh")
    }
    
    @IBAction func dismissToViewController(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
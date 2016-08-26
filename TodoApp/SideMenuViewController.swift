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
    
    let transitionManager = SideMenuTransitionManager()
    
    @IBOutlet var menuTitleLabel: UILabel!
    
    @IBOutlet var homeButton: UIButton!
    
    @IBOutlet var reminderButton: UIButton!
    
    @IBOutlet var notesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.transitioningDelegate = self.transitionManager
        
    }
    
    override func didReceiveMemoryWarning() {
        print("uh oh")
    }
    
    @IBAction func dismissToViewController(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        print("uh oh")
    }
    
    @IBAction func dismissToViewController(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
}
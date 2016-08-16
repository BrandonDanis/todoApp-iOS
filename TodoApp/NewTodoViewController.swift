//
//  NewTodoViewController.swift
//  TodoApp
//
//  Created by Rushil Perera on 2016-08-14.
//  Copyright © 2016 RBSoftware. All rights reserved.
//

import Foundation
import UIKit
import UITextView_Placeholder

class NewTodoViewController : UIViewController {
    
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var backButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        descriptionTextView.placeholder = "Begin your masterpiece..."
        
        let fontAwesome = UIFont(name: "FontAwesome", size: 15)
        backButton.setTitleTextAttributes([NSFontAttributeName: fontAwesome!], forState: UIControlState.Normal)
        backButton.title = "\u{f078}"
    }
    
    @IBAction func backButtonClicked(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}